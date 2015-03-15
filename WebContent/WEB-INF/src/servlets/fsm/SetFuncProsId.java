package servlets.fsm;

import java.io.IOException;
import java.io.PrintWriter;
import javaBeans.fsm.ProjectMeasureBean;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class SetFuncProsId extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public SetFuncProsId() {
		super();
	}

	/**
	 * Destruction of the servlet. <br>
	 */
	public void destroy() {
		super.destroy(); // Just puts "destroy" string in log
		// Put your code here
	}

	/**
	 * The doGet method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to get.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html");
		response.setCharacterEncoding("gb2312");

		int funcProsId = Integer.valueOf(request.getParameter("funcProsId"));
		ProjectMeasureBean pmb = (ProjectMeasureBean)request.getSession().getAttribute("projectMeasureBean");
		pmb.setFuncProsId(funcProsId);
		//PrintWriter out = response.getWriter();
		//out.println(pmb.getPeerCompId());
		//out.println(funcProsId);
		//out.println(pmb.getFuncProsId());
		
		/*getRequestDispatcher(url)中的url是服务器端的转跳，其地址相对于localhost：8080/gcgl/，
		 * 而Html中相对浏览器端的转跳，其地址相对于localhost：8080/
		 */ 
		RequestDispatcher dispatcher = request.getRequestDispatcher("/FSM/cosmicStandard/measure/dataMovement.jsp"); 
		dispatcher .forward(request, response); 
		
		
		
		
	}

	/**
	 * The doPost method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to post.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		 doGet(request,response);
	}

	/**
	 * Initialization of the servlet. <br>
	 *
	 * @throws ServletException if an error occurs
	 */
	public void init() throws ServletException {
		// Put your code here
	}

}
