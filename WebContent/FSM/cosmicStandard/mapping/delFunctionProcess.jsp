<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@ page import="business.FSM.MappingPhase" %>
<%@ page import="business.FSM.MeasurePhase" %>
<%@ page import="hibernate.FSM.FsmFunctionProcessEvent" %>
<%@ page import="hibernate.FSM.FsmFunctionProcessUser" %>
<%@ page import="hibernate.FSM.FsmFunctionProcessInterestObject" %>
<%@ page import="hibernate.FSM.FsmDataMovement" %>
<%@ page import="hibernate.FSM.FsmFunctionProcess" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'delFunctionProcess.jsp' starting page</title>
    
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
   
      Integer funcProsId =new Integer(request.getParameter("funcProsId"));//获取从页面functionProcess.jsp传来funcProsId
      MappingPhase mp = new MappingPhase();  //业务层函数，
      MeasurePhase mp1 = new MeasurePhase();  //业务层函数，
      FsmFunctionProcess ffp = (FsmFunctionProcess)mp.getFunctionProcessById(funcProsId); //定义实体bean     
      List  funcProsEventList = mp.getFunctionProcessEventByFuncProsId(funcProsId); 
      mp.delFunctionProcessEventByFuncProsId(funcProsId);
      mp.delFunctionProcessInterestObjectByFuncProsId(funcProsId);
      mp.delFunctionProcessUserByFuncProsId(funcProsId);
      mp1.delDataMovementByFuncProsId(funcProsId);         
      
      boolean result = mp.delFunctionProcess(funcProsId);
      if(result==true){
          response.sendRedirect("/fsmch/FSM/cosmicStandard/mapping/functionProcess.jsp");
             }
        
          
    %>
  
  </body>
</html>
