<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'interestObjMethord.jsp' starting page</title>
    
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
     //获取从mappingPhase.jsp或者interestObjectDescription.jsp传来的back、productId、layerId、peerCompId
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
		          <td>兴趣对象</td> 
		          <td>1:一个兴趣对象就是从功能性用户需求的角度所识别出来的任何事物，可能是具体的事物，可能是功能用户世界的概念性对象或概念性对象的一部分，它是软件处理的和/或要为之存储数据<br>
		              2:它由多个数据组描述。每一个数据组都描述了兴趣对象的不同方面。<br>
		              3：COSMIC方法中使用“兴趣对象”是为了和面向对象方法学中的对象区别。
		             
		          </td>
		          
	         </tr>  	     
	        
         
           </table>        
  <!-- 判断返回mappingPhase.jsp页面还是interestObject.jsp页面 -->
      <%if(back.equals("mapping")){ %>
     <a href="/fsmch/FSM/cosmicStandard/mapping/mappingPhase.jsp?productId=<%=productId%>&layerId=<%=layerId%>&peerCompId=<%=peerCompId%>">返回</a>
     <%} else{%>
       <a  href="javascript:window.name=='contentFrame'?window.location='/fsmch/FSM/cosmicStandard/mapping/interestObject.jsp':parent.location.href='/fsmch/FSM/cosmicStandard/mapping/interestObject.jsp'">返回</a>
     <% }%>
  </body>
</html>
