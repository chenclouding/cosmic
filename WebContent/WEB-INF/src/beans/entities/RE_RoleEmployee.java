
package beans.entities;

/**
 * @author 周齐
 *  
 */
public class RE_RoleEmployee {

	public RE_RoleEmployee() {
	}

	public RE_RoleEmployee(String projectId,String employeeId,String roleId) {
		this.projectId = projectId;
		this.employeeId = employeeId;
		this.roleId = roleId;
	}

	private String projectId = null;

	private String employeeId = null;
	
	private String roleId = null;
	//构造私有变量取值方法get（）和私有变量赋值方法set（）
	/**
	 * @return Returns the id.
	 */
	public String getProjectId() {
		return projectId;
	}

	/**
	 * @param id
	 *            The id to set.
	 */
	public void setProjectId(String projectId) {
		this.projectId = projectId;
	}

	/**
	 * @return Returns the name.
	 */
	public String getEmployeeId() {
		return employeeId;
	}
	
	/**
	 * @param name
	 *            The name to set.
	 */
	public void setEmployeeId(String employeeId) {
		this.employeeId = employeeId;
	}
	

	/**
	 * @param name
	 *            The name to set.
	 */
	public void setRoleId(String roleId) {
		this.roleId = roleId;
	}
	
	public String getRoleId() {
		return roleId;
	}

}