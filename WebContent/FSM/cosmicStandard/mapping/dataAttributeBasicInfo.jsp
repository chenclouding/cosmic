<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@ page import="business.FSM.ProductMeasureBusiness" %>
<%@ page import="business.FSM.StrategyPhase" %>
<%@ page import="business.FSM.MappingPhase" %>
<%@ page import="hibernate.FSM.FsmProduct" %>
<%@ page import="hibernate.FSM.FsmLayer" %>
<%@ page import="hibernate.FSM.FsmPeerComponent" %>
<%@ page import="hibernate.FSM.FsmDataGroup" %>
<%@ page import="hibernate.FSM.FsmDataAttribute" %>
<jsp:useBean id="projectMeasureBean" scope="session" class="javaBeans.fsm.ProjectMeasureBean"/> 

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'dataAttributeInfo.jsp' starting page</title>
    
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
   //��ȡ��dataAttributeDescription.jspҳ�洫����dataAttriId��dataGroupId��interestObjId
   
   Integer dataAttriId = (Integer)session.getAttribute("dataAttriId");
   Integer dataGroupId = (Integer)session.getAttribute("dataGroupId");
   Integer interestObjId = new Integer(request.getParameter("interestObjId"));
   //���ո���ID������ȡ����
   ProductMeasureBusiness pmb = new ProductMeasureBusiness();
   StrategyPhase sp = new StrategyPhase();
   MappingPhase mp = new MappingPhase();
   FsmDataGroup fdg =(FsmDataGroup) mp.getDataGroupById(dataGroupId);
   FsmDataAttribute fda =(FsmDataAttribute) mp.getDataAttributeById(dataAttriId);
     
%>

  
    <table>
       <tr> 
          <td width="15%">����������:</td> <td><%=fdg.getDataGroupName()%></td>
      </tr>     
       <tr> 
          <td width="15%">������������:</td> <td><%=fda.getDataAttriName()%></td>
      </tr>
      <tr> 
          <td width="15%">������������:</td> <td><%=fda.getDataAttriDesp()%></td>
      </tr>
      
    </table>
    <hr>    
     <a  href="javascript:window.name=='contentFrame'?window.location='/fsmch/FSM/cosmicStandard/mapping/dataAttibute.jsp?interestObjId=<%=interestObjId %>&dataGroupId=<%=dataGroupId %>':parent.location.href='/fsmch/FSM/cosmicStandard/mapping/dataAttribute.jsp?interestObjId=<%=interestObjId %>&dataGroupId=<%=dataGroupId %>'">����</a>
  </body>
</html>
