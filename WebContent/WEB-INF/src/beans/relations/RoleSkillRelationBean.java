/*
 * RoleSkillRelationBean.java
 *
 * Created on 2005年5月5日, 下午9:43
 */

package beans.relations;

/**
 * 用于生成角色技能关系表的实体
 * @author Max
 */
public class RoleSkillRelationBean {
    
    /** Creates a new instance of RoleSkillRelationBean */
    public RoleSkillRelationBean() {
    }
    
    /**
     * 设置角色技能id的构造函数
     * @param idRole 角色id
     * @param idSkill 技能id
     */
    public RoleSkillRelationBean(String idRole,String idSkill){
        this.idRole=idRole;
        this.idSkill=idSkill;
    }
    
        
     /**
     * 设置全部属性的构造函数
     * @param idRole 角色id
     * @param idSkill 技能id
     */
    public RoleSkillRelationBean(String idRole,String idSkill,String roleName,String skillName){
        this.idRole=idRole;
        this.idSkill=idSkill;
        this.roleName=roleName;
        this.skillName=skillName;
    }
    
    private String idRole;
        
    private String idSkill;
    
    private String roleName;
    
    private String skillName;
    
    /**
     * 获取角色id
     * @return 角色id
     */
    public String getIdRole(){
        return idRole;
    }
    
    /**
     * 设置角色id
     * @param id 传入要设置的角色id
     */
    public void setIdRole(String id){
        this.idRole=id;
    }
    
    /**
     * 获取技能id
     * @return 技能id
     */
    public String getIdSkill(){
        return idSkill;
    }
    
    /**
     * 设置技能id
     * @param id 传入要设置的技能id
     */
    public void setIdSkill(String id){
        this.idSkill=id;
    }
    
    /**
     * 获取角色名称
     * @return 角色名称
     */
    public String getSkillName(){
        return skillName;
    }
    
    /**
     * 设置技能名称
     * @param name 传入要设置的技能名称
     */
    public void setSkillName(String name){
        this.skillName=name;
    }
    
    /**
     * 获取角色名称
     * @return 技能名称
     */
    public String getRoleName(){
        return roleName;
    }
    
    /**
     * 设置技能名称
     * @param name 传入要设置的技能名称
     */
    public void setRoleName(String name){
        this.roleName=name;
    }
}
