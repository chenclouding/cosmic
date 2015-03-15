package hibernate.FSM;

/**
 * FsmFunctionProcess entity.
 * 
 * @author MyEclipse Persistence Tools
 */

public class FsmFunctionProcess implements java.io.Serializable {

	// Fields

	private Integer id;
	private Integer peerCompId;
	private String funcProsName;
	private String funcProsDesp;
	private Integer measureStatus;
	private Integer mappingUserStatus;
	private Integer mappingEventStatus;
	private Integer mappingIostatus;

	// Constructors

	/** default constructor */
	public FsmFunctionProcess() {
	}

	/** minimal constructor */
	public FsmFunctionProcess(Integer peerCompId, String funcProsName,
			Integer measureStatus) {
		this.peerCompId = peerCompId;
		this.funcProsName = funcProsName;
		this.measureStatus = measureStatus;
	}

	/** full constructor */
	public FsmFunctionProcess(Integer peerCompId, String funcProsName,
			String funcProsDesp, Integer measureStatus,
			Integer mappingUserStatus, Integer mappingEventStatus,
			Integer mappingIostatus) {
		this.peerCompId = peerCompId;
		this.funcProsName = funcProsName;
		this.funcProsDesp = funcProsDesp;
		this.measureStatus = measureStatus;
		this.mappingUserStatus = mappingUserStatus;
		this.mappingEventStatus = mappingEventStatus;
		this.mappingIostatus = mappingIostatus;
	}

	// Property accessors

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getPeerCompId() {
		return this.peerCompId;
	}

	public void setPeerCompId(Integer peerCompId) {
		this.peerCompId = peerCompId;
	}

	public String getFuncProsName() {
		return this.funcProsName;
	}

	public void setFuncProsName(String funcProsName) {
		this.funcProsName = funcProsName;
	}

	public String getFuncProsDesp() {
		return this.funcProsDesp;
	}

	public void setFuncProsDesp(String funcProsDesp) {
		this.funcProsDesp = funcProsDesp;
	}

	public Integer getMeasureStatus() {
		return this.measureStatus;
	}

	public void setMeasureStatus(Integer measureStatus) {
		this.measureStatus = measureStatus;
	}

	public Integer getMappingUserStatus() {
		return this.mappingUserStatus;
	}

	public void setMappingUserStatus(Integer mappingUserStatus) {
		this.mappingUserStatus = mappingUserStatus;
	}

	public Integer getMappingEventStatus() {
		return this.mappingEventStatus;
	}

	public void setMappingEventStatus(Integer mappingEventStatus) {
		this.mappingEventStatus = mappingEventStatus;
	}

	public Integer getMappingIostatus() {
		return this.mappingIostatus;
	}

	public void setMappingIostatus(Integer mappingIostatus) {
		this.mappingIostatus = mappingIostatus;
	}

}