<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@ page import="business.FSM.ProductMeasureBusiness" %>
<%@ page import="business.FSM.StrategyPhase" %>
<%@ page import="business.FSM.MappingPhase" %>
<%@ page import="hibernate.FSM.FsmProduct" %>
<%@ page import="hibernate.FSM.FsmLayer" %>
<%@ page import="hibernate.FSM.FsmPeerComponent" %>
<%@ page import="hibernate.FSM.FsmDataGroup" %>
<jsp:useBean id="projectMeasureBean" scope="session" class="javaBeans.fsm.ProjectMeasureBean"/> 

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'dataGroupBasicInfo.jsp' starting page</title>
    
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
   Integer interestObjId = new Integer(request.getParameter("interestObjId"));
   Integer dataGroupId = (Integer)session.getAttribute("dataGroupId");
   //按照各自ID将名称取出来
   ProductMeasureBusiness pmb = new ProductMeasureBusiness();
   StrategyPhase sp = new StrategyPhase();
   MappingPhase mp = new MappingPhase();
   FsmDataGroup fdg =(FsmDataGroup) mp.getDataGroupById(dataGroupId);
     
%>

  
    <table>     
       <tr> 
          <td width="15%">数据组名称:</td> <td><%=fdg.getDataGroupName()%></td>
      </tr>
      <tr> 
          <td width="15%">数据组描述:</td> <td><%=fdg.getDataGroupDesp()%></td>
      </tr>
      
    </table>
    <hr>    
    <a  href="javascript:window.name=='contentFrame'?window.location='/fsmch/FSM/cosmicStandard/mapping/addDataGroup.jsp?interestObjId=<%=interestObjId %>':parent.location.href='/fsmch/FSM/cosmicStandard/mapping/addDataGroup.jsp?interestObjId=<%=interestObjId %>'">返回</a>
  </body>
</html>
