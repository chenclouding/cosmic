/*
 * Created on 2005-1-4 by congpz
 * 
 */
package beans.entities;

/**
 * 
 *  
 */
public class ProjectActionTypeBean {

	public ProjectActionTypeBean(){}
	
	public ProjectActionTypeBean(String projectId, String actionType) {
		this.projectId = projectId;
		this.actionType = actionType;
	}

	private String projectId = null;

	private String actionType = null;
	
	private double actionTypeWorkload;
	
	private double actionTypeWorkloadRate;

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
	 * @return Returns the roleId.
	 */
	public String getActionType() {
		return actionType;
	}

	/**
	 * @param roleId
	 *            The roleId to set.
	 */
	public void setActionType(String actionType) {
		this.actionType = actionType;
	}

	/**
	 * @return Returns the ActorWorkload.
	 */
	public double getActionTypeWorkload() {
		return actionTypeWorkload;
	}

	/**
	 * @param ActorWorkload
	 *            The ActorWorkload to set.
	 */
	public void setActionTypeWorkload(double actionTypeWorkload) {
		this.actionTypeWorkload = actionTypeWorkload;
	}

	/**
	 * @return Returns the actorWorkloadRate.
	 */
	public double getActionTypeWorkloadRate() {
		return actionTypeWorkloadRate;
	}
	/**
	 * @param actorWorkloadRate The actorWorkloadRate to set.
	 */
	public void setActionTypeWorkloadRate(double actionTypeWorkloadRate) {
		this.actionTypeWorkloadRate = actionTypeWorkloadRate;
	}
}