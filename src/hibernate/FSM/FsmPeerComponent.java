package hibernate.FSM;

/**
 * FsmPeerComponent entity.
 * 
 * @author MyEclipse Persistence Tools
 */

public class FsmPeerComponent implements java.io.Serializable {

	// Fields

	private Integer id;
	private Integer layerId;
	private Integer fatherId;
	private String peerCompName;
	private String peerCompDesp;
	private Integer measureStatus;
	private Integer compType;

	// Constructors

	/** default constructor */
	public FsmPeerComponent() {
	}

	/** minimal constructor */
	public FsmPeerComponent(Integer layerId, String peerCompName,
			Integer measureStatus, Integer compType) {
		this.layerId = layerId;
		this.peerCompName = peerCompName;
		this.measureStatus = measureStatus;
		this.compType = compType;
	}

	/** full constructor */
	public FsmPeerComponent(Integer layerId, Integer fatherId,
			String peerCompName, String peerCompDesp, Integer measureStatus,
			Integer compType) {
		this.layerId = layerId;
		this.fatherId = fatherId;
		this.peerCompName = peerCompName;
		this.peerCompDesp = peerCompDesp;
		this.measureStatus = measureStatus;
		this.compType = compType;
	}

	// Property accessors

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getLayerId() {
		return this.layerId;
	}

	public void setLayerId(Integer layerId) {
		this.layerId = layerId;
	}

	public Integer getFatherId() {
		return this.fatherId;
	}

	public void setFatherId(Integer fatherId) {
		this.fatherId = fatherId;
	}

	public String getPeerCompName() {
		return this.peerCompName;
	}

	public void setPeerCompName(String peerCompName) {
		this.peerCompName = peerCompName;
	}

	public String getPeerCompDesp() {
		return this.peerCompDesp;
	}

	public void setPeerCompDesp(String peerCompDesp) {
		this.peerCompDesp = peerCompDesp;
	}

	public Integer getMeasureStatus() {
		return this.measureStatus;
	}

	public void setMeasureStatus(Integer measureStatus) {
		this.measureStatus = measureStatus;
	}

	public Integer getCompType() {
		return this.compType;
	}

	public void setCompType(Integer compType) {
		this.compType = compType;
	}

}