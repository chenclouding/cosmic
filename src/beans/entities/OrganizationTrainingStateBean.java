/*
 * Created on 2005-5-14
 *
 * TODO To change the template for this generated file go to
 * Window - Preferences - Java - Code Style - Code Templates
 */
package beans.entities;

//import java.sql.Date;
/**
 * @author Max
 *
 * TODO To change the template for this generated type comment go to
 * Window - Preferences - Java - Code Style - Code Templates
 */
public class OrganizationTrainingStateBean {
 
	/**
	 * 
	 */
	public OrganizationTrainingStateBean() {
	}

	public OrganizationTrainingStateBean(EmployeeBean ei) {
		this.idEmpoyee=ei.getId();		
	}
	
	private String idEmpoyee="";	
	private String project="";
	private String appDate="";
	private String idRole="";
	private String idSkill="";
	private String idCourse="";
	private String dutyNow="";
	private String appReason="";
	private String status="";
	
	
	public String getId(){
		return idEmpoyee;
	}
		
	
	public String getProject(){
		return project;
	}
	
	public String getAppdate(){
		return appDate;
	}
	
	public String getIdRole(){
		return idRole;		
	}
	
	public String getIdSkill(){
		return idSkill;
	}
	
	public String getIdCourse(){
		return idCourse;
	}
	
	public String getDutyNow(){
		return dutyNow;
	}
	
	public String getAppReason(){
		return appReason;
	}
	
	public String getStatus(){
		return status;
	}	
	
	public void setId(String id){
		this.idEmpoyee=id;
	}
	
		
	public void setProject(String project){
		this.project=project;
	}
	
	public void setAppdate(String appDate){
		this.appDate=appDate;
	}
	
	public void setIdRole(String idRole){
		this.idRole=idRole;		
	}
	
	public void setIdSkill(String idSkill){
		this.idSkill=idSkill;
	}
	
	public void setIdCourse(String idCourse){
		this.idCourse=idCourse;
	}
	
	public void setDutyNow(String dutyNow){
		this.dutyNow=dutyNow;
	}
	
	public void setAppReason(String appReason){
		this.appReason=appReason;
	}
	
	public void setStatus(String status){
		this.status=status;
	}
	
}

