package hibernate.FSM;

/**
 * FsmEvent entity.
 * 
 * @author MyEclipse Persistence Tools
 */

public class FsmEvent implements java.io.Serializable {

	// Fields

	private Integer id;
	private Integer peerCompId;
	private String eventName;
	private String eventDesp;

	// Constructors

	/** default constructor */
	public FsmEvent() {
	}

	/** minimal constructor */
	public FsmEvent(Integer peerCompId, String eventName) {
		this.peerCompId = peerCompId;
		this.eventName = eventName;
	}

	/** full constructor */
	public FsmEvent(Integer peerCompId, String eventName, String eventDesp) {
		this.peerCompId = peerCompId;
		this.eventName = eventName;
		this.eventDesp = eventDesp;
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

	public String getEventName() {
		return this.eventName;
	}

	public void setEventName(String eventName) {
		this.eventName = eventName;
	}

	public String getEventDesp() {
		return this.eventDesp;
	}

	public void setEventDesp(String eventDesp) {
		this.eventDesp = eventDesp;
	}

}