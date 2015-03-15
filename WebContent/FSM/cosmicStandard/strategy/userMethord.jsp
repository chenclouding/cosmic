<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'userMethord.jsp' starting page</title>
    
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
   <%
     //获取从functionUserDescription.jsp页面传来的back和productId
    String back = new String(request.getParameter("back"));
    Integer productId = new Integer(request.getParameter("productId")); 
   %>
  
  <body>
	
   <h1> 方法介绍</h1>
	    <table>
	      <tr> 
	          <th>名称</th>
	          <th>方法介绍</th>	          
	      </tr>
	      <tr>
		          <td>功能用户</td> 
		          <td>1:功能用户是软件的功能性需求中数据的发送者或者数据的意向接受者。<br>
		              2:功能用户可以是人、硬件、或者对等组件，即任何与待估算软件交互的事物。
		              
		             
		          </td>
		          
	         </tr>  	     
	        
         
           </table>
            <!-- 判断是否返回strategyPhase.jsp页面 -->
      <%if(back.equals("strategyPhase")){ %>
     <a href="/fsmch/FSM/cosmicStandard/strategy/strategyPhase.jsp?productId=<%=productId%>">返回</a>
     <%} else{%>
      <a  href="javascript:window.name=='contentFrame'?window.location='/fsmch/FSM/cosmicStandard/strategy/functionUser.jsp?productId=<%=productId %>':parent.location.href='/fsmch/FSM/cosmicStandard/strategy/functionUser.jsp?productId=<%=productId %>'">返回</a>
     
     <%}%>        
  
  </body>
</html>
