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
 * Creation date: 01-06-2010
 * 
 * XDoclet definition:
 * @struts.form name="eventForm"
 */
public class EventForm extends ActionForm {
	/*
	 * Generated fields
	 */

	/** eventDesp property */
	private String eventDesp;

	/** eventName property */
	private String eventName;

	/** id property */
	private String id;
	
	private String peerCompId;

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
	 * Returns the eventDesp.
	 * @return String
	 */
	public String getEventDesp() {
		return eventDesp;
	}

	/** 
	 * Set the eventDesp.
	 * @param eventDesp The eventDesp to set
	 */
	public void setEventDesp(String eventDesp) {
		this.eventDesp = eventDesp;
	}

	/** 
	 * Returns the eventName.
	 * @return String
	 */
	public String getEventName() {
		return eventName;
	}

	/** 
	 * Set the eventName.
	 * @param eventName The eventName to set
	 */
	public void setEventName(String eventName) {
		this.eventName = eventName;
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

	public String getPeerCompId() {
		return peerCompId;
	}

	public void setPeerCompId(String peerCompId) {
		this.peerCompId = peerCompId;
	}
}