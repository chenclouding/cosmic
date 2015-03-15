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
public class ProjectBean {

	private String id = null;

	private String name = null;

	private String abbreviation = null;

	private String managerId = null;

	private Date planStartTime = null;

	private Date realStartTime = null;

	private Date planEndTime = null;

	private Date realEndTime = null;

	private String deptId ;

	private String dispatchCycle = DataDictionaryBean.UNIT_MONTH;

	private int currentCycleScale = 1;

	private Date cycleStartTime = null;

	private int lifecycleId = 0;

	private int currentPhaseId = 0;

	private String currentState = null;
	
	private double ProjectLength ;
	
	private double ProjectWorkload ;
	
	private String projectSize = null;
	private String projectType = null;
	private String projectBack = null;
	private String projectIntro = null;
    private String projectAcceptStandard=null;	
    private String projectQualityObject=null;

	
	public ProjectBean(String id) {
		this.id = id;
	}

	public ProjectBean() {
	}

	/**
	 * @return Returns the abbreviation.
	 */
	
	
	public String getProjectSize() {
			return projectSize;
		}

		/**
		 * @param deptId
		 *            The deptId to set.
		 */
		public void setProjectSize(String deptId) {
			this.projectSize = deptId;
		}

	public String getProjectType() {
			return projectType;
		}

		/**
		 * @param deptId
		 *            The deptId to set.
		 */
		public void setProjectType(String deptId) {
			this.projectType = deptId;
		}

	public String getProjectBack() {
			return projectBack;
		}

		/**
		 * @param deptId
		 *            The deptId to set.
		 */
		public void setProjectBack(String projectBack) {
			this.projectBack = projectBack;
		}

	public String getProjectIntro() {
			return projectIntro;
		}

		/**
		 * @param deptId
		 *            The deptId to set.
		 */
		public void setProjectIntro(String deptId) {
			this.projectIntro = deptId;
		}

		public String getProjectAcceptStandard() {
			return projectAcceptStandard;
		}
		public void setProjectAcceptStandard(String projectAcceptStandard ) {
			this.projectAcceptStandard=projectAcceptStandard;
		}
		public String getProjectQualityObject() {
			return projectQualityObject;
		}
		public void setProjectQualityObject(String projectQualityObject) {
			this.projectQualityObject = projectQualityObject;
		}
	
	
	
	public String getAbbreviation() {
		return abbreviation;
	}

	/**
	 * @param abbreviation
	 *            The abbreviation to set.
	 */
	public void setAbbreviation(String abbreviation) {
		this.abbreviation = abbreviation;
	}

	/**
	 * @return Returns the currentCycleScale.
	 */
	public int getCurrentCycleScale() {
		return currentCycleScale;
	}

	/**
	 * @param currentCycleScale
	 *            The currentCycleScale to set.
	*/
	public void setCurrentCycleScale(int currentCycleScale) {
		this.currentCycleScale = currentCycleScale;
	}

	/**
	 * @return Returns the currentPhaseId.
	 */
	public int getCurrentPhaseId() {
		return currentPhaseId;
	}

	/**
	 * @param currentPhaseId
	 *            The currentPhaseId to set.
	 */
	public void setCurrentPhaseId(int currentPhaseId) {
		this.currentPhaseId = currentPhaseId;
	}

	/**
	 * @return Returns the currentState.
	 */
	public String getCurrentState() {
		return currentState;
	}

	/**
	 * @param currentState
	 *            The currentState to set.
	 */
	public void setCurrentState(String currentState) {
		this.currentState = currentState;
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
	 * @return Returns the deptId.
	 */
	public String getDeptId() {
		return deptId;
	}

	/**
	 * @param deptId
	 *            The deptId to set.
	 */
	public void setDeptId(String deptId) {
		this.deptId = deptId;
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
	 * @return Returns the id.
	 */
	public String getId() {
		return id;
	}

	/**
	 * @param id
	 *            The id to set.
	 */
	public void setId(String id) {
		this.id = id;
	}

	/**
	 * @return Returns the lifecycleId.
	 */
	public int getLifecycleId() {
		return lifecycleId;
	}

	/**
	 * @param lifecycleId
	 *            The lifecycleId to set.
	 */
	public void setLifecycleId(int lifecycleId) {
		this.lifecycleId = lifecycleId;
	}

	/**
	 * @return Returns the managerId.
	 */
	public String getManagerId() {
		return managerId;
	}

	/**
	 * @param managerId
	 *            The managerId to set.
	 */
	public void setManagerId(String managerId) {
		this.managerId = managerId;
	}

	/**
	 * @return Returns the name.
	 */
	public String getName() {
		return name;
	}

	/**
	 * @param name
	 *            The name to set.
	 */
	public void setName(String name) {
		this.name = name;
	}

	/**
	 * @return Returns the planEndTime.
	 */
	public Date getPlanEndTime() {
		return planEndTime;
	}

	/**
	 * @param planEndTime
	 *            The planEndTime to set.
	 */
	public void setPlanEndTime(Date planEndTime) {
		this.planEndTime = planEndTime;
	}

	/**
	 * @return Returns the planStartTime.
	 */
	public Date getPlanStartTime() {
		return planStartTime;
	}

	/**
	 * @param planStartTime
	 *            The planStartTime to set.
	 */
	public void setPlanStartTime(Date planStartTime) {
		this.planStartTime = planStartTime;
	}

	/**
	 * @return Returns the realEndTime.
	 */
	public Date getRealEndTime() {
		return realEndTime;
	}

	/**
	 * @param realEndTime
	 *            The realEndTime to set.
	 */
	public void setRealEndTime(Date realEndTime) {
		this.realEndTime = realEndTime;
	}

	/**
	 * @return Returns the realStartTime.
	 */
	public Date getRealStartTime() {
		return realStartTime;
	}

	/**
	 * @param realStartTime
	 *            The realStartTime to set.
	 */
	public void setRealStartTime(Date realStartTime) {
		this.realStartTime = realStartTime;
	}

	/**
	 * @return Returns the ProjectWorkload.
	 */
	public double getProjectWorkload() {
		return ProjectWorkload;
	}

	/**
	 * @param ProjectWorkload
	 *            The ProjectWorkload to set.
	 */
	public void setProjectWorkload(double ProjectWorkload) {
		this.ProjectWorkload = ProjectWorkload;
	}

	/**
	 * @return Returns the ProjectLength.
	 */
	public double getProjectLength() {
		return ProjectLength;
	}

	/**
	 * @param ProjectLength
	 *            The ProjectLength to set.
	 */
	public void setProjectLength(double ProjectLength) {
		this.ProjectLength = ProjectLength;
	}

	public boolean equals(Object o){
	    boolean iResult = false;
	    if(o instanceof ProjectBean){
	    	ProjectBean projectInfo = (ProjectBean)o;
		    if(projectInfo.getId().equals(id)){
		        iResult = true;
		    }else
		        iResult = false;
		    return iResult;
	    }else
	        return false;
	}
}