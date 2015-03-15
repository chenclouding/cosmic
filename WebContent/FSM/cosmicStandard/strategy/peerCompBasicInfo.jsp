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
    
    <title>My JSP 'peerCompBasicInfo.jsp' starting page</title>
    
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
  //获取从peerComponentDescription.jsp传来的back、peerCompId、layerId、productId
   String back = new String(request.getParameter("back"));
   Integer peerCompId = new Integer(request.getParameter("peerCompId"));
   Integer layerId = new Integer(request.getParameter("layerId"));
   Integer productId = new Integer(request.getParameter("productId"));
   Integer fatherId = new Integer(request.getParameter("fatherId"));
   //按照各自ID将名称取出来   
   StrategyPhase sp = new StrategyPhase();   
   FsmPeerComponent fpc =(FsmPeerComponent)sp.getPeerComponentById(peerCompId);
   Integer peerCompType = fpc.getCompType();
	         String compTypeName = null;
	         switch (peerCompType)  
	         {
		         case 0:compTypeName = "组合组件";break;
		         case 1:compTypeName = "原子组件";break;		         
		         default:compTypeName = "类型错误";
	         }
     
%>

  
    <table>
      
       <tr> 
          <td width="15%">对等组件名称:</td> <td><%=fpc.getPeerCompName()%></td>
      </tr>
      <tr> 
          <td width="15%">对等组件描述:</td> <td><%=fpc.getPeerCompDesp()%></td>
      </tr>
      <tr> 
          <td width="15%">对等组件类型:</td> <td><%=compTypeName%></td>
      </tr>
      
    </table>
    <hr>
     <!-- 判断返回peerComponent.jsp页面还是addSubPeerComponent.jsp页面 -->
      <%if(back.equals("peerComp")){ %>
     <a href="javascript:window.name=='contentFrame'?window.location='/fsmch/FSM/cosmicStandard/strategy/peerComponent.jsp?productId=<%=productId%>&layerId=<%=layerId %>':parent.location.href='/fsmch/FSM/cosmicStandard/strategy/peerComponent.jsp?productId=<%=productId%>&layerId=<%=layerId %>'">返回</a>
     <%} else{%>
      <a href="javascript:window.name=='contentFrame'?window.location='/fsmch/FSM/cosmicStandard/strategy/addSubPeerComponent.jsp?productId=<%=productId%>&layerId=<%=layerId %>&fatherId=<%=fatherId %>':parent.location.href='/fsmch/FSM/cosmicStandard/strategy/addSubPeerComponent.jsp?productId=<%=productId%>&layerId=<%=layerId %>&fatherId=<%=fatherId %>'">返回</a>
     <% }%>    
   
  </body>
</html>
