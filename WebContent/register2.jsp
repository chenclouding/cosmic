<%@ page language="java" contentType="text/html; charset=gb2312"
    pageEncoding="gb2312"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'register2.jsp' starting page</title>
    
    <link rel="stylesheet" href="/fsmch/images/CSS.CSS" type="text/css">
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<script language="JavaScript" src="javascript/verify.js"></script>
<script language="JavaScript">
function verifyInput(){
	if(registerForm.username.value==null||registerForm.username.value==""){
		alert("�����������û���!!!");
		registerForm.username.focus();
		return false;
	}else if(registerForm.password1.value==null||registerForm.password1.value==""){
		registerForm.password1.focus();
		alert("��������������!!!");
		return false;
	}else if(registerForm.password2.value==null||registerForm.password2.value==""){
		registerForm.password2.focus();
		alert("��������ͬ������!!");
		return false;
	}else{
	    registerForm.submit();
    }
}


</script>
  </head>
  
  <body>
<form action="/fsmch/FSM/addRegister.do" name="registerForm" method="post" onSubmit="return verifyInput();">
	<table style="width:500px">
		<tr>
			<td>�û���:</td><td><input type="text" name="username" ></td>
		</tr>
		<tr>
			<td>����:</td><td><input type="password" name="password1"></td>
		</tr>
		<tr>
			<td>�ٴ���������:</td><td><input type="password" name="password2"></td>
		</tr>
	</table>
  <input type="submit" name="submit" value="ע��" onClick="check()"/> 
  <input type='button' onclick="Javascript:window.location='/fsm/index.jsp'" value="���� "> 
</form>
  </body>
</html>
