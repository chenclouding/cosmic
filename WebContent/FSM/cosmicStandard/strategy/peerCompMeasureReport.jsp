<%@ page contentType="text/html; charset=gb2312" language="java" import="java.util.*" %>
<%@ page import="business.FSM.MappingPhase" %>
<%@ page import="business.FSM.MeasurePhase" %>
<%@ page import="business.FSM.CountFPNumber" %>
<%@ page import="java.util.List" %>
<%@ page import="business.FSM.StrategyPhase" %>
<%@ page import="business.FSM.ViewReportTreeService" %>
<%@ page import="hibernate.FSM.FsmFunctionProcess" %>
<%@ page import="hibernate.FSM.FsmPeerComponent" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%> 
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>

<jsp:useBean id="projectMeasureBean" scope="session" class="javaBeans.fsm.ProjectMeasureBean"/>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>

    
    <title>My JSP 'peerCompMeasureReport.jsp' starting page</title>
    <link rel="StyleSheet" href="/fsmch/javascript/dtree.css" type="text/css" />
	<script type="text/javascript" src="/fsmch/javascript/dtree.js"></script>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<script language="jscript" src="../javascript/newtable.js"></script>
	
	<link rel="StyleSheet" href="/fsmch/fsmch/javascript/dtree.css" type="text/css" />
	<script type="text/javascript" src="/fsmch/fsmch/javascript/dtree.js"></script>
	 
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
  <link rel="stylesheet" type="text/css" href="/fsmch/images/screen.css"> 
  <script language="javascript">
  function layerHttpRequest(){
	       var http_request = creatHttpRequest();
	       http_request.onreadystatechange = layerSelectAjax;
           http_request.open('GET', "/fsm/servlet/PeerCompTreeAjax?peerCompId="+peerCompId, true);
           http_request.send(null);     
       }
       </script>
  </head>
  
  <body>
  <%  
      
     //��ȡ��peerComponentDescription.jsp������back��peerCompId��layerId��productId
   String back = new String(request.getParameter("back"));
   Integer peerCompId = new Integer(request.getParameter("peerCompId"));
   Integer layerId = new Integer(request.getParameter("layerId"));
   Integer productId = new Integer(request.getParameter("productId"));
   Integer fatherId = new Integer(request.getParameter("fatherId"));
         
      MappingPhase mp = new MappingPhase();
      MeasurePhase mp1 = new MeasurePhase();
      StrategyPhase sp = new StrategyPhase();
      CountFPNumber cfpn = new CountFPNumber();
      ViewReportTreeService vrts = new ViewReportTreeService(); 
      List funcProsList = mp.getFunctionProcessByPeerCompId(peerCompId);
      FsmPeerComponent fpc = (FsmPeerComponent) sp.getPeerComponentById(peerCompId);
      Integer measureStatus = fpc.getMeasureStatus();
	  String measureStatusName = null;
	  String tree = vrts.buildReportTree(peerCompId,back,productId);
	  switch (measureStatus)  
	         {
		         case 0:measureStatusName = "δ����";break;
		         case 1:measureStatusName = "���ֹ���";break;
		         case 2:measureStatusName = "ȫ������";break;
		         default:measureStatusName = "״̬����";
	         }       
  %>
  
  
  
	<h2>�öԵ�����Ĺ��ܵ����Ϊ<%=cfpn.CountFPNumber1(fpc) %>�����������</h2>
	<table border="1">
	  
	    <tr>
	    <th>�Ե��������</th>
	    <td><%=fpc.getPeerCompName()%></td>
	    </tr>
	    <tr>
	     <th>����״̬</th>
	     <td><%=measureStatusName%></td>
	     </tr>	          			   
	     <tr>
	     <th>���ܵ����</th>
	     <td><%=cfpn.CountFPNumber1(fpc) %></td>
	  </tr>	 
	    <tr> 
	    <th>�����������</th>
	    <td>	       
      <div class="dtree">
		<script type="text/javascript">
	
		d = new dTree('d');
		<%=tree%>
		document.write(d);
     </script>
		</div>       			        
	</td></tr>	      	   
	</table>
	
  </body>
</html>
