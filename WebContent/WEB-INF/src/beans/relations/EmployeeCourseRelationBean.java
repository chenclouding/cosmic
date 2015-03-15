/*
 * EmployeeCourseRelationBean.java
 *
 * Created on 2005年5月8日, 下午3:17
 */

package beans.relations;

/**
 *
 * @author Max
 */
public class EmployeeCourseRelationBean {
    
    /** Creates a new instance of EmployeeCourseRelationBean */
    public EmployeeCourseRelationBean() {
    }
    
    private String idEmployee=null;
    private String idCourse=null;
    private String employeeName=null;
    private String courseName=null;
    
    public String getIdEmployee(){
        return this.idEmployee;
    }
    
    public String getIdCourse(){
        return this.idCourse;
    }
    
    public String getEmployeeName(){
        return this.employeeName;
    }
    
    public String getCourseName(){
        return this.courseName;
    }
    
    public void setIdEmployee(String idEmployee){
        this.idEmployee=idEmployee;
    }
    
    public void setIdCourse(String idCourse){
        this.idCourse=idCourse;
    }
    
    public void setEmployeeName(String EmployeeName){
        this.employeeName=EmployeeName;
    }
    
    public void setCourseName(String courseName){
        this.courseName=courseName;
    }
    
}