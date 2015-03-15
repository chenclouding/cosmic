package hibernate.FSM;

/**
 * FsmMeasureScope entity.
 * 
 * @author MyEclipse Persistence Tools
 */

public class FsmMeasureScope implements java.io.Serializable {

	// Fields

	private Integer id;
	private Integer productId;
	private String measureScopeName;
	private String measureScopeDesp;

	// Constructors

	/** default constructor */
	public FsmMeasureScope() {
	}

	/** minimal constructor */
	public FsmMeasureScope(Integer productId, String measureScopeName) {
		this.productId = productId;
		this.measureScopeName = measureScopeName;
	}

	/** full constructor */
	public FsmMeasureScope(Integer productId, String measureScopeName,
			String measureScopeDesp) {
		this.productId = productId;
		this.measureScopeName = measureScopeName;
		this.measureScopeDesp = measureScopeDesp;
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

	public String getMeasureScopeName() {
		return this.measureScopeName;
	}

	public void setMeasureScopeName(String measureScopeName) {
		this.measureScopeName = measureScopeName;
	}

	public String getMeasureScopeDesp() {
		return this.measureScopeDesp;
	}

	public void setMeasureScopeDesp(String measureScopeDesp) {
		this.measureScopeDesp = measureScopeDesp;
	}

}