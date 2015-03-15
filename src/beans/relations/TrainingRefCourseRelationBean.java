/*
 * Created on 2006-3-3
 *
 * TODO To change the template for this generated file go to
 * Window - Preferences - Java - Code Style - Code Templates
 */
package beans.relations;

/**
 * @author feifei
 *
 * TODO To change the template for this generated type comment go to
 * Window - Preferences - Java - Code Style - Code Templates
 */
public class TrainingRefCourseRelationBean {

	public TrainingRefCourseRelationBean(){
	}
	
	private String idTrainingRef = null;
	private String idCourse = null;
	private String refName = null;
	private String courseName = null;
	
	public String getIdTrainingRef(){
		return this.idTrainingRef;
	}
	
	public String getIdCourse(){
		return this.idCourse;
	}
	
	public String getRefName(){
		return this.refName;
	}
	
	public String getCourseName(){
		return this.courseName;
	}
	
	public void setIdTrainingRef(String idTrainingRef){
		this.idTrainingRef=idTrainingRef;
	}
	
	public void setIdCourse(String idCourse){
		this.idCourse=idCourse;
	}
  	
	public void setRefName(String refName){
		this.refName=refName;
	}
	
	public void setCourseName(String courseName){
		this.courseName=courseName;
	}
	
	
}
