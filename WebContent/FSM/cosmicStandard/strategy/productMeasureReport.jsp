<%@ page contentType="text/html; charset=gb2312" language="java" import="java.util.*" %>
<%@ page import="business.FSM.MappingPhase" %>
<%@ page import="business.FSM.MeasurePhase" %>
<%@ page import="business.FSM.ProductMeasureBusiness" %>
<%@ page import="business.FSM.CountFPNumber" %>
<%@ page import="java.util.List" %>
<%@ page import="business.FSM.StrategyPhase" %>
<%@ page import="business.FSM.ViewProductReportTreeService" %>
<%@ page import="hibernate.FSM.FsmProduct" %>
<%@ page import="hibernate.FSM.FsmLayer" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%> 
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>

<jsp:useBean id="projectMeasureBean" scope="session" class="javaBeans.fsm.ProjectMeasureBean"/>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>

    
    <title>My JSP 'productMeasureReport.jsp' starting page</title>
    <link rel="StyleSheet" href="/fsmch/javascript/dtree.css" type="text/css" />
	<script type="text/javascript" src="/fsmch/javascript/dtree.js"></script>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<script language="jscript" src="../javascript/newtable.js"></script>
	
	<link rel="StyleSheet" href="/fsmch/fsmch/javascript/dtree.css" type="text/css" />
	<script type="text/javascript" src="/fsmch/fsmch/javascript/dtree.js"></script>
	 
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
  <link rel="stylesheet" type="text/css" href="/fsmch/images/screen.css"> 
  <script language="javascript">
  function layerHttpRequest(){
	       var http_request = creatHttpRequest();
	       http_request.onreadystatechange = layerSelectAjax;
           http_request.open('GET', "/fsm/servlet/PeerCompTreeAjax?peerCompId="+peerCompId, true);
           http_request.send(null);     
       }
       </script>
  </head>
  
  <body>
  <%  
      
      Integer productId =  new Integer(request.getParameter("productId"));//获取从页面productDescription.jsp传来的productId
       ProductMeasureBusiness pmb = new ProductMeasureBusiness();  
      MappingPhase mp = new MappingPhase();
      MeasurePhase mp1 = new MeasurePhase();
      StrategyPhase sp = new StrategyPhase();
      CountFPNumber cfpn = new CountFPNumber();
      ViewProductReportTreeService vprts = new ViewProductReportTreeService();     
      FsmProduct fp = (FsmProduct) pmb.getProductById(productId);
      Integer measureStatus = fp.getMeasureStatus();
	  String measureStatusName = null;
	  String tree = vprts.buildReportTree(productId);
	  switch (measureStatus)  
	         {
		         case 0:measureStatusName = "未估算";break;
		         case 1:measureStatusName = "部分估算";break;
		         case 2:measureStatusName = "全部估算";break;
		         default:measureStatusName = "状态错误";
	         }       
  %>
  
  
  
	<h2>该产品的功能点个数为<%=cfpn.CountFPNumber1(fp) %>：其具体如下</h2>
	<table border="1">
	  
	    <tr>
	    <th>产品名称</th>
	    <td><%=fp.getProductName()%></td>
	    </tr>
	    <tr>
	     <th>估算状态</th>
	     <td><%=measureStatusName%></td>
	     </tr>	          			   
	     <tr>
	     <th>功能点个数</th>
	     <td><%=cfpn.CountFPNumber1(fp) %></td>
	  </tr>	 
	    <tr> 
	    <th>包含的层次</th>
	    <td>	       
      <div class="dtree">
		<script type="text/javascript">
	
		d = new dTree('d');
		<%=tree%>
		document.write(d);
     </script>
		</div>       			        
	</td></tr>	      	   
	</table> 
	 <a  href="javascript:window.name=='contentFrame'?window.location='/fsmch/FSM/cosmicStandard/projectMeasure.jsp':parent.location.href='/fsmch/FSM/cosmicStandard/projectMeasure.jsp'">返回</a>
  </body>
</html>
