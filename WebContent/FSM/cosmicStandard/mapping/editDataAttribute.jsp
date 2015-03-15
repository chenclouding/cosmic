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
       /*获取从页面dataAttribute.jsp传来dataGroupId和dataAttriId*/
      Integer dataGroupId = new Integer(request.getParameter("dataGroupId"));
      Integer dataAttriId = new Integer(request.getParameter("dataAttriId"));
      Integer interestObjId = new Integer(request.getParameter("interestObjId")); 
      /*从数据库中把id为dataAttriId的数据属性取出*/
      MappingPhase mp = new MappingPhase(); //业务层，对应于COSMIC方法的策略阶段
      FsmDataAttribute dataAttribute = (FsmDataAttribute)mp.getDataAttributeById(dataAttriId);
     
     
      %>
  <form action="/fsmch/FSM/editDataAttribute.do">
      <table>
         <tr>
            <td width="15%">数据属性名</td>
            <td> <input type="text" name="dataAttriName" value="<%=dataAttribute.getDataAttriName()%>"/> </td>        
         </tr>
        <tr>
            <td width="15%">数据属性描述</td> 
            <td><input type="text" name="dataAttriDesp" value="<%=dataAttribute.getDataAttriDesp() %>"/>   </td>     
         </tr>
         
        
         <tr>
            <td> <input type="submit" name="submit" value="修改数据属性"/> </td>        
         </tr>
         
      </table>
      <input type="hidden" name="id" value="<%=dataAttriId%>"/>  
      <input type="hidden" name="dataGroupId" value="<%=dataGroupId%>"/> 
      <input type="hidden" name="interestObjId" value="<%=interestObjId%>"/>
    </form>
  </body>
</html>
