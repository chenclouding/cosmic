<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@ page import="business.FSM.ProductMeasureBusiness" %>
<%@ page import="business.FSM.StrategyPhase" %>
<%@ page import="business.FSM.MappingPhase" %>
<%@ page import="hibernate.FSM.FsmProduct" %>
<%@ page import="hibernate.FSM.FsmLayer" %>
<%@ page import="hibernate.FSM.FsmPeerComponent" %>
<%@ page import="hibernate.FSM.FsmEvent" %>
<jsp:useBean id="projectMeasureBean" scope="session" class="javaBeans.fsm.ProjectMeasureBean"/> 
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'event.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
 <link rel="stylesheet" type="text/css" href="/fsmch/images/screen.css">
  <script language="JavaScript" src="/fsmch/javascript/verify.js"></script>
  <script language="JavaScript">
        function confirmdel(){
        return confirm("ȷ��ɾ����");
	}	  
		function verifyInput()
	  {	
		var frm = document.eventForm;
	   
			if(isEmpty(frm.eventName.value)) 
			{
				alert("����д�¼����ƣ�");
				frm.eventName.focus();
				return false;
			}
			
		}
		
	</script>
  </head>
  
  <body>
	<% 
	if(projectMeasureBean.getProductId()==null || projectMeasureBean.getPeerCompId()==null||projectMeasureBean.getLayerId()==null)
          response.sendRedirect("/fsmch/FSM/cosmicStandard/mapping/alertFunctionProcess.jsp");
    else{
	   //��projectMeasureBean���productId��peerCompId��layerId
	   Integer productId = projectMeasureBean.getProductId();
	   Integer peerCompId = projectMeasureBean.getPeerCompId();
	   Integer layerId = projectMeasureBean.getLayerId();
	   //���ո���ID������ȡ����
	   ProductMeasureBusiness pmb = new ProductMeasureBusiness();
	   StrategyPhase sp = new StrategyPhase();
	   String productName = ((FsmProduct)pmb.getProductById(productId)).getProductName();
	   String peerCompName = ((FsmPeerComponent)sp.getPeerComponentById(peerCompId)).getPeerCompName();
	   String layerName  = ((FsmLayer)sp.getLayerById(layerId)).getLayerName();  
	%>
   <h1> �������</h1>
    <table>
      <tr> 
          <td width="15%">�������:</td> <td><%=productName%></td>
      </tr>
       <tr> 
          <td width="15%">�������:</td> <td><%=layerName%></td>
      </tr>
       <tr> 
          <td width="15%">�������:</td> <td><%=peerCompName %></td>
      </tr>
    </table>
    <hr>
   <h2> �¼��б�</h2>
       <%
       //�����ݿ��аѴ��¼����¼���Ϣȫ��ȡ��
       MappingPhase mp = new MappingPhase();
       List eventList = mp.getEventByPeerCompId(peerCompId);
       FsmEvent fe = new FsmEvent();   //����ʵ��Bean
       //�����¼���Ϣ����ʾ��ӣ������¼���Ϣ���г��¼��б�
       if(eventList==null ||eventList.size()==0 ){%>  
         <h1 style="color:red">Ŀǰ���¼���Ϣ��������¼�</h1> 
       <%}else{ %>
	    <table>
	      <tr> 
	          <th>���</th>
	          <th>�¼�</th>
	          <th>����</th>
	          <th>�޸�</th>
	          <th>ɾ��</th>
	      </tr>
  	     <%   for(Object obj:eventList){ 
	         fe = (FsmEvent)obj; 
	         Integer eventId = fe.getId(); 
	        
	        
	     %>
	         <tr>
		          <td><%= eventList.indexOf(obj)+1 %></td> 
		          <td><%= fe.getEventName() %></td>
		          <td><a href="/fsmch/FSM/cosmicStandard/mapping/eventDescription.jsp?peerCompId=<%=peerCompId%>&eventId=<%=eventId%>&productId=<%=productId%>&layerId=<%=layerId%>"><IMG src="/fsmch/images/btncheck.gif" alt="�鿴" border="0" /></a></td>
		      	  <td><a href="/fsmch/FSM/cosmicStandard/mapping/editEvent.jsp?peerCompId=<%=peerCompId%>&eventId=<%=eventId%>"><IMG src="/fsmch/images/btnedit.gif" alt="�޸�" border="0" /></a></td>
		          <td>
		            <a href="/fsmch/FSM/cosmicStandard/mapping/delEvent.jsp?eventId=<%=eventId%>" onclick="return confirmdel();"><IMG src="/fsmch/images/btndel.gif" alt="ɾ��" width="15" height="12" border="0" /></a>		          
		          </td>
	         </tr>  
          <%}%>
           </table>
         <%} %>
  <hr>
      <h3>����¼�</h3>
     <form action="/fsmch/FSM/addEvent.do" name="eventForm" method="post" onSubmit="return verifyInput();"> 
      <table>
        <tr>
  			<td width="10%">�¼�����</td>
  			<td >
  			    <input type="text" name="eventName" style="width:160px" value=""/ >
            </td>
  		</tr>
  		<tr>
  			<td width="10%">�¼�����</td>
  			<td >
  			    <textarea name="eventDesp" wrap="soft" cols="25" rows="5"></textarea>
            </td>
  		</tr>
         
         <tr>
            <td> <input type="submit" name="submit" value="����¼�"/> </td>        
         </tr>
      </table>   
      
      <input type="hidden" name="peerCompId" value="<%=peerCompId%>"/>
    </form>
    <%} %>
  </body>
</html>
