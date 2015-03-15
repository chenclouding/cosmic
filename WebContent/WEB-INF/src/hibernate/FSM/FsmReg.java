package hibernate.FSM;

/**
 * FsmReg entity.
 * 
 * @author MyEclipse Persistence Tools
 */

public class FsmReg implements java.io.Serializable {

	// Fields

	private Integer id;
	private String userName;
	private String password;

	// Constructors

	/** default constructor */
	public FsmReg() {
	}

	/** minimal constructor */
	public FsmReg(String userName) {
		this.userName = userName;
	}

	/** full constructor */
	public FsmReg(String userName, String password) {
		this.userName = userName;
		this.password = password;
	}

	// Property accessors

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getUserName() {
		return this.userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getPassword() {
		return this.password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

}