<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@ page import="business.FSM.MappingPhase" %>
<%@ page import="business.FSM.MeasurePhase" %>
<%@ page import="business.FSM.LayerMeasureReport" %>
<%@ page import="business.FSM.ProductMeasureBusiness" %>
<%@ page import="business.FSM.CountFPNumber" %>
<%@ page import="java.util.List" %>
<%@ page import="business.FSM.StrategyPhase" %>
<%@ page import="business.FSM.ViewProductReportTreeService" %>
<%@ page import="hibernate.FSM.FsmProduct" %>
<%@ page import="hibernate.FSM.FsmLayer" %>
<%@ page import="hibernate.FSM.FsmMeasurePurpose" %>
<%@ page import="hibernate.FSM.FsmMeasureScope" %>
<%@ page import="hibernate.FSM.FsmUser" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%> 
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>

<jsp:useBean id="projectMeasureBean" scope="session" class="javaBeans.fsm.ProjectMeasureBean"/>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>

    
    <title>My JSP 'layerMeasureReport1.jsp' starting page</title>
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
  </head>
  
  <body>
  <%  
      
       Integer layerId = new Integer(request.getParameter("layerId"));//获取从页面layer.jsp传来的软件layerId
       Integer productId = new Integer(request.getParameter("productId"));
       LayerMeasureReport lmr = new LayerMeasureReport();
       String code = lmr.exportMeasureReport(layerId);          
  %>  
 <%=code %>
 <a href="/fsmch/FSM/cosmicStandard/strategy/layerMeasureReport2.jsp?productId=<%=productId %>&layerId=<%=layerId %>"> 导出度量报告到word</a><br>
  </body>
  <a href="/fsmch/FSM/cosmicStandard/strategy/layer.jsp?productId=<%=productId %>"> 返回</a>
</html>
