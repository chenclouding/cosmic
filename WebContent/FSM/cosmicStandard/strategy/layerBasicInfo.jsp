<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@ page import="business.FSM.ProductMeasureBusiness" %>
<%@ page import="business.FSM.StrategyPhase" %>
<%@ page import="business.FSM.MappingPhase" %>
<%@ page import="hibernate.FSM.FsmProduct" %>
<%@ page import="hibernate.FSM.FsmLayer" %>
<%@ page import="hibernate.FSM.FsmPeerComponent" %>

<%@ page import="hibernate.FSM.FsmFunctionProcess" %>
<jsp:useBean id="projectMeasureBean" scope="session" class="javaBeans.fsm.ProjectMeasureBean"/> 

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'layerBasicInfo.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
 <link rel="stylesheet" type="text/css" href="/fsmch/images/screen.css" >
  </head>
  
  <body>
	
 <% 
 //获取从页面layerDescription.jsp传来的软件productId和layerId
   Integer productId = new Integer(request.getParameter("productId"));
   Integer layerId = new Integer(request.getParameter("layerId"));
   //按照各自ID将名称取出来   
   StrategyPhase sp = new StrategyPhase();   
   FsmLayer fl =(FsmLayer)sp.getLayerById(layerId);	        
%>
  
    <table>     
       <tr> 
          <td width="15%">层次名称:</td> <td><%=fl.getLayerName()%></td>
      </tr>
      <tr> 
          <td width="15%">层次描述:</td> <td><%=fl.getLayerDesp()%></td>
      </tr>     
      
    </table>
    <hr>    
    <a  href="javascript:window.name=='contentFrame'?window.location='/fsmch/FSM/cosmicStandard/strategy/layer.jsp?productId=<%=productId%>':parent.location.href='/fsmch/FSM/cosmicStandard/strategy/layer.jsp?productId=<%=productId%>'">返回</a>
  </body>
</html>
