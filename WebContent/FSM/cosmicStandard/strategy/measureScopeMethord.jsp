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
  //��ȡ��measureScopeDescription.jspҳ�洫����back��productId
    String back = new String(request.getParameter("back"));
    Integer productId = new Integer(request.getParameter("productId"));
  
   %>
   
  
	
   <h1> ��������</h1>
	    <table>
	      <tr> 
	          <th>����</th>
	          <th>��������</th>	          
	      </tr>
	      <tr>
		          <td>������Χ</td> 
		          <td> 1��������Χ�����ڶ���Ŀ�ģ�<br>
                       2���κζ����ķ�Χ�������쳬��������������ڵĲ㣻<br>
                       3�����ܷ�Χ�����ܷ�Χ�ڵĵ�������ġ���Χ��Ӧ�������𣺡��ܷ�Χ����ָ����Ŀ��Ӧ�����������������������Ĵ�СӦ�÷ֱ������<br>        
		             
		          </td>
		          
	         </tr>  	     
	      
         
           </table>        
      <!-- �ж��Ƿ񷵻�strategyPhase.jspҳ�� -->
      <%if(back.equals("strategyPhase")){ %>
     <a href="/fsmch/FSM/cosmicStandard/strategy/strategyPhase.jsp?productId=<%=productId%>">����</a>
     <%} else{%>
      <a  href="javascript:window.name=='contentFrame'?window.location='/fsmch/FSM/cosmicStandard/strategy/measureScope.jsp?productId=<%=productId %>':parent.location.href='/fsmch/FSM/cosmicStandard/strategy/measureScope.jsp?productId=<%=productId %>'">����</a>
     
     <%}%>
  </body>
</html>
