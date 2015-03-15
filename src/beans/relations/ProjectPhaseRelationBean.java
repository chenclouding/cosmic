/*
 * Created on 2005-1-4 by congpz
 * 
 */
package beans.relations;

import java.sql.Date;

/**
 * @author congpz
 *  
 */
public class ProjectPhaseRelationBean {
	
	public ProjectPhaseRelationBean(){
		
	}

	public ProjectPhaseRelationBean(String projectId, int lifecycleId,
			int phaseId, int sequenceNum) {
		this.projectId = projectId;
		this.lifecycleId = lifecycleId;
		this.phaseId = phaseId;
		this.sequenceNum = sequenceNum;

	}

	private String projectId = null;

	private int lifecycleId;

	private int phaseId;

	private int sequenceNum = 0;
	
	private Date PhaseStartTime;
	
	private Date PhaseEndTime;
	
	private double PhaseLength;
	
	private double PhaseLengthRate;
	
	private double PhaseWorkload;
	
	private double PhaseWorkloadRate;

	private int wbsPhasePlan;
	
	private int wbsPhaseActual;
	
	private int wbsTotalPlan;
	
	private int wbsTotalActual;
	
	private double phaseBCWS;
	
	private double phaseBCWP;
	private double phaseACWP;
	private double totalBCWS;
	private double totalBCWP;
	private double totalACWP;
	private double CV;
	private double SV;
	private double CPI;
	private double SPI;
	/**
	 * @param lifecycleId
	 *            The lifecycleId to set.
	 */
	/**
	 * @return Returns the lifecycleId.
	 */
	public int getLifecycleId() {
		return lifecycleId;
	}

	/**
	 * @param lifecycleId
	 *            The lifecycleId to set.
	 */
	public void setLifecycleId(int lifecycleId) {
		this.lifecycleId = lifecycleId;
	}

	/**
	 * @return Returns the phaseId.
	 */
	public int getPhaseId() {
		return phaseId;
	}

	/**
	 * @param phaseId
	 *            The phaseId to set.
	 */
	public void setPhaseId(int phaseId) {
		this.phaseId = phaseId;
	}

	/**
	 * @return Returns the projectId.
	 */
	public String getProjectId() {
		return projectId;
	}

	/**
	 * @param projectId
	 *            The projectId to set.
	 */
	public void setProjectId(String projectId) {
		this.projectId = projectId;
	}

	/**
	 * @return Returns the sequenceNum.
	 */
	public int getSequenceNum() {
		return sequenceNum;
	}

	/**
	 * @param sequenceNum
	 *            The sequenceNum to set.
	 */
	public void setSequenceNum(int sequenceNum) {
		this.sequenceNum = sequenceNum;
	}
	
	
	/**
	 * @return Returns the PhaseStartTime.
	 */
	public Date getPhaseStartTime() {
		return PhaseStartTime;
	}

	/**
	 * @param PhaseStartTime
	 *            The PhaseStartTime to set.
	 */
	public void setPhaseStartTime(Date PhaseStartTime) {
		this.PhaseStartTime = PhaseStartTime;
	}
	
	/**
	 * @return Returns the PhaseEndTime.
	 */
	public Date getPhaseEndTime() {
		return PhaseEndTime;
	}

	/**
	 * @param PhaseEndTime
	 *            The PhaseEndTime to set.
	 */
	public void setPhaseEndTime(Date PhaseEndTime) {
		this.PhaseEndTime = PhaseEndTime;
	}
	
	/**
	 * @return Returns the PhaseLength.
	 */
	public double getPhaseLength() {
		return PhaseLength;
	}

	/**
	 * @param PhaseLength
	 *            The PhaseLength to set.
	 */
	public void setPhaseLength(double PhaseLength) {
		this.PhaseLength = PhaseLength;
	}
	
	/**
	 * @return Returns the PhaseLengthRate.
	 */
	public double getPhaseLengthRate() {
		return PhaseLengthRate;
	}

	/**
	 * @param PhaseLengthRate
	 *            The PhaseLengthRate to set.
	 */
	public void setPhaseLengthRate(double PhaseLengthRate) {
		this.PhaseLengthRate = PhaseLengthRate;
	}
	
	/**
	 * @return Returns the PhaseWorkload.
	 */
	public double getPhaseWorkload() {
		return PhaseWorkload;
	}

	/**
	 * @param PhaseWorkload
	 *            The PhaseWorkload to set.
	 */
	public void setPhaseWorkload(double PhaseWorkload) {
		this.PhaseWorkload = PhaseWorkload;
	}
	
	/**
	 * @return Returns the PhaseWorkloadRate.
	 */
	public double getPhaseWorkloadRate() {
		return PhaseWorkloadRate;
	}

	/**
	 * @param PhaseWorkloadRate
	 *            The PhaseWorkloadRate to set.
	 */
	public void setPhaseWorkloadRate(double PhaseWorkloadRate) {
		this.PhaseWorkloadRate = PhaseWorkloadRate;
	}
	
	public void setWbsPhasePlan(int i){
		this.wbsPhasePlan=i;
	}
	public int getWbsPhasePlan(){
		return wbsPhasePlan;
	}
	public void setWbsPhaseActual(int i){
		this.wbsPhaseActual=i;
	}
	public int getWbsPhaseActual(){
		return wbsPhaseActual;
	}
	public void setWbsTotalPlan(int i){
		this.wbsTotalPlan=i;
	}
	public int getWbsTotalPlan(){
		return wbsTotalPlan;
	}
	public void setWbsTotalActual(int i){
		this.wbsTotalActual=i;
	}
	public int getWbsTotalActual(){
		return wbsTotalActual;
	}
	public void setPhaseBCWP(double i){
		phaseBCWP=i;
	}
	public double getPhaseBCWP(){
		return phaseBCWP;
	}
	public void setPhaseBCWS(double i){
		phaseBCWS=i;
	}
	public double getPhaseBCWS(){
		return phaseBCWS;
	}
	public void setPhaseACWP(double i){
		phaseACWP=i;
	}
	public double getPhaseACWP(){
		return phaseACWP;
	}
	public void setTotalBCWP(double i){
		totalBCWP=i;
	}
	public double getTotalBCWP(){
		return totalBCWP;
	}
	public void setTotalBCWS(double i){
		totalBCWS=i;
	}
	public double getTotalBCWS(){
		return totalBCWS;
	}
	public void setTotalACWP(double i){
		totalACWP=i;
	}
	public double getTotalACWP(){
		return totalACWP;
	}
	public void setCV(double i){
		CV=i;
	}
	public double getCV(){
		return CV;
	}
	public void setSV(double i){
		SV=i;
	}
	public double getSV(){
		return SV;
	}
	public void setCPI(double i){
		CPI=i;
	}
	public double getCPI(){
		return CPI;
	}
	public void setSPI(double i){
		SPI=i;
	}
	public double getSPI(){
		return SPI;
	}
}