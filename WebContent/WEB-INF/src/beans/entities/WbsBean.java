/*
 * Created on 2005-1-4 by congpz
 * 
 */
package beans.entities;

import java.sql.Date;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Set;

/**
 * @author congpz
 *  
 */
public class WbsBean {

	public WbsBean() {
		children = new ArrayList();
	}

	public WbsBean(String id, String projectId) {
		children = new ArrayList();
		this.id = id;
		this.projectId = projectId;
	}

	private String projectId = null;

	private String id = null;

	private String name = null;

	private String creatorId = null;

	private Date planStartTime = null;

	private Date realStartTime = null;

	private Date planEndTime = null;

	private Date realEndTime = null;
	
	private Date eETime = null;
	private Date eSTime = null;
	private Date lETime = null;
	private Date lSTime = null;

	private double planWorkload = 0;

	private double realWorkload = 0;

	private double planScale = 0;

	private double realScale = 0;

	private String scaleUnit = "001";

	private String currentState = null;

	private String parentId = "000";

//	private boolean isChild = true;

	private Collection children;

	private String preWorks=null;
	
	private Set preWorksSet=null;
	
	private boolean isImportantWbs=false;
	
	private int bufferTime=0;
	
	private String isMilestone=null;
	
	private String isCycleWork=null;
//	private Set aWorks=null;
//	private Set bWorks=null;
	
	private String actionType = null;

	private double lineScale = 0;

	private double pageScale = 0;

	private double unitScale = 0;

	private double numScale = 0;

	private double productScale = 0;

	private String description = null;
	
	private String productName = null;

	private int productId = 0;

	private String functionary = null;

	private String functionaryId = null;

	private String productType = null;
	
	/**
	 * @return Returns the creatorId.
	 */
	public String getCreatorId() {
		return creatorId;
	}

	/**
	 * @param creatorId
	 *            The creatorId to set.
	 */
	public void setCreatorId(String creatorId) {
		this.creatorId = creatorId;
	}

	/**
	 * @return Returns the currentState.
	 */
	public String getCurrentState() {
		return currentState;
	}

	/**
	 * @param currentState
	 *            The currentState to set.
	 */
	public void setCurrentState(String currentState) {
		this.currentState = currentState;
	}

	/**
	 * @return Returns the id.
	 */
	public String getId() {
		return id;
	}
	
	public int getIdLength() {
		return Integer.valueOf(id.length()).intValue();
	}
	
	public int getIdLevel() {
		return getIdLength()/3;
	}

	/**
	 * @param id
	 *            The id to set.
	 */
	public void setId(String id) {
		this.id = id;
	}

	/**
	 * @return Returns the name.
	 */
	public String getName() {
		return name;
	}

	/**
	 * @param name
	 *            The name to set.
	 */
	public void setName(String name) {
		this.name = name;
	}

	/**
	 * @return Returns the planEndTime.
	 */
	public Date getPlanEndTime() {
		return planEndTime;
	}

	/**
	 * @param planEndTime
	 *            The planEndTime to set.
	 */
	public void setPlanEndTime(Date planEndTime) {
		this.planEndTime = planEndTime;
	}

	/**
	 * @return Returns the planScale.
	 */
	public double getPlanScale() {
		return planScale;
	}

	/**
	 * @param planScale
	 *            The planScale to set.
	 */
	public void setPlanScale(double planScale) {
		this.planScale = planScale;
	}

	/**
	 * @return Returns the planStartTime.
	 */
	public Date getESTime() {
		return eSTime;
	}

	/**
	 * @param planStartTime
	 *            The planStartTime to set.
	 */
	public void setESTime(Date eSTime) {
		this.eSTime = eSTime;
	}
	public Date getEETime() {
		return eETime;
	}

	/**
	 * @param planStartTime
	 *            The planStartTime to set.
	 */
	public void setEETime(Date eETime) {
		this.eETime = eETime;
	}public Date getLSTime() {
		return lSTime;
	}

	/**
	 * @param planStartTime
	 *            The planStartTime to set.
	 */
	public void setLSTime(Date lSTime) {
		this.lSTime = lSTime;
	}public Date getLETime() {
		return lETime;
	}

	/**
	 * @param planStartTime
	 *            The planStartTime to set.
	 */
	public void setLETime(Date lETime) {
		this.lETime = lETime;
		
	}public Date getPlanStartTime() {
		return planStartTime;
	}

	/**
	 * @param planStartTime
	 *            The planStartTime to set.
	 */
	public void setPlanStartTime(Date planStartTime) {
		this.planStartTime = planStartTime;
	}
	/**
	 * @return Returns the planWorkload.
	 */
	public double getPlanWorkload() {
		return planWorkload;
	}

	/**
	 * @param planWorkload
	 *            The planWorkload to set.
	 */
	public void setPlanWorkload(double planWorkload) {
		this.planWorkload = planWorkload;
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
	 * @return Returns the realEndTime.
	 */
	public Date getRealEndTime() {
		return realEndTime;
	}

	/**
	 * @param realEndTime
	 *            The realEndTime to set.
	 */
	public void setRealEndTime(Date realEndTime) {
		this.realEndTime = realEndTime;
	}

	/**
	 * @return Returns the realScale.
	 */
	public double getRealScale() {
		return realScale;
	}

	/**
	 * @param realScale
	 *            The realScale to set.
	 */
	public void setRealScale(double realScale) {
		this.realScale = realScale;
	}

	/**
	 * @return Returns the realStartTime.
	 */
	public Date getRealStartTime() {
		return realStartTime;
	}

	/**
	 * @param realStartTime
	 *            The realStartTime to set.
	 */
	public void setRealStartTime(Date realStartTime) {
		this.realStartTime = realStartTime;
	}

	/**
	 * @return Returns the realWorkload.
	 */
	public double getRealWorkload() {
		return realWorkload;
	}

	/**
	 * @param realWorkload
	 *            The realWorkload to set.
	 */
	public void setRealWorkload(double realWorkload) {
		this.realWorkload = realWorkload;
	}

	/**
	 * @return Returns the scaleUnit.
	 */
	public String getScaleUnit() {
		return scaleUnit;
	}

	/**
	 * @param scaleUnit
	 *            The scaleUnit to set.
	 */
	public void setScaleUnit(String scaleUnit) {
		this.scaleUnit = scaleUnit;
	}

	/**
	 * @return Returns the parentId.
	 */
	public String getParentId() {
		if (getId().length() > 3) {
			this.parentId = getId().substring(0, getId().length() - 3);
		} else {
			this.parentId = "000";
		}
		return parentId;
	}

	/**
	 * @return
	 */
	public boolean isChild() {
		return children.isEmpty();
	}

	/**
	 * @return Returns the children.
	 */
	public Collection getChildren() {
		return children;
	}

	/**
	 * @param children
	 *            The children to set.
	 */
	public void setChildren(Collection children) {
		this.children = children;
	}

	/**
	 * @return
	 */
	public boolean hasParent() {
		return getId().length() != 3;
	}
	 
	public String getPreWorks(){
		return preWorks ;
	} 
	public void setPreWorks(String s){
		preWorks = s;
	}
	public void setPreWorksSet(Set s){
		preWorksSet=s;
	}
	public Set getPreWorksSet(){
		return preWorksSet;
	}
	public boolean isImportantWbs(){
		return isImportantWbs;
	}
	public void setImportantWbs(boolean i){						
		isImportantWbs=i;
	}
	public void setBufferTime(int i){
		bufferTime=i;
	}
	public int getBufferTime(){
		return bufferTime;
	}
	public void setIsCycleWork(String b){
		isCycleWork = b;
	}
	public void setIsMileStone(String b){
		isMilestone = b;
	}
	public String getIsMileStone(){
		return isMilestone;
	}
	public String getIsCycleWork(){
		return isCycleWork;
	}

	public String getActionType() {
		return actionType;
	}

	public void setActionType(String actionType) {
		this.actionType = actionType;
	}

	public double getLineScale() {
		return lineScale;
	}


	public void setLineScale(double lineScale) {
		this.lineScale = lineScale;
	}
	
	public double getPageScale() {
		return pageScale;
	}


	public void setPageScale(double pageScale) {
		this.pageScale = pageScale;
	}
	
	public double getUnitScale() {
		return unitScale;
	}


	public void setUnitScale(double unitScale) {
		this.unitScale = unitScale;
	}
	
	public double getNumScale() {
		return numScale;
	}


	public void setNumScale(double numScale) {
		this.numScale = numScale;
	}

	public String getDescription() {
		return description;
	}
   
	
	public void setDescription(String description) {
		this.description = description;
	}
	
	public String getProductName(){
		return productName;
	}
	public void setProductName(String productName){
		this.productName=productName;
	}
	
	public int getProductId(){
		return productId;
	}
	public void setProductId(int productId){
		this.productId=productId;
	}

    public String getFunctionary(){
    	return functionary;
    }
    
    public void setFunctionary(String functionary){
    	this.functionary=functionary;
    }
    
    public String getFunctionaryId(){
    	return functionaryId;
    }
    public void setFunctionaryId(String functionaryId){
    	this.functionaryId=functionaryId;
    }
    public String getProductType(){
    	return productType;
    }
    public void setProductType(String productType){
    	this.productType=productType;
    } 
    
    public double getProductScale(){
    	return productScale;
    }
    public void setProductScale(double productScale){
    	this.productScale=productScale;
    }
    
}  