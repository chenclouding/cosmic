/*
 * Created on 2005-1-4 by congpz
 * 
 */
package beans.entities;

import java.sql.Date;

/**
 * @author congpz
 *  
 */
public class ProjectCycleBackupBean {

	/**
	 *  
	 */
	public ProjectCycleBackupBean(String projectId, Date cycleStartTime,
			String employeeId, String dispatchCycle) {
		this.projectId = projectId;
		this.cycleStartTime = cycleStartTime;
		this.employeeId = employeeId;
		this.dispatchCycle = dispatchCycle;
	}
	
	public ProjectCycleBackupBean(){
		
	}

	private String projectId = null;

	private Date cycleStartTime = null;

	private String employeeId = null;

	private String dispatchCycle = null;

	private double cycleScale = 0;

	private double dispatchedTime = 0;

	private double usedTime = 0;

	private double realWorkTime = 0;
	//构造私有变量取值方法get（）和私有变量赋值方法set（）
	/**
	 * @return Returns the cycleScale.
	 */
	public double getCycleScale() {
		return cycleScale;
	}

	/**
	 * @param cycleScale
	 *            The cycleScale to set.
	 */
	public void setCycleScale(double cycleScale) {
		this.cycleScale = cycleScale;
	}

	/**
	 * @return Returns the cycleStartTime.
	 */
	public Date getCycleStartTime() {
		return cycleStartTime;
	}

	/**
	 * @param cycleStartTime
	 *            The cycleStartTime to set.
	 */
	public void setCycleStartTime(Date cycleStartTime) {
		this.cycleStartTime = cycleStartTime;
	}

	/**
	 * @return Returns the dispatchCycle.
	 */
	public String getDispatchCycle() {
		return dispatchCycle;
	}

	/**
	 * @param dispatchCycle
	 *            The dispatchCycle to set.
	 */
	public void setDispatchCycle(String dispatchCycle) {
		this.dispatchCycle = dispatchCycle;
	}

	/**
	 * @return Returns the dispatchedTime.
	 */
	public double getDispatchedTime() {
		return dispatchedTime;
	}

	/**
	 * @param dispatchedTime
	 *            The dispatchedTime to set.
	 */
	public void setDispatchedTime(double dispatchedTime) {
		this.dispatchedTime = dispatchedTime;
	}

	/**
	 * @return Returns the employeeId.
	 */
	public String getEmployeeId() {
		return employeeId;
	}

	/**
	 * @param employeeId
	 *            The employeeId to set.
	 */
	public void setEmployeeId(String employeeId) {
		this.employeeId = employeeId;
	}

	/**
	 * @return Returns the projectId.
	 */
	public String getProjectId() {
		return projectId;
	}

	/**
	 * @param projectId
	 *            The projectId to set.
	 */
	public void setProjectId(String projectId) {
		this.projectId = projectId;
	}

	/**
	 * @return Returns the realWorkTime.
	 */
	public double getRealWorkTime() {
		return realWorkTime;
	}

	/**
	 * @param realWorkTime
	 *            The realWorkTime to set.
	 */
	public void setRealWorkTime(double realWorkTime) {
		this.realWorkTime = realWorkTime;
	}

	/**
	 * @return Returns the usedTime.
	 */
	public double getUsedTime() {
		return usedTime;
	}

	/**
	 * @param usedTime
	 *            The usedTime to set.
	 */
	public void setUsedTime(double usedTime) {
		this.usedTime = usedTime;
	}

	public boolean equals(Object o) {
		boolean iResult = false;
		if (o instanceof ProjectCycleBackupBean) {
			ProjectCycleBackupBean projectCycleBackupInfo = (ProjectCycleBackupBean) o;
			if (projectCycleBackupInfo.getProjectId().equals(projectId)
					&& projectCycleBackupInfo.getEmployeeId().equals(employeeId)
					&& projectCycleBackupInfo.getCycleStartTime().getDate() == cycleStartTime.getDate()
					&& projectCycleBackupInfo.getCycleStartTime().getMonth() == cycleStartTime
							.getMonth()
					&& projectCycleBackupInfo.getCycleStartTime().getYear() == cycleStartTime.getYear()) {
				iResult = true;
			} else
				iResult = false;
			return iResult;
		} else
			return false;
	}
}