package hibernate.FSM;

/**
 * FsmLayer entity.
 * 
 * @author MyEclipse Persistence Tools
 */

public class FsmLayer implements java.io.Serializable {

	// Fields

	private Integer id;
	private Integer productId;
	private String layerName;
	private String layerDesp;
	private Integer measureStatus;

	// Constructors

	/** default constructor */
	public FsmLayer() {
	}

	/** minimal constructor */
	public FsmLayer(Integer productId, String layerName, Integer measureStatus) {
		this.productId = productId;
		this.layerName = layerName;
		this.measureStatus = measureStatus;
	}

	/** full constructor */
	public FsmLayer(Integer productId, String layerName, String layerDesp,
			Integer measureStatus) {
		this.productId = productId;
		this.layerName = layerName;
		this.layerDesp = layerDesp;
		this.measureStatus = measureStatus;
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

	public String getLayerName() {
		return this.layerName;
	}

	public void setLayerName(String layerName) {
		this.layerName = layerName;
	}

	public String getLayerDesp() {
		return this.layerDesp;
	}

	public void setLayerDesp(String layerDesp) {
		this.layerDesp = layerDesp;
	}

	public Integer getMeasureStatus() {
		return this.measureStatus;
	}

	public void setMeasureStatus(Integer measureStatus) {
		this.measureStatus = measureStatus;
	}

}