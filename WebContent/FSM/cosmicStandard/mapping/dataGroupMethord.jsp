<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'dataGroupMethord.jsp' starting page</title>
    
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
     Integer interestObjId = new Integer(request.getParameter("interestObjId"));     
   %>
	
   <h1> 方法介绍</h1>
	    <table>
	      <tr> 
	          <th>名称</th>
	          <th>方法介绍</th>	          
	      </tr>
	      <tr>
		          <td>数据组</td> 
		          <td>1：一个数据组是一个唯一的、非空的、无序的、无冗余的数据属性集合，其中每一个数据属性描述同一个兴趣对象的不同方面。<br>
		              2：一个数据组可以是一个文件、数据库表、内存中的一个数据结构、一条消息等。<br>
		              3：每个数据组都应该和一个用户功能需求中的兴趣对象直接关联，并且在计算机系统中都应该能够被物化（持久存储体上的记录、输入/输出设备等）
		                 以支持软件系统。
		          </td>
		          
	         </tr>  	     
	     
         
           </table>
                   
 
  </body>
</html>
