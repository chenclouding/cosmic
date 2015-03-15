<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@ page import="business.FSM.StrategyPhase" %>
<%@ page import="hibernate.FSM.FsmPeerComponent" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'getPeerComponentByLayer.jsp' starting page</title>
    
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
       Integer layerId = new Integer(request.getParameter("layerId"));//获取从页面addPeerComponent.jsp传来的软件productId
       
       /*从数据库中把软件的层次信息取出*/
        StrategyPhase sp = new StrategyPhase(); //业务层，对应于COSMIC方法的策略阶段
        Iterator it = sp.getPeerComponentByLayerId(layerId).iterator();
       
  %>

	 <form  action="/fsmch/FSM/cosmicStandard/mapping/mappingPhase.jsp"  method="post" target="peerCompFrame" >
	   <table>
        <tr>
            <td>
                 请选择对等组件
		      	<select name="peerCompId" style="width:160px">
		      	 <%
		      	    while(it.hasNext()){
		      	        FsmPeerComponent fp = (FsmPeerComponent)it.next();%>
		      	        <option value="<%=fp.getId()%>"><%=fp.getPeerCompName()%></option>
		      	  <%}%>
			 	   
			    </select>
			</td>
		  </tr>
		</table> 
	   <input type="submit" name="submit" value="进入映射阶段"/>     
    </form>
		   
    <iFrame name="peerCompFrame" frameborder=""0 height="800px" width="100%" scrolling="auto"/>
  </body>
</html>
