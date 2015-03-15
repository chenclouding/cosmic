package hibernate.FSM;

/**
 * FsmFunctionProcessEvent entity.
 * 
 * @author MyEclipse Persistence Tools
 */

public class FsmFunctionProcessEvent implements java.io.Serializable {

	// Fields

	private Integer id;
	private Integer funcProsId;
	private Integer eventId;

	// Constructors

	/** default constructor */
	public FsmFunctionProcessEvent() {
	}

	/** full constructor */
	public FsmFunctionProcessEvent(Integer funcProsId, Integer eventId) {
		this.funcProsId = funcProsId;
		this.eventId = eventId;
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

	public Integer getEventId() {
		return this.eventId;
	}

	public void setEventId(Integer eventId) {
		this.eventId = eventId;
	}

}