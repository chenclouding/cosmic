/*
 * Generated by MyEclipse Struts
 * Template path: templates/java/JavaClass.vtl
 */
package struts.FSM.action;

import java.io.UnsupportedEncodingException;

import hibernate.FSM.FsmMeasurePurpose;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.hibernate.HibernateException;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import business.FSM.StrategyPhase;
import struts.FSM.form.MeasurePurposeForm;

/** 
 * MyEclipse Struts
 * Creation date: 03-08-2010
 * 
 * XDoclet definition:
 * @struts.action path="/editLayer" name="layerForm" scope="request" validate="true"
 * @struts.action-forward name="success" path="/FSM/cosmicStandard/strategy/layer.jsp" contextRelative="true"
 * @struts.action-forward name="failure" path="/FSM/cosmicStandard/failure.jsp" contextRelative="true"
 */
public class EditMeasurePurposeAction extends Action {
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
		MeasurePurposeForm measurePurposeForm = (MeasurePurposeForm) form;// TODO Auto-generated method stub
		StrategyPhase sp = new StrategyPhase();//业务层函数,对度量目的进行增删改查等操作
		FsmMeasurePurpose fmp = new FsmMeasurePurpose();          //定义实体bean
		
		/*将id为layerId的实体bean查找出来*/
		int measPurId = new Integer(measurePurposeForm.getId());
		fmp = (FsmMeasurePurpose)sp.getMeasurePurposeById(measPurId);
		/*从form表单中获取度量目的信息,更新实体Bean*/
		String measurePurposeName = null;
		String measure = null;
		String measurePurposeDesp = null;
		try {
			measurePurposeName = new String(measurePurposeForm.getMeasurePurposeName().getBytes("ISO-8859-1"),"gb2312");
			measurePurposeDesp = new String(measurePurposeForm.getMeasurePurposeDesp().getBytes("ISO-8859-1"),"gb2312");
			measure = new String(measurePurposeForm.getMeasure().getBytes("ISO-8859-1"),"gb2312");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		fmp.setProductId(new Integer(measurePurposeForm.getProductId()));
		fmp.setMeasurePurposeName(measurePurposeName);
		fmp.setMeasure(measure);
		fmp.setMeasurePurposeDesp(measurePurposeDesp);		
		
		
		/*调用业务层,修改度量目的*/		

		boolean result = sp.updateMeasurePurpose(fmp);
		if(result==true){
		   request.setAttribute("productId", measurePurposeForm.getProductId());//这句的目的是能够转跳回measurePurpose.jsp
		   return mapping.findForward("success");
		}else{
		   return mapping.findForward("failure");
		}
	}
}

