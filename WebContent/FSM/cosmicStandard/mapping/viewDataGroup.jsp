<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'viewDataGroup.jsp' starting page</title>
    
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
     //Access coming from the mappingPhase.jsp or interestObjectDescription.jsp back, productId, layerId, peerCompId
     String back=new String(request.getParameter("back"));
     String productId=new String(request.getParameter("productId"));
     String layerId=new String(request.getParameter("layerId"));
     String peerCompId=new String(request.getParameter("peerCompId"));
   
   %>
	
   <h1> 方法介绍</h1>
	    <table>
	      <tr> 
	          <th>名称</th>
	          <th>介绍</th>	          
	      </tr>
	      <tr>
		          <td>数据组</td> 
		          <td>A data group is a distinct, non empty, non ordered and non redundant set of data attributes where each included data attribute describes a complementary aspect of the same object of interest.<br>

		             
		          </td>
		          
	         </tr>  	     
	        
         
           </table>        
  <!-- Determine pages back mappingPhase.jsp page or interestObject.jsp -->
      <%if(back.equals("mapping")){ %>
     <a href="/fsmch/FSM/cosmicStandard/mapping/mappingPhase.jsp?productId=<%=productId%>&layerId=<%=layerId%>&peerCompId=<%=peerCompId%>">Back</a>
     <%} else{%>
       <a  href="javascript:window.name=='contentFrame'?window.location='/fsmch/FSM/cosmicStandard/mapping/interestObject.jsp':parent.location.href='/fsmch/FSM/cosmicStandard/mapping/interestObject.jsp'">Back</a>
     <% }%>
  </body>
</html>
