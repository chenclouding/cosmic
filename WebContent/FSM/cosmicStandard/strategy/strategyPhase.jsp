<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<jsp:useBean id="projectMeasureBean" scope="session" class="javaBeans.fsm.ProjectMeasureBean"/> 
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'strategyPhase.jsp' starting page</title>
    
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
      String back = "strategyPhase";
      Integer productId = Integer.valueOf(request.getParameter("productId"));//��ȡ��ҳ��strategy.jsp���������productId 
     
    %>
    
    <!--��projectMeasureBean��productId��ֵ��Ŀ������session��Χ��ʹ��  -->
     <jsp:setProperty name="projectMeasureBean" property="productId" value="<%=productId%>" />
    <table>
	       <tr> 
	            <td>�</td>
	            <td>�������</td>
	            <td>���</td>       
	       </tr> 
	       <tr> 
	            <td>��ӹ����û�</td>
	            <td > <a href="/fsmch/FSM/cosmicStandard/strategy/userMethord.jsp?back=<%=back%>&productId=<%=productId%>"><IMG src="/fsmch/images/btncheck.gif" alt="�����û���������" border="0" /></a> </td>
	            <td>�����Ŀ¼��� </td>
	       </tr>
           <tr> 
	            <td>��ӹ���Ŀ��</td>
	            <td > <a href="/fsmch/FSM/cosmicStandard/strategy/measurePurposeMethord.jsp?back=<%=back%>&productId=<%=productId%>"><IMG src="/fsmch/images/btncheck.gif" alt="����Ŀ�ķ�������" border="0" /></a> </td>
	            <td>�����Ŀ¼��� </td>
	           
	       </tr>
           <tr> 
	            <td>��ӹ��㷶Χ</td>
	            <td > <a href="/fsmch/FSM/cosmicStandard/strategy/measureScopeMethord.jsp?back=<%=back%>&productId=<%=productId%>"><IMG src="/fsmch/images/btncheck.gif" alt="������Χ��������" border="0" /></a> </td>
	            <td>�����Ŀ¼��� </td>
	       </tr>
	       
	       <tr> 
	            <td>��Ӳ��</td>
	            <td > <a href="/fsmch/FSM/cosmicStandard/strategy/layerMethord.jsp?back=<%=back%>&productId=<%=productId%>"><IMG src="/fsmch/images/btncheck.gif" alt="��η�������" border="0" /></a> </td>
	           <td>�����Ŀ¼��� </td>
	       </tr>
	       <tr> 
	            <td>��ӶԵ����</td>
	            <td > <a href="/fsmch/FSM/cosmicStandard/strategy/peerCompMethord.jsp?back=<%=back%>&productId=<%=productId%>&layerId=1&fatherId=0"><IMG src="/fsmch/images/btncheck.gif" alt="��η�������" border="0" /></a> </td>
	           <td>�����Ŀ¼��� </td>
	       </tr>
	      	      
	    </table>	   
     

  </body>
</html>
