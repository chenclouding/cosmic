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
    
    
    <title>layerDescription.jsp</title>
    
    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">    
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
    <meta http-equiv="description" content="This is my page">
    
    <link rel="stylesheet" type="text/css" href="/gcgl/images/screen.css">
  </head>
  
  <body>
  <%
  
  String back = "layer";
  //获取从页面layer.jsp传来的软件layerId和productId 
  Integer layerId = new Integer(request.getParameter("layerId"));
  Integer productId = new Integer(request.getParameter("productId"));
  %> 
  
  <A href="#" onclick="window.contentframe.location='/gcgl/FSM/cosmicStandard/strategy/layerBasicInfo.jsp?layerId=<%=layerId%>&productId=<%=productId%>';">基本信息</A>|
  <A href="#" onclick="window.contentframe.location='/gcgl/FSM/cosmicStandard/strategy/layerMethord.jsp?back=<%=back%>&productId=<%=productId%>';">方法介绍</A>|
  <A href="#" onclick="window.contentframe.location='/gcgl/FSM/cosmicStandard/strategy/layerMeasureReport.jsp?layerId=<%=layerId%>&productId=<%=productId%>';">度量报告</A>
  <HR>
  
     <iframe name="contentframe" src="" width="100%" height="500" frameborder="0" scrolling="auto"/>
  
  </body>
</html>