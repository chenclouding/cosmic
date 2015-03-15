/*
 * TrainerCourseRelationBean.java
 *
 * Created on 2005年5月8日, 下午3:17
 */

package beans.relations;

/**
 *
 * @author Max
 */
public class TrainerCourseRelationBean {
    
    /** Creates a new instance of TrainerCourseRelationBean */
    public TrainerCourseRelationBean() {
    }
    
    private String idTrainer=null;
    private String idCourse=null;
    private String trainerName=null;
    private String courseName=null;
    
    public String getIdTrainer(){
        return this.idTrainer;
    }
    
    public String getIdCourse(){
        return this.idCourse;
    }
    
    public String getTrainerName(){
        return this.trainerName;
    }
    
    public String getCourseName(){
        return this.courseName;
    }
    
    public void setIdTrainer(String idTrainer){
        this.idTrainer=idTrainer;
    }
    
    public void setIdCourse(String idCourse){
        this.idCourse=idCourse;
    }
    
    public void setTrainerName(String trainerName){
        this.trainerName=trainerName;
    }
    
    public void setCourseName(String courseName){
        this.courseName=courseName;
    }
    
}
