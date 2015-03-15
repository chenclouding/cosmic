/*
 * Created on 2005-1-4 by congpz
 * 
 */
package beans.relations;
   

/**
 * @author congpz
 *  
 */
public class ProjectEmployeeRelationBean {

	private String projectId = null;

	private String employeeId = null;

	private double dispatchedTime = 0;

	private double usedTime = 0;

	private String dispatchPurview = beans.entities.DataDictionaryBean.NORMAL_PURVIEW;

	private double currentAppliedTime = 0;

	private double nextAppliedTime = 0;

	public ProjectEmployeeRelationBean(){}

	public ProjectEmployeeRelationBean(String projectId, String employeeId) {
		this.projectId = projectId;
		this.employeeId = employeeId;
	}
	//构造私有变量取值方法get（）和私有变量赋值方法set（）
	/**
	 * @return Returns the currentAppliedTime.
	 */
	public double getCurrentAppliedTime() {
		return currentAppliedTime;
	}

	/**
	 * @param currentAppliedTime
	 *            The currentAppliedTime to set.
	 */
	public void setCurrentAppliedTime(double currentAppliedTime) {
		this.currentAppliedTime = currentAppliedTime;
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
	 * @return Returns the dispatchPurview.
	 */
	public String getDispatchPurview() {
		return dispatchPurview;
	}

	/**
	 * @param dispatchPurview
	 *            The dispatchPurview to set.
	 */
	public void setDispatchPurview(String dispatchPurview) {
		this.dispatchPurview = dispatchPurview;
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
	 * @return Returns the nextAppliedTime.
	 */
	public double getNextAppliedTime() {
		return nextAppliedTime;
	}

	/**
	 * @param nextAppliedTime
	 *            The nextAppliedTime to set.
	 */
	public void setNextAppliedTime(double nextAppliedTime) {
		this.nextAppliedTime = nextAppliedTime;
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
}