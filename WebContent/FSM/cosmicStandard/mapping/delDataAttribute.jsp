<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@ page import="business.FSM.MappingPhase" %>
<%@ page import="hibernate.FSM.FsmDataAttribute" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'delDataAttribute.jsp' starting page</title>
    
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
      
      Integer dataGroupId = new Integer(request.getParameter("dataGroupId"));//获取从页面dataAttribute.jsp传来的dataGroupId
      Integer dataAttriId =new Integer(request.getParameter("dataAttriId"));//获取从页面dataAttribute.jsp传来的dataAttriId
       Integer interestObjId = new Integer(request.getParameter("interestObjId")); 
      MappingPhase mp = new MappingPhase();  //业务层函数，封装了对等组件进行的增删改查等操作
      boolean result = mp.delDataAttribute(dataAttriId);
      if(result==true){

          response.sendRedirect("/fsmch/FSM/cosmicStandard/mapping/dataAttribute.jsp?dataGroupId="+dataGroupId+"&interestObjId="+interestObjId);
      }
   %>
  </body>
</html>
