<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@ page import="business.FSM.MappingPhase" %>
<%@ page import="hibernate.FSM.FsmDataGroup" %>
<%@ page import="hibernate.FSM.FsmDataAttribute" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'delDataGroup.jsp' starting page</title>
    
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
      Integer interestObjId = new Integer(request.getParameter("interestObjId"));//��ȡ��ҳ��addDataGroup.jsp������interestObjId
      Integer dataGroupId =  new Integer(request.getParameter("dataGroupId"));//��ȡ��ҳ��addDataGroup.jsp������dataGroupId
      FsmDataAttribute dataAttribute = new FsmDataAttribute();//����ʵ��Bean
      MappingPhase mp = new MappingPhase();  //ҵ��㺯������װ����������е���ɾ�Ĳ�Ȳ���
      
      //ɾ�����������Ӧ����������
      List dataAttributeList = mp.getDataAttributeByDataGroupId(dataGroupId);
       if(dataAttributeList!=null ||dataAttributeList.size()!=0 ){
           for(Object p:dataAttributeList){
            dataAttribute = (FsmDataAttribute)p; 
	         Integer dataAttributeId = dataAttribute.getId();	         
	        mp.delDataAttribute(dataAttributeId);
           }
       }
      boolean result = mp.delDataGroup(dataGroupId);
      if(result==true){

          response.sendRedirect("/fsmch/FSM/cosmicStandard/mapping/addDataGroup.jsp?interestObjId="+interestObjId);
      }
   %>
  </body>
</html>
