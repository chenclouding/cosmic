package hibernate.FSM;

/**
 * FsmDataAttribute entity.
 * 
 * @author MyEclipse Persistence Tools
 */

public class FsmDataAttribute implements java.io.Serializable {

	// Fields

	private Integer id;
	private Integer dataGroupId;
	private String dataAttriName;
	private String dataAttriDesp;

	// Constructors

	/** default constructor */
	public FsmDataAttribute() {
	}

	/** minimal constructor */
	public FsmDataAttribute(Integer dataGroupId, String dataAttriName) {
		this.dataGroupId = dataGroupId;
		this.dataAttriName = dataAttriName;
	}

	/** full constructor */
	public FsmDataAttribute(Integer dataGroupId, String dataAttriName,
			String dataAttriDesp) {
		this.dataGroupId = dataGroupId;
		this.dataAttriName = dataAttriName;
		this.dataAttriDesp = dataAttriDesp;
	}

	// Property accessors

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getDataGroupId() {
		return this.dataGroupId;
	}

	public void setDataGroupId(Integer dataGroupId) {
		this.dataGroupId = dataGroupId;
	}

	public String getDataAttriName() {
		return this.dataAttriName;
	}

	public void setDataAttriName(String dataAttriName) {
		this.dataAttriName = dataAttriName;
	}

	public String getDataAttriDesp() {
		return this.dataAttriDesp;
	}

	public void setDataAttriDesp(String dataAttriDesp) {
		this.dataAttriDesp = dataAttriDesp;
	}

}