/*
 * Generated by MyEclipse Struts
 * Template path: templates/java/JavaClass.vtl
 */
package struts.FSM.action;

import java.io.UnsupportedEncodingException;

import hibernate.FSM.FsmPeerComponent;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.hibernate.HibernateException;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import business.FSM.StrategyPhase;
import struts.FSM.form.PeerComponentForm;

/** 
 * MyEclipse Struts
 * Creation date: 12-21-2009
 * 
 * XDoclet definition:
 * @struts.action path="/editPeerComponent" name="peerComponentForm" scope="request" validate="true"
 * @struts.action-forward name="success" path="/FSM/cosmicStandard/peerComponent.jsp" contextRelative="true"
 * @struts.action-forward name="failure" path="/FSM/cosmicStandard/failure.jsp" contextRelative="true"
 */
public class EditPeerComponentAction extends Action {
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
		//Integer peerCompId = new Integer(request.getParameter("peerCompId"));
		PeerComponentForm peerComponentForm = (PeerComponentForm) form;// TODO Auto-generated method stub
		StrategyPhase sp = new StrategyPhase();//业务层函数,对对等组件进行增删改查等操作
		FsmPeerComponent fpc = new FsmPeerComponent();          //定义实体bean
		Integer productId = new Integer(request.getParameter("productId"));
		/*将id为peerCompId的实体bean查找出来*/
		int peerCompId = new Integer(peerComponentForm.getId());
		fpc = (FsmPeerComponent)sp.getPeerComponentById(peerCompId);
		/*从form表单中获取对等组件信息,更新实体Bean*/
		String peerCompName = null;
		String peerCompDesp = null;
		try {
			peerCompName = new String(peerComponentForm.getPeerCompName().getBytes("ISO-8859-1"),"gb2312");
			peerCompDesp = new String(peerComponentForm.getPeerCompDesp().getBytes("ISO-8859-1"),"gb2312");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		fpc.setLayerId(new Integer(peerComponentForm.getLayerId()));
		fpc.setPeerCompName(peerCompName);
		fpc.setPeerCompDesp(peerCompDesp);
		fpc.setMeasureStatus(new Integer(peerComponentForm.getMeasureStatus()));
		fpc.setCompType(new Integer(peerComponentForm.getCompType()));
		
		/*调用业务层,添加组件*/
		

		boolean result = sp.updatePeerComponent(fpc);
		if(result==true){
		   request.setAttribute("layerId", peerComponentForm.getLayerId());//这句的目的是能够转跳回peerComponent.jsp
		   request.setAttribute("productId",productId);
		   return mapping.findForward("success");
		}else{
		   return mapping.findForward("failure");
		}
	}
}