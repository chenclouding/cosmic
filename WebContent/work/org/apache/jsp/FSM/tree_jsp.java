package org.apache.jsp.FSM;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class tree_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List _jspx_dependants;

  static {
    _jspx_dependants = new java.util.ArrayList(2);
    _jspx_dependants.add("/WEB-INF/struts-bean.tld");
    _jspx_dependants.add("/WEB-INF/struts-html.tld");
  }

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
      response.setContentType("text/html; charset=gb2312");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;

      out.write("\r\n");
      out.write(" \r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("<html>\r\n");
      out.write("\t<head>\r\n");
      out.write("\t\t<title></title>\r\n");
      out.write("\t\t<link rel=\"StyleSheet\" href=\"../javascript/dtree.css\" type=\"text/css\" />\r\n");
      out.write("\t\t<script type=\"text/javascript\" src=\"../javascript/dtree.js\"></script>\r\n");
      out.write("\t\t<style>\r\n");
      out.write("body{\r\n");
      out.write("\tfont-family: \"宋体\"; \r\n");
      out.write("\tfont-size: 12px; \r\n");
      out.write("\tfont-weight: normal;}\r\n");
      out.write("a{\r\n");
      out.write("\tfont-family: \"宋体\"; \r\n");
      out.write("\tfont-size: 12px; \r\n");
      out.write("\tcolor: #000000; \r\n");
      out.write("\tfont-weight: normal; \r\n");
      out.write("}\r\n");
      out.write("</style>\r\n");
      out.write("\t</head>\r\n");
      out.write("\t<body bgcolor=\"#e7f3f8\">\r\n");
      out.write("\t");
String projectId = "";
	projectId =  (String)session.getAttribute("projectId");
	//获取FSM用到的变量
	String productId = (String)request.getAttribute("productId");  
      out.write("\r\n");
      out.write("\t\t<div class=\"dtree\">\r\n");
      out.write("\t\t\t<script type=\"text/javascript\">\r\n");
      out.write("\t\t<!--\r\n");
      out.write("\t\td = new dTree('d');\r\n");
      out.write("\r\n");
      out.write("\t\td.add(0,-1,'规模估算');\r\n");
      out.write("\t\td.add(22,0,'估算工具','cosmicStandard/methordAndHelp.jsp');\r\n");
      out.write("\t\t    d.add(23,22,'全功能点规模估算','cosmicStandard/projectMeasure.jsp');\r\n");
      out.write("\t\t    d.add(24,22,'识别对等组件阶段','cosmicStandard/strategy/methordAndHelp.jsp');\r\n");
      out.write("\t\t       d.add(28,24,'任务概述','cosmicStandard/strategy/strategy.jsp');\r\n");
      out.write("\t\t       d.add(31,24,'添加功能用户','cosmicStandard/strategy/functionUser.jsp');\r\n");
      out.write("\t\t       d.add(32,24,'添加估算目的','cosmicStandard/strategy/measurePurpose.jsp');\r\n");
      out.write("\t\t       d.add(33,24,'添加估算范围','cosmicStandard/strategy/measureScope.jsp');\r\n");
      out.write("\t\t       d.add(34,24,'添加层次','cosmicStandard/strategy/layer.jsp');\r\n");
      out.write("\t\t       d.add(35,24,'添加对等组件','cosmicStandard/strategy/addPeerComponent.jsp?productId=1');//1没有任何意义，仅仅是为了传递参数\t       \r\n");
      out.write("\t\t    d.add(25,22,'识别功能流程阶段','cosmicStandard/mapping/methordAndHelp.jsp');\r\n");
      out.write("\t\t       d.add(40,25,'任务概述','cosmicStandard/mapping/mapping.jsp');\r\n");
      out.write("\t\t       d.add(41,25,'添加功能流程','cosmicStandard/mapping/functionProcess.jsp?back=\"a\"');\r\n");
      out.write("\t\t       d.add(42,25,'添加兴趣对象','cosmicStandard/mapping/interestObject.jsp');\r\n");
      out.write("\t\t       d.add(43,25,'添加数据组','cosmicStandard/mapping/dataGroup.jsp');\r\n");
      out.write("\t\t       d.add(44,25,'添加事件','cosmicStandard/mapping/event.jsp');  \r\n");
      out.write("\t\t       d.add(45,25,'建立功能流程与兴趣对象关联','cosmicStandard/mapping/functionProcessInterestObject.jsp');   \r\n");
      out.write("\t\t       d.add(46,25,'建立功能流程与事件关联','cosmicStandard/mapping/functionProcessEvent.jsp'); \r\n");
      out.write("\t\t       d.add(47,25,'建立功能流程与功能用户关联','cosmicStandard/mapping/functionProcessUser.jsp');    \r\n");
      out.write("\t\t    d.add(26,22,'识别数据移动阶段','cosmicStandard/measure/methordAndHelp.jsp');\r\n");
      out.write("\t\t       d.add(50,26,'任务概述','cosmicStandard/measure/measure.jsp');\r\n");
      out.write("\t\t       d.add(51,26,'添加数据移动','cosmicStandard/measure/dataMovement.jsp');  \r\n");
      out.write("\t\t    d.add(27,22,'导出度量报告','cosmicStandard/measure/measureReport.jsp');\r\n");
      out.write("\t    d.add(208,22,'用例模型估算规模');\r\n");
      out.write("\t    d.add(209,22,'工作量估算');\r\n");
      out.write("\t            \r\n");
      out.write("        \r\n");
      out.write("\t    d.config.target = \"contentFrame\";\r\n");
      out.write("\r\n");
      out.write("\t\tdocument.write(d);\r\n");
      out.write("\t\t//-->\t\t\r\n");
      out.write("\t</script>\r\n");
      out.write("\t\t</div>\r\n");
      out.write("\t\t<p>\r\n");
      out.write("\t\t\t<a href=\"javascript: d.openAll();\">展开目录</a> | <a href=\"javascript: d.closeAll();\">收起目录</a>\r\n");
      out.write("\t\t</p>\r\n");
      out.write("\r\n");
      out.write("\t</body>\r\n");
      out.write("\r\n");
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
