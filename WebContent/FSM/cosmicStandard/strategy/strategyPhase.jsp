<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<jsp:useBean id="projectMeasureBean" scope="session" class="javaBeans.fsm.ProjectMeasureBean"/> 
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'strategyPhase.jsp' starting page</title>
    
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
      String back = "strategyPhase";
      Integer productId = Integer.valueOf(request.getParameter("productId"));//获取从页面strategy.jsp传来的软件productId 
     
    %>
    
    <!--给projectMeasureBean的productId赋值，目的是在session范围内使用  -->
     <jsp:setProperty name="projectMeasureBean" property="productId" value="<%=productId%>" />
    <table>
	       <tr> 
	            <td>活动</td>
	            <td>概念介绍</td>
	            <td>添加</td>       
	       </tr> 
	       <tr> 
	            <td>添加功能用户</td>
	            <td > <a href="/fsmch/FSM/cosmicStandard/strategy/userMethord.jsp?back=<%=back%>&productId=<%=productId%>"><IMG src="/fsmch/images/btncheck.gif" alt="功能用户方法介绍" border="0" /></a> </td>
	            <td>在左侧目录添加 </td>
	       </tr>
           <tr> 
	            <td>添加估算目的</td>
	            <td > <a href="/fsmch/FSM/cosmicStandard/strategy/measurePurposeMethord.jsp?back=<%=back%>&productId=<%=productId%>"><IMG src="/fsmch/images/btncheck.gif" alt="度量目的方法介绍" border="0" /></a> </td>
	            <td>在左侧目录添加 </td>
	           
	       </tr>
           <tr> 
	            <td>添加估算范围</td>
	            <td > <a href="/fsmch/FSM/cosmicStandard/strategy/measureScopeMethord.jsp?back=<%=back%>&productId=<%=productId%>"><IMG src="/fsmch/images/btncheck.gif" alt="度量范围方法介绍" border="0" /></a> </td>
	            <td>在左侧目录添加 </td>
	       </tr>
	       
	       <tr> 
	            <td>添加层次</td>
	            <td > <a href="/fsmch/FSM/cosmicStandard/strategy/layerMethord.jsp?back=<%=back%>&productId=<%=productId%>"><IMG src="/fsmch/images/btncheck.gif" alt="层次方法介绍" border="0" /></a> </td>
	           <td>在左侧目录添加 </td>
	       </tr>
	       <tr> 
	            <td>添加对等组件</td>
	            <td > <a href="/fsmch/FSM/cosmicStandard/strategy/peerCompMethord.jsp?back=<%=back%>&productId=<%=productId%>&layerId=1&fatherId=0"><IMG src="/fsmch/images/btncheck.gif" alt="层次方法介绍" border="0" /></a> </td>
	           <td>在左侧目录添加 </td>
	       </tr>
	      	      
	    </table>	   
     

  </body>
</html>
