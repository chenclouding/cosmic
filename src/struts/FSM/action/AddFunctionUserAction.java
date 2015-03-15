/*
 * Generated by MyEclipse Struts
 * Template path: templates/java/JavaClass.vtl
 */
package struts.FSM.action;

import java.io.UnsupportedEncodingException;

import hibernate.FSM.FsmUser;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.hibernate.HibernateException;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import business.FSM.StrategyPhase;
import struts.FSM.form.UserForm;

/** 
 * MyEclipse Struts
 * Creation date: 03-10-2010
 * 
 * XDoclet definition:
 * @struts.action path="/addFunctionUser" name="userForm" scope="request" validate="true"
 * @struts.action-forward name="success" path="/FSM/cosmicStandard/strategy/functionUser.jsp" contextRelative="true"
 * @struts.action-forward name="failure" path="/FSM/cosmicStandard/failure.jsp" contextRelative="true"
 */
public class AddFunctionUserAction extends Action {
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
		UserForm userForm = (UserForm) form;// TODO Auto-generated method stub
		StrategyPhase sp = new StrategyPhase();//ҵ��㺯��,�Թ����û�������ɾ�Ĳ�Ȳ���
		FsmUser fu = new FsmUser();          //����ʵ��bean
		
		/*��form�����л�ȡUser��Ϣ,��ֵ��ʵ��Bean*/
		String userName = null;
		String userDesp = null;
		try {
			userName = new String(userForm.getUserName().getBytes("ISO-8859-1"),"gb2312");
			userDesp = new String(userForm.getUserDesp().getBytes("ISO-8859-1"),"gb2312");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		fu.setProductId(new Integer(userForm.getProductId()));
		fu.setUserName(userName);
		fu.setUserDesp(userDesp);
		
		
		/*����ҵ���,���ӹ����û�*/
		boolean result = sp.insertFunctionUser(fu);
		if(result==true){
		   return mapping.findForward("success");
		}else{
		   return mapping.findForward("failure");
		}
		
		
	
	}
}