package ajaxServlet.FSM;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Iterator;
import java.net.URLEncoder;
import java.net.URLDecoder;


import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.hibernate.HibernateException;
import business.FSM.StrategyPhase;
import hibernate.FSM.FsmLayer;
import hibernate.FSM.FsmPeerComponent;

public class LayerRequestAjax extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public LayerRequestAjax() {
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
	    //禁止服务器端缓存，否则会在缓存中取数据，不执行服务器端操作
	    response.setHeader("Pragma", "No-cache");
		response.setHeader("Cache-Control", "no-cache");
		response.setDateHeader("Expires", 0);
		//response.setDateHeader("Content-Type","text/html; encoding=gb18030");
		response.setContentType("text/xml;charset=gb2312");
		PrintWriter out = response.getWriter();//创建对象必须在设置编码之后，避免出现中文乱码问题
		int productId = Integer.valueOf(request.getParameter("productId"));	
        StrategyPhase sp = new StrategyPhase();    //业务层，对应于COSMIC方法的策略阶段
        Iterator it = null;
		try {
			it = sp.getLayerByProductId(productId).iterator();
		} catch (HibernateException e) {
			e.printStackTrace();
		}
       
        String value = "";     
        while(it.hasNext()){
          FsmLayer fp = (FsmLayer)it.next();
          //String layerName =URLDecoder.decode(fp.getLayerName(), "UTF-8");////解码关键！！！！ 
          //String layerName=new String(fp.getLayerName().getBytes("ISO-8859-1"),"utf-8");
          value = value+fp.getId()+','+fp.getLayerName()+',';        
     	}
     	out.write(value==""?value:value.trim().substring(0,value.length()-1));
		out.flush();
		out.close();
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
		response.setContentType("text/xml;charset=gb2312");
		response.setHeader("Cache-Control", "no-cache");
		response.setCharacterEncoding("gb2312");		
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
