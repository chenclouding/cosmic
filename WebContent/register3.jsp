<%@ page language="java" contentType="text/html; charset=gb2312"
    pageEncoding="gb2312"%>
    
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<base href="<%=basePath%>">
    
    <title>My JSP 'Register.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<link rel="stylesheet" type="text/css" href="/fsmch/images/screen.css">
<script language="JavaScript" src="/fsmch/javascript/verify.js"></script>

<script type="text/javascript">
function check(){
if(registerForm.username.value==null||registerForm.username.value==""){
	alert("ÓÃ»§Ãû²»ÄÜÎª¿Õ!!!");
}else if(registerForm.password1.value==null||registerForm.password1.value==""){
 	alert("ÃÜÂë²»ÄÜÎª¿Õ!!!");
}else if(registerForm.password1.value.length<3){
	alert("ÃÜÂë³¤¶È²»ÄÜÉÙÓÚ3!!!");
}else if(registerForm.password1.value!=form1.password2.value){
	alert("ÇëÊäÈëÏàÍ¬µÄÃÜÂë£¡£¡£¡");
}else{
	return registerForm.submit();
}

}

</script>
</head>
<body BGCOLOR=#669966 leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<center>
<h1>User Register</h1><br>

<%@include file="messageshow.jsp" %>

<table width="778" border="0" cellspacing="0" cellpadding="0" align="center" height="130">
  <tr>
    <td background="/fsmch/images/index_topPP1.gif" valign="top">
     
    </td>
  </tr>
</table>

<form action="/fsmch/FSM/addRegister.do" name="registerForm" method="post" onSubmit="return verifyInput();">
	<table style="width:500px">
		<tr>
			<td>ÓÃ»§Ãû:</td><td><input type="text" name="username" ></td>
		</tr>
		<tr>
			<td>ÃÜÂë:</td><td><input type="password" name="password1"></td>
		</tr>
		<tr>
			<td>ÔÙ´ÎÊäÈëÃÜÂë:</td><td><input type="password" name="password2"></td>
		</tr>
	</table>
  <input type="submit" name="submit" value="×¢²á"/> 
  <input type='button' onclick="Javascript:window.location='/fsm/index.jsp'" value="·µ»Ø "> 
</form>


<table width="778" border="0" cellspacing="0" cellpadding="0" align="center">
  <tr>
    <td><img src="/fsmch/images/index_bottom.gif" width="778" height="50"></td>
  </tr>
</table>
</center>
</body>
</html>