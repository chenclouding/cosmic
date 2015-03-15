package hibernate.FSM;

/**
 * FsmDataGroup entity.
 * 
 * @author MyEclipse Persistence Tools
 */

public class FsmDataGroup implements java.io.Serializable {

	// Fields

	private Integer id;
	private Integer interestObjId;
	private String dataGroupName;
	private String dataGroupDesp;

	// Constructors

	/** default constructor */
	public FsmDataGroup() {
	}

	/** minimal constructor */
	public FsmDataGroup(Integer interestObjId, String dataGroupName) {
		this.interestObjId = interestObjId;
		this.dataGroupName = dataGroupName;
	}

	/** full constructor */
	public FsmDataGroup(Integer interestObjId, String dataGroupName,
			String dataGroupDesp) {
		this.interestObjId = interestObjId;
		this.dataGroupName = dataGroupName;
		this.dataGroupDesp = dataGroupDesp;
	}

	// Property accessors

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getInterestObjId() {
		return this.interestObjId;
	}

	public void setInterestObjId(Integer interestObjId) {
		this.interestObjId = interestObjId;
	}

	public String getDataGroupName() {
		return this.dataGroupName;
	}

	public void setDataGroupName(String dataGroupName) {
		this.dataGroupName = dataGroupName;
	}

	public String getDataGroupDesp() {
		return this.dataGroupDesp;
	}

	public void setDataGroupDesp(String dataGroupDesp) {
		this.dataGroupDesp = dataGroupDesp;
	}

}