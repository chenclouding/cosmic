/*
 * Created on 2005-1-4 by congpz
 * 
 */
package beans.entities;

/**
 * �������ɽ�ɫʵ�壬�����ݿ��еĽ�ɫ���Ӧ
 * @author Max
 */
public class OTRoleBean {

	/**
	 * �޲������캯��
	 */
	public OTRoleBean() {
	}

	/**
	 * ���ý�ɫid�Ĺ��캯��
	 * @param roleId ��ɫid
	 */
	public OTRoleBean(String roleId) {
		this.id = roleId;
	}
        
        /**
         * ���ý�ɫid����ɫ���ƵĹ��캯��
         * @param roleId ��ɫid
         * @param roleName ��ɫ����
         */
        public OTRoleBean(String roleId,String roleName) {
                this.id = roleId;
                this.name=roleName;
	}

	private String id = null;

	private String name = null;

	/**
	 * ����id
	 * @return Returns the id.
	 */
	public String getId() {
		return id;
	}

	/**
	 * ����id
	 * @param id The id to set.
	 */
	public void setId(String id) {
		this.id = id;
	}

	/**
	 * ���ؽ�ɫ����
	 * @return Returns the name.
	 */
	public String getName() {
		return name;
	}

	/**
	 * ���ý�ɫ����
	 * @param name The name to set.
	 */
	public void setName(String name) {
		this.name = name;
	}
	
	/**
	 * �жϴ�������Ƿ�Ϊ��һ����ɫ�����Ƿ���ͬ
	 * @param o ��ɫ����
	 * @return ���ز���ֵ����ͬ�򷵻�1�����򷵻�0
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