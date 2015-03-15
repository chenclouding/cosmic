<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@ page import="business.FSM.ProductMeasureBusiness" %>
<%@ page import="business.FSM.StrategyPhase" %>
<%@ page import="business.FSM.MappingPhase" %>
<%@ page import="hibernate.FSM.FsmProduct" %>
<%@ page import="hibernate.FSM.FsmLayer" %>
<%@ page import="hibernate.FSM.FsmMeasureScope" %>

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
    
    <title>My JSP 'measureScopeBasicInfo.jsp' starting page</title>
    
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
   
   Integer measScopeId = new Integer(request.getParameter("measScopeId"));//获取从measureScopeDescription.jsp传来的measScopeId
   Integer productId = new Integer(request.getParameter("productId"));
   //按照各自ID将名称取出来   
   StrategyPhase sp = new StrategyPhase();   
   FsmMeasureScope fms =(FsmMeasureScope)sp.getMeasureScopeById(measScopeId);
  
%>

  
    <table>
      
       <tr> 
          <td width="15%">度量范围名称:</td> <td><%=fms.getMeasureScopeName()%></td>
      </tr>
     
      <tr> 
          <td width="15%">度量范围描述:</td> <td><%=fms.getMeasureScopeDesp()%></td>
      </tr>
      
      
    </table>
    <hr>    
     <a  href="javascript:window.name=='contentFrame'?window.location='/fsmch/FSM/cosmicStandard/strategy/measureScope.jsp?productId=<%=productId %>':parent.location.href='/fsmch/FSM/cosmicStandard/strategy/measureScope.jsp?productId=<%=productId %>'">返回</a>
  </body>
</html>
