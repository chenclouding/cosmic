package hibernate.FSM;

/**
 * FsmInterestObject entity.
 * 
 * @author MyEclipse Persistence Tools
 */

public class FsmInterestObject implements java.io.Serializable {

	// Fields

	private Integer id;
	private Integer peerCompId;
	private String interestObjName;
	private String interestObjDesp;

	// Constructors

	/** default constructor */
	public FsmInterestObject() {
	}

	/** minimal constructor */
	public FsmInterestObject(Integer peerCompId, String interestObjName) {
		this.peerCompId = peerCompId;
		this.interestObjName = interestObjName;
	}

	/** full constructor */
	public FsmInterestObject(Integer peerCompId, String interestObjName,
			String interestObjDesp) {
		this.peerCompId = peerCompId;
		this.interestObjName = interestObjName;
		this.interestObjDesp = interestObjDesp;
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

	public String getInterestObjName() {
		return this.interestObjName;
	}

	public void setInterestObjName(String interestObjName) {
		this.interestObjName = interestObjName;
	}

	public String getInterestObjDesp() {
		return this.interestObjDesp;
	}

	public void setInterestObjDesp(String interestObjDesp) {
		this.interestObjDesp = interestObjDesp;
	}

}