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
    
    <title>My JSP 'editEvent.jsp' starting page</title>
    
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
       /*Came from the page to get peerCompId and eventId event.jsp*/
      Integer peerCompId = new Integer(request.getParameter("peerCompId"));
      Integer interestObjectId = new Integer(request.getParameter("interestObjectId"));
      
      /*Id from the database to remove the event for the eventId*/
      MappingPhase mp = new MappingPhase(); //Business layer, which corresponds to the strategy phase of COSMIC method
      FsmInterestObject interestObject = (FsmInterestObject)mp.getInterestObjectById(interestObjectId);   
      FsmInterestObject fio = new FsmInterestObject();          //定义实体bean
		
		/*将id为interestObjId的实体bean查找出来*/
		fio = (FsmInterestObject)mp.getInterestObjectById(interestObjectId); 
		String interestObjName = null;
		String interestObjDesp = null;	
		interestObjName = new String(request.getParameter("interestObjName").getBytes("ISO-8859-1"),"gb2312");
		interestObjDesp = new String(request.getParameter("interestObjDesp").getBytes("ISO-8859-1"),"gb2312");
		fio.setPeerCompId(peerCompId);
		fio.setInterestObjName(interestObjName);
		fio.setInterestObjDesp(interestObjDesp);
		boolean result = mp.updateInterestObject(fio);
		response.sendRedirect("/fsmch/FSM/cosmicStandard/mapping/interestObject.jsp");
	
      %>

  </body>
</html>
