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
  //��ȡ��measurePurposeDescription.jsp������back ��productId
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
		          <td>����Ŀ��</td> 
		          <td> 1������Ŀ�ľ��ǹ��ڶ���ԭ��Ͷ��������;�Ĳ�����<br>
		               2������Ŀ�ĵĵ���ʵ����<br>
                        1������FUR���������֮ǰ����������ĵ������ݽ��������С�����㿪����������<br>
                        2����FUR��׼��Ϊ������Ŀ�ġ���Χ���ӡ�������������ֵĴ�С��<br>
                        3�����������������FUR��С���Զ��������ߵ�Ч�ʣ�<br>
                        4�������ܵĽ��������FUR��С���Լ��������������FUR��С������ù������õĶ�����<br>
                        5�������Ѵ��������FUR��С���������������ά����֧�ֵ���Ա��Ч�ʣ�<br>
                        6������һ���������ϵͳ�ı�����ֵĴ�С��������һ����ǿ����Ŀ�ŶӵĲ�����<br>
                        7������һ����������ṩ����Ȼ�˹����û��Ĺ��ܴ�С��<br>        
		             
		          </td>
		          
	         </tr>  	     
	      
         
           </table>        
      <!-- �ж��Ƿ񷵻�strategyPhase.jspҳ�� -->
      <%if(back.equals("strategyPhase")){ %>
     <a href="/fsmch/FSM/cosmicStandard/strategy/strategyPhase.jsp?productId=<%=productId%>">����</a>
     <%} else{%>
      <a  href="javascript:window.name=='contentFrame'?window.location='/fsmch/FSM/cosmicStandard/strategy/measurePurpose.jsp?productId=<%=productId %>':parent.location.href='/fsmch/FSM/cosmicStandard/strategy/measurePurpose.jsp?productId=<%=productId %>'">����</a>
     
     <%}%>
     
  </body>
</html>
