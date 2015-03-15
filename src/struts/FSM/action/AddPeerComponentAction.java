/*
 * Generated by MyEclipse Struts
 * Template path: templates/java/JavaClass.vtl
 */
package struts.FSM.action;

import java.io.UnsupportedEncodingException;

import hibernate.FSM.FsmLayer;
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
 * Creation date: 12-14-2009
 * 
 * XDoclet definition:
 * @struts.action path="/peerComponent" name="peerComponentForm" scope="request" validate="true"
 * @struts.action-forward name="success" path="/FSM/cosmicStandard/addPeerComponent.jsp" contextRelative="true"
 * @struts.action-forward name="failure" path="/FSM/cosmicStandard/failure.jsp" contextRelative="true"
 */
public class AddPeerComponentAction extends Action {
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
		PeerComponentForm peerComponentForm = (PeerComponentForm) form;// TODO Auto-generated method stub
		StrategyPhase sp = new StrategyPhase();//ҵ��㺯��,�ԶԵ����������ɾ�Ĳ�Ȳ���
		FsmPeerComponent fpc = new FsmPeerComponent();          //����ʵ��bean
		Integer layerId = new Integer(peerComponentForm.getLayerId());
		Integer fatherId = new Integer(peerComponentForm.getFatherId());
		Integer productId = new Integer(request.getParameter("productId"));//��ȡ��peerComponent.jsp������productId
		/*��form�����л�ȡ�Ե������Ϣ,��ֵ��ʵ��Bean*/
		String peerCompName = null;
		String peerCompDesp = null;
		try {
			peerCompName = new String(peerComponentForm.getPeerCompName().getBytes("ISO-8859-1"),"gb2312");
			peerCompDesp = new String(peerComponentForm.getPeerCompDesp().getBytes("ISO-8859-1"),"gb2312");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		fpc.setLayerId(layerId);
		fpc.setFatherId(fatherId);
		fpc.setPeerCompName(peerCompName);
		fpc.setPeerCompDesp(peerCompDesp);
		fpc.setMeasureStatus(Integer.valueOf(peerComponentForm.getMeasureStatus()));
		fpc.setCompType(Integer.valueOf(peerComponentForm.getCompType()));
		
		/*����ҵ���,�������*/
		boolean result = sp.insertPeerComponent(fpc);
		if(result==true){
			if(fatherId==0){ //����Ե������"��"���
			  request.setAttribute("layerId", layerId);
			  request.setAttribute("productId", productId);
		      return mapping.findForward("peerComponent");
			}else{
			  request.setAttribute("layerId", layerId);
			  request.setAttribute("fatherId", fatherId);
			  request.setAttribute("productId", productId);
			  return mapping.findForward("subPeerComponent");
			}
		}else{
		   return mapping.findForward("failure");
		}
		
		
		
	}
}