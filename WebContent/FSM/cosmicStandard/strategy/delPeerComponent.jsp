<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@ page import="business.FSM.StrategyPhase" %>
<%@ page import="business.FSM.MappingPhase" %>
<%@ page import="hibernate.FSM.FsmPeerComponent" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'delPeerComponent.jsp' starting page</title>
    
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
      Integer layerId = new Integer(request.getParameter("layerId"));//��ȡ��ҳ��peerComponent.jsp����layerId,����ת���ص�peerComponent.jsp
      Integer peerCompId = new Integer(request.getParameter("peerCompId"));//��ȡ��ҳ��peerComponent.jsp����peerCompId,����ɾ������
      Integer productId = new Integer(request.getParameter("productId"));
      StrategyPhase sp = new StrategyPhase();  //ҵ��㺯������װ�˶Ե�������е���ɾ�Ĳ�Ȳ���
      MappingPhase mp = new MappingPhase();
      FsmPeerComponent fpc = (FsmPeerComponent)sp.getPeerComponentById(peerCompId);// ��peerCompId�����ݿ���ȡ���Ե����
      if(fpc.getCompType()==1){  //����������Ϊԭ��������ж����Ƿ������������
        List funcList = mp.getFunctionProcessByPeerCompId(peerCompId); 
        //System.out.println(funcList.isEmpty());
        if(funcList!=null && funcList.size()!=0){ //���Ե�������������������ܱ�ɾ��
           response.sendRedirect("/fsmch/FSM/cosmicStandard/strategy/alertDelPeerCompnent.jsp?layerId="+layerId+"&productId="+productId); 
        }else{ //���԰�ȫɾ��
           sp.delPeerComponent(peerCompId);
           response.sendRedirect("/fsmch/FSM/cosmicStandard/strategy/peerComponent.jsp?layerId="+layerId+"&productId="+productId);
        } 
      } 
      else{  //����������Ϊ��϶Ե������Ȼ�����ж����Ƿ���������Ե����
          List peerCompList = sp.getPeerComponentByFatherId(peerCompId);
          if(peerCompList!=null && peerCompList.size()!=0){  //���Ե�������������Ե�������ܱ�ɾ��
             response.sendRedirect("/fsmch/FSM/cosmicStandard/strategy/alertDelPeerCompnent.jsp?layerId="+layerId+"&productId="+productId); 
          }else{  //���԰�ȫɾ��
             sp.delPeerComponent(peerCompId);
             response.sendRedirect("/fsmch/FSM/cosmicStandard/strategy/peerComponent.jsp?layerId="+layerId+"&productId="+productId);
        }
      }
   %>
  </body>
</html>