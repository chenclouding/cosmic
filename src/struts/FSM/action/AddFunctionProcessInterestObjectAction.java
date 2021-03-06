/*
 * Generated by MyEclipse Struts
 * Template path: templates/java/JavaClass.vtl
 */
package struts.FSM.action;
import java.io.IOException;

import javaBeans.fsm.ProjectMeasureBean;

import hibernate.FSM.FsmFunctionProcess;
import hibernate.FSM.FsmFunctionProcessInterestObject;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.hibernate.HibernateException;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import business.FSM.MappingPhase;
import struts.FSM.form.FunctionProcessInterestObjectForm;

/** 
 * MyEclipse Struts
 * Creation date: 01-06-2010
 * 
 * XDoclet definition:
 * @struts.action path="/addFunctionProcessInterestObject" name="functionProcessInterestObjectForm" scope="request" validate="true"
 * @struts.action-forward name="success" path="/FSM/cosmicStandard/measure/dataMovement.jsp" contextRelative="true"
 * @struts.action-forward name="failure" path="/FSM/cosmicStandard/failure.jsp" contextRelative="true"
 */
public class AddFunctionProcessInterestObjectAction extends Action {
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
	 * @throws IOException 
	 */
	public ActionForward execute(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) throws HibernateException, IOException {
		FunctionProcessInterestObjectForm fm = (FunctionProcessInterestObjectForm) form;// TODO Auto-generated method stub
		MappingPhase mp = new MappingPhase();//业务层函数,对功能流程-兴趣对象进行增删改查等操作
		FsmFunctionProcessInterestObject ffpio = new FsmFunctionProcessInterestObject(); //定义实体Bean
		
		
		//从form表单将功能流程-兴趣对象信息取出，赋给实体bean
		Integer funcProsId=0;	     
		 funcProsId = new Integer(fm.getFuncProsId());	      
		 //javaBeans.fsm.ProjectMeasureBean
		 request.getSession().setAttribute("funcProsId", funcProsId);
		 String interestObjId[] = fm.getInterestObjId();
		 for(int i=0; i<interestObjId.length;i++){
			//将功能流程-兴趣对象插入数据库
			 ffpio.setFuncProsId(funcProsId);
			 ffpio.setInterestObjId(new Integer(interestObjId[i]));
			 boolean result1 = mp.insertFunctionProcessInterestObject(ffpio);  
			 if(result1==false){
				 return mapping.findForward("failure");
			 }	
		 }
		 //查找id为funcProsId的功能流程
		 FsmFunctionProcess ffp = (FsmFunctionProcess) mp.getFunctionProcessById(funcProsId);
		 //更改功能流程的MappingIOStatus为1，表示已经完成功能流程-兴趣对象的映射
		 ffp.setMappingIostatus(1);
		 Boolean result2 = mp.updateFunctionProcess(ffp);
		 if(result2==false){
			 return mapping.findForward("failure");
		 }
		 return mapping.findForward("success");
	}
}