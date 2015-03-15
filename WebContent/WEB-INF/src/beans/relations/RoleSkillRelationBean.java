/*
 * RoleSkillRelationBean.java
 *
 * Created on 2005��5��5��, ����9:43
 */

package beans.relations;

/**
 * �������ɽ�ɫ���ܹ�ϵ���ʵ��
 * @author Max
 */
public class RoleSkillRelationBean {
    
    /** Creates a new instance of RoleSkillRelationBean */
    public RoleSkillRelationBean() {
    }
    
    /**
     * ���ý�ɫ����id�Ĺ��캯��
     * @param idRole ��ɫid
     * @param idSkill ����id
     */
    public RoleSkillRelationBean(String idRole,String idSkill){
        this.idRole=idRole;
        this.idSkill=idSkill;
    }
    
        
     /**
     * ����ȫ�����ԵĹ��캯��
     * @param idRole ��ɫid
     * @param idSkill ����id
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
     * ��ȡ��ɫid
     * @return ��ɫid
     */
    public String getIdRole(){
        return idRole;
    }
    
    /**
     * ���ý�ɫid
     * @param id ����Ҫ���õĽ�ɫid
     */
    public void setIdRole(String id){
        this.idRole=id;
    }
    
    /**
     * ��ȡ����id
     * @return ����id
     */
    public String getIdSkill(){
        return idSkill;
    }
    
    /**
     * ���ü���id
     * @param id ����Ҫ���õļ���id
     */
    public void setIdSkill(String id){
        this.idSkill=id;
    }
    
    /**
     * ��ȡ��ɫ����
     * @return ��ɫ����
     */
    public String getSkillName(){
        return skillName;
    }
    
    /**
     * ���ü�������
     * @param name ����Ҫ���õļ�������
     */
    public void setSkillName(String name){
        this.skillName=name;
    }
    
    /**
     * ��ȡ��ɫ����
     * @return ��������
     */
    public String getRoleName(){
        return roleName;
    }
    
    /**
     * ���ü�������
     * @param name ����Ҫ���õļ�������
     */
    public void setRoleName(String name){
        this.roleName=name;
    }
}
