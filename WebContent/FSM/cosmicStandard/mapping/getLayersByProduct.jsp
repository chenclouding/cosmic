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
       Integer productId = new Integer(request.getParameter("productId"));//��ȡ��ҳ��addPeerComponent.jsp���������productId
       
       /*�����ݿ��а�����Ĳ����Ϣȡ��*/
       StrategyPhase sp = new StrategyPhase(); //ҵ��㣬��Ӧ��COSMIC�����Ĳ��Խ׶�
        Iterator it = sp.getLayerByProductId(productId).iterator();
       
       FsmLayer layer = new FsmLayer();//����ʵ��Bean
  %>
   <table>
     <tr>
      <td>
        ��ѡ����
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
