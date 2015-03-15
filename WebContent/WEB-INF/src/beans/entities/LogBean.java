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
public class LogBean {

	public LogBean() {
	}

	public LogBean(String projectId, String wbsId, Date startTime,
			String employeeId) {
		this.projectId = projectId;
		this.wbsId = wbsId;
		this.startTime = startTime;
		this.employeeId = employeeId;
	}

	public static final String OTHERWBSLOG = "999";

	private String projectId = null;

	private String wbsId = null;

	private Date startTime = null;

	private String employeeId = null;

	private double mondayWorkTime = 0;

	private double tuesdayWorkTime = 0;

	private double wednesdayWorkTime = 0;

	private double thursdayWorkTime = 0;

	private double fridayWorkTime = 0;

	private double saturdayWorkTime = 0;

	private double sundayWorkTime = 0;
	//构造私有变量取值方法get（）和私有变量赋值方法set（）
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
	 * @return Returns the fridayWorkTime.
	 */
	public double getFridayWorkTime() {
		return fridayWorkTime;
	}

	/**
	 * @param fridayWorkTime
	 *            The fridayWorkTime to set.
	 */
	public void setFridayWorkTime(double fridayWorkTime) {
		this.fridayWorkTime = fridayWorkTime;
	}

	/**
	 * @return Returns the mondayWorkTime.
	 */
	public double getMondayWorkTime() {
		return mondayWorkTime;
	}

	/**
	 * @param mondayWorkTime
	 *            The mondayWorkTime to set.
	 */
	public void setMondayWorkTime(double mondayWorkTime) {
		this.mondayWorkTime = mondayWorkTime;
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
	 * @return Returns the saturdayWorkTime.
	 */
	public double getSaturdayWorkTime() {
		return saturdayWorkTime;
	}

	/**
	 * @param saturdayWorkTime
	 *            The saturdayWorkTime to set.
	 */
	public void setSaturdayWorkTime(double saturdayWorkTime) {
		this.saturdayWorkTime = saturdayWorkTime;
	}

	/**
	 * @return Returns the startTime.
	 */
	public Date getStartTime() {
		return startTime;
	}

	/**
	 * @param startTime
	 *            The startTime to set.
	 */
	public void setStartTime(Date startTime) {
		this.startTime = startTime;
	}

	/**
	 * @return Returns the sundayWorkTime.
	 */
	public double getSundayWorkTime() {
		return sundayWorkTime;
	}

	/**
	 * @param sundayWorkTime
	 *            The sundayWorkTime to set.
	 */
	public void setSundayWorkTime(double sundayWorkTime) {
		this.sundayWorkTime = sundayWorkTime;
	}

	/**
	 * @return Returns the thursdayWorkTime.
	 */
	public double getThursdayWorkTime() {
		return thursdayWorkTime;
	}

	/**
	 * @param thursdayWorkTime
	 *            The thursdayWorkTime to set.
	 */
	public void setThursdayWorkTime(double thursdayWorkTime) {
		this.thursdayWorkTime = thursdayWorkTime;
	}

	/**
	 * @return Returns the tuesdayWorkTime.
	 */
	public double getTuesdayWorkTime() {
		return tuesdayWorkTime;
	}

	/**
	 * @param tuesdayWorkTime
	 *            The tuesdayWorkTime to set.
	 */
	public void setTuesdayWorkTime(double tuesdayWorkTime) {
		this.tuesdayWorkTime = tuesdayWorkTime;
	}

	/**
	 * @return Returns the wbsId.
	 */
	public String getWbsId() {
		return wbsId;
	}

	/**
	 * @param wbsId
	 *            The wbsId to set.
	 */
	public void setWbsId(String wbsId) {
		this.wbsId = wbsId;
	}

	/**
	 * @return Returns the wednesdayWorkTime.
	 */
	public double getWednesdayWorkTime() {
		return wednesdayWorkTime;
	}

	/**
	 * @param wednesdayWorkTime
	 *            The wednesdayWorkTime to set.
	 */
	public void setWednesdayWorkTime(double wednesdayWorkTime) {
		this.wednesdayWorkTime = wednesdayWorkTime;
	}

	public boolean equals(Object o) {
		boolean iResult = false;
		if (o instanceof LogBean) {
			LogBean logInfo = (LogBean) o;
			if (logInfo.getProjectId().equals(projectId)
					&& logInfo.getEmployeeId().equals(employeeId)
					&& logInfo.getWbsId().equals(wbsId)
					&& logInfo.getStartTime().getDate() == startTime.getDate()
					&& logInfo.getStartTime().getMonth() == startTime
							.getMonth()
					&& logInfo.getStartTime().getYear() == startTime.getYear()) {
				iResult = true;
			} else
				iResult = false;
			return iResult;
		} else
			return false;
	}
}