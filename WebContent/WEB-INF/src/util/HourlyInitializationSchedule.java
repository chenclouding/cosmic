package util;

import java.util.Calendar;
import java.util.Collection;
import java.util.Date;
import java.util.Iterator;
import java.util.Timer;
import java.util.TimerTask;

import beans.entities.DataDictionaryBean;
import beans.entities.EmployeeBean;
import beans.entities.LogBean;
import beans.entities.WbsBean;
import beans.entities.ProjectBean;
import beans.entities.ProjectCycleBackupBean;
import beans.relations.EmployeeWbsRelationBean;
import beans.relations.ProjectEmployeeRelationBean;

import business.MA.MaCollectDataService;
import business.MA.MaWeekReportService;
import facades.DataDictionaryFacade;
import facades.EmployeeFacade;
import facades.LogFacade;
import facades.ProjectCycleBackupFacade;
import facades.ProjectFacade;
import facades.WbsFacade;
import facades.evFacade;

/*
 * 每小时定期执行程序。查看是否有到期的派工周期。如果有，执行相应的更新程序。
 * */
public class HourlyInitializationSchedule extends TimerTask {

	private static HourlyInitializationSchedule _initializationSchedule = null;

	private static Timer timer = null;

	private ProjectFacade projectFacade = new ProjectFacade();

	private LogFacade logFacade = new LogFacade();

	// 6小时所含毫秒数。

	private long cycleDelayTime = 21600000;

	// 私有构建器
	private HourlyInitializationSchedule() {
	}

	// 得到对象
	public static HourlyInitializationSchedule getInstance() {
		if (_initializationSchedule == null) {
			_initializationSchedule = new HourlyInitializationSchedule();
		}
		return _initializationSchedule;
	}

	// 启动任务，timer.schedule这个方法详细使用说明看api
	/*
	 * public void schedule(TimerTask task,Date firstTime,long period)
	 * 
	 * Parameters: task - task to be scheduled. firstTime - First time at which
	 * task is to be executed. period - time in milliseconds between successive
	 * task executions.
	 */
	/**
	 * Create on 2005-2-3 by congpz.
	 * <p>
	 * 启动方法，当InitializationSchedule实例被创建时自动运行。
	 * 在当前时间下一小时的正点启动计时器，执行run方法中所要执行的任务· 。
	 */
	public void start() {

		if (timer != null) {

			// 如果当前有定时器任务，则将该定时任务取消
			timer.cancel();
		}
		Calendar startTimeOfTheTask = Calendar.getInstance();

		startTimeOfTheTask.set(Calendar.MILLISECOND, 0);

		Date firstTime = startTimeOfTheTask.getTime();// 获得任务开始时间，即当前时间

		timer = new Timer();// 申请定时器
		System.out.println("申请定时器成功！");
		timer.schedule(this, firstTime, cycleDelayTime);
		// 初始化定时器时间表

	}

	/**
	 * 自动执行程序，每小时期执行一次。查周是否有项目已到达派工周期结束点，如果存在则清除该项目的员工的周期已用工时，可用工时不变。
	 * 将当前周期所有员工的数据备份到ProjectCycleBackup表中。
	 */
	public void run() {

		/*
		 * 获取所有项目，将已到达周期结束点的项目的下周期规模、下周期规模单位设置为当前周期规模和当前周期规模单位。
		 * 下周期规模设为1，下周期规模单位设为月。
		 */

		Collection allProjects = projectFacade.getAllUncompletedProjects();
		evFacade ef = new evFacade();
		Iterator iter = allProjects.iterator();// 获得所以未完成的项目的信息列表

		while (iter.hasNext()) {

			ProjectBean projectInfo = (ProjectBean) iter.next();

			if (projectFacade.dispatchCycleFinished(projectInfo.getId())) {
				// 如果该项目已经达到派工周期结束点，则更新项目信息
				updateProjectInfo(projectInfo);
			}
		}

		Calendar now = Calendar.getInstance();
		java.sql.Date currentTime = new java.sql.Date(now.getTimeInMillis());
		// System.out.println(currentTime.getTime());
		// 获得当前时间currentTime
		java.sql.Date executeTime = logFacade.getLastExecuteTime();
		// 获得上次周初始化时间executeTime

		if (executeTime == null) {
			// 无周初始化时间记录则进行周初始化
			logFacade.insertTimerTask(currentTime);
			executeWeeklyInitialize();

			System.out.println("初始化成功");
			ef.PMCWeeklyInit();// 挣值分析
			System.out.println("End of t ");

		} else {
			// 当前周一晚于上次周初始化时间的周一，则进行周初始化
			Calendar lastExecuteCal = Calendar.getInstance();
			lastExecuteCal.setTimeInMillis(executeTime.getTime());
			System.out.println(logFacade.getStartDateOfWeek());
			System.out.println(logFacade.getStartDateOfWeek(lastExecuteCal));
			if ((logFacade.getStartDateOfWeek().after(logFacade
					.getStartDateOfWeek(lastExecuteCal)))
					&& (!logFacade.isTheSameDate(
							logFacade.getStartDateOfWeek(), logFacade
									.getStartDateOfWeek(lastExecuteCal)))) {

				logFacade.updateTimerTask(currentTime);
				System.out.println("更新Timer成功！");

				executeWeeklyInitialize();
				// Add by zhangfj
				// 用于度量数据的收集
				MaCollectDataService maService = new MaCollectDataService();
				if (maService.weekInsertDataForAllProject(currentTime, "人时",
						"代码行", "元", 400)) {
					HibernateUtil.commitTransaction();
					HibernateUtil.closeSession();
					System.out
							.println("(-:(-:(-:(-:(-:度量数据采集成功:-):-):-):-):-):-):-)");
				} else {
					HibernateUtil.commitTransaction();
					HibernateUtil.closeSession();
					System.out
							.println(")-:)-:)-:)-:)-:度量数据采集失败:-(:-(:-(:-(:-(:-(:-(");
				}
				MaWeekReportService mwrs=new MaWeekReportService();
				if(mwrs.weekInsertForAllProject(currentTime)){
					HibernateUtil.commitTransaction();
					HibernateUtil.closeSession();
					System.out
					.println(")-:)-:)-:)-:)-:度量周报数据采集成功:-(:-(:-(:-(:-(:-(:-(");

				}else{
					HibernateUtil.commitTransaction();
					HibernateUtil.closeSession();
					System.out
					.println(")-:)-:)-:)-:)-:度量周报数据采集失败:-(:-(:-(:-(:-(:-(:-(");

				}
				 ef.PMCWeeklyInit();// 挣值分析
				System.out.println("挣值分析周报");
			}

		}

	}

	/**
	 * Create on 2005-4-18 by congpz.
	 * <p>
	 * 
	 */
	private void executeWeeklyInitialize() {

		java.sql.Date startTime = logFacade.getStartDateOfWeek();
		// 取得当前时间的下周的周一时间startTime
		// System.out.println("++++++++++++++++++++++++__________________________");
		java.sql.Date nextWeekStartTime = logFacade.getStartDateOfNextWeek();
		EmployeeWbsRelationBean ewrb = new EmployeeWbsRelationBean();
		WbsFacade wbsFacade = new WbsFacade();
		Iterator iter = wbsFacade.getEmployeeWbsRelationCollection(ewrb)
				.iterator();
		String projectid, wbsid;
		java.sql.Date planstarttime;
		// 遍历EmployeeWbsRelation表
		System.out
				.println("=======================日志信息更新开始=======================");
		while (iter.hasNext()) {
			EmployeeWbsRelationBean employeeWbsRelation = (EmployeeWbsRelationBean) iter
					.next();
			projectid = employeeWbsRelation.getProjectId();
			wbsid = employeeWbsRelation.getWbsId();
			WbsBean wbsbean = new WbsBean();
			// System.out.println("wbsid============"+wbsid+"-------------"+projectid);
			wbsbean = wbsFacade.getWbsInfo(wbsid, projectid);
			// System.out.println(wbsid+"
			// "+projectid+"=="+wbsbean.getPlanStartTime());
			planstarttime = wbsbean.getPlanStartTime();
			//TODO: 这里要处理一下时间为空的情况
			
			if ((!employeeWbsRelation.getWbsState().equals(
					DataDictionaryBean.FINISH_STATE))
					&& (!planstarttime.after(nextWeekStartTime))
					&& (!logFacade.isTheSameDate(nextWeekStartTime,
							planstarttime))) {
				// System.out.println(startTime+"startTime=======================");
				// 如果当前任务包状态不是完成并且计划开始时间早于下周一，则该插入任务包的日志信息。
				// 任务包开始时间为本周一
				String projectId = employeeWbsRelation.getProjectId();
				String employeeId = employeeWbsRelation.getEmployeeId();
				String wbsId = employeeWbsRelation.getWbsId();
				LogBean logInfo = new LogBean();
				logInfo.setProjectId(projectId);
				logInfo.setEmployeeId(employeeId);
				logInfo.setWbsId(wbsId);
				logInfo.setStartTime(startTime);
				
				boolean includeHandlePspDb = false;
				logFacade.insertNewLog(logInfo, includeHandlePspDb);

			}
		}

		EmployeeFacade employeeFacade = new EmployeeFacade();
		ProjectFacade projectFacade = new ProjectFacade();
		iter = employeeFacade.getAllProjectEmployeeRelations().iterator();
		// 遍历ProjectEmployeeRelation表
		while (iter.hasNext()) {
			ProjectEmployeeRelationBean per = (ProjectEmployeeRelationBean) iter
					.next();
			// 将下周申请工时定为本周申请工时
			per.setCurrentAppliedTime(per.getNextAppliedTime());
			// System.out.println("xiasdfsdaf");
			// 将下周申请工时定为0
			per.setNextAppliedTime(0);
			projectFacade.updateProjectEmployeeRelation(per);
		}
		System.out
				.println("=======================日志信息更新成功=======================");

	}

	/**
	 * Create on 2005-3-4 by congpz.
	 * <p>
	 * 
	 * 将已到达周期结束点的项目中所属员工信息备份， 下周期规模设为1，下周期规模单位设为月。
	 * 
	 * @param projectInfo
	 */
	private boolean updateProjectInfo(ProjectBean projectInfo) {

		DataDictionaryFacade ddf = new DataDictionaryFacade();
		boolean iResult = false;
		boolean iResult2 = false;
		boolean iResult3 = false;
		java.sql.Date startDate = projectFacade
				.getCycleEndDateOfProject(projectInfo.getId());
		Calendar cal = Calendar.getInstance();
		cal.setTimeInMillis(startDate.getTime());
		cal.add(Calendar.DATE, 1);
		startDate = new java.sql.Date(cal.getTimeInMillis());

		// 将周期开始时间设置为上周期结束时间的下一天
		projectInfo.setCycleStartTime(startDate);
		/* 备份项目中员工信息，并将下周期已用工时设置为0 */
		iResult = backupProjectCycle(projectInfo.getId());
		/* 更新项目信息，将本周期规模定为1月，周期开始时间定为上周期结束时间的下一天 */
		iResult2 = projectFacade.updateProjectInfo(projectInfo);
		/* 将项目中所有员工的分配工时（assignedEmployeeTime）设置为0 */
		EmployeeWbsRelationBean ewrb = new EmployeeWbsRelationBean();
		ewrb.setProjectId(projectInfo.getId());
		WbsFacade wbsFacade = new WbsFacade();
		Iterator iter = wbsFacade.getEmployeeWbsRelationCollection(ewrb)
				.iterator();
		while (iter.hasNext()) {
			EmployeeWbsRelationBean employeeWbsRelation = (EmployeeWbsRelationBean) iter
					.next();
			employeeWbsRelation.setAssignedEmployeeTime(0);
			iResult3 = wbsFacade
					.updateAssignedInfoToDatabase(employeeWbsRelation);

		}

		return iResult && iResult2 && iResult3;
	}

	/**
	 * Create on 2005-3-4 by congpz.
	 * <p>
	 * 备份到达周期结束点的项目中所有员工的信息。
	 * 
	 * @param projectId
	 *            到达周期结束点的项目id
	 * @return 是否成功备份。
	 */
	private boolean backupProjectCycle(String projectId) {

		boolean iResult = false;
		EmployeeFacade employeeFacade = new EmployeeFacade();

		ProjectBean projectInfo = projectFacade.getProjectInfoById(projectId);
		// 取得所有项目中的人员信息
		Collection col = employeeFacade.getAllEmployeesInProject(projectId);
		Iterator iter = col.iterator();
		// 遍历项目中人员信息
		while (iter.hasNext()) {
			EmployeeBean employeeInfo = (EmployeeBean) iter.next();
			ProjectCycleBackupBean projectCycleBackupInfo = new ProjectCycleBackupBean();
			ProjectEmployeeRelationBean perb = employeeFacade
					.getProjectEmployeeRelation(projectId, employeeInfo.getId());

			// 备份该人员信息到ProjectCycleBackup表中
			ProjectCycleBackupFacade projectCycleBackupFacade = new ProjectCycleBackupFacade();
			projectCycleBackupInfo.setProjectId(projectId);
			projectCycleBackupInfo.setEmployeeId(employeeInfo.getId());
			projectCycleBackupInfo.setCycleStartTime(projectInfo
					.getCycleStartTime());
			projectCycleBackupInfo.setCycleScale(projectInfo
					.getCurrentCycleScale());
			projectCycleBackupInfo.setDispatchCycle(projectInfo
					.getDispatchCycle());
			projectCycleBackupInfo.setDispatchedTime(perb.getDispatchedTime());
			// 实际工时未得到，用已用工时代替。
			projectCycleBackupInfo.setRealWorkTime(perb.getUsedTime());
			projectCycleBackupInfo.setUsedTime(perb.getUsedTime());
			projectCycleBackupFacade
					.insertNewProjectCycleBackup(projectCycleBackupInfo);
			// 将项目下周期已用工时设置为0
			perb.setUsedTime(0);
			iResult = projectFacade.updateProjectEmployeeRelation(perb);

		}

		return iResult;
	}

}