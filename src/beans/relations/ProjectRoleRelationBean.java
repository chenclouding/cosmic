/*
 * Created on 2005-1-4 by congpz
 * 
 */
package beans.relations;

/**
 * @author congpz
 *  
 */
public class ProjectRoleRelationBean {

	public ProjectRoleRelationBean(){}
	
	public ProjectRoleRelationBean(String projectId, String roleId) {
		this.projectId = projectId;
		this.roleId = roleId;
	}

	private String projectId = null;

	private String roleId = null;
	
	private double ActorWorkload;
	
	private double ActorWorkloadRate;

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
	public String getRoleId() {
		return roleId;
	}

	/**
	 * @param roleId
	 *            The roleId to set.
	 */
	public void setRoleId(String roleId) {
		this.roleId = roleId;
	}

	/**
	 * @return Returns the ActorWorkload.
	 */
	public double getActorWorkload() {
		return ActorWorkload;
	}

	/**
	 * @param ActorWorkload
	 *            The ActorWorkload to set.
	 */
	public void setActorWorkload(double ActorWorkload) {
		this.ActorWorkload = ActorWorkload;
	}

	/**
	 * @return Returns the actorWorkloadRate.
	 */
	public double getActorWorkloadRate() {
		return ActorWorkloadRate;
	}
	/**
	 * @param actorWorkloadRate The actorWorkloadRate to set.
	 */
	public void setActorWorkloadRate(double actorWorkloadRate) {
		ActorWorkloadRate = actorWorkloadRate;
	}
}