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
       Integer layerId = new Integer(request.getParameter("layerId"));//��ȡ��ҳ��addPeerComponent.jsp���������productId
       
       /*�����ݿ��а�����Ĳ����Ϣȡ��*/
        StrategyPhase sp = new StrategyPhase(); //ҵ��㣬��Ӧ��COSMIC�����Ĳ��Խ׶�
        Iterator it = sp.getPeerComponentByLayerId(layerId).iterator();
       
  %>

	 <form  action="/fsmch/FSM/cosmicStandard/mapping/mappingPhase.jsp"  method="post" target="peerCompFrame" >
	   <table>
        <tr>
            <td>
                 ��ѡ��Ե����
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
	   <input type="submit" name="submit" value="����ӳ��׶�"/>     
    </form>
		   
    <iFrame name="peerCompFrame" frameborder=""0 height="800px" width="100%" scrolling="auto"/>
  </body>
</html>
