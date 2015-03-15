<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@ page import="business.FSM.MappingPhase" %>
<%@ page import="hibernate.FSM.FsmFunctionProcess" %>
<%@ page import="hibernate.FSM.FsmEvent" %>
<%@ page import="hibernate.FSM.FsmInterestObject" %>
<jsp:useBean id="projectMeasureBean" scope="session" class="javaBeans.fsm.ProjectMeasureBean"/> 
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'mappingPhase.jsp' starting page</title>
    
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
       String back="mapping"; 
      /*peerCompId的作用是映射阶段的主角，productId和layerId的作用是存入sessionBean*/ 
      Integer productId = Integer.valueOf(request.getParameter("productId"));//获取从页面mapping.jsp传来的软件productId 
      Integer layerId = new Integer(request.getParameter("layerId"));        //获取从页面mapping.jsp传来的软件layerId 
      Integer peerCompId = new Integer(request.getParameter("peerCompId"));  //获取从页面mapping.jsp传来的软件peerCompId 
      //根据对等组件id取出功能流程,事件和兴趣对象 
      MappingPhase mp = new MappingPhase(); 
      List ffpList = mp.getFunctionProcessByPeerCompId(peerCompId); 
      List eList = mp.getEventByPeerCompId(peerCompId); 
      List ioList = mp.getInterestObjectByPeerCompId(peerCompId); 
     // FsmFunctionProcess ffp = 
    %>
  
     <!--给projectMeasureBean的productId，layerId，peerCompId赋值，目的是在session范围内使用  -->
     <jsp:setProperty name="projectMeasureBean" property="productId" value="<%=productId%>" />
     <jsp:setProperty name="projectMeasureBean" property="layerId" value="<%=layerId%>" />
     <jsp:setProperty name="projectMeasureBean" property="peerCompId" value="<%=peerCompId%>" />
      
      <table>
	       <tr> 
	            <td>活动</td>	           
	            <td>概念介绍</td>
	            <td>添加</td>       
	       </tr> 
           <tr> 
	            <td>添加功能流程</td>	            
	            <td > <a href="/fsmch/FSM/cosmicStandard/mapping/funcProsMethord.jsp?back=<%=back%>&productId=<%=productId%>&layerId=<%=layerId%>&peerCompId=<%=peerCompId%>"><IMG src="/fsmch/images/btncheck.gif" alt="功能流程方法介绍" border="0" /></a> </td>
	            <td>在左侧目录添加 </td> 
	       </tr>
	       <tr> 
	            <td>添加兴趣对象</td>
	            <td > <a href="/fsmch/FSM/cosmicStandard/mapping/interestObjMethord.jsp?back=<%=back%>&productId=<%=productId%>&layerId=<%=layerId%>&peerCompId=<%=peerCompId%>"><IMG src="/fsmch/images/btncheck.gif" alt="兴趣对象方法介绍" border="0" /></a> </td>
	             <td>在左侧目录添加</td> 
	       </tr>
	       <tr> 
	            <td>添加数据组</td>
	            <td > <a href=""><IMG src="/fsmch/images/btncheck.gif" alt="数据组方法介绍" border="0" /></a> </td>
	             <td>在左侧目录添加</td> 
	       </tr>		
           <tr> 
	            <td>添加事件</td>    
	            <td > <a href="/fsmch/FSM/cosmicStandard/mapping/eventMethord.jsp?back=<%=back%>&productId=<%=productId%>&layerId=<%=layerId%>&peerCompId=<%=peerCompId%>"><IMG src="/fsmch/images/btncheck.gif" alt="事件方法介绍" border="0" /></a> </td>
	            <td>在左侧目录添加 </td>
	       </tr>
	              	       
	       <tr> 
	            <td>建立功能流程与兴趣对象关联</td>	 
	            <td ><IMG src="/fsmch/images/btncheck.gif"  border="0" /></td>
	            <td>在左侧目录添加 </td> 
	       </tr>
	       <tr> 
	            <td>建立功能流程与事件关联</td>
	            <td ><IMG src="/fsmch/images/btncheck.gif"  border="0" /></td>
	             <td>在左侧目录添加 </td>
	       </tr>
	       <tr> 
	            <td>建立功能流程与功能用户关联</td>	    
	            <td ><IMG src="/fsmch/images/btncheck.gif" border="0" /></td>
	             <td>在左侧目录添加</td>
	       </tr>
	   </table>
    
  </body>
</html>
