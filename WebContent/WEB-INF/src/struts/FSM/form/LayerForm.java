/*
 * Generated by MyEclipse Struts
 * Template path: templates/java/JavaClass.vtl
 */
package struts.FSM.form;

import javax.servlet.http.HttpServletRequest;
import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionMapping;

/** 
 * MyEclipse Struts
 * Creation date: 12-13-2009
 * 
 * XDoclet definition:
 * @struts.form name="layerForm"
 */
public class LayerForm extends ActionForm {
	/*
	 * Generated fields
	 */

	/** layerDesp property */
	private String layerDesp;

	/** productId property */
	private String productId;

	/** layerName property */
	private String layerName;

	/** id property */
	private String id;
	
	private String measureStatus;

	/*
	 * Generated Methods
	 */

	/** 
	 * Method validate
	 * @param mapping
	 * @param request
	 * @return ActionErrors
	 */
	public ActionErrors validate(ActionMapping mapping,
			HttpServletRequest request) {
		// TODO Auto-generated method stub
		return null;
	}

	/** 
	 * Method reset
	 * @param mapping
	 * @param request
	 */
	public void reset(ActionMapping mapping, HttpServletRequest request) {
		// TODO Auto-generated method stub
	}

	/** 
	 * Returns the layerDesp.
	 * @return String
	 */
	public String getLayerDesp() {
		return layerDesp;
	}

	/** 
	 * Set the layerDesp.
	 * @param layerDesp The layerDesp to set
	 */
	public void setLayerDesp(String layerDesp) {
		this.layerDesp = layerDesp;
	}

	/** 
	 * Returns the productId.
	 * @return String
	 */
	public String getProductId() {
		return productId;
	}

	/** 
	 * Set the productId.
	 * @param productId The productId to set
	 */
	public void setProductId(String productId) {
		this.productId = productId;
	}

	/** 
	 * Returns the layerName.
	 * @return String
	 */
	public String getLayerName() {
		return layerName;
	}

	/** 
	 * Set the layerName.
	 * @param layerName The layerName to set
	 */
	public void setLayerName(String layerName) {
		this.layerName = layerName;
	}

	/** 
	 * Returns the id.
	 * @return String
	 */
	public String getId() {
		return id;
	}

	/** 
	 * Set the id.
	 * @param id The id to set
	 */
	public void setId(String id) {
		this.id = id;
	}
	
	public String getMeasureStatus() {
		return measureStatus;
	}
	
	public void setMeasureStatus(String measureStatus) {
		this.measureStatus = measureStatus;
	}
}