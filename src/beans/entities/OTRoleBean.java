/*
 * Created on 2005-1-4 by congpz
 * 
 */
package beans.entities;

/**
 * 用于生成角色实体，与数据库中的角色表对应
 * @author Max
 */
public class OTRoleBean {

	/**
	 * 无参数构造函数
	 */
	public OTRoleBean() {
	}

	/**
	 * 设置角色id的构造函数
	 * @param roleId 角色id
	 */
	public OTRoleBean(String roleId) {
		this.id = roleId;
	}
        
        /**
         * 设置角色id、角色名称的构造函数
         * @param roleId 角色id
         * @param roleName 角色名称
         */
        public OTRoleBean(String roleId,String roleName) {
                this.id = roleId;
                this.name=roleName;
	}

	private String id = null;

	private String name = null;

	/**
	 * 返回id
	 * @return Returns the id.
	 */
	public String getId() {
		return id;
	}

	/**
	 * 设置id
	 * @param id The id to set.
	 */
	public void setId(String id) {
		this.id = id;
	}

	/**
	 * 返回角色名称
	 * @return Returns the name.
	 */
	public String getName() {
		return name;
	}

	/**
	 * 设置角色名称
	 * @param name The name to set.
	 */
	public void setName(String name) {
		this.name = name;
	}
	
	/**
	 * 判断传入对象是否为另一个角色对象是否相同
	 * @param o 角色对象
	 * @return 返回布尔值，相同则返回1，否则返回0
	 */
	public boolean equals(Object o){
	    boolean iResult = false;
	    if(o instanceof OTRoleBean){
	    	OTRoleBean roleInfo = (OTRoleBean)o;
		    if(roleInfo.getId().equals(id)){
		        iResult = true;
		    }else
		        iResult = false;
		    return iResult;
	    }else
	        return false;
	}
}