<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'eventMethord.jsp' starting page</title>
    
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
      //��ȡ��mappingPhase.jsp����functionProcessDescription.jsp������back
     String back=new String(request.getParameter("back"));
     String productId=new String(request.getParameter("productId"));
     String layerId=new String(request.getParameter("layerId"));
     String peerCompId=new String(request.getParameter("peerCompId"));
   %>
	
   <h1> ��������</h1>
	    <table>
	      <tr> 
	          <th>����</th>
	          <th>��������</th>	          
	      </tr>
	      <tr>
		          <td>�¼�</td> 
		          <td>1:һ���¼���������Ĺ����û�����һ�������������̡�ʱ�Ӻ�ʱ���¼�������Ϊ�����¼���<br>
		              2:һ���¼���������ĳ�£���������Ĺ����û����𣨴�����һ�����߶�����ܹ��̡������ڹ����û����󼯺��У�
		                  ���¹����û�����һ�����ܹ��̵��¼����ڹ����û����󼯺��в����ٷֲ���Ҫô������Ҫô��������<br>
		              3:��ͼ�����˴����¼��������û��ʹ������ܹ��̵�Entry�����ƶ�֮��Ĺ�ϵ���Ը�ͼ�Ľ����ǣ������¼��������û���⵽�������û�����һ�����ܹ��̡�
		          </td>		         		          
	         </tr>  	     
	      <tr>
	         <td>&nbsp&nbsp&nbsp</td> 
		     <td><img src="/fsmch/FSM/cosmicStandard/image/event.gif"/></td> 
		          
		          
	         </tr>  
         
           </table>        
  <!-- �жϷ���mappingPhase.jspҳ�滹��event.jspҳ�� -->
      <%if(back.equals("mapping")){ %>
     <a href="/fsmch/FSM/cosmicStandard/mapping/mappingPhase.jsp?productId=<%=productId%>&layerId=<%=layerId%>&peerCompId=<%=peerCompId%>">����</a>
     <%} else{%>
       <a  href="javascript:window.name=='contentFrame'?window.location='/fsmch/FSM/cosmicStandard/mapping/event.jsp':parent.location.href='/fsmch/FSM/cosmicStandard/mapping/event.jsp'">����</a>
     <% }%>
  </body>
</html>
