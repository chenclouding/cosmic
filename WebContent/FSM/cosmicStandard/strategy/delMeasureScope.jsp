<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@ page import="business.FSM.StrategyPhase" %>
<%@ page import="business.FSM.MappingPhase" %>
<%@ page import="hibernate.FSM.FsmMeasureScope" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'delMeasureScope.jsp' starting page</title>
    
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
      Integer productId = new Integer(request.getParameter("productId"));//��ȡ��ҳ��measureScope.jsp����productId,����ת���ص�measureScope.jsp
      Integer measScopeId = new Integer(request.getParameter("measScopeId"));//��ȡ��ҳ��measureScope.jsp����measScopeId,����ɾ������
      StrategyPhase sp = new StrategyPhase();  //ҵ��㺯������װ�˶�����Χ���е���ɾ�Ĳ�Ȳ���
      FsmMeasureScope fms = (FsmMeasureScope)sp.getMeasureScopeById(measScopeId);// ��measScopeId�����ݿ���ȡ��������Χ
      sp.delMeasureScope(measScopeId);
           response.sendRedirect("/fsmch/FSM/cosmicStandard/strategy/measureScope.jsp?productId="+productId);
               
   %>
  </body>
</html>
