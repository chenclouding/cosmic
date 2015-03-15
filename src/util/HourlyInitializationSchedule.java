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
 * ÿСʱ����ִ�г��򡣲鿴�Ƿ��е��ڵ��ɹ����ڡ�����У�ִ����Ӧ�ĸ��³���
 * */
public class HourlyInitializationSchedule extends TimerTask {

	private static HourlyInitializationSchedule _initializationSchedule = null;

	private static Timer timer = null;

	private ProjectFacade projectFacade = new ProjectFacade();

	private LogFacade logFacade = new LogFacade();

	// 6Сʱ������������

	private long cycleDelayTime = 21600000;

	// ˽�й�����
	private HourlyInitializationSchedule() {
	}

	// �õ�����
	public static HourlyInitializationSchedule getInstance() {
		if (_initializationSchedule == null) {
			_initializationSchedule = new HourlyInitializationSchedule();
		}
		return _initializationSchedule;
	}

	// ��������timer.schedule���������ϸʹ��˵����api
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
	 * ������������InitializationScheduleʵ��������ʱ�Զ����С�
	 * �ڵ�ǰʱ����һСʱ������������ʱ����ִ��run��������Ҫִ�е����� ��
	 */
	public void start() {

		if (timer != null) {

			// �����ǰ�ж�ʱ�������򽫸ö�ʱ����ȡ��
			timer.cancel();
		}
		Calendar startTimeOfTheTask = Calendar.getInstance();

		startTimeOfTheTask.set(Calendar.MILLISECOND, 0);

		Date firstTime = startTimeOfTheTask.getTime();// �������ʼʱ�䣬����ǰʱ��

		timer = new Timer();// ���붨ʱ��
		System.out.println("���붨ʱ���ɹ���");
		timer.schedule(this, firstTime, cycleDelayTime);
		// ��ʼ����ʱ��ʱ���

	}

	/**
	 * �Զ�ִ�г���ÿСʱ��ִ��һ�Ρ������Ƿ�����Ŀ�ѵ����ɹ����ڽ����㣬����������������Ŀ��Ա�����������ù�ʱ�����ù�ʱ���䡣
	 * ����ǰ��������Ա�������ݱ��ݵ�ProjectCycleBackup���С�
	 */
	public void run() {

		/*
		 * ��ȡ������Ŀ�����ѵ������ڽ��������Ŀ�������ڹ�ģ�������ڹ�ģ��λ����Ϊ��ǰ���ڹ�ģ�͵�ǰ���ڹ�ģ��λ��
		 * �����ڹ�ģ��Ϊ1�������ڹ�ģ��λ��Ϊ�¡�
		 */

		Collection allProjects = projectFacade.getAllUncompletedProjects();
		evFacade ef = new evFacade();
		Iterator iter = allProjects.iterator();// �������δ��ɵ���Ŀ����Ϣ�б�

		while (iter.hasNext()) {

			ProjectBean projectInfo = (ProjectBean) iter.next();

			if (projectFacade.dispatchCycleFinished(projectInfo.getId())) {
				// �������Ŀ�Ѿ��ﵽ�ɹ����ڽ����㣬�������Ŀ��Ϣ
				updateProjectInfo(projectInfo);
			}
		}

		Calendar now = Calendar.getInstance();
		java.sql.Date currentTime = new java.sql.Date(now.getTimeInMillis());
		// System.out.println(currentTime.getTime());
		// ��õ�ǰʱ��currentTime
		java.sql.Date executeTime = logFacade.getLastExecuteTime();
		// ����ϴ��ܳ�ʼ��ʱ��executeTime

		if (executeTime == null) {
			// ���ܳ�ʼ��ʱ���¼������ܳ�ʼ��
			logFacade.insertTimerTask(currentTime);
			executeWeeklyInitialize();

			System.out.println("��ʼ���ɹ�");
			ef.PMCWeeklyInit();// ��ֵ����
			System.out.println("End of t ");

		} else {
			// ��ǰ��һ�����ϴ��ܳ�ʼ��ʱ�����һ��������ܳ�ʼ��
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
				System.out.println("����Timer�ɹ���");

				executeWeeklyInitialize();
				// Add by zhangfj
				// ���ڶ������ݵ��ռ�
				MaCollectDataService maService = new MaCollectDataService();
				if (maService.weekInsertDataForAllProject(currentTime, "��ʱ",
						"������", "Ԫ", 400)) {
					HibernateUtil.commitTransaction();
					HibernateUtil.closeSession();
					System.out
							.println("(-:(-:(-:(-:(-:�������ݲɼ��ɹ�:-):-):-):-):-):-):-)");
				} else {
					HibernateUtil.commitTransaction();
					HibernateUtil.closeSession();
					System.out
							.println(")-:)-:)-:)-:)-:�������ݲɼ�ʧ��:-(:-(:-(:-(:-(:-(:-(");
				}
				MaWeekReportService mwrs=new MaWeekReportService();
				if(mwrs.weekInsertForAllProject(currentTime)){
					HibernateUtil.commitTransaction();
					HibernateUtil.closeSession();
					System.out
					.println(")-:)-:)-:)-:)-:�����ܱ����ݲɼ��ɹ�:-(:-(:-(:-(:-(:-(:-(");

				}else{
					HibernateUtil.commitTransaction();
					HibernateUtil.closeSession();
					System.out
					.println(")-:)-:)-:)-:)-:�����ܱ����ݲɼ�ʧ��:-(:-(:-(:-(:-(:-(:-(");

				}
				 ef.PMCWeeklyInit();// ��ֵ����
				System.out.println("��ֵ�����ܱ�");
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
		// ȡ�õ�ǰʱ������ܵ���һʱ��startTime
		// System.out.println("++++++++++++++++++++++++__________________________");
		java.sql.Date nextWeekStartTime = logFacade.getStartDateOfNextWeek();
		EmployeeWbsRelationBean ewrb = new EmployeeWbsRelationBean();
		WbsFacade wbsFacade = new WbsFacade();
		Iterator iter = wbsFacade.getEmployeeWbsRelationCollection(ewrb)
				.iterator();
		String projectid, wbsid;
		java.sql.Date planstarttime;
		// ����EmployeeWbsRelation��
		System.out
				.println("=======================��־��Ϣ���¿�ʼ=======================");
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
			//TODO: ����Ҫ����һ��ʱ��Ϊ�յ����
			
			if ((!employeeWbsRelation.getWbsState().equals(
					DataDictionaryBean.FINISH_STATE))
					&& (!planstarttime.after(nextWeekStartTime))
					&& (!logFacade.isTheSameDate(nextWeekStartTime,
							planstarttime))) {
				// System.out.println(startTime+"startTime=======================");
				// �����ǰ�����״̬������ɲ��Ҽƻ���ʼʱ����������һ����ò������������־��Ϣ��
				// �������ʼʱ��Ϊ����һ
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
		// ����ProjectEmployeeRelation��
		while (iter.hasNext()) {
			ProjectEmployeeRelationBean per = (ProjectEmployeeRelationBean) iter
					.next();
			// ���������빤ʱ��Ϊ�������빤ʱ
			per.setCurrentAppliedTime(per.getNextAppliedTime());
			// System.out.println("xiasdfsdaf");
			// ���������빤ʱ��Ϊ0
			per.setNextAppliedTime(0);
			projectFacade.updateProjectEmployeeRelation(per);
		}
		System.out
				.println("=======================��־��Ϣ���³ɹ�=======================");

	}

	/**
	 * Create on 2005-3-4 by congpz.
	 * <p>
	 * 
	 * ���ѵ������ڽ��������Ŀ������Ա����Ϣ���ݣ� �����ڹ�ģ��Ϊ1�������ڹ�ģ��λ��Ϊ�¡�
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

		// �����ڿ�ʼʱ������Ϊ�����ڽ���ʱ�����һ��
		projectInfo.setCycleStartTime(startDate);
		/* ������Ŀ��Ա����Ϣ���������������ù�ʱ����Ϊ0 */
		iResult = backupProjectCycle(projectInfo.getId());
		/* ������Ŀ��Ϣ���������ڹ�ģ��Ϊ1�£����ڿ�ʼʱ�䶨Ϊ�����ڽ���ʱ�����һ�� */
		iResult2 = projectFacade.updateProjectInfo(projectInfo);
		/* ����Ŀ������Ա���ķ��乤ʱ��assignedEmployeeTime������Ϊ0 */
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
	 * ���ݵ������ڽ��������Ŀ������Ա������Ϣ��
	 * 
	 * @param projectId
	 *            �������ڽ��������Ŀid
	 * @return �Ƿ�ɹ����ݡ�
	 */
	private boolean backupProjectCycle(String projectId) {

		boolean iResult = false;
		EmployeeFacade employeeFacade = new EmployeeFacade();

		ProjectBean projectInfo = projectFacade.getProjectInfoById(projectId);
		// ȡ��������Ŀ�е���Ա��Ϣ
		Collection col = employeeFacade.getAllEmployeesInProject(projectId);
		Iterator iter = col.iterator();
		// ������Ŀ����Ա��Ϣ
		while (iter.hasNext()) {
			EmployeeBean employeeInfo = (EmployeeBean) iter.next();
			ProjectCycleBackupBean projectCycleBackupInfo = new ProjectCycleBackupBean();
			ProjectEmployeeRelationBean perb = employeeFacade
					.getProjectEmployeeRelation(projectId, employeeInfo.getId());

			// ���ݸ���Ա��Ϣ��ProjectCycleBackup����
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
			// ʵ�ʹ�ʱδ�õ��������ù�ʱ���档
			projectCycleBackupInfo.setRealWorkTime(perb.getUsedTime());
			projectCycleBackupInfo.setUsedTime(perb.getUsedTime());
			projectCycleBackupFacade
					.insertNewProjectCycleBackup(projectCycleBackupInfo);
			// ����Ŀ���������ù�ʱ����Ϊ0
			perb.setUsedTime(0);
			iResult = projectFacade.updateProjectEmployeeRelation(perb);

		}

		return iResult;
	}

}