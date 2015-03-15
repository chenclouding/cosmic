package org.apache.jsp.FSM.cosmicStandard.strategy;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.util.*;
import business.FSM.ProductMeasureBusiness;
import hibernate.FSM.FsmProduct;

public final class strategy_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List _jspx_dependants;

  private javax.el.ExpressionFactory _el_expressionfactory;
  private org.apache.AnnotationProcessor _jsp_annotationprocessor;

  public Object getDependants() {
    return _jspx_dependants;
  }

  public void _jspInit() {
    _el_expressionfactory = _jspxFactory.getJspApplicationContext(getServletConfig().getServletContext()).getExpressionFactory();
    _jsp_annotationprocessor = (org.apache.AnnotationProcessor) getServletConfig().getServletContext().getAttribute(org.apache.AnnotationProcessor.class.getName());
  }

  public void _jspDestroy() {
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;


    try {
      response.setContentType("text/html;charset=gb2312");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;

      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");

String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";

      out.write("\r\n");
      out.write("\r\n");
      out.write("<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\">\r\n");
      out.write("<html>\r\n");
      out.write("  <head>\r\n");
      out.write("    <base href=\"");
      out.print(basePath);
      out.write("\">\r\n");
      out.write("    \r\n");
      out.write("    <title>My JSP 'strategy.jsp' starting page</title>\r\n");
      out.write("    \r\n");
      out.write("\t<meta http-equiv=\"pragma\" content=\"no-cache\">\r\n");
      out.write("\t<meta http-equiv=\"cache-control\" content=\"no-cache\">\r\n");
      out.write("\t<meta http-equiv=\"expires\" content=\"0\">    \r\n");
      out.write("\t<meta http-equiv=\"keywords\" content=\"keyword1,keyword2,keyword3\">\r\n");
      out.write("\t<meta http-equiv=\"description\" content=\"This is my page\">\r\n");
      out.write("\t<!--\r\n");
      out.write("\t<link rel=\"stylesheet\" type=\"text/css\" href=\"styles.css\">\r\n");
      out.write("\t-->\r\n");
      out.write("    <link rel=\"stylesheet\" type=\"text/css\" href=\"/fsmch/images/screen.css\">\r\n");
      out.write("     <script language=\"JavaScript\" src=\"/fsmch/javascript/verify.js\"></script>\r\n");
      out.write("     <script language=\"javascript\">\r\n");
      out.write("       var http_request = false;\r\n");
      out.write("       \r\n");
      out.write("       function verifyInput()\r\n");
      out.write("\t  {\t\r\n");
      out.write("\t\tvar frm = document.form0;\r\n");
      out.write("\t   \r\n");
      out.write("\t\t\tif(frm.productId.value==0) \r\n");
      out.write("\t\t\t{\r\n");
      out.write("\t\t\t\talert(\"请选择产品！\");\r\n");
      out.write("\t\t\t\tfrm.productId.focus();\r\n");
      out.write("\t\t\t\treturn false;\r\n");
      out.write("\t\t\t}\t\t\t\r\n");
      out.write("\t\t\t\t\t\r\n");
      out.write("\t\t}\r\n");
      out.write("\t\t </script>\r\n");
      out.write("  </head>\r\n");
      out.write("  \r\n");
      out.write("  <body>\r\n");
      out.write("   ");
 
     ProductMeasureBusiness pmb = new ProductMeasureBusiness(); 
     Iterator it = pmb.getAllProduct().iterator();              //迭代器获得所有待估算软件    
   
      out.write("\r\n");
      out.write("   <table>\r\n");
      out.write("     <tr>\r\n");
      out.write("       <td>\r\n");
      out.write("       请选择产品\r\n");
      out.write("\t\t    <form  name=\"form0\" action=\"/fsmch/FSM/cosmicStandard/strategy/strategyPhase.jsp\"  method=\"post\" target=\"staregyFrame\" onSubmit=\"return verifyInput();\"  >\r\n");
      out.write("\t\t      \t<select name=\"productId\" style=\"width:160px\">\r\n");
      out.write("\t\t      \t<option value=\"0\">=请选择=</option>\r\n");
      out.write("\t\t      \t ");

		      	    while(it.hasNext()){
		      	        FsmProduct fp = (FsmProduct)it.next();
      out.write("\t\t      \t        \r\n");
      out.write("\t\t      \t        <option value=\"");
      out.print(fp.getId());
      out.write('"');
      out.write('>');
      out.print(fp.getProductName());
      out.write("</option>\r\n");
      out.write("\t\t      \t  ");
}
      out.write("\r\n");
      out.write("\t\t\t \t   \r\n");
      out.write("\t\t\t    </select>\r\n");
      out.write("\t\t\t     <input type=\"submit\" name=\"submit\" value=\"提交\">\r\n");
      out.write("\t\t    </form>\r\n");
      out.write("\t\t</td>\r\n");
      out.write("\t  </tr>\r\n");
      out.write("\t</table>\r\n");
      out.write("\t<hr>\r\n");
      out.write("    \r\n");
      out.write("    <iFrame name=\"staregyFrame\" frameborder=\"0\" height=\"400px\" width=\"100%\" scrolling=\"auto\"/>\r\n");
      out.write("    \r\n");
      out.write("    \r\n");
      out.write("  </body>\r\n");
      out.write("</html>\r\n");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          try { out.clearBuffer(); } catch (java.io.IOException e) {}
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
