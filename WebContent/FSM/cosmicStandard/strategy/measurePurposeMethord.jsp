<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'measurePurposeMethord.jsp' starting page</title>
    
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
  //获取从measurePurposeDescription.jsp传来的back 和productId
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
		          <td>度量目的</td> 
		          <td> 1：度量目的就是关于度量原因和度量结果用途的阐述。<br>
		               2：度量目的的典型实例：<br>
                        1）随着FUR（软件开发之前产生的软件文档）的演进度量其大小，估算开发工作量；<br>
                        2）在FUR批准后，为管理项目的“范围蔓延”，度量变更部分的大小；<br>
                        3）度量所交付软件的FUR大小，以度量开发者的效率；<br>
                        4）度量总的交付软件的FUR大小，以及所开发的软件的FUR大小，来获得功能重用的度量；<br>
                        5）度量已存在软件的FUR大小，来度量负责软件维护和支持的人员的效率；<br>
                        6）度量一个现有软件系统的变更部分的大小，来度量一个增强型项目团队的产出；<br>
                        7）度量一个现有软件提供给自然人功能用户的功能大小。<br>        
		             
		          </td>
		          
	         </tr>  	     
	      
         
           </table>        
      <!-- 判断是否返回strategyPhase.jsp页面 -->
      <%if(back.equals("strategyPhase")){ %>
     <a href="/fsmch/FSM/cosmicStandard/strategy/strategyPhase.jsp?productId=<%=productId%>">返回</a>
     <%} else{%>
      <a  href="javascript:window.name=='contentFrame'?window.location='/fsmch/FSM/cosmicStandard/strategy/measurePurpose.jsp?productId=<%=productId %>':parent.location.href='/fsmch/FSM/cosmicStandard/strategy/measurePurpose.jsp?productId=<%=productId %>'">返回</a>
     
     <%}%>
     
  </body>
</html>
