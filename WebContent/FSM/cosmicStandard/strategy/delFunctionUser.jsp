<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@ page import="business.FSM.StrategyPhase" %>
<%@ page import="hibernate.FSM.FsmUser" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'delFunctionUser.jsp' starting page</title>
    
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
      Integer productId = new Integer(request.getParameter("productId"));//获取从页面functionUser.jsp传来productId,用于转跳回到functionUser.jsp
      Integer userId = new Integer(request.getParameter("userId"));//获取从页面functionUser.jsp传来userId,用于删除操作
      StrategyPhase sp = new StrategyPhase();  //业务层函数，封装了功能用户进行的增删改查等操作
      boolean result = sp.delFunctionUser(userId);
      if(result==true){

          response.sendRedirect("/fsmch/FSM/cosmicStandard/strategy/functionUser.jsp?productId="+productId);
      }
   %>
  </body>
</html>
