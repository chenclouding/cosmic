<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@ page import="business.FSM.StrategyPhase" %>
<%@ page import="business.FSM.MappingPhase" %>
<%@ page import="hibernate.FSM.FsmLayer" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'delLayer.jsp' starting page</title>
    
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
      Integer productId = new Integer(request.getParameter("productId"));//获取从页面layer.jsp传来productId,用于转跳回到layer.jsp
      Integer layerId = new Integer(request.getParameter("layerId"));//获取从页面layer.jsp传来layerId,用于删除操作
      StrategyPhase sp = new StrategyPhase();  //业务层函数，封装了层次进行的增删改查等操作
      MappingPhase mp = new MappingPhase();
      FsmLayer fl = (FsmLayer)sp.getLayerById(layerId);// 按layerId从数据库中取出层次
      List peerCompList = sp.getPeerComponentByLayerId(layerId);      
       if(peerCompList!=null && peerCompList.size()!=0){ //若层次包含对等组件则不能被删除
           response.sendRedirect("/fsmch/FSM/cosmicStandard/strategy/alertDelLayer.jsp?productId="+productId); 
        }else{ //可以安全删除
           sp.delLayer(layerId);
           response.sendRedirect("/fsmch/FSM/cosmicStandard/strategy/layer.jsp?productId="+productId);
        }       
   %>
  </body>
</html>
