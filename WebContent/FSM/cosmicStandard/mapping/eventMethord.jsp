<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'eventMethord.jsp' starting page</title>
    
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
      //获取从mappingPhase.jsp或者functionProcessDescription.jsp传来的back
     String back=new String(request.getParameter("back"));
     String productId=new String(request.getParameter("productId"));
     String layerId=new String(request.getParameter("layerId"));
     String peerCompId=new String(request.getParameter("peerCompId"));
   %>
	
   <h1> 方法介绍</h1>
	    <table>
	      <tr> 
	          <th>名称</th>
	          <th>方法介绍</th>	          
	      </tr>
	      <tr>
		          <td>事件</td> 
		          <td>1:一个事件导致软件的功能用户发起一个或多个功能流程。时钟和时间事件可以作为触发事件。<br>
		              2:一个事件（发生的某事）导致软件的功能用户发起（触发）一个或者多个功能过程。而且在功能用户需求集合中，
		                  导致功能用户触发一个功能过程的事件：在功能用户需求集合中不可再分并且要么发生，要么不发生。<br>
		              3:下图描述了触发事件、功能用户和触发功能过程的Entry数据移动之间的关系。对该图的解释是：触发事件被功能用户检测到，功能用户触发一个功能过程。
		          </td>		         		          
	         </tr>  	     
	      <tr>
	         <td>&nbsp&nbsp&nbsp</td> 
		     <td><img src="/fsmch/FSM/cosmicStandard/image/event.gif"/></td> 
		          
		          
	         </tr>  
         
           </table>        
  <!-- 判断返回mappingPhase.jsp页面还是event.jsp页面 -->
      <%if(back.equals("mapping")){ %>
     <a href="/fsmch/FSM/cosmicStandard/mapping/mappingPhase.jsp?productId=<%=productId%>&layerId=<%=layerId%>&peerCompId=<%=peerCompId%>">返回</a>
     <%} else{%>
       <a  href="javascript:window.name=='contentFrame'?window.location='/fsmch/FSM/cosmicStandard/mapping/event.jsp':parent.location.href='/fsmch/FSM/cosmicStandard/mapping/event.jsp'">返回</a>
     <% }%>
  </body>
</html>
