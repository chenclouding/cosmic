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
	
   <h1> ��������</h1>
	    <table>
	      <tr> 
	          <th>����</th>
	          <th>��������</th>	          
	      </tr>
	      <tr>
		          <td>������</td> 
		          <td>1��һ����������һ��Ψһ�ġ��ǿյġ�����ġ���������������Լ��ϣ�����ÿһ��������������ͬһ����Ȥ����Ĳ�ͬ���档<br>
		              2��һ�������������һ���ļ������ݿ���ڴ��е�һ�����ݽṹ��һ����Ϣ�ȡ�<br>
		              3��ÿ�������鶼Ӧ�ú�һ���û����������е���Ȥ����ֱ�ӹ����������ڼ����ϵͳ�ж�Ӧ���ܹ����ﻯ���־ô洢���ϵļ�¼������/����豸�ȣ�
		                 ��֧�����ϵͳ��
		          </td>
		          
	         </tr>  	     
	     
         
           </table>
                   
 
  </body>
</html>
