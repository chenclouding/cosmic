<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@ page import="business.FSM.StrategyPhase" %>
<%@ page import="hibernate.FSM.FsmLayer" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'getLayersByProduct.jsp' starting page</title>
    
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
       Integer productId = new Integer(request.getParameter("productId"));//获取从页面addPeerComponent.jsp传来的软件productId
       
       /*从数据库中把软件的层次信息取出*/
       StrategyPhase sp = new StrategyPhase(); //业务层，对应于COSMIC方法的策略阶段
        Iterator it = sp.getLayerByProductId(productId).iterator();
       
       FsmLayer layer = new FsmLayer();//定义实体Bean
  %>
   <table>
     <tr>
      <td>
        请选择层次
	   <form  action="/fsmch/FSM/cosmicStandard/mapping/getPeerComponentByLayer.jsp"  method="post" target="peerCompFrame" >
		      	<select name="layerId" style="width:160px">
		      	 <%
		      	    while(it.hasNext()){
		      	        FsmLayer fp = (FsmLayer)it.next();%>
		      	        <option value="<%=fp.getId()%>"><%=fp.getLayerName()%></option>
		      	  <%}%>
			 	   
			    </select>
			     <input type="submit" name="submit" value="submit"/>
	    </form>
		    
		</td>
	  </tr>
	</table>   
    <iFrame name="peerCompFrame" frameborder=""0 height="800px" width="100%" scrolling="auto"/>
  </body>
</html>
