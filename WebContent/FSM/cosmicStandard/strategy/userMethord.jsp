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
     //��ȡ��functionUserDescription.jspҳ�洫����back��productId
    String back = new String(request.getParameter("back"));
    Integer productId = new Integer(request.getParameter("productId")); 
   %>
  
  <body>
	
   <h1> ��������</h1>
	    <table>
	      <tr> 
	          <th>����</th>
	          <th>��������</th>	          
	      </tr>
	      <tr>
		          <td>�����û�</td> 
		          <td>1:�����û�������Ĺ��������������ݵķ����߻������ݵ���������ߡ�<br>
		              2:�����û��������ˡ�Ӳ�������߶Ե���������κ��������������������
		              
		             
		          </td>
		          
	         </tr>  	     
	        
         
           </table>
            <!-- �ж��Ƿ񷵻�strategyPhase.jspҳ�� -->
      <%if(back.equals("strategyPhase")){ %>
     <a href="/fsmch/FSM/cosmicStandard/strategy/strategyPhase.jsp?productId=<%=productId%>">����</a>
     <%} else{%>
      <a  href="javascript:window.name=='contentFrame'?window.location='/fsmch/FSM/cosmicStandard/strategy/functionUser.jsp?productId=<%=productId %>':parent.location.href='/fsmch/FSM/cosmicStandard/strategy/functionUser.jsp?productId=<%=productId %>'">����</a>
     
     <%}%>        
  
  </body>
</html>
