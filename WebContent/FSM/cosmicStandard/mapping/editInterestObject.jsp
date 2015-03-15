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
      Integer interestObjectId = new Integer(request.getParameter("interestObjId"));
      
      /*Id from the database to remove the event for the eventId*/
      MappingPhase mp = new MappingPhase(); //Business layer, which corresponds to the strategy phase of COSMIC method
      FsmInterestObject interestObject = (FsmInterestObject)mp.getInterestObjectById(interestObjectId);    
      %>
  <form action="/fsmch/FSM/cosmicStandard/mapping/editInterestObject2.jsp"> 
      <table>
         <tr>
            <td width="15%">兴趣对象名称</td>
            <td> <input type="text" name="interestObjName" value="<%=interestObject.getInterestObjName() %>"/> </td>        
         </tr>
        <tr>
            <td width="15%">兴趣对像描述</td> 
            <td><input type="text" name="interestObjDesp" value="<%=interestObject.getInterestObjDesp() %>"/>   </td>     
         </tr>
        
        
         <tr>
            <td> <input type="submit" name="submit" value="Modify Interest Object"/> </td>        
         </tr>
         
      </table>
      <input type="hidden" name="interestObjectId" value="<%=interestObjectId%>"/>  
      <input type="hidden" name="peerCompId" value="<%=peerCompId%>"/> 
    </form>
  </body>
</html>
