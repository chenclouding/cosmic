<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'productMethord.jsp' starting page</title>
    
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
  
   
  
	
   <h1> ��������</h1>
	    <table>
	      <tr> 
	          <th>����</th>
	          <th>��������</th>	          
	      </tr>
	      <tr>
		          <td>��Ʒ</td> 
		          <td> ��Ʒ�������Ǽ���Ҫ���й����������֡�<br>
		               
		          </td>		          
	         </tr>  	             
           </table>        
     <a  href="javascript:window.name=='contentFrame'?window.location='/fsmch/FSM/cosmicStandard/projectMeasure.jsp':parent.location.href='/fsmch/FSM/cosmicStandard/projectMeasure.jsp'">����</a>  
  </body>
</html>
