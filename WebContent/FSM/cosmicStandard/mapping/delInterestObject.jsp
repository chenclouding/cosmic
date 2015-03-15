<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@ page import="business.FSM.MappingPhase" %>
<%@ page import="hibernate.FSM.FsmInterestObject" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'delInterestObject.jsp' starting page</title>
    
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
      Integer peerCompId = new Integer(request.getParameter("peerCompId"));//获取从页面interestObject.jsp传来peerCompId
      Integer interestObjId =new Integer(request.getParameter("interestObjId"));//获取从页面interestObject.jsp传来interestObjId
      MappingPhase mp = new MappingPhase();  //业务层函数，封装了兴趣对象进行的增删改查等操作
      List  funcProsIOList = mp.getFunctionProcessInterestObjectByInterestObjId(interestObjId);     
      if(funcProsIOList!=null && funcProsIOList.size()!=0){ //若该兴趣对象已经与功能流程相关联，则不能被删除
           response.sendRedirect("/fsmch/FSM/cosmicStandard/mapping/alertDelInterestObject.jsp"); 
        }else{ //可以安全删除
           mp.delInterestObject(interestObjId);
           response.sendRedirect("/fsmch/FSM/cosmicStandard/mapping/interestObject.jsp");
        }  
     
   %>
  </body>
</html>
