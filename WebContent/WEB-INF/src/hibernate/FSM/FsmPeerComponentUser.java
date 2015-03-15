package hibernate.FSM;

/**
 * FsmPeerComponentUser entity.
 * 
 * @author MyEclipse Persistence Tools
 */

public class FsmPeerComponentUser implements java.io.Serializable {

	// Fields

	private Integer id;
	private Integer userId;
	private Integer peerCompId;

	// Constructors

	/** default constructor */
	public FsmPeerComponentUser() {
	}

	/** full constructor */
	public FsmPeerComponentUser(Integer userId, Integer peerCompId) {
		this.userId = userId;
		this.peerCompId = peerCompId;
	}

	// Property accessors

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getUserId() {
		return this.userId;
	}

	public void setUserId(Integer userId) {
		this.userId = userId;
	}

	public Integer getPeerCompId() {
		return this.peerCompId;
	}

	public void setPeerCompId(Integer peerCompId) {
		this.peerCompId = peerCompId;
	}

}