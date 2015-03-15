<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@ page import="business.FSM.MappingPhase" %>
<%@ page import="hibernate.FSM.FsmEvent" %>
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
       /*获取从页面event.jsp传来peerCompId和eventId*/
      Integer peerCompId = new Integer(request.getParameter("peerCompId"));
      Integer eventId = new Integer(request.getParameter("eventId"));
      
      /*从数据库中把id为eventId的事件取出*/
      MappingPhase mp = new MappingPhase(); //业务层，对应于COSMIC方法的策略阶段
      FsmEvent event = (FsmEvent)mp.getEventById(eventId);    
      %>
  <form action="/fsmch/FSM/editEvent.do">
      <table>
         <tr>
            <td width="15%">事件名</td>
            <td> <input type="text" name="eventName" value="<%=event.getEventName()%>"/> </td>        
         </tr>
        <tr>
            <td width="15%">事件描述</td> 
            <td><input type="text" name="eventDesp" value="<%=event.getEventDesp() %>"/>   </td>     
         </tr>
        
        
         <tr>
            <td> <input type="submit" name="submit" value="修改事件"/> </td>        
         </tr>
         
      </table>
      <input type="hidden" name="id" value="<%=eventId%>"/>  
      <input type="hidden" name="peerCompId" value="<%=peerCompId%>"/> 
    </form>
  </body>
</html>
