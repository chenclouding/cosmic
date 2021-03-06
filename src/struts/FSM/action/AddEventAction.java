/*
 * Generated by MyEclipse Struts
 * Template path: templates/java/JavaClass.vtl
 */
package struts.FSM.action;

import java.io.UnsupportedEncodingException;

import hibernate.FSM.FsmEvent;
import hibernate.FSM.FsmInterestObject;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.hibernate.HibernateException;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import business.FSM.MappingPhase;
import struts.FSM.form.EventForm;
import struts.FSM.form.InterestObjectForm;

/** 
 * MyEclipse Struts
 * Creation date: 01-06-2010
 * 
 * XDoclet definition:
 * @struts.action path="/addEvent" name="eventForm" scope="request" validate="true"
 * @struts.action-forward name="success" path="/FSM/cosmicStandard/mapping/event.jsp" contextRelative="true"
 * @struts.action-forward name="failure" path="/FSM/cosmicStandard/failure.jsp" contextRelative="true"
 */
public class AddEventAction extends Action {
	/*
	 * Generated Methods
	 */

	/** 
	 * Method execute
	 * @param mapping
	 * @param form
	 * @param request
	 * @param response
	 * @return ActionForward
	 * @throws HibernateException 
	 */
	public ActionForward execute(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) throws HibernateException {
		EventForm fm = (EventForm) form;// TODO Auto-generated method stub
		MappingPhase mp = new MappingPhase();//业务层函数,对兴趣对象进行增删改查等操作
		FsmEvent fe = new FsmEvent(); //定义实体Bean
		
		//从form表单将事件信息取出，赋给实体bean
		String eventName = null;
		String eventDesp = null;
		try {
			eventName = new String(fm.getEventName().getBytes("ISO-8859-1"),"gb2312");
			eventDesp = new String(fm.getEventDesp().getBytes("ISO-8859-1"),"gb2312");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		fe.setPeerCompId(new Integer((fm.getPeerCompId())));
		fe.setEventName(eventName);
		fe.setEventDesp(eventDesp);
		
		/*调用业务层,添加功能流程*/
		boolean result = mp.insertEvent(fe);
		if(result==true){
		   return mapping.findForward("success");
		}else{
		   return mapping.findForward("failure");
		}
	}
}