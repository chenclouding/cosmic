<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@ page import="business.FSM.MappingPhase" %>
<%@ page import="business.FSM.MeasurePhase" %>
<%@ page import="hibernate.FSM.FsmFunctionProcess" %>
<%@ page import="hibernate.FSM.FsmDataMovement" %>
<%@ page import="hibernate.FSM.FsmDataGroup" %>

<jsp:useBean id="projectMeasureBean" scope="session" class="javaBeans.fsm.ProjectMeasureBean"/>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'funcProsMeasureReport.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
  <link rel="stylesheet" type="text/css" href="/fsmch/images/screen.css">
  </head>
  
  <body>
  <%  
      
    Integer funcProsId = new Integer(request.getParameter("funcProsId"));//获取从页面measure.jsp传来的软件funcProsId     
      MappingPhase mp = new MappingPhase();
      MeasurePhase mp1 = new MeasurePhase();   
     boolean result = mp1.delDataMovementByFuncProsId(funcProsId);
     if(result==true){
        FsmFunctionProcess ffp = (FsmFunctionProcess)mp.getFunctionProcessById(funcProsId);
        ffp.setMeasureStatus(0);
        mp.updateFunctionProcess(ffp);
        response.sendRedirect("/fsmch/FSM/cosmicStandard/measure/measure.jsp");
     }
       
  %>
  
  
	
  </body>
</html>
