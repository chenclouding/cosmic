<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@ page import="business.FSM.MappingPhase" %>
<%@ page import="hibernate.FSM.FsmEvent" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'delEvent.jsp' starting page</title>
    
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
      
      Integer eventId = new Integer(request.getParameter("eventId"));//��ȡ��ҳ��event.jsp����eventId
      MappingPhase mp = new MappingPhase();  //ҵ��㺯������װ�˶Ե�������е���ɾ�Ĳ�Ȳ���
      boolean result = mp.delEvent(eventId);
      if(result==true){

          response.sendRedirect("/fsmch/FSM/cosmicStandard/mapping/event.jsp");
      }
   %>
  </body>
</html>
