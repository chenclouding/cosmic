<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'dataMoveMethord.jsp' starting page</title>
    
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
		          <td>�����ƶ�</td> 
		          <td>1�������ƶ���һ���������ܳɷ֣����ƶ����������顣
		              2����ͼ��ʾ�������ƶ����������֣����루Entry���������Exit��������Read����д��Write����
		              3��һ��Entry���ǽ�һ��������ӹ����û�����߽��ƶ����������̡�һ��Exit�ķ�����Entry�෴��һ��Read���ǽ�һ��������ӳ־ô洢���ƶ����������̡�һ��Write��Read�ķ����෴��		             
		          </td>		          
	         </tr>
	      <tr>
	         <td>&nbsp&nbsp&nbsp</td> 
		     <td><img src="/fsmch/FSM/cosmicStandard/image/dataMovement.gif"/></td> 		          		          
	         </tr>    	     
	        
         
           </table>        
   <a  href="javascript:window.name=='contentFrame'?window.location='/fsmch/FSM/cosmicStandard/measure/dataMovement.jsp':parent.location.href='/fsmch/FSM/cosmicStandard/measure/dataMovement.jsp'">����</a>
  </body>
</html>
