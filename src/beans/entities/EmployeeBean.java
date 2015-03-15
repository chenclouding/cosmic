/*
 * Created on 2005-1-4 by congpz
 * 
 */
package beans.entities;

/**
 * @author congpz
 * 
 */
public class EmployeeBean {

	public EmployeeBean() {
	}

	public EmployeeBean(String id) {
		this.id = id;
	}

	private String id = null;

	private String name = null;

	private String deptId = null;

	private String userName = null;

	private String password = null;
	
	//null, 000 and 001 stands for ordinary employee
	//002:
	//003: quit
	//others: reserved
	private String employeeType = null;
	
    //===========start  Add by zhangfj=======
	private String email = null;

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}
	 //===========end  Add by zhangfj=======
	// 构造私有变量取值方法get（）和私有变量赋值方法set（）
	/**
	 * @return Returns the department id.
	 */
	public String getDeptId() {
		return deptId;
	}

	/**
	 * @param deptId
	 *            The department id to set, which the employee belongs to.
	 */
	public void setDeptId(String deptId) {
		this.deptId = deptId;
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
	 * @return Returns the password.
	 */
	public String getPassword() {
		return password;
	}

	/**
	 * @param password
	 *            The password to set.
	 */
	public void setPassword(String password) {
		this.password = password;
	}

	/**
	 * @return Returns the user name.
	 */
	public String getUserName() {
		return userName;
	}

	/**
	 * @param userName
	 *            The user name to set, which is one-to-one related to the
	 *            employee's id.
	 */
	public void setUserName(String userName) {
		this.userName = userName;
	}

	public boolean equals(Object o) {
		boolean iResult = false;
		if (o instanceof EmployeeBean) {
			EmployeeBean employeeInfo = (EmployeeBean) o;
			if (employeeInfo.getId().equals(id)) {
				iResult = true;
			} else
				iResult = false;
			return iResult;
		} else
			return false;
	}

	public String getEmployeeType() {
		return employeeType;
	}

	public void setEmployeeType(String employeeType) {
		this.employeeType = employeeType;
	}
}