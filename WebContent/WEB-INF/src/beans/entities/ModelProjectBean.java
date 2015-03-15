/*
 * Created on 2005-5-19
 *
 * TODO To change the template for this generated file go to
 * Window - Preferences - Java - Code Style - Code Templates
 */
package beans.entities;


/**
 * @author Alligator
 *
 * TODO To change the template for this generated type comment go to
 * Window - Preferences - Java - Code Style - Code Templates
 */

public class ModelProjectBean {
	public ModelProjectBean(){
		}
	public ModelProjectBean(String ProjectId, int PhaseId, String actionType){
		this.ProjectId = ProjectId;
		this.PhaseId = PhaseId;
		this.actionType = actionType;
		}
	private String ProjectId = null;
	
	private int PhaseId ;
	
	private String ActorId = null;
	
	private String actionType=null;
	
	private double PhaseActionTypeWorkload;
	
	private double PhaseActionTypeWorkloadRate;
	

	/**
	 * @return Returns the PhaseId.
	 */
	public int getPhaseId() {
		return PhaseId;
	}

	/**
	 * @param PhaseId
	 *            The PhaseId to set.
	 */
	public void setPhaseId(int PhaseId) {
		this.PhaseId = PhaseId;
	}
	
	/**
	 * @return Returns the ProjectId.
	 */
	public String getProjectId() {
		return ProjectId;
	}

	/**
	 * @param ProjectId
	 *            The ProjectId to set.
	 */
	public void setProjectId(String ProjectId) {
		this.ProjectId = ProjectId;
	}
	
	/**
	 * @return Returns the ActorId.
	 */
	public String getActorId() {
		return ActorId;
	}

	/**
	 * @param ActorId
	 *            The ActorId to set.
	 */
	public void setActorId(String ActorId) {
		this.ActorId = ActorId;
	}
	
	public String getActionType(){
		return actionType;
	}
	
	public void setActionType(String actionType){
		this.actionType=actionType;
	}
	/**
	 * @return Returns the PhaseActionTypeWorkloadRate.
	 */
	public double getPhaseActionTypeWorkloadRate() {
		return PhaseActionTypeWorkloadRate;
	}

	/**
	 * @param PhaseActionTypeWorkloadRate
	 *            The PhaseActionTypeWorkloadRate to set.
	 */
	public void setPhaseActionTypeWorkloadRate(double PhaseActionTypeWorkloadRate) {
		this.PhaseActionTypeWorkloadRate = PhaseActionTypeWorkloadRate;
	}
	
	/**
	 * @return Returns the PhaseActionTypeWorkload.
	 */
	public double getPhaseActionTypeWorkload() {
		return PhaseActionTypeWorkload;
	}

	/**
	 * @param PhaseActionTypeWorkload
	 *            The PhaseActionTypeWorkload to set.
	 */
	public void setPhaseActionTypeWorkload(double PhaseActionTypeWorkload) {
		this.PhaseActionTypeWorkload = PhaseActionTypeWorkload;
	}

}
