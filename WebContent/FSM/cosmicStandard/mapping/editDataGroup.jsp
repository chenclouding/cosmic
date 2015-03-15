<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@ page import="business.FSM.MappingPhase" %>
<%@ page import="hibernate.FSM.FsmDataGroup" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'editDataGroup.jsp' starting page</title>
    
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
       /*获取从页面addDataGroup.jsp传来interestObjId和dataGroupId*/
      Integer interestObjId = new Integer(request.getParameter("interestObjId"));
      Integer dataGroupId = new Integer(request.getParameter("dataGroupId"));
      
      /*从数据库中把id为dataGroupId的数据组取出*/
      MappingPhase mp = new MappingPhase(); //业务层，对应于COSMIC方法的策略阶段
      FsmDataGroup dataGroup = (FsmDataGroup)mp.getDataGroupById(dataGroupId);    
      %>
  <form action="/fsmch/FSM/editDataGroup.do" name="dataGroupForm" method="post">
      <table>
         <tr>
            <td width="15%">数据组名</td>
            <td> <input type="text" name="dataGroupName" value="<%=dataGroup.getDataGroupName()%>"/> </td>        
         </tr>
        <tr>
            <td width="15%">数据组描述</td> 
            <td><input type="text" name="dataGroupDesp" value="<%=dataGroup.getDataGroupDesp() %>"/>   </td>     
         </tr>
        
        
         <tr>
            <td> <input type="submit" name="submit" value="修改数据组"/> </td>        
         </tr>
         
      </table>
      <input type="hidden" name="id" value="<%=dataGroupId%>"/>  
      <input type="hidden" name="interestObjId" value="<%=interestObjId%>"/> 
    </form>
  </body>
</html>
