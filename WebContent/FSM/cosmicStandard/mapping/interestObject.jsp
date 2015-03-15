<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@ page import="business.FSM.ProductMeasureBusiness" %>
<%@ page import="business.FSM.StrategyPhase" %>
<%@ page import="business.FSM.MappingPhase" %>
<%@ page import="hibernate.FSM.FsmProduct" %>
<%@ page import="hibernate.FSM.FsmLayer" %>
<%@ page import="hibernate.FSM.FsmPeerComponent" %>
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
    
    <title>My JSP 'interestObject.jsp' starting page</title>
    
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
		var frm = document.interestObjectForm;
	   
			if(isEmpty(frm.interestObjName.value)) 
			{
				alert("����д��Ȥ�������ƣ�");
				frm.interestObjName.focus();
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
          <td width="15%">�������:</td> <td><%=peerCompName%></td>
      </tr>
       <tr> 
          <td width="15%">�������:</td> <td><%=layerName %></td>
      </tr>
    </table>
    <hr>
   <h2> ��Ȥ�����б�</h2>
       <%
       //�����ݿ��аѴ˶Ե��������Ȥ������Ϣȫ��ȡ��
       MappingPhase mp = new MappingPhase();
       List interObjList = mp.getInterestObjectByPeerCompId(peerCompId);
       FsmInterestObject fio = new FsmInterestObject();   //����ʵ��Bean
       //������Ȥ������Ϣ����ʾ��ӣ�������Ȥ������Ϣ���г���Ȥ�����б�
       if(interObjList==null ||interObjList.size()==0 ){%>  
         <h1 style="color:red">Ŀǰ����Ȥ������Ϣ���������Ȥ����</h1> 
       <%}else{ %>
	    <table>
	      <tr> 
	          <th>���</th>
	          <th>��Ȥ����</th>
	          <th>����</th>
	          <th>�޸�</th>
	          <th>ɾ��</th>
	          <th>���������</th>
	      </tr>
  	     <%   for(Object obj:interObjList){ 
	         fio = (FsmInterestObject)obj; 
	         Integer interestObjId = fio.getId(); 
	          
	     %>
	         <tr>
		          <td><%= interObjList.indexOf(obj)+1 %></td> 
		          <td><%= fio.getInterestObjName() %></td>
		          <td><a href="/fsmch/FSM/cosmicStandard/mapping/interestObjectDescription.jsp?interestObjId=<%=interestObjId%>&peerCompId=<%=peerCompId%>&productId=<%=productId%>&layerId=<%=layerId%>"><IMG src="/fsmch/images/btncheck.gif" alt="�鿴" border="0" /></a></td>
		      	  <td><a href="/fsmch/FSM/cosmicStandard/mapping/editInterestObject.jsp?interestObjId=<%=interestObjId%>&peerCompId=<%=peerCompId%>"><IMG src="/fsmch/images/btnedit.gif" alt="�޸�" border="0" /></a></td>
		          <td>
		            <a href="/fsmch/FSM/cosmicStandard/mapping/delInterestObject.jsp?interestObjId=<%=interestObjId%>&peerCompId=<%=peerCompId%>" onclick="return confirmdel();"><IMG src="/fsmch/images/btndel.gif" alt="ɾ��" width="15" height="12" border="0" /></a>
		          </td>
		          <td><a href="/fsmch/FSM/cosmicStandard/mapping/addDataGroup.jsp?interestObjId=<%=interestObjId%>&productId=<%=productId%>&layerId=<%=layerId%>&peerCompId=<%=peerCompId%>">���������</a></td>
	         </tr>  
          <%}%>
           </table>
         <%} %>
  <hr>
      <h3>�����Ȥ����</h3>
     <form action="/fsmch/FSM/addInterestObject.do" name="interestObjectForm" method="post" onSubmit="return verifyInput();"> 
      <table>
        <tr>
  			<td width="10%">��Ȥ��������</td>
  			<td >
  			    <input type="text" name="interestObjName" style="width:160px" value=""/ >
            </td>
  		</tr>
  		<tr>
  			<td width="10%">��Ȥ��������</td>
  			<td >
  			    <textarea name="interestObjDesp" wrap="soft" cols="25" rows="5"></textarea>
            </td>
  		</tr>
        
         
         <tr>
            <td> <input type="submit" name="submit" value="�����Ȥ����"/> </td>        
         </tr>
      </table>   
      
      <input type="hidden" name="peerCompId" value="<%=peerCompId%>"/>
    </form>
    <%} %>
  </body>
</html>
