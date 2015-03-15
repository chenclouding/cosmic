/*
 * Created on 2005-6-15
 *
 * TODO To change the template for this generated file go to
 * Window - Preferences - Java - Code Style - Code Templates
 */
package beans.entities;

import java.sql.Date;

/**
 * @author Alligator
 *
 * TODO To change the template for this generated type comment go to
 * Window - Preferences - Java - Code Style - Code Templates
 */
public class ModelEquWeekBean {
	/**
	 * @return Returns the equWeekEndTime.
	 */
	public Date getEquWeekEndTime() {
		return equWeekEndTime;
	}
	/**
	 * @param equWeekEndTime The equWeekEndTime to set.
	 */
	public void setEquWeekEndTime(Date equWeekEndTime) {
		this.equWeekEndTime = equWeekEndTime;
	}
	/**
	 * @return Returns the equWeekId.
	 */
	
	/**
	 * @return Returns the equWeekActionTypeWorkload.
	 */
	public double getEquWeekActionTypeWorkload() {
		return equWeekActionTypeWorkload;
	}
	/**
	 * @param equWeekActionTypeWorkload The equWeekActionTypeWorkload to set.
	 */
	public void setEquWeekActionTypeWorkload(double equWeekActionTypeWorkload) {
		this.equWeekActionTypeWorkload = equWeekActionTypeWorkload;
	}
	/**
	 * @return Returns the equWeekActionTypeWorkloadRate.
	 */
	public double getEquWeekActionTypeWorkloadRate() {
		return equWeekActionTypeWorkloadRate;
	}
	/**
	 * @param equWeekActionTypeWorkloadRate The equWeekActionTypeWorkloadRate to set.
	 */
	public void setEquWeekActionTypeWorkloadRate(double equWeekActionTypeWorkloadRate) {
		this.equWeekActionTypeWorkloadRate = equWeekActionTypeWorkloadRate;
	}
	/**
	 * @return Returns the equWeekStartTime.
	 */
	public Date getEquWeekStartTime() {
		return equWeekStartTime;
	}
	/**
	 * @param equWeekStartTime The equWeekStartTime to set.
	 */
	public void setEquWeekStartTime(Date equWeekStartTime) {
		this.equWeekStartTime = equWeekStartTime;
	}
	/**
	 * @return Returns the projectId.
	 */
	public String getProjectId() {
		return projectId;
	}
	/**
	 * @param projectId The projectId to set.
	 */
	public void setProjectId(String projectId) {
		this.projectId = projectId;
	}
	/**
	 * @return Returns the ActionTypeId.
	 */
	
	public String getActionType(){
		return actionType;
	}
	
	public void  setActionType(String actionType){
		this.actionType = actionType;
	}
	public ModelEquWeekBean()
	{
		projectId = null;
		equWeekId = 0;
		actionType=null;
		equWeekActionTypeWorkload = 0;
		equWeekActionTypeWorkloadRate = 0;
		equWeekStartTime = null;
		equWeekEndTime = null;
		
	}
	private String projectId;
	private int equWeekId;
	private double equWeekActionTypeWorkloadRate;
	private double equWeekActionTypeWorkload;
	private Date equWeekStartTime;
	private Date equWeekEndTime;
	private String actionType;
	
	
	/**
	 * @return Returns the equWeekId.
	 */
	public int getEquWeekId() {
		return equWeekId;
	}
	/**
	 * @param equWeekId The equWeekId to set.
	 */
	public void setEquWeekId(int equWeekId) {
		this.equWeekId = equWeekId;
	}
}
