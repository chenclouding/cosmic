package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class index_jsp extends org.apache.jasper.runtime.HttpJspBase
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

      out.write("  \r\n");
      out.write(" \r\n");
      out.write("\r\n");
      out.write("<HTML>\r\n");
      out.write("<HEAD>\r\n");
      out.write("<TITLE>基于CMMI过程管理工具</TITLE>\r\n");
      out.write("<!--CharSet-->\r\n");
      out.write("<META HTTP-EQUIV=\"Content-Type\" CONTENT=\"text/html; charset=gb2312\">\r\n");
      out.write("<link rel=\"stylesheet\" href=\"/fsmch/images/CSS.CSS\" type=\"text/css\">\r\n");
      out.write("<style type=\"text/css\">\r\n");
      out.write("<!--\r\n");
      out.write(".style1 {color: #006600}\r\n");
      out.write(".style2 {font-size: 16px}\r\n");
      out.write(".style3 {color: #CC3300}\r\n");
      out.write(".style4 {\r\n");
      out.write("\tfont-family: \"华文隶书\";\r\n");
      out.write("\tfont-size: 24px;\r\n");
      out.write("\tcolor: #FF0000;\r\n");
      out.write("}\r\n");
      out.write(".style6 {\r\n");
      out.write("\tfont-size: 36px;\r\n");
      out.write("\tfont-family: \"华文隶书\";\r\n");
      out.write("}\r\n");
      out.write(".style8 {font-size: 24px; font-family: \"华文隶书\";}\r\n");
      out.write("-->\r\n");
      out.write("</style>\r\n");
      out.write("<script language=\"JavaScript\" src=\"javascript/verify.js\"></script>\r\n");
      out.write("<script language=\"JavaScript\">\r\n");
      out.write("function check(){\r\n");
      out.write("if(form1.username.value==null||form1.username.value==\"\"){\r\n");
      out.write("alert(\"请输入用户名!!!\");\r\n");
      out.write("}else if(form1.password.value==null||form1.password.value==\"\"){\r\n");
      out.write("alert(\"请输入密码!!!\");\r\n");
      out.write("}else{\r\n");
      out.write("form1.submit();\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("function register(){\r\n");
      out.write("window.location.href=\"/fsmch/register.jsp\";\r\n");
      out.write("\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("</script>\r\n");
      out.write("</HEAD>\r\n");
      out.write("<BODY BGCOLOR=#669966 leftmargin=\"0\" topmargin=\"0\" marginwidth=\"0\" marginheight=\"0\" >\r\n");
      out.write("<!--Counter-->\r\n");
      out.write("<!--Something Here-->\r\n");
      out.write("<table width=\"778\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\" align=\"center\" height=\"130\">\r\n");
      out.write("  <tr>\r\n");
      out.write("    <td background=\"/fsmch/images/index_topPP1.jpg\" valign=\"top\">\r\n");
      out.write("     \r\n");
      out.write("    </td>\r\n");
      out.write("  </tr>\r\n");
      out.write("</table>\r\n");
      out.write("<table width=\"778\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\" align=\"center\" background=\"/fsmch/images/index_bg.gif\">\r\n");
      out.write("  <tr>\r\n");
      out.write("    <td valign=\"top\" width=\"215\" rowspan=\"2\">\r\n");
      out.write("      <table width=\"215\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\r\n");
      out.write("        <tr>\r\n");
      out.write("          <td>\r\n");
      out.write("            <table width=\"215\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\" height=\"20\" background=\"/fsmch/images/01.gif\">\r\n");
      out.write("              <tr>\r\n");
      out.write("                <td> <img src=\"/fsmch/images/index_pic.gif\" width=\"215\" height=\"155\"></td>\r\n");
      out.write("              </tr>\r\n");
      out.write("            </table>\r\n");
      out.write("          </td>\r\n");
      out.write("        </tr>\r\n");
      out.write("        <tr>\r\n");
      out.write("          <td>\r\n");
      out.write("            <table width=\"215\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\" height=\"15\">\r\n");
      out.write("              <tr>\r\n");
      out.write("                <td>\r\n");
      out.write("                  <div align=\"center\">\r\n");
      out.write("<!--Language-->\r\n");
      out.write("<!--Something Here-->\r\n");
      out.write("</div>\r\n");
      out.write("                </td>\r\n");
      out.write("              </tr>\r\n");
      out.write("            </table>\r\n");
      out.write("            <table width=\"215\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\" height=\"40\" background=\"/fsmch/images/index_lm.gif\">\r\n");
      out.write("              <tr>\r\n");
      out.write("                <td> <div align=\"center\"><b><a href=\"index.jsp\">首页</a></b> </div></td>\r\n");
      out.write("              </tr>\r\n");
      out.write("            </table>\r\n");
      out.write("\r\n");
      out.write("<!--Button9.Content.Begin-->\r\n");
      out.write("            <table width=\"215\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\" height=\"40\" background=\"/fsmch/images/index_lm.gif\">\r\n");
      out.write("              <tr>\r\n");
      out.write("                <td>\r\n");
      out.write("                  <div align=\"center\"><b>\r\n");
      out.write("<!--Button9.Link-->\r\n");
      out.write("<a href=\"/fsmch/adminLogin.jsp\">\r\n");
      out.write("    <!--Button9-->管理页面 \r\n");
      out.write("</a></b></div>\r\n");
      out.write("                </td>\r\n");
      out.write("              </tr>\r\n");
      out.write("            </table>\r\n");
      out.write("<!--Button9.Content.End-->\r\n");
      out.write("\r\n");
      out.write("<!--Button10.Content.Begin-->\r\n");
      out.write("            <table width=\"215\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\" height=\"40\" background=\"/fsmch/images/index_lm.gif\">\r\n");
      out.write("              <tr>\r\n");
      out.write("                <td>\r\n");
      out.write("                  <div align=\"center\"><b>\r\n");
      out.write("<!--Button10.Link-->\r\n");
      out.write("<a href=\"/fsmch/logout.jsp\">\r\n");
      out.write("<!--Button10-->\r\n");
      out.write("退出系统\r\n");
      out.write("</a></b></div>\r\n");
      out.write("                </td>\r\n");
      out.write("              </tr>\r\n");
      out.write("            </table>\r\n");
      out.write("<!--Button10.Content.End-->\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("          </td>\r\n");
      out.write("        </tr>\r\n");
      out.write("      </table>\r\n");
      out.write("    </td>\r\n");
      out.write("    <td valign=\"top\" width=\"563\"><img src=\"/fsmch/images/index_top2.gif\" width=\"563\" height=\"70\"></td>\r\n");
      out.write("  </tr>\r\n");
      out.write("  <tr>\r\n");
      out.write("    <td valign=\"top\">\r\n");
      out.write("      <table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\r\n");
      out.write("     \r\n");
      out.write("        <tr>\r\n");
      out.write("          <td>\r\n");
      out.write("           <!--IndexPage.Content.Begin-->\r\n");
      out.write("            <table width=\"90%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\" align=\"center\">\r\n");
      out.write("            <tr>\r\n");
      out.write("              <td>\r\n");
      out.write("                  <div align=\"left\" class=\"style2 style3\">\r\n");
      out.write("                     <p class=\"style2 style4\">欢迎访问本网站！</p>\r\n");
      out.write("                    </div> \r\n");
      out.write("              </td>\r\n");
      out.write("             </tr>\r\n");
      out.write("             <tr>\r\n");
      out.write("                <td bgcolor=\"#000000\"><img src=\"/fsmch/images/Spacer.gif\" width=\"1\" height=\"1\"></td>\r\n");
      out.write("             </tr>\r\n");
      out.write("             <tr>\r\n");
      out.write("                <td height=\"128\">\r\n");
      out.write("<!--Page.Content.Begin-->\r\n");
      out.write("<!--Something Here-->\r\n");
      out.write("<form name=\"form1\" id=\"_form\" method=\"post\" action=\"/fsmch/FSM/login.do\"  onSubmit=\"\">\r\n");
      out.write("  <table width=\"37%\"  border=\"0\" align=\"center\" cellpadding=\"1\" cellspacing=\"1\">\r\n");
      out.write("   <tr>\r\n");
      out.write("    \r\n");
      out.write("      <td> <p>&nbsp;</p></td>\r\n");
      out.write("    \r\n");
      out.write("    </tr>\r\n");
      out.write("  \r\n");
      out.write("    <tr>\r\n");
      out.write("    \r\n");
      out.write("      <td>用户名</td>\r\n");
      out.write("      <td><input type=\"text\" name=\"username\" ></td>\r\n");
      out.write("    </tr>\r\n");
      out.write("    <tr>\r\n");
      out.write("      <td>密码       </td>\r\n");
      out.write("      <td><input type=\"password\" name=\"password\"></td>\r\n");
      out.write("    </tr>\r\n");
      out.write("    <tr>\r\n");
      out.write("      <td><div align=\"center\">\r\n");
      out.write("      </div></td>\r\n");
      out.write("      <td><div align=\"center\">\r\n");
      out.write("        <input type=\"button\" value=\"登录\" onClick=\"check()\">\r\n");
      out.write("        <input type=\"button\" value=\"注册\" onClick=\"register()\">\r\n");
      out.write("\r\n");
      out.write("      </div></td>\r\n");
      out.write("    </tr>\r\n");
      out.write("  </table>\r\n");
      out.write("  <p>&nbsp;</p>\r\n");
      out.write("  </form>\r\n");
      out.write("<p>&nbsp; </p>\r\n");
      out.write("\r\n");
      out.write("<!--Page.Content.End-->\r\n");
      out.write("       </td>\r\n");
      out.write("          </tr>\r\n");
      out.write("</table>\r\n");
      out.write("<!--IndexPage.Content.End-->\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("            <table width=\"90%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\" align=\"center\" height=\"1\">\r\n");
      out.write("              <tr>\r\n");
      out.write("                <td bgcolor=\"#000000\"> </td>\r\n");
      out.write("              </tr>\r\n");
      out.write("            </table>\r\n");
      out.write("            <table width=\"90%\" border=\"0\" cellspacing=\"0\" cellpadding=\"4\" align=\"center\">\r\n");
      out.write("              <tr>\r\n");
      out.write("                <td>\r\n");
      out.write("                  <p align=\"center\">\r\n");
      out.write("<!--Your Company Name-->\r\n");
      out.write("北航软件所\r\n");
      out.write("<!--TCopyRight-->\r\n");
      out.write(" 版权所有 @2011<br>\r\n");
      out.write("<!--TAddress-->\r\n");
      out.write("地址：北京市海淀区学院路37号\r\n");
      out.write("<!--Address-->\r\n");
      out.write("<br>\r\n");
      out.write("<!--TTelephone-->\r\n");
      out.write("电话:010－82316288\r\n");
      out.write("<!--Telephone-->\r\n");
      out.write("<br>\r\n");
      out.write("<!--TEMail-->\r\n");
      out.write("\r\n");
      out.write("<!--EMail-->\r\n");
      out.write("\r\n");
      out.write("<!--Email-->\r\n");
      out.write("</p>\r\n");
      out.write("                </td>\r\n");
      out.write("              </tr>\r\n");
      out.write("            </table>\r\n");
      out.write("          </td>\r\n");
      out.write("        </tr>\r\n");
      out.write("      </table>\r\n");
      out.write("    </td>\r\n");
      out.write("  </tr>\r\n");
      out.write("</table>\r\n");
      out.write("<table width=\"778\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\" align=\"center\">\r\n");
      out.write("  <tr>\r\n");
      out.write("    <td><img src=\"/fsmch/images/index_bottom.gif\" width=\"778\" height=\"50\"></td>\r\n");
      out.write("  </tr>\r\n");
      out.write("</table>\r\n");
      out.write("</BODY>\r\n");
      out.write("\r\n");
      out.write(" </HTML>\r\n");
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
