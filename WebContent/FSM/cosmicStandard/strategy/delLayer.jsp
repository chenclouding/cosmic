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
      Integer productId = new Integer(request.getParameter("productId"));//��ȡ��ҳ��layer.jsp����productId,����ת���ص�layer.jsp
      Integer layerId = new Integer(request.getParameter("layerId"));//��ȡ��ҳ��layer.jsp����layerId,����ɾ������
      StrategyPhase sp = new StrategyPhase();  //ҵ��㺯������װ�˲�ν��е���ɾ�Ĳ�Ȳ���
      MappingPhase mp = new MappingPhase();
      FsmLayer fl = (FsmLayer)sp.getLayerById(layerId);// ��layerId�����ݿ���ȡ�����
      List peerCompList = sp.getPeerComponentByLayerId(layerId);      
       if(peerCompList!=null && peerCompList.size()!=0){ //����ΰ����Ե�������ܱ�ɾ��
           response.sendRedirect("/fsmch/FSM/cosmicStandard/strategy/alertDelLayer.jsp?productId="+productId); 
        }else{ //���԰�ȫɾ��
           sp.delLayer(layerId);
           response.sendRedirect("/fsmch/FSM/cosmicStandard/strategy/layer.jsp?productId="+productId);
        }       
   %>
  </body>
</html>
