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
	
   <h1> 方法介绍</h1>
	    <table>
	      <tr> 
	          <th>名称</th>
	          <th>方法介绍</th>	          
	      </tr>
	      <tr>
		          <td>数据移动</td> 
		          <td>1：数据移动是一个基本功能成分，它移动单个数据组。
		              2：如图所示，数据移动类型有四种：输入（Entry），输出（Exit），读（Read），写（Write）。
		              3：一个Entry就是将一个数据组从功能用户跨过边界移动到功能流程。一个Exit的方向与Entry相反。一个Read就是将一个数据组从持久存储器移动到功能流程。一个Write与Read的方向相反。		             
		          </td>		          
	         </tr>
	      <tr>
	         <td>&nbsp&nbsp&nbsp</td> 
		     <td><img src="/fsmch/FSM/cosmicStandard/image/dataMovement.gif"/></td> 		          		          
	         </tr>    	     
	        
         
           </table>        
   <a  href="javascript:window.name=='contentFrame'?window.location='/fsmch/FSM/cosmicStandard/measure/dataMovement.jsp':parent.location.href='/fsmch/FSM/cosmicStandard/measure/dataMovement.jsp'">返回</a>
  </body>
</html>
