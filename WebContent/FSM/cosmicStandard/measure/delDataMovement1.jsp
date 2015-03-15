<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@ page import="business.FSM.MeasurePhase" %>
<%@ page import="hibernate.FSM.FsmDataMovement" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'delDataMovement1.jsp' starting page</title>
    
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
      Integer funcProsId = new Integer(request.getParameter("funcProsId"));//获取从页面dataMovement.jsp传来funcProsId,用于转跳回到dataMovement.jsp
      Integer dataMoveId = new Integer(request.getParameter("dataMoveId"));//获取从页dataMovement.jsp传来dataMoveId,用于删除操作
      MeasurePhase mp = new MeasurePhase();  //业务层函数，封装了数据移动进行的增删改查等操作
      boolean result = mp.delDataMovement(dataMoveId);
      if(result==true){

          response.sendRedirect("/fsmch/FSM/cosmicStandard/measure/editDataMoveOfFuncPros.jsp?funcProsId="+funcProsId);
      }
   %>
  </body>
</html>
