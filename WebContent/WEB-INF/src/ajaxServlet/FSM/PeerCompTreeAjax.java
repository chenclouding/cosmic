package ajaxServlet.FSM;

import hibernate.FSM.FsmPeerComponent;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Iterator;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.hibernate.HibernateException;
import business.FSM.MappingPhase;
import business.FSM.StrategyPhase;

public class PeerCompTreeAjax extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public PeerCompTreeAjax() {
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

		PrintWriter out = response.getWriter();
	    //禁止服务器端缓存，否则会在缓存中取数据，不执行服务器端操作
	    response.setHeader("Pragma", "No-cache");
		response.setHeader("Cache-Control", "no-cache");
		response.setDateHeader("Expires", 0);	
		response.setContentType("text/xml"); 
		int peerCompId = Integer.valueOf(request.getParameter("peerCompId")); 
		StrategyPhase sp = new StrategyPhase();    //业务层，对应于COSMIC方法的策略阶段
		String code = "<script language=\"javascript\">\n";
		code += "var tree = new alai_tree_win2k(divTree);\n";
		code += "var root = tree.root;\n";
		try {
			//组织级过程
			code += "var peerCompTree = root.add(\"对等组件列表\");\n";
			java.util.List fatherPeerComp = sp.getPeerComponentByFatherId(peerCompId);		
			Iterator fatherit = fatherPeerComp.iterator();
			while (fatherit.hasNext())
			{
				FsmPeerComponent opi = (FsmPeerComponent) fatherit.next();
				Integer pid = opi.getId();
				String pname = opi.getPeerCompName();
				String ponClick = "parent.edit.location='funcProsMeasureReport.jsp?id="+pid+"'";
				code += "var n_" + pid + " = peerCompTree.add(\"" + pname
						+ "\", \"\", \"js\", \"" + ponClick + "\");\n";
				
				java.util.List al = sp.getPeerComponentByFatherId(pid);
				Iterator ait = al.iterator();
				while (ait.hasNext())
				{
					FsmPeerComponent oai = (FsmPeerComponent) ait.next();
					Integer aid = oai.getId();
					String aname = oai.getPeerCompName();
					String aonClick = "parent.edit.location='funcProsMeasureReport.jsp?id="+aid+"&processId="+pid+"'";
					code += "var n_" + aid + " = n_" + pid + ".add(\""
							+ aname + "\", \"\", \"js\", \""
							+ aonClick + "\");\n";
					
				}
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			
		}
		code += "tree.expandToTier(2);\n";
		code += "</script>\n";
		
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

		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		out
				.println("<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\">");
		out.println("<HTML>");
		out.println("  <HEAD><TITLE>A Servlet</TITLE></HEAD>");
		out.println("  <BODY>");
		out.print("    This is ");
		out.print(this.getClass());
		out.println(", using the POST method");
		out.println("  </BODY>");
		out.println("</HTML>");
		out.flush();
		out.close();
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
