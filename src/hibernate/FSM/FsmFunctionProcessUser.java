package hibernate.FSM;

/**
 * FsmFunctionProcessUser entity.
 * 
 * @author MyEclipse Persistence Tools
 */

public class FsmFunctionProcessUser implements java.io.Serializable {

	// Fields

	private Integer id;
	private Integer funcProsId;
	private Integer userId;

	// Constructors

	/** default constructor */
	public FsmFunctionProcessUser() {
	}

	/** full constructor */
	public FsmFunctionProcessUser(Integer funcProsId, Integer userId) {
		this.funcProsId = funcProsId;
		this.userId = userId;
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

	public Integer getUserId() {
		return this.userId;
	}

	public void setUserId(Integer userId) {
		this.userId = userId;
	}

}