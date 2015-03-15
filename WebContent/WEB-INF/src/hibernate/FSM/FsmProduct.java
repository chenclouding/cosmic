package hibernate.FSM;

import java.util.Date;
import java.util.HashSet;
import java.util.Set;

/**
 * FsmProduct entity.
 * 
 * @author MyEclipse Persistence Tools
 */

public class FsmProduct implements java.io.Serializable {

	// Fields

	private Integer id;
	private String productName;
	private String productDesp;
	private Integer productType;
	private Integer developType;
	private Integer measureMethod;
	private Integer lifecyclePhase;
	private Integer measureStatus;
	private String estimator;
	private Date startTime;
	private Date endTime;
	private Date estimateStartTime;
	private Date estimateEndTime;
	private Integer regId;
	private Set fsmLayers = new HashSet(0);

	// Constructors

	/** default constructor */
	public FsmProduct() {
	}

	/** minimal constructor */
	public FsmProduct(String productName, Integer productType,
			Integer developType, Integer measureMethod, Integer lifecyclePhase,
			Integer measureStatus) {
		this.productName = productName;
		this.productType = productType;
		this.developType = developType;
		this.measureMethod = measureMethod;
		this.lifecyclePhase = lifecyclePhase;
		this.measureStatus = measureStatus;
	}

	/** full constructor */
	public FsmProduct(String productName, String productDesp,
			Integer productType, Integer developType, Integer measureMethod,
			Integer lifecyclePhase, Integer measureStatus, String estimator,
			Date startTime, Date endTime, Date estimateStartTime,
			Date estimateEndTime, Integer regId, Set fsmLayers) {
		this.productName = productName;
		this.productDesp = productDesp;
		this.productType = productType;
		this.developType = developType;
		this.measureMethod = measureMethod;
		this.lifecyclePhase = lifecyclePhase;
		this.measureStatus = measureStatus;
		this.estimator = estimator;
		this.startTime = startTime;
		this.endTime = endTime;
		this.estimateStartTime = estimateStartTime;
		this.estimateEndTime = estimateEndTime;
		this.regId = regId;
		this.fsmLayers = fsmLayers;
	}

	// Property accessors

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getProductName() {
		return this.productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public String getProductDesp() {
		return this.productDesp;
	}

	public void setProductDesp(String productDesp) {
		this.productDesp = productDesp;
	}

	public Integer getProductType() {
		return this.productType;
	}

	public void setProductType(Integer productType) {
		this.productType = productType;
	}

	public Integer getDevelopType() {
		return this.developType;
	}

	public void setDevelopType(Integer developType) {
		this.developType = developType;
	}

	public Integer getMeasureMethod() {
		return this.measureMethod;
	}

	public void setMeasureMethod(Integer measureMethod) {
		this.measureMethod = measureMethod;
	}

	public Integer getLifecyclePhase() {
		return this.lifecyclePhase;
	}

	public void setLifecyclePhase(Integer lifecyclePhase) {
		this.lifecyclePhase = lifecyclePhase;
	}

	public Integer getMeasureStatus() {
		return this.measureStatus;
	}

	public void setMeasureStatus(Integer measureStatus) {
		this.measureStatus = measureStatus;
	}

	public String getEstimator() {
		return this.estimator;
	}

	public void setEstimator(String estimator) {
		this.estimator = estimator;
	}

	public Date getStartTime() {
		return this.startTime;
	}

	public void setStartTime(Date startTime) {
		this.startTime = startTime;
	}

	public Date getEndTime() {
		return this.endTime;
	}

	public void setEndTime(Date endTime) {
		this.endTime = endTime;
	}

	public Date getEstimateStartTime() {
		return this.estimateStartTime;
	}

	public void setEstimateStartTime(Date estimateStartTime) {
		this.estimateStartTime = estimateStartTime;
	}

	public Date getEstimateEndTime() {
		return this.estimateEndTime;
	}

	public void setEstimateEndTime(Date estimateEndTime) {
		this.estimateEndTime = estimateEndTime;
	}

	public Integer getRegId() {
		return this.regId;
	}

	public void setRegId(Integer regId) {
		this.regId = regId;
	}

	public Set getFsmLayers() {
		return this.fsmLayers;
	}

	public void setFsmLayers(Set fsmLayers) {
		this.fsmLayers = fsmLayers;
	}

}