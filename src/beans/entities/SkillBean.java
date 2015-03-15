/*
 * SkillInfo.java
 *
 * Created on 2005年5月5日, 上午8:52
 */

package beans.entities;

/**
 * 用于生成技能实体，与数据库中的角色表对应
 * @author Max
 */
public class SkillBean {
    
    /** Creates a new instance of SkillInfo */
    public SkillBean() {
    }
    
     /**
      * 用于设置技能id的构造函数
      * @param id 技能id
      */
     public SkillBean(String id) {
         this.id=id;         
    }
     
     public SkillBean(String id, String name, String info){
        this.id=id;
        this.info=info;
        this.name=name;
     }
    
    private String id=null;
    
    private String name=null;
    
    private String info=null;
            
    /**
     * 返回id
     * @return 返回id
     */
    public String getId(){
        return id;
    }
    
    /**
     * 设置id
     * @param id 设置id
     */
    public void setId(String id){
        this.id=id;
    }
    
    /**
     * 返回技能名称
     * @return 返回技能名称
     */
    public String getName(){
        return name;
    }
    
    /**
     * 设置名称
     * @param name 技能名称
     */
    public void setName(String name){
        this.name=name;
    }
    
    /**
     * 返回技能信息
     * @return 返回技能信息
     */
    public String getInfo(){
        return info;
    }
    
    /**
     * 设置技能信息
     * @param info 技能信息
     */
    public void setInfo(String info){
        this.info=info;
    }
    
    /**
     * 判断传入对象是否为另一个技能对象是否相同
     * @param o 对象
     * @return 返回布尔值，相同则返回1，否则返回0
     */
    public boolean equals(Object o){
	    boolean iResult = false;
	    if(o instanceof SkillBean){
	    	SkillBean skillInfo = (SkillBean)o;
		    if(skillInfo.getId().equals(id)){
		        iResult = true;
		    }else
		        iResult = false;
		    return iResult;
	    }else
	        return false;
    }
}
