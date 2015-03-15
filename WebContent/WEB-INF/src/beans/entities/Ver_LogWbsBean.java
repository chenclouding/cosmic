package beans.entities;

import java.sql.Date;
import java.util.ArrayList;
import java.util.Collection;

public class Ver_LogWbsBean {
	
	public Ver_LogWbsBean() {
		children = new ArrayList();
	}

	public Ver_LogWbsBean(String id, String projectId, String employeeId, String productId) {
		children = new ArrayList();
		this.wbsId = id;
		this.projectId = projectId;
		this.employeeId = employeeId;
		this.productId = productId;
	}
	
	String projectId;
	String wbsId;
	String wbsName;
	String productId;
	String employeeId;
	Date planStartTime;
	Date planEndTime;
	Date realStartTime;
	Date realEndTime;
	double planWorkLoad;
	double realWorkLoad;
	private Collection children;
	private String parentId = "000";
	
	public String getProjectId(){
		return projectId;
	}
	public String getProductId(){
		return productId;
	}
	public String getWbsId(){
		return wbsId;
	}
	public String getWbsName(){
		return wbsName;
	}
	public String getEmployeeId(){
		return employeeId;
	}
	public Date getPlanStartTime(){
		return planStartTime;
	}
	public Date getPlanEndTime(){
		return planEndTime;
	}
	public Date getRealStartTime(){
		return realStartTime;
	}
	public Date getRealEndTime(){
		return realEndTime;
	}
	public double getPlanWorkLoad(){
		return planWorkLoad;
	}
	public double getRealWorkLoad(){
		return realWorkLoad;
	}
	
	public void setProjectId(String projectId){
		this.projectId=projectId;
	}
	public void setProductId(String productId){
		this.productId=productId;
	}
	public void setWbsId(String wbsId){
		this.wbsId=wbsId;
	}
	public void setWbsName(String wbsName){
		this.wbsName=wbsName;
	}
	public void setEmployeeId(String id){
		this.employeeId=id;
	}
	public void setPlanStartTime(Date planStartTime){
		this.planStartTime=planStartTime;
	}
	public void setPlanEndTime(Date planEndTime){
		this.planEndTime=planEndTime;
	}
	public void setRealStartTime(Date realStartTime){
		this.realStartTime=realStartTime;
	}
	public void setRealEndTime(Date realEndTime){
		this.realEndTime=realEndTime;
	}
	public void setPlanWorkLoad(double planWorkLoad){
		this.planWorkLoad=planWorkLoad;
	}
	public void setRealWorkLoad(double realWorkLoad){
		this.realWorkLoad=realWorkLoad;
	}
	public Collection getChildren() {
		return children;
	}
	public void setChildren(Collection children) {
		this.children = children;
	}
	public boolean isChild() {
		return children.isEmpty();
	}
	public String getParentId() {
		if (getWbsId().length() > 3) {
			this.parentId = getWbsId().substring(0, getWbsId().length() - 3);
		} else {
			this.parentId = "000";
		}
		return parentId;
	}
	public boolean hasParent() {
		return getWbsId().length() != 3;
	}
}
