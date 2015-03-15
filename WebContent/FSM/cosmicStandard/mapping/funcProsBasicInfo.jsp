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
    
    <title>My JSP 'funcProsBasicInfo.jsp' starting page</title>
    
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
   //从projectMeasureBean获得productId，peerCompId，layerId
   Integer productId = projectMeasureBean.getProductId();
   Integer peerCompId = projectMeasureBean.getPeerCompId();
   Integer layerId = projectMeasureBean.getLayerId();
   Integer funcProsId = new Integer(request.getParameter("funcProsId"));
   //按照各自ID将名称取出来
   ProductMeasureBusiness pmb = new ProductMeasureBusiness();
   StrategyPhase sp = new StrategyPhase();
   MappingPhase mp = new MappingPhase();
   FsmFunctionProcess ffp =(FsmFunctionProcess) mp.getFunctionProcessById(funcProsId);
   String productName = ((FsmProduct)pmb.getProductById(productId)).getProductName();
   String peerCompName = ((FsmPeerComponent)sp.getPeerComponentById(peerCompId)).getPeerCompName();
   String layerName  = ((FsmLayer)sp.getLayerById(layerId)).getLayerName();   
%>

   <h1> 软件描述</h1>
    <table>
      <tr> 
          <td width="15%">所属软件:</td> <td><%=productName%></td>
      </tr>
       <tr> 
          <td width="15%">所属层次:</td> <td><%=layerName%></td>
      </tr>
       <tr> 
          <td width="15%">所属组件:</td> <td><%=peerCompName%></td>
      </tr>
       <tr> 
          <td width="15%">功能流程名称:</td> <td><%=ffp.getFuncProsName()%></td>
      </tr>
      <tr> 
          <td width="15%">功能流程描述:</td> <td><%=ffp.getFuncProsDesp()%></td>
      </tr>
      
    </table>
    <hr>    
   <a  href="javascript:window.name=='contentFrame'?window.location='/fsmch/FSM/cosmicStandard/mapping/functionProcess.jsp':parent.location.href='/fsmch/FSM/cosmicStandard/mapping/functionProcess.jsp'">返回</a> 
  </body>
</html>
