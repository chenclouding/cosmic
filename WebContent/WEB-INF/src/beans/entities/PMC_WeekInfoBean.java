/*
 * Created on 2006-1-20
 *
 * TODO To change the template for this generated file go to
 * Window - Preferences - Java - Code Style - Code Templates
 */
package beans.entities;

import java.sql.Date;

/**
 * @author USER
 *
 * TODO To change the template for this generated type comment go to
 * Window - Preferences - Java - Code Style - Code Templates
 */
public class PMC_WeekInfoBean {
	String projectId;
	int weekSequence;
	int wbsWeekPlan;
	int wbsWeekActual;
	int wbsTotalPlan;
	int wbsTotalActual;
	int phaseId;
	int lifeCycleId;
	
	double weekACWP;
	double weekBCWP;
	double weekBCWS;
	double totalACWP;
	double totalBCWP;
	double totalBCWS;
	
	double CPI;
	double SPI;
	double CV;
	double SV;
	
	Date weekStartDate;
	Date weekEndDate;
	
	public void setProjectId(String  i){
		projectId=i;
	}
	public String getProjectId(){
		return projectId;
	}
	public void setWeekSequence(int i){
		weekSequence=i;
	}
	public int getWeekSequence(){
		return this.weekSequence;
	}
	public void setWbsWeekPlan(int i){
		wbsWeekPlan=i;
	}
	public int getWbsWeekPlan(){
		return wbsWeekPlan;
	}
	public void setWbsWeekActual(int i){
		wbsWeekActual=i;
	}
	public int getWbsWeekActual(){
		return wbsWeekActual; 
	}
	public void setWbsTotalPlan(int i){
		wbsTotalPlan=i;
	}
	public int getWbsTotalPlan(){
		return wbsTotalPlan;
	}
	public void setWbsTotalActual(int i){
		wbsTotalActual=i;
	}
	public int getWbsTotalActual(){
		return wbsTotalActual;
	}
	
	
	public void setWeekACWP(double i){
		weekACWP=i;
	}
	public double getWeekACWP(){
		return weekACWP;
	}
	public void setWeekBCWP(double i){
		weekBCWP=i;
	}
	public double getWeekBCWP(){
		return weekBCWP;
	}
	public void setWeekBCWS(double i){
		weekBCWS=i;
	}
	public double getWeekBCWS(){
		return weekBCWS;
	}
	public void setTotalBcwp(double i){
		totalBCWP=i;
	}
	public double getTotalBcwp(){
		return totalBCWP;
	}
	public void setTotalAcwp(double i){
		totalACWP=i;
	}
	public double getTotalAcwp(){
		return totalACWP;
	}public void setTotalBcws(double i){
		totalBCWS=i;
	}
	public double getTotalBcws(){
		return totalBCWS;
	}
	
	public void setSpi(double i){
		SPI=i;
	}
	public double getSpi(){
		return SPI;
	}
	public void setCpi(double i){
		CPI=i;
	}
	public double getCpi(){
		return CPI;
	}
	public void setSv(double i){
		SV=i;
	}
	public double getSv(){
		return SV;
	}
	public void setCV(double i){
		CV=i;
	}
	public double getCV(){
		return CV;
	}
	public void setPhaseId(int i){
		phaseId=i;
	}
	public int getPhaseId(){
		return phaseId;
	}
	public void setLifeCycleId(int i){
		lifeCycleId=i;
	}
	public int getLifeCycleId(){
		return lifeCycleId;
	}
	
	public void setWeekStartDate(Date dt){
		weekStartDate=dt;
	}
	public Date getWeekStartDate(){
		return weekStartDate;
	}
	public void setWeekEndDate(Date dt){
		weekEndDate=dt;
	}
	public Date getWeekEndDate(){
		return weekEndDate;
	}
}
