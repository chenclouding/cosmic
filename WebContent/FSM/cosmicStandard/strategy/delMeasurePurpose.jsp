<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@ page import="business.FSM.StrategyPhase" %>
<%@ page import="business.FSM.MappingPhase" %>
<%@ page import="hibernate.FSM.FsmMeasurePurpose" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'delMeasurePurpose.jsp' starting page</title>
    
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
      Integer productId = new Integer(request.getParameter("productId"));//��ȡ��ҳ��measurePurpose.jsp����productId,����ת���ص�measurePurpose.jsp
      Integer measPurId = new Integer(request.getParameter("measPurId"));//��ȡ��ҳ��measurePurpose.jsp����measPurId,����ɾ������
      StrategyPhase sp = new StrategyPhase();  //ҵ��㺯������װ�˶���Ŀ�Ľ��е���ɾ�Ĳ�Ȳ���
      FsmMeasurePurpose fmp = (FsmMeasurePurpose)sp.getMeasurePurposeById(measPurId);// ��measPurId�����ݿ���ȡ������Ŀ��
      sp.delMeasurePurpose(measPurId);
           response.sendRedirect("/fsmch/FSM/cosmicStandard/strategy/measurePurpose.jsp?productId="+productId);
               
   %>
  </body>
</html>
