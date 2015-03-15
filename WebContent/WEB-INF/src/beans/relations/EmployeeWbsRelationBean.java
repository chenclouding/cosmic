/*
 * Created on 2005-1-4 by congpz
 * 
 */
package beans.relations;

/**
 * @author congpz
 *  
 */
public class EmployeeWbsRelationBean {

	public EmployeeWbsRelationBean() {
	}

	public EmployeeWbsRelationBean(String projectId, String wbsId,
			String employeeId) {
		this.projectId = projectId;
		this.wbsId = wbsId;
		this.employeeId = employeeId;

	}

	private String projectId = null;

	private String wbsId = null;

	private String employeeId = null;

	private String wbsState = null;

	private String scaleUnit = null;

	private double wbsScale = 0;

	private String assessorId = null;

	private String roleId = null;

	private int lifecycleId = 0;

	private int phaseId = 0;

	private double workload = 0;
	
	private double assignedEmployeeTime=0;
	
	public double getAssignedEmployeeTime(){
		return assignedEmployeeTime;
	}
	//构造私有变量取值方法get（）和私有变量赋值方法set（）
	/**
	 * @return Returns the assessorId.
	 */
	public String getAssessorId() {
		return assessorId;
	}

	/**
	 * @param assessorId
	 *            The assessorId to set.
	 */
	public void setAssessorId(String assessorId) {
		this.assessorId = assessorId;
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
	 * @return Returns the phaseId.
	 */
	public int getPhaseId() {
		return phaseId;
	}

	/**
	 * @param phaseId
	 *            The phaseId to set.
	 */
	public void setPhaseId(int phaseId) {
		this.phaseId = phaseId;
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
	 * @return Returns the roleId.
	 */
	public String getRoleId() {
		return roleId;
	}

	public void setAssignedEmployeeTime(double assignedEmployeeTime){
		this.assignedEmployeeTime=assignedEmployeeTime;
	}
	
	/**
	 * @param roleId
	 *            The roleId to set.
	 */
	public void setRoleId(String roleId) {
		this.roleId = roleId;
	}

	/**
	 * @return Returns the scaleUnit.
	 */
	public String getScaleUnit() {
		return scaleUnit;
	}

	/**
	 * @param scaleUnit
	 *            The scaleUnit to set.
	 */
	public void setScaleUnit(String scaleUnit) {
		this.scaleUnit = scaleUnit;
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
	 * @return Returns the wbsScale.
	 */
	public double getWbsScale() {
		return wbsScale;
	}

	/**
	 * @param wbsScale
	 *            The wbsScale to set.
	 */
	public void setWbsScale(double wbsScale) {
		this.wbsScale = wbsScale;
	}

	/**
	 * @return Returns the wbsState.
	 */
	public String getWbsState() {
		return wbsState;
	}

	/**
	 * @param wbsState
	 *            The wbsState to set.
	 */
	public void setWbsState(String wbsState) {
		this.wbsState = wbsState;
	}

	/**
	 * @return Returns the workload.
	 */
	public double getWorkload() {
		return workload;
	}

	/**
	 * @param workload
	 *            The workload to set.
	 */
	public void setWorkload(double workload) {
		this.workload = workload;
	}

	public boolean equals(Object o) {
		if (o instanceof EmployeeWbsRelationBean) {
			EmployeeWbsRelationBean ewrb = (EmployeeWbsRelationBean) o;
			if (ewrb.getProjectId().equals(projectId)
					&& ewrb.getWbsId().equals(wbsId)
					&& ewrb.getEmployeeId().equals(employeeId)) {
				return true;
			}
		}
		
		return false;
	}
}