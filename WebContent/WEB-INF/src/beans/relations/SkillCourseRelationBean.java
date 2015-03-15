/*
 * SkillCourseRelationBean.java
 *
 * Created on 2005年5月7日, 下午8:02
 */

package beans.relations;

/**
 *
 * @author Max
 */
public class SkillCourseRelationBean {
    
    /** Creates a new instance of SkillCourseRelationBean */
    public SkillCourseRelationBean() {
    }
    
    public SkillCourseRelationBean(String idSkill,String idCourse){
        this.idCourse=idCourse;
        this.idSkill=idSkill;
        
    }
    
    
    
    private String idSkill;
    private String idCourse;
    private String skillName;
    private String courseName;
    
    public String getIdSkill(){
        return this.idSkill;
    }
    
    public String getIdCourse(){
        return this.idCourse;
    }
    
    public String getSkillName(){
        return this.skillName;
    }
    
    public String getCourseName(){
        return this.courseName;
    }
    
    public void setIdSkill(String idSkill){
        this.idSkill=idSkill;
    }
    
    public void setIdCourse(String idCourse){
        this.idCourse=idCourse;        
    }
    
    public void setCourseName(String courseName){
        this.courseName=courseName;
    }
    
    public void setSkillName(String skillName){
        this.skillName=skillName;
    }
    
    
}
