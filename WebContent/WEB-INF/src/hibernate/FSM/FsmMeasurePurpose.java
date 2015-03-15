package hibernate.FSM;

/**
 * FsmMeasurePurpose entity.
 * 
 * @author MyEclipse Persistence Tools
 */

public class FsmMeasurePurpose implements java.io.Serializable {

	// Fields

	private Integer id;
	private Integer productId;
	private String measure;
	private String measurePurposeName;
	private String measurePurposeDesp;

	// Constructors

	/** default constructor */
	public FsmMeasurePurpose() {
	}

	/** minimal constructor */
	public FsmMeasurePurpose(Integer productId, String measure,
			String measurePurposeName) {
		this.productId = productId;
		this.measure = measure;
		this.measurePurposeName = measurePurposeName;
	}

	/** full constructor */
	public FsmMeasurePurpose(Integer productId, String measure,
			String measurePurposeName, String measurePurposeDesp) {
		this.productId = productId;
		this.measure = measure;
		this.measurePurposeName = measurePurposeName;
		this.measurePurposeDesp = measurePurposeDesp;
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

	public String getMeasure() {
		return this.measure;
	}

	public void setMeasure(String measure) {
		this.measure = measure;
	}

	public String getMeasurePurposeName() {
		return this.measurePurposeName;
	}

	public void setMeasurePurposeName(String measurePurposeName) {
		this.measurePurposeName = measurePurposeName;
	}

	public String getMeasurePurposeDesp() {
		return this.measurePurposeDesp;
	}

	public void setMeasurePurposeDesp(String measurePurposeDesp) {
		this.measurePurposeDesp = measurePurposeDesp;
	}

}