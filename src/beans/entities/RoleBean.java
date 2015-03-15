/*
 * Created on 2005-1-4 by congpz
 * 
 */
package beans.entities;

/**
 * @author congpz
 *  
 */
public class RoleBean {

	public RoleBean() {
	}

	public RoleBean(String id) {
		this.id = id;
	}

	private String id = null;

	private String name = null;
	//构造私有变量取值方法get（）和私有变量赋值方法set（）
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
	
	public boolean equals(Object o){
	    boolean iResult = false;
	    if(o instanceof RoleBean){
	    	RoleBean roleInfo = (RoleBean)o;
		    if(roleInfo.getId().equals(id)){
		        iResult = true;
		    }else
		        iResult = false;
		    return iResult;
	    }else
	        return false;
	}
}