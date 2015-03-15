<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'funcProsMethord.jsp' starting page</title>
    
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
		          <td>功能流程</td> 
		          <td>1:一个功能流程是功能性用户需求集合的一个基本成分，它包括一组唯一的、内聚的（cohesive）、可独立执行的数据移动。<br>
		              2:它由来自功能用户的数据移动（Entry）触发，通知软件功能用户识别了一个触发事件。当执行了响应触发事件所需的任务后，该功能过程就结束了。<br>
		              3:全功能点规模估算就是在功能流程粒度级别上进行的。功能流程的识别原则是：一个功能流程完全属于且仅属于某一层的一个软件，一个功能过程至少包含两个数据移动，一个Entry，一个Exit或Write。
		          </td>
		          
	         </tr>  	     
	      <tr>
		          <td>确定功能流程过程</td> 
		          <td>一个功能关系者首先感知到一个触发事件，然后触发一个功能流程。<br>
		                通常来说，触发输入是一个确定的、无歧义的信息，它通知软件一个触发事件已经被功能关系者确定。<br>
		                同时，它也常常包含了与事件相关的兴趣对象。在触发输入被接受后，功能流程可能需要接受并处理描述其他兴趣对象的输入。<br>
		                而对于非正确的输入，功能流程同样需要知道如何验证以及如何进行响应。
		          </td>
		          
	         </tr>  
         
           </table>        
  <!-- 判断返回mappingPhase.jsp页面还是functionProcess.jsp页面 -->
      <%if(back.equals("mapping")){ %>
     <a href="/fsmch/FSM/cosmicStandard/mapping/mappingPhase.jsp?productId=<%=productId%>&layerId=<%=layerId%>&peerCompId=<%=peerCompId%>">返回</a>
     <%} else{%>
       <a  href="javascript:window.name=='contentFrame'?window.location='/fsmch/FSM/cosmicStandard/mapping/functionProcess.jsp':parent.location.href='/fsmch/FSM/cosmicStandard/mapping/functionProcess.jsp'">返回</a>
     <% }%>
  </body>
</html>
