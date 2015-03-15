<%@ page language="java" pageEncoding="gb2312" import="java.util.*"%>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-bean" prefix="bean" %>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-html" prefix="html" %>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-logic" prefix="logic" %>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-tiles" prefix="tiles" %>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-template" prefix="template" %>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-nested" prefix="nested" %>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    
    <title>dataGroupDescription.jsp</title>
    
    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">    
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
    <meta http-equiv="description" content="This is my page">
    
    <link rel="stylesheet" type="text/css" href="/fsmch/images/screen.css">
  </head>
  
  <body>
  <%
   
   Integer dataGroupId = new Integer(request.getParameter("dataGroupId"));
   session.setAttribute("dataGroupId",dataGroupId); 
   Integer interestObjId = new Integer(request.getParameter("interestObjId"));
   String back="dataGroup";
  %> 
  
  <A href="#" onclick="window.contentframe.location='/fsmch/FSM/cosmicStandard/mapping/dataGroupBasicInfo.jsp?interestObjId=<%=interestObjId %>';">基本信息</A>|
  <A href="#" onclick="window.contentframe.location='/fsmch/FSM/cosmicStandard/mapping/dataGroupMethord.jsp?interestObjId=<%=interestObjId %>&back=<%=back%>';">方法介绍</A>|
  
  <HR>
  
     <iframe name="contentframe" src="" width="100%" height="500" frameborder="0" scrolling="auto"/>
  
  </body>
</html>