<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@ page import="business.FSM.MappingPhase" %>
<%@ page import="hibernate.FSM.FsmFunctionProcessUser" %>
<%@ page import="hibernate.FSM.FsmFunctionProcess" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'delFunctionProcessUser.jsp' starting page</title>
    
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
   
      Integer funcProsId =  new Integer(request.getParameter("funcProsId"));//��ȡ��ҳ��functionProcessUser.jsp����funcProsId
      MappingPhase mp = new MappingPhase();  //ҵ��㺯������װ����Ȥ������е���ɾ�Ĳ�Ȳ���
      FsmFunctionProcess ffp = (FsmFunctionProcess)mp.getFunctionProcessById(funcProsId); //����ʵ��bean
      int ms = ffp.getMeasureStatus(); //��ȡ�������̵Ķ���״̬     
      List  funcProsUserList = mp.getFunctionProcessUserByFuncProsId(funcProsId);     
      if(ms!=0){ //���ù��������Ѿ������ֶ�������ȫ�����������ܱ�ɾ���˹���
           response.sendRedirect("/fsmch/FSM/cosmicStandard/mapping/alertDelFunctionProcessInterestObject.jsp"); 
        }else{ 
           ffp.setMappingUserStatus(0); //���Ĺ������̵�MappingEventStatusΪ0����ʾ�Ѿ�ȡ����������-�¼���ӳ��
           mp.updateFunctionProcess(ffp);
           boolean result = mp.delFunctionProcessUserByFuncProsId(funcProsId);
          if(result==true){
          response.sendRedirect("/fsmch/FSM/cosmicStandard/mapping/functionProcessUser.jsp");
             }
        }
          
    %>
  
  </body>
</html>
