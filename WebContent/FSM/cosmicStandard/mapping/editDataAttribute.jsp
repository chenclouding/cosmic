<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@ page import="business.FSM.MappingPhase" %>
<%@ page import="hibernate.FSM.FsmDataAttribute" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'editDataAttribute.jsp' starting page</title>
    
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
       /*��ȡ��ҳ��dataAttribute.jsp����dataGroupId��dataAttriId*/
      Integer dataGroupId = new Integer(request.getParameter("dataGroupId"));
      Integer dataAttriId = new Integer(request.getParameter("dataAttriId"));
      Integer interestObjId = new Integer(request.getParameter("interestObjId")); 
      /*�����ݿ��а�idΪdataAttriId����������ȡ��*/
      MappingPhase mp = new MappingPhase(); //ҵ��㣬��Ӧ��COSMIC�����Ĳ��Խ׶�
      FsmDataAttribute dataAttribute = (FsmDataAttribute)mp.getDataAttributeById(dataAttriId);
     
     
      %>
  <form action="/fsmch/FSM/editDataAttribute.do">
      <table>
         <tr>
            <td width="15%">����������</td>
            <td> <input type="text" name="dataAttriName" value="<%=dataAttribute.getDataAttriName()%>"/> </td>        
         </tr>
        <tr>
            <td width="15%">������������</td> 
            <td><input type="text" name="dataAttriDesp" value="<%=dataAttribute.getDataAttriDesp() %>"/>   </td>     
         </tr>
         
        
         <tr>
            <td> <input type="submit" name="submit" value="�޸���������"/> </td>        
         </tr>
         
      </table>
      <input type="hidden" name="id" value="<%=dataAttriId%>"/>  
      <input type="hidden" name="dataGroupId" value="<%=dataGroupId%>"/> 
      <input type="hidden" name="interestObjId" value="<%=interestObjId%>"/>
    </form>
  </body>
</html>
