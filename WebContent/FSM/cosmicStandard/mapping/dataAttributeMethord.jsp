<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'dataAttributeMethord.jsp' starting page</title>
    
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
   Integer dataGroupId = (Integer)session.getAttribute("dataGroupId");
   Integer interestObjId = new Integer(request.getParameter("interestObjId"));    
%>
	
   <h1> 方法介绍</h1>
	    <table>
	      <tr> 
	          <th>名称</th>
	          <th>方法介绍</th>	          
	      </tr>
	      <tr>
		          <td>数据属性</td> 
		          <td>1：从用户功能需求的观点看，数据属性就是数据组中持有信息的最小单位。<br>
		              2：在COSMIC方法的3.0版本中，确定数据属性不是必须要做的工作。但是<br>
		                   在区分数据组和兴趣对象的过程中，这一个步骤是很有帮助的。<br>
		              3：COSMIC中基本的功能度量单位是一次数据移动，数据移动的对象<br>
		                  是数据组，数据组是数据属性的集合。<br>
		              4:COSMIC在计算功能规模时没有考虑数据属性的多少，对于特定的度量目的，<br>
		                  在需要更加精确地度量规模时，可以对COSMIC方法进行扩展，度量数据属性<br>
		                  的个数是其中一种扩展方法。
		          </td>
		          
	         </tr>  	     
	     
         
           </table>        
   <a  href="javascript:window.name=='contentFrame'?window.location='/fsmch/FSM/cosmicStandard/mapping/dataAttibute.jsp?interestObjId=<%=interestObjId %>&dataGroupId=<%=dataGroupId %>':parent.location.href='/fsmch/FSM/cosmicStandard/mapping/dataAttribute.jsp?interestObjId=<%=interestObjId %>&dataGroupId=<%=dataGroupId %>'">返回</a>
  </body>
</html>
