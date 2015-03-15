<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'registerAlert.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>

    <%
     
       String suc =(String)request.getParameter("success");
 
    %>
   
			<script language="javascript" type="text/javascript"> 
			     if(<%=suc.equals("false")%>){
			      alert("您已经注册");
				   window.location.href = "index.jsp";
				 }
				 else{
				   alert("注册成功！");
				   window.location.href="index.jsp";
				 }
			
			   </script>
		


  </body>
</html>
