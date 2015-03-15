package org.apache.jsp.FSM.cosmicStandard;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.util.*;
import java.util.Iterator;
import java.sql.Date;
import java.util.Calendar;
import business.FSM.ProductMeasureBusiness;
import hibernate.FSM.FsmProduct;

public final class projectMeasure_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      javaBeans.fsm.ProjectMeasureBean projectMeasureBean = null;
      synchronized (session) {
        projectMeasureBean = (javaBeans.fsm.ProjectMeasureBean) _jspx_page_context.getAttribute("projectMeasureBean", PageContext.SESSION_SCOPE);
        if (projectMeasureBean == null){
          projectMeasureBean = new javaBeans.fsm.ProjectMeasureBean();
          _jspx_page_context.setAttribute("projectMeasureBean", projectMeasureBean, PageContext.SESSION_SCOPE);
        }
      }
      out.write("  \r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\">\r\n");
      out.write("<html>\r\n");
      out.write("  <head>\r\n");
      out.write("     <html:base/>\r\n");
      out.write("    <title>My JSP 'projectMeasure.jsp' starting page</title>\r\n");
      out.write("    \r\n");
      out.write("\t<meta http-equiv=\"pragma\" content=\"no-cache\">\r\n");
      out.write("\t<meta http-equiv=\"cache-control\" content=\"no-cache\">\r\n");
      out.write("\t<meta http-equiv=\"expires\" content=\"0\">    \r\n");
      out.write("\t<meta http-equiv=\"keywords\" content=\"keyword1,keyword2,keyword3\">\r\n");
      out.write("\t<meta http-equiv=\"description\" content=\"This is my page\">\t\r\n");
      out.write("    <link rel=\"stylesheet\" type=\"text/css\" href=\"/fsmch/images/screen.css\">\r\n");
      out.write("    <script language=\"JavaScript\" src=\"/fsmch/javascript/verify.js\"></script>\r\n");
      out.write("    <script type=\"text/javascript\" src=\"./timejs.js\"></script>\r\n");
      out.write("\t<script language=\"JavaScript\">\r\n");
      out.write("\t\r\n");
      out.write("\t   function confirmdel(){\r\n");
      out.write("          return confirm(\"确定删除？\");\r\n");
      out.write("\t   }\r\n");
      out.write("\t  \r\n");
      out.write("\t\tfunction verifyInput()\r\n");
      out.write("\t  {\t\r\n");
      out.write("\t\t    var frm = document.productForm;\r\n");
      out.write("\t\t    var endTime1=frm.endTime.value;\r\n");
      out.write("\t\t    var data1=frm.endTime.value.split(\"-\");\r\n");
      out.write("\t\t    var data2=frm.startTime.value.split(\"-\");\r\n");
      out.write("\t\t    var data3=frm.estimateStartTime.value.split(\"-\");\r\n");
      out.write("\t\t    var data4=frm.estimateEndTime.value.split(\"-\");\r\n");
      out.write("\t\t    \r\n");
      out.write("\t\t    for(var i=0;i<3;i++)\r\n");
      out.write("\t\t    { \r\n");
      out.write("\t\t       if(data1[i]<data2[i])\r\n");
      out.write("\t\t        {\r\n");
      out.write("\t\t        alert(\"请重新选择项目结束时间，应该大于项目开始时间！\");\r\n");
      out.write("\t\t        return false;\r\n");
      out.write("\t\t        break;\r\n");
      out.write("\t\t        }\r\n");
      out.write("\t\t     }\r\n");
      out.write("\t\t     \r\n");
      out.write("\t\t      for(var j=0;j<3;j++)\r\n");
      out.write("\t\t    { \r\n");
      out.write("\t\t       if(data4[j]<data3[j])\r\n");
      out.write("\t\t        {\r\n");
      out.write("\t\t        alert(\"请重新选择估算结束时间，应该大于估算开始时间！\");\r\n");
      out.write("\t\t        return false;\r\n");
      out.write("\t\t        break;\r\n");
      out.write("\t\t        }\r\n");
      out.write("\t\t     }\r\n");
      out.write("\t\t      \t\t    \t   \r\n");
      out.write("\t\t\tif(isEmpty(frm.productName.value)) \r\n");
      out.write("\t\t\t{\t\r\n");
      out.write("\t\t\t    alert(\"请填写软件名称！\");\r\n");
      out.write("\t\t\t\tfrm.productName.focus();\r\n");
      out.write("\t\t\t\treturn false;\r\n");
      out.write("\t\t\t}\t\r\n");
      out.write("\t\t\tif(isEmpty(frm.startTime.value)) \r\n");
      out.write("\t\t\t{\t\r\n");
      out.write("\t\t\t    alert(\"请选择项目开始时间！\");\r\n");
      out.write("\t\t\t\tfrm.startTime.focus();\r\n");
      out.write("\t\t\t\treturn false;\r\n");
      out.write("\t\t\t}\t\r\n");
      out.write("\t\t\tif(isEmpty(frm.endTime.value)) \r\n");
      out.write("\t\t\t{\t\r\n");
      out.write("\t\t\t    alert(\"请选择项目结束时间！\");\r\n");
      out.write("\t\t\t\tfrm.endTime.focus();\r\n");
      out.write("\t\t\t\treturn false;\r\n");
      out.write("\t\t\t}\t\r\n");
      out.write("\t\t\tif(isEmpty(frm.estimateStartTime.value)) \r\n");
      out.write("\t\t\t{\t\r\n");
      out.write("\t\t\t    alert(\"请选择开始估算时间！\");\r\n");
      out.write("\t\t\t\tfrm.estimateStartTime.focus();\r\n");
      out.write("\t\t\t\treturn false;\r\n");
      out.write("\t\t\t}\t\r\n");
      out.write("\t\t\tif(isEmpty(frm.estimateEndTime.value)) \r\n");
      out.write("\t\t\t{\t\r\n");
      out.write("\t\t\t    alert(\"请选择结束估算时间！\");\r\n");
      out.write("\t\t\t\tfrm.estimateEndTime.focus();\r\n");
      out.write("\t\t\t\treturn false;\r\n");
      out.write("\t\t\t}\t\t\t\t\t\t\t\t\t\r\n");
      out.write("\t\t\tif(isEmpty(frm.productType.value)) \r\n");
      out.write("\t\t\t{\r\n");
      out.write("\t\t\t\talert(\"请填写软件类型！\");\r\n");
      out.write("\t\t\t\tfrm.productType.focus();\r\n");
      out.write("\t\t\t\treturn false;\r\n");
      out.write("\t\t\t}\t\t\r\n");
      out.write("\t\t\tif(isEmpty(frm.developType.value)) \r\n");
      out.write("\t\t\t{\r\n");
      out.write("\t\t\t\talert(\"请填写项目类型！\");\r\n");
      out.write("\t\t\t\tfrm.developType.focus();\r\n");
      out.write("\t\t\t\treturn false;\r\n");
      out.write("\t\t\t}\r\n");
      out.write("\t\t\t\r\n");
      out.write("\t\t\tif(isEmpty(frm.measureMethod.value)) \r\n");
      out.write("\t\t\t{\r\n");
      out.write("\t\t\t\talert(\"请填写估算方法！\");\r\n");
      out.write("\t\t\t\tfrm.measureMethod.focus();\r\n");
      out.write("\t\t\t\treturn false;\r\n");
      out.write("\t\t\t}\r\n");
      out.write("\t\t\t\r\n");
      out.write("\t\t\tif(isEmpty(frm.lifecyclePhase.value)) \r\n");
      out.write("\t\t\t{\r\n");
      out.write("\t\t\t\talert(\"请填写生命周期阶段！\");\r\n");
      out.write("\t\t\t\tfrm.lifecyclePhase.focus();\r\n");
      out.write("\t\t\t\treturn false;\r\n");
      out.write("\t\t\t}\r\n");
      out.write("\t\t\t\r\n");
      out.write("\t\t\tif(isEmpty(frm.measureStatus.value)) \r\n");
      out.write("\t\t\t{\r\n");
      out.write("\t\t\t\talert(\"请选择软件估算状态！\");\r\n");
      out.write("\t\t\t\tfrm.measureStatus.focus();\r\n");
      out.write("\t\t\t\treturn false;\r\n");
      out.write("\t\t\t}\r\n");
      out.write("\t\t}\r\n");
      out.write("\t\t     \r\n");
      out.write("\t</script> \r\n");
      out.write("  </head>\r\n");
      out.write("  \r\n");
      out.write("  <body>\r\n");
      out.write("    <h1>估算软件列表</h1>\r\n");
      out.write("    <table>\r\n");
      out.write("       <tr>\r\n");
      out.write("         <td>序号</td> \r\n");
      out.write("         <td>软件名称</td>\r\n");
      out.write("         <td>估算状态</td>\r\n");
      out.write("         <td>查看</td>\r\n");
      out.write("         <td>修改</td>\r\n");
      out.write("         <td>删除</td>\r\n");
      out.write("         <td>开始估算</td>\r\n");
      out.write("       </tr>\r\n");
      out.write("       ");
 
       /*从数据库中把所有软件的估算信息取出*/
       ProductMeasureBusiness pmb = new ProductMeasureBusiness(); 
       List productList = pmb.getAllProduct();  
       FsmProduct product = new FsmProduct();//定义实体Bean
       
        Calendar cal = Calendar.getInstance();
		Date now = new Date(cal.getTimeInMillis());
     
       /*若无软件信息，提示添加；若有软件信息，列出估算软件列表*/
       if(productList==null ||productList.size()==0 ){
      out.write("  \r\n");
      out.write("       <h1 style=\"color:red\">目前无估算软件信息，请添加待估算的软件<h1>\r\n");
      out.write("       ");
}else{ 
	       for(Object p:productList){ 
	         product = (FsmProduct)p; 
	         Integer productId = product.getId();
	         session.setAttribute("productId",productId);
	         //根据状态的返回值，对状态赋值 
	         Integer measureStatus = product.getMeasureStatus();
	         String measureStatusName = null;
	         switch (measureStatus)  
	         {
		         case 0:measureStatusName = "未估算";break;
		         case 1:measureStatusName = "部分估算";break;
		         case 2:measureStatusName = "全部估算";break;
		         default:measureStatusName = "状态错误";
	         }
	          
      out.write("\r\n");
      out.write("\t         <tr>\r\n");
      out.write("\t          <td>");
      out.print( productList.indexOf(p)+1);
      out.write("</td> \r\n");
      out.write("\t          <td>");
      out.print( product.getProductName() );
      out.write("</td>\r\n");
      out.write("\t          <td>");
      out.print( measureStatusName );
      out.write("</td>\r\n");
      out.write("\t          <td><a href=\"/fsmch/FSM/cosmicStandard/strategy/productDescription.jsp?productId=");
      out.print(productId);
      out.write("\"><IMG src=\"/fsmch/images/btncheck.gif\" alt=\"查看\" border=\"0\" /></a></td>\r\n");
      out.write("\t          <td><a href=\"/fsmch/FSM/cosmicStandard/strategy/editProduct.jsp?productId=");
      out.print(productId);
      out.write("\"> <IMG src=\"/fsmch/images/btnedit.gif\" alt=\"修改\" border=\"0\" /></a></td>\r\n");
      out.write("\t          <td>\r\n");
      out.write("\t          <a href=\"/fsmch/FSM/cosmicStandard/strategy/delProduct.jsp?productId=");
      out.print(productId);
      out.write("\" onclick=\"return confirmdel();\"><IMG src=\"/fsmch/images/btndel.gif\" alt=\"删除\" width=\"15\" height=\"12\" border=\"0\" /></a>\r\n");
      out.write("\t          </td>\r\n");
      out.write("\t          <td><a href=\"/fsmch/FSM/cosmicStandard/strategy/strategyPhase.jsp?productId=");
      out.print(productId);
      out.write("\">识别对等组件阶段</a></td>\r\n");
      out.write("\t         </tr>  \r\n");
      out.write("          ");
}
       }
      out.write("  \r\n");
      out.write("    </table>\r\n");
      out.write("    <form  action=\"/fsmch/FSM/addProduct.do\"  name=\"productForm\" method=\"post\" onSubmit=\"return verifyInput();\">\r\n");
      out.write("  \t<table>\r\n");
      out.write("  \t\t<tr>\r\n");
      out.write("  \t\t\t<td width=\"10%\">待估算软件名称</td>\r\n");
      out.write("  \t\t\t<td >\r\n");
      out.write("  \t\t\t    <input type=\"text\" name=\"productName\" style=\"width:160px\" value=\"\"/ >\r\n");
      out.write("            </td>\r\n");
      out.write("  \t\t</tr>\r\n");
      out.write("  \t\t<tr>\r\n");
      out.write("  \t\t\t<td width=\"10%\">待估算软件描述</td>\r\n");
      out.write("  \t\t\t<td >\r\n");
      out.write("  \t\t\t    <textarea name=\"productDesp\" wrap=\"soft\" cols=\"25\" rows=\"5\"></textarea>\r\n");
      out.write("            </td>\r\n");
      out.write("  \t\t</tr>\r\n");
      out.write("  \t\r\n");
      out.write("  \t\t<tr>\r\n");
      out.write("  \t\t\t<td width=\"10%\">软件类型</td>\r\n");
      out.write("  \t\t\t<td >\r\n");
      out.write("  \t\t\t \t<select name=\"productType\" style=\"width:160px\" >\r\n");
      out.write("  \t\t\t \t    <option value=\"\">=请选择=</option>\r\n");
      out.write("  \t\t\t \t    <!--0代表MIS系统，1代表web系统  -->\r\n");
      out.write("  \t\t\t\t\t<option value=\"0\" selected>MIS</option>\r\n");
      out.write("  \t\t\t\t\t<option value=\"1\">Web</option>\r\n");
      out.write("  \t\t\t\t</select>\r\n");
      out.write("            </td>\r\n");
      out.write("  \t\t</tr>\r\n");
      out.write("  \t\t<tr>\r\n");
      out.write("  \t\t\t<td width=\"10%\">项目类型</td>\r\n");
      out.write("  \t\t\t<td >\r\n");
      out.write("  \t\t\t \t<select name=\"developType\" style=\"width:160px\">\r\n");
      out.write("  \t\t\t \t    <option value=\"\">=请选择=</option>\r\n");
      out.write("  \t\t\t \t    <!--0代表newDevelop，1代表二次开发，2代表增强型 -->\r\n");
      out.write("  \t\t\t\t\t<option value=\"0\" selected>新开发</option>\r\n");
      out.write("  \t\t\t\t\t<option value=\"1\">二次开发</option>\r\n");
      out.write("  \t\t\t\t\t<option value=\"2\">增强型</option>\r\n");
      out.write("  \t\t\t\t</select>\r\n");
      out.write("            </td>\r\n");
      out.write("  \t\t</tr>\r\n");
      out.write("  \t\t<tr>\r\n");
      out.write("  \t\t\t<td>估算方法</td>\r\n");
      out.write("  \t\t\t<td width=\"40px\">\r\n");
      out.write("  \t\t\t \t<select name=\"measureMethod\" style=\"width:160px\">\r\n");
      out.write("  \t\t\t \t    <option value=\"\">=请选择=</option>\r\n");
      out.write("  \t\t\t \t    <!--0代表COSMIC标准方法直接估算，1代表COSMIC近似估算  -->\r\n");
      out.write("  \t\t\t \t    <option value=\"0\" selected>COSMIC标准方法直接估算</option> \t\t\t\t\r\n");
      out.write("  \t\t\t\t\t<option value=\"1\">COSMIC近似估算</option>\r\n");
      out.write("  \t\t\t\t</select>\r\n");
      out.write("            </td>\r\n");
      out.write("  \t\t</tr>\r\n");
      out.write("  \t\t<tr>\r\n");
      out.write("  \t\t\t<td>生命周期阶段</td>\r\n");
      out.write("  \t\t\t<td >\r\n");
      out.write("  \t\t\t \t<select name=\"lifecyclePhase\" style=\"width:160px\">\r\n");
      out.write("  \t\t\t \t    <option value=\"\">=请选择=</option>\r\n");
      out.write("  \t\t\t \t    <!--0代表需求定义后，1代表详细设计后，2代表编码完成后，3代表产品交付后  -->\r\n");
      out.write("  \t\t\t\t\t<option value=\"0\" selected>需求定义后</option>\r\n");
      out.write("  \t\t\t\t\t<option value=\"1\">详细设计后</option>\r\n");
      out.write("  \t\t\t\t\t<option value=\"2\">编码完成后</option>\r\n");
      out.write("  \t\t\t\t\t<option value=\"3\">产品交付后</option>\r\n");
      out.write("  \t\t\t\t</select>\r\n");
      out.write("            </td>\r\n");
      out.write("  \t\t</tr>\r\n");
      out.write("  \t\t<tr>\r\n");
      out.write("  \t\t\t<td width=\"10%\">估算人员</td>\r\n");
      out.write("  \t\t\t<td >    \r\n");
      out.write("  \t\t\t  <input type=\"text\" name=\"estimator\" style=\"width:160px\" value=\"\"/ >         \r\n");
      out.write("            </td>\r\n");
      out.write("  \t\t</tr>\r\n");
      out.write("  \t\t<tr>\r\n");
      out.write("           <td> 项目开始日期</td>\r\n");
      out.write("           <td>\r\n");
      out.write("               <input type=\"text\" name=\"startTime\" style=\"width:160px\" value=\"\"/ >\r\n");
      out.write("               <input size=\"20\" type=\"button\" name=\"start1Time\" id=\"start1Time\" value=\"选择日期\" readOnly  onClick=\"javascript:fPopCalendar(this, startTime)\"/>\r\n");
      out.write("           </td>\r\n");
      out.write("           </tr>\r\n");
      out.write("           <tr>\r\n");
      out.write("           <td> 项目结束日期</td>\r\n");
      out.write("           <td>\r\n");
      out.write("             <input type=\"text\" name=\"endTime\" style=\"width:160px\" value=\"\" / >\r\n");
      out.write("             <input size=\"20\" type=\"button\" name=\"end1Time\" id=\"end1Time\" value=\"选择日期\" readOnly  onClick=\"javascript:fPopCalendar(this, endTime) \"  />\r\n");
      out.write("          \r\n");
      out.write("           </td>\r\n");
      out.write("          </tr>\r\n");
      out.write("          \r\n");
      out.write("       <tr>\r\n");
      out.write("           <td> 估算开始日期</td>\r\n");
      out.write("           <td>\r\n");
      out.write("             <input type=\"text\" name=\"estimateStartTime\" style=\"width:160px\" value=\"\"/ >\r\n");
      out.write("             <input size=\"20\" type=\"button\" name=\"estimateStart1Time\" id=\"estimateStart1Time\" value=\"选择日期\" readOnly  onClick=\"javascript:fPopCalendar(this, estimateStartTime)\"/>\r\n");
      out.write("           </td>\r\n");
      out.write("           </tr>\r\n");
      out.write("           <tr>\r\n");
      out.write("           <td> 估算结束日期</td>\r\n");
      out.write("           <td>\r\n");
      out.write("              <input type=\"text\" name=\"estimateEndTime\" style=\"width:160px\" value=\"\"/ >\r\n");
      out.write("             <input size=\"20\" type=\"button\" name=\"estimateEnd1Time\" id=\"estimateEnd1Time\" value=\"选择日期\" readOnly  onClick=\"javascript:fPopCalendar(this, estimateEndTime)\"/>\r\n");
      out.write("           </td>\r\n");
      out.write("           </tr>\r\n");
      out.write("  \t   \r\n");
      out.write("  \t\r\n");
      out.write("  \t\t<tr>\r\n");
      out.write("  \t\t    <td>\r\n");
      out.write("  \t\t\t\t<input type=\"submit\" name=\"submit\" value=\"增加软件\"/>\r\n");
      out.write("  \t\t\t</td>\r\n");
      out.write("  \t\t\t<td>\r\n");
      out.write("  \t\t\t\t<input type=\"reset\" name=\"reset\" value=\"清除\"/>\r\n");
      out.write("  \t\t\t</td>\r\n");
      out.write("  \t\t</tr>\r\n");
      out.write("  \t</table>\r\n");
      out.write("  \t<!--0代表未进行估算，1代表软件部分被估算，2代表软件全部被估算 -->\r\n");
      out.write("      <input type=\"hidden\" name=\"measureStatus\" value=\"0\"/>\r\n");
      out.write("  \t</form>\r\n");
      out.write("  \t\r\n");
      out.write("  \t\t\t\r\n");
      out.write("  </body>\r\n");
      out.write("  \r\n");
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
