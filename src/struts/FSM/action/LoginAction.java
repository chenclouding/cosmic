package struts.FSM.action;
import jdbc.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import struts.FSM.form.LoginForm;
import entityOperation.FSM.Login;

public class LoginAction extends Action {

	@Override
	public ActionForward execute(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		LoginForm login=(LoginForm)form;
		String username=login.getUsername();
		String password=login.getPassword();
		Login loginClass = new Login();
		boolean record = loginClass.queryByNameAndPwd(username, password);
		String key=null;
		if(record==true){			
			key="success";
			request.getSession().setAttribute("userName", username);
			return mapping.findForward(key);
		}
		else{
			key="failure";
			response.getWriter().print(
		        "<script>alert('Incorrect password or username entered. Please try again.');location.href='/fsm/index.jsp'</script>");
			return null;

		}
		
	}

}
