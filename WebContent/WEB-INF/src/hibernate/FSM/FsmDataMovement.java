package hibernate.FSM;

/**
 * FsmDataMovement entity.
 * 
 * @author MyEclipse Persistence Tools
 */

public class FsmDataMovement implements java.io.Serializable {

	// Fields

	private Integer id;
	private Integer funcProsId;
	private Integer dataGroupId;
	private String dataMoveName;
	private Integer dataMoveType;
	private String dataMoveDesp;

	// Constructors

	/** default constructor */
	public FsmDataMovement() {
	}

	/** minimal constructor */
	public FsmDataMovement(Integer funcProsId, Integer dataGroupId,
			String dataMoveName, Integer dataMoveType) {
		this.funcProsId = funcProsId;
		this.dataGroupId = dataGroupId;
		this.dataMoveName = dataMoveName;
		this.dataMoveType = dataMoveType;
	}

	/** full constructor */
	public FsmDataMovement(Integer funcProsId, Integer dataGroupId,
			String dataMoveName, Integer dataMoveType, String dataMoveDesp) {
		this.funcProsId = funcProsId;
		this.dataGroupId = dataGroupId;
		this.dataMoveName = dataMoveName;
		this.dataMoveType = dataMoveType;
		this.dataMoveDesp = dataMoveDesp;
	}

	// Property accessors

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getFuncProsId() {
		return this.funcProsId;
	}

	public void setFuncProsId(Integer funcProsId) {
		this.funcProsId = funcProsId;
	}

	public Integer getDataGroupId() {
		return this.dataGroupId;
	}

	public void setDataGroupId(Integer dataGroupId) {
		this.dataGroupId = dataGroupId;
	}

	public String getDataMoveName() {
		return this.dataMoveName;
	}

	public void setDataMoveName(String dataMoveName) {
		this.dataMoveName = dataMoveName;
	}

	public Integer getDataMoveType() {
		return this.dataMoveType;
	}

	public void setDataMoveType(Integer dataMoveType) {
		this.dataMoveType = dataMoveType;
	}

	public String getDataMoveDesp() {
		return this.dataMoveDesp;
	}

	public void setDataMoveDesp(String dataMoveDesp) {
		this.dataMoveDesp = dataMoveDesp;
	}

}