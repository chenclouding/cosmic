<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@ page import="business.FSM.MappingPhase" %>
<%@ page import="business.FSM.MeasurePhase" %>
<%@ page import="business.FSM.PeerCompMeasureReport" %>
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

    
    <title>My JSP 'peerCompMeasureReport1.jsp' starting page</title>
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
      
       Integer peerCompId = new Integer(request.getParameter("peerCompId"));//获取从页面peerComponent.jsp或者addSubPeerComponent.jsp传来的软件peerCompId
       Integer productId = new Integer(request.getParameter("productId"));
       Integer layerId = new Integer(request.getParameter("layerId"));
       Integer fatherId = new Integer(request.getParameter("fatherId"));
       String back = new String(request.getParameter("back"));
       PeerCompMeasureReport pmr = new PeerCompMeasureReport();
       String code = pmr.exportMeasureReport(peerCompId);          
  %> 
  
 <%=code %>
 <a href="/fsmch/FSM/cosmicStandard/strategy/peerCompMeasureReport2.jsp?productId=<%=productId %>&peerCompId=<%=peerCompId%>"> 导出度量报告到word</a><br>
  </body>
  <%if(back.equals("peerComp")){ %>
  <a href="/fsmch/FSM/cosmicStandard/strategy/peerComponent.jsp?productId=<%=productId %>&layerId=<%=layerId %>"> 返回</a>
<%}else{%>
    <a href="/fsmch/FSM/cosmicStandard/strategy/addSubPeerComponent.jsp?productId=<%=productId %>&layerId=<%=layerId %>&fatherId=<%=fatherId %>"> 返回</a>
   <%} %>
</html>
