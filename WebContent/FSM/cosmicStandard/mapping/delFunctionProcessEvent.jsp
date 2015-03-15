<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@ page import="business.FSM.MappingPhase" %>
<%@ page import="hibernate.FSM.FsmFunctionProcessEvent" %>
<%@ page import="hibernate.FSM.FsmFunctionProcess" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'delFunctionProcessEvent.jsp' starting page</title>
    
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
   
      Integer funcProsId = new Integer(request.getParameter("funcProsId"));//获取从页面functionProcessEvent.jsp传来funcProsId
      MappingPhase mp = new MappingPhase();  //业务层函数，封装了兴趣对象进行的增删改查等操作
      FsmFunctionProcess ffp = (FsmFunctionProcess)mp.getFunctionProcessById(funcProsId); //定义实体bean
      int ms = ffp.getMeasureStatus(); //获取功能流程的度量状态     
      List  funcProsEventList = mp.getFunctionProcessEventByFuncProsId(funcProsId);     
      if(ms!=0){ //若该功能流程已经被部分度量或者全部度量，则不能被删除此关联
           response.sendRedirect("/fsmch/FSM/cosmicStandard/mapping/alertDelFunctionProcessInterestObject.jsp"); 
        }else{ 
           ffp.setMappingEventStatus(0); //更改功能流程的MappingEventStatus为0，表示已经取消功能流程-事件的映射
           mp.updateFunctionProcess(ffp);
           boolean result = mp.delFunctionProcessEventByFuncProsId(funcProsId);
          if(result==true){
          response.sendRedirect("/fsmch/FSM/cosmicStandard/mapping/functionProcessEvent.jsp");
             }
        }
          
    %>
  
  </body>
</html>
