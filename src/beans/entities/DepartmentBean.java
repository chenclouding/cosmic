/*
 * Created on 2005-1-4 by congpz
 * 
 */
package beans.entities;

/**
 * @author congpz
 *  
 */
public class DepartmentBean {

	public DepartmentBean() {}
	public DepartmentBean(String id) {
		this.id = id;
	}

	private String id = null;

	private String name = null;

	private String deptManagerId = null;

	//构造私有变量取值方法get（）和私有变量赋值方法set（）
	/**
	 * @return Returns the deptManagerId.
	 */
	
	public String getDeptManagerId() {
		return deptManagerId;
	}

	/**
	 * @param deptManagerId
	 *            The deptManagerId to set.
	 */
	public void setDeptManagerId(String deptManagerId) {
		this.deptManagerId = deptManagerId;
	}

	/**
	 * @return Returns the fullName.
	 */
	public String getName() {
		return name;
	}

	/**
	 * @param name
	 *            The fullName to set.
	 */
	public void setName(String name) {
		this.name = name;
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
}