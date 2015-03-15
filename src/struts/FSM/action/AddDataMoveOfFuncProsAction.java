/*
 * Generated by MyEclipse Struts
 * Template path: templates/java/JavaClass.vtl
 */
package struts.FSM.action;

import java.io.UnsupportedEncodingException;

import hibernate.FSM.FsmDataMovement;
import hibernate.FSM.FsmEvent;
import hibernate.FSM.FsmFunctionProcess;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.hibernate.HibernateException;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import business.FSM.MeasurePhase;
import business.FSM.MappingPhase;
import struts.FSM.form.DataMovementForm;


/** 
 * MyEclipse Struts
 * Creation date: 01-07-2010
 * 
 * XDoclet definition:
 * @struts.action path="/addDataMovement" name="dataMovementForm" scope="request" validate="true"
 * @struts.action-forward name="success" path="/FSM/cosmicStandard/measure/dataMovement.jsp" contextRelative="true"
 * @struts.action-forward name="failure" path="/FSM/cosmicStandard/failure.jsp" contextRelative="true"
 */
public class AddDataMoveOfFuncProsAction extends Action {
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
		DataMovementForm fm = (DataMovementForm) form;// TODO Auto-generated method stub
		MeasurePhase mp = new MeasurePhase();//ҵ��㺯��,�������ƶ�������ɾ�Ĳ�Ȳ���
		MappingPhase mp1 = new MappingPhase();
		FsmDataMovement fdm = new FsmDataMovement(); //����ʵ��Bean
		
		
		//��form�����������ƶ���Ϣȡ��������ʵ��bean
		String dataMoveName = null;
		String dataMoveDesp = null;
		try {
			dataMoveName = new String(fm.getDataMoveName().getBytes("ISO-8859-1"),"gb2312");
			dataMoveDesp = new String(fm.getDataMoveDesp().getBytes("ISO-8859-1"),"gb2312");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
				
		fdm.setDataMoveName(dataMoveName);
		fdm.setDataMoveDesp(dataMoveDesp);		
		fdm.setFuncProsId(Integer.valueOf(fm.getFuncProsId()));
		fdm.setDataGroupId(Integer.valueOf(fm.getDataGroupId()));
		fdm.setDataMoveType(new Integer(fm.getDataMoveType()));				
	
		
		/*����ҵ���,���������ƶ�*/
		boolean result = mp.insertDataMovement(fdm);
		if(result==true){
			FsmFunctionProcess ffp = (FsmFunctionProcess)mp1.getFunctionProcessById(Integer.valueOf(fm.getFuncProsId()));
			ffp.setMeasureStatus(1);
			mp1.updateFunctionProcess(ffp);
		   return mapping.findForward("success");
		}else{
		   return mapping.findForward("failure");
		}
	}
}