<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@ page import="business.FSM.MappingPhase" %>
<jsp:useBean id="projectMeasureBean" scope="session" class="javaBeans.fsm.ProjectMeasureBean"/> 
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'setProjectMeasureBean.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
   <%  
      /*peerCompId mapping phase is the role of the protagonist, productId, and the role of layerId into session Bean*/ 
      Integer productId = Integer.valueOf(request.getParameter("productId"));//Get the software came from the page mapping.jsp productId 
      Integer layerId = new Integer(request.getParameter("layerId"));        //Get the software came from the page mapping.jsp layerId 
      Integer peerCompId = new Integer(request.getParameter("peerCompId"));  //Get the software came from the page mapping.jsp peerCompId
    %>
  
     <!--To projectMeasureBean the productId, layerId, peerCompId assignment is aimed at use within session  -->
     <jsp:setProperty name="projectMeasureBean" property="productId" value="<%=productId%>" />
     <jsp:setProperty name="projectMeasureBean" property="layerId" value="<%=layerId%>" />
     <jsp:setProperty name="projectMeasureBean" property="peerCompId" value="<%=peerCompId%>" />
     
     <%
        response.sendRedirect("/fsmch/FSM/cosmicStandard/measure/measure.jsp");
     %>
  </body>
</html>
