<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@ page import="business.FSM.MappingPhase" %>
<%@ page import="hibernate.FSM.FsmFunctionProcess" %>
<%@ page import="hibernate.FSM.FsmEvent" %>
<%@ page import="hibernate.FSM.FsmInterestObject" %>
<jsp:useBean id="projectMeasureBean" scope="session" class="javaBeans.fsm.ProjectMeasureBean"/> 
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'mappingPhase.jsp' starting page</title>
    
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
       String back="mapping"; 
      /*peerCompId��������ӳ��׶ε����ǣ�productId��layerId�������Ǵ���sessionBean*/ 
      Integer productId = Integer.valueOf(request.getParameter("productId"));//��ȡ��ҳ��mapping.jsp���������productId 
      Integer layerId = new Integer(request.getParameter("layerId"));        //��ȡ��ҳ��mapping.jsp���������layerId 
      Integer peerCompId = new Integer(request.getParameter("peerCompId"));  //��ȡ��ҳ��mapping.jsp���������peerCompId 
      //���ݶԵ����idȡ����������,�¼�����Ȥ���� 
      MappingPhase mp = new MappingPhase(); 
      List ffpList = mp.getFunctionProcessByPeerCompId(peerCompId); 
      List eList = mp.getEventByPeerCompId(peerCompId); 
      List ioList = mp.getInterestObjectByPeerCompId(peerCompId); 
     // FsmFunctionProcess ffp = 
    %>
  
     <!--��projectMeasureBean��productId��layerId��peerCompId��ֵ��Ŀ������session��Χ��ʹ��  -->
     <jsp:setProperty name="projectMeasureBean" property="productId" value="<%=productId%>" />
     <jsp:setProperty name="projectMeasureBean" property="layerId" value="<%=layerId%>" />
     <jsp:setProperty name="projectMeasureBean" property="peerCompId" value="<%=peerCompId%>" />
      
      <table>
	       <tr> 
	            <td>�</td>	           
	            <td>�������</td>
	            <td>���</td>       
	       </tr> 
           <tr> 
	            <td>��ӹ�������</td>	            
	            <td > <a href="/fsmch/FSM/cosmicStandard/mapping/funcProsMethord.jsp?back=<%=back%>&productId=<%=productId%>&layerId=<%=layerId%>&peerCompId=<%=peerCompId%>"><IMG src="/fsmch/images/btncheck.gif" alt="�������̷�������" border="0" /></a> </td>
	            <td>�����Ŀ¼��� </td> 
	       </tr>
	       <tr> 
	            <td>�����Ȥ����</td>
	            <td > <a href="/fsmch/FSM/cosmicStandard/mapping/interestObjMethord.jsp?back=<%=back%>&productId=<%=productId%>&layerId=<%=layerId%>&peerCompId=<%=peerCompId%>"><IMG src="/fsmch/images/btncheck.gif" alt="��Ȥ���󷽷�����" border="0" /></a> </td>
	             <td>�����Ŀ¼���</td> 
	       </tr>
	       <tr> 
	            <td>���������</td>
	            <td > <a href=""><IMG src="/fsmch/images/btncheck.gif" alt="�����鷽������" border="0" /></a> </td>
	             <td>�����Ŀ¼���</td> 
	       </tr>		
           <tr> 
	            <td>����¼�</td>    
	            <td > <a href="/fsmch/FSM/cosmicStandard/mapping/eventMethord.jsp?back=<%=back%>&productId=<%=productId%>&layerId=<%=layerId%>&peerCompId=<%=peerCompId%>"><IMG src="/fsmch/images/btncheck.gif" alt="�¼���������" border="0" /></a> </td>
	            <td>�����Ŀ¼��� </td>
	       </tr>
	              	       
	       <tr> 
	            <td>����������������Ȥ�������</td>	 
	            <td ><IMG src="/fsmch/images/btncheck.gif"  border="0" /></td>
	            <td>�����Ŀ¼��� </td> 
	       </tr>
	       <tr> 
	            <td>���������������¼�����</td>
	            <td ><IMG src="/fsmch/images/btncheck.gif"  border="0" /></td>
	             <td>�����Ŀ¼��� </td>
	       </tr>
	       <tr> 
	            <td>�������������빦���û�����</td>	    
	            <td ><IMG src="/fsmch/images/btncheck.gif" border="0" /></td>
	             <td>�����Ŀ¼���</td>
	       </tr>
	   </table>
    
  </body>
</html>
