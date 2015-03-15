package hibernate.FSM;

/**
 * FsmFunctionProcessInterestObject entity.
 * 
 * @author MyEclipse Persistence Tools
 */

public class FsmFunctionProcessInterestObject implements java.io.Serializable {

	// Fields

	private Integer id;
	private Integer funcProsId;
	private Integer interestObjId;

	// Constructors

	/** default constructor */
	public FsmFunctionProcessInterestObject() {
	}

	/** full constructor */
	public FsmFunctionProcessInterestObject(Integer funcProsId,
			Integer interestObjId) {
		this.funcProsId = funcProsId;
		this.interestObjId = interestObjId;
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

	public Integer getInterestObjId() {
		return this.interestObjId;
	}

	public void setInterestObjId(Integer interestObjId) {
		this.interestObjId = interestObjId;
	}

}