package hibernate.FSM;

/**
 * FsmUser entity.
 * 
 * @author MyEclipse Persistence Tools
 */

public class FsmUser implements java.io.Serializable {

	// Fields

	private Integer id;
	private Integer productId;
	private String userName;
	private String userDesp;

	// Constructors

	/** default constructor */
	public FsmUser() {
	}

	/** minimal constructor */
	public FsmUser(Integer productId, String userName) {
		this.productId = productId;
		this.userName = userName;
	}

	/** full constructor */
	public FsmUser(Integer productId, String userName, String userDesp) {
		this.productId = productId;
		this.userName = userName;
		this.userDesp = userDesp;
	}

	// Property accessors

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getProductId() {
		return this.productId;
	}

	public void setProductId(Integer productId) {
		this.productId = productId;
	}

	public String getUserName() {
		return this.userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getUserDesp() {
		return this.userDesp;
	}

	public void setUserDesp(String userDesp) {
		this.userDesp = userDesp;
	}

}