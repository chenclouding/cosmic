<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@ page import="business.FSM.MappingPhase" %>
<%@ page import="hibernate.FSM.FsmInterestObject" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'delInterestObject.jsp' starting page</title>
    
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
      Integer peerCompId = new Integer(request.getParameter("peerCompId"));//��ȡ��ҳ��interestObject.jsp����peerCompId
      Integer interestObjId =new Integer(request.getParameter("interestObjId"));//��ȡ��ҳ��interestObject.jsp����interestObjId
      MappingPhase mp = new MappingPhase();  //ҵ��㺯������װ����Ȥ������е���ɾ�Ĳ�Ȳ���
      List  funcProsIOList = mp.getFunctionProcessInterestObjectByInterestObjId(interestObjId);     
      if(funcProsIOList!=null && funcProsIOList.size()!=0){ //������Ȥ�����Ѿ��빦����������������ܱ�ɾ��
           response.sendRedirect("/fsmch/FSM/cosmicStandard/mapping/alertDelInterestObject.jsp"); 
        }else{ //���԰�ȫɾ��
           mp.delInterestObject(interestObjId);
           response.sendRedirect("/fsmch/FSM/cosmicStandard/mapping/interestObject.jsp");
        }  
     
   %>
  </body>
</html>
