<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@ page import="business.FSM.MeasurePhase" %>
<%@ page import="hibernate.FSM.FsmDataMovement" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'delDataMovement1.jsp' starting page</title>
    
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
      Integer funcProsId = new Integer(request.getParameter("funcProsId"));//��ȡ��ҳ��dataMovement.jsp����funcProsId,����ת���ص�dataMovement.jsp
      Integer dataMoveId = new Integer(request.getParameter("dataMoveId"));//��ȡ��ҳdataMovement.jsp����dataMoveId,����ɾ������
      MeasurePhase mp = new MeasurePhase();  //ҵ��㺯������װ�������ƶ����е���ɾ�Ĳ�Ȳ���
      boolean result = mp.delDataMovement(dataMoveId);
      if(result==true){

          response.sendRedirect("/fsmch/FSM/cosmicStandard/measure/editDataMoveOfFuncPros.jsp?funcProsId="+funcProsId);
      }
   %>
  </body>
</html>
