<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'interestObjMethord.jsp' starting page</title>
    
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
     //��ȡ��mappingPhase.jsp����interestObjectDescription.jsp������back��productId��layerId��peerCompId
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
		          <td>��Ȥ����</td> 
		          <td>1:һ����Ȥ������Ǵӹ������û�����ĽǶ���ʶ��������κ���������Ǿ������������ǹ����û�����ĸ����Զ��������Զ����һ���֣������������ĺ�/��ҪΪ֮�洢����<br>
		              2:���ɶ��������������ÿһ�������鶼��������Ȥ����Ĳ�ͬ���档<br>
		              3��COSMIC������ʹ�á���Ȥ������Ϊ�˺�������󷽷�ѧ�еĶ�������
		             
		          </td>
		          
	         </tr>  	     
	        
         
           </table>        
  <!-- �жϷ���mappingPhase.jspҳ�滹��interestObject.jspҳ�� -->
      <%if(back.equals("mapping")){ %>
     <a href="/fsmch/FSM/cosmicStandard/mapping/mappingPhase.jsp?productId=<%=productId%>&layerId=<%=layerId%>&peerCompId=<%=peerCompId%>">����</a>
     <%} else{%>
       <a  href="javascript:window.name=='contentFrame'?window.location='/fsmch/FSM/cosmicStandard/mapping/interestObject.jsp':parent.location.href='/fsmch/FSM/cosmicStandard/mapping/interestObject.jsp'">����</a>
     <% }%>
  </body>
</html>
