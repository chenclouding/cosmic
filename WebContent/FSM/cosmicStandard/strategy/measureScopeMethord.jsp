<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'measureScopeMethord.jsp' starting page</title>
    
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
  //获取从measureScopeDescription.jsp页面传来的back和productId
    String back = new String(request.getParameter("back"));
    Integer productId = new Integer(request.getParameter("productId"));
  
   %>
   
  
	
   <h1> 方法介绍</h1>
	    <table>
	      <tr> 
	          <th>名称</th>
	          <th>方法介绍</th>	          
	      </tr>
	      <tr>
		          <td>度量范围</td> 
		          <td> 1：度量范围依赖于度量目的；<br>
                       2：任何度量的范围不能延伸超过被度量软件所在的层；<br>
                       3：“总范围”与总范围内的单个软件的“范围”应予以区别：“总范围”是指根据目的应度量的所有软件，单个软件的大小应该分别度量。<br>        
		             
		          </td>
		          
	         </tr>  	     
	      
         
           </table>        
      <!-- 判断是否返回strategyPhase.jsp页面 -->
      <%if(back.equals("strategyPhase")){ %>
     <a href="/fsmch/FSM/cosmicStandard/strategy/strategyPhase.jsp?productId=<%=productId%>">返回</a>
     <%} else{%>
      <a  href="javascript:window.name=='contentFrame'?window.location='/fsmch/FSM/cosmicStandard/strategy/measureScope.jsp?productId=<%=productId %>':parent.location.href='/fsmch/FSM/cosmicStandard/strategy/measureScope.jsp?productId=<%=productId %>'">返回</a>
     
     <%}%>
  </body>
</html>
