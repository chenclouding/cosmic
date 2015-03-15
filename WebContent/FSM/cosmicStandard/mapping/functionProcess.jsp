<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@ page import="business.FSM.ProductMeasureBusiness" %>
<%@ page import="business.FSM.StrategyPhase" %>
<%@ page import="business.FSM.MappingPhase" %>
<%@ page import="hibernate.FSM.FsmProduct" %>
<%@ page import="hibernate.FSM.FsmLayer" %>
<%@ page import="hibernate.FSM.FsmPeerComponent" %>
<%@ page import="hibernate.FSM.FsmFunctionProcess" %>
<jsp:useBean id="projectMeasureBean" scope="session" class="javaBeans.fsm.ProjectMeasureBean"/> 

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'functionProcess.jsp' starting page</title>
    
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
		var frm = document.functionProcessForm;
	   
			if(isEmpty(frm.funcProsName.value)) 
			{
				alert("����д�����������ƣ�");
				frm.funcProsName.focus();
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
          <td width="15%">�������:</td> <td><%=peerCompName%></td>
      </tr>
    </table>
    <hr>
    <h2> ���������б�</h2>
       <%
       //�����ݿ��аѴζԵ�����Ĺ���������Ϣȫ��ȡ��
       MappingPhase mp = new MappingPhase();
       List funcProsList = mp.getFunctionProcessByPeerCompId(peerCompId);
       FsmFunctionProcess funcPros = new FsmFunctionProcess();   //����ʵ��Bean
       //���޹���������Ϣ����ʾ��ӣ����й���������Ϣ���г����������б�
       if(funcProsList==null ||funcProsList.size()==0 ){%>  
         <h1 style="color:red">Ŀǰ�޹���������Ϣ������ӹ�������</h1> 
       <%}else{ %>
	    <table>
	      <tr> 
	          <th>���</th>
	          <th>��������</th>
	          <th>����״̬</th>
	          <th>����</th>
	          <th>�޸�</th>
	          <th>ɾ��</th>
	      </tr>
  	     <%   for(Object f:funcProsList){ 
	         funcPros = (FsmFunctionProcess)f; 
	         Integer funcProsId = funcPros.getId();	        
	         //����״̬�ķ���ֵ����״̬��ֵ 
	         Integer measureStatus = funcPros.getMeasureStatus();
	         String measureStatusName = null;
	         switch (measureStatus)  
	         {
		         case 0:measureStatusName = "δ����";break;
		         case 1:measureStatusName = "���ֹ���";break;
		         case 2:measureStatusName = "ȫ������";break;
		         default:measureStatusName = "״̬����";
	         }
	          %>
	         <tr>
		          <td><%= funcProsList.indexOf(f)+1 %></td> 
		          <td><%= funcPros.getFuncProsName() %></td>
		          <td><%= measureStatusName %></td>
		          <td><a href="/fsmch/FSM/cosmicStandard/mapping/functionProcessDescription.jsp?funcProsId=<%=funcProsId%>&peerCompId=<%=peerCompId%>&productId=<%=productId%>&layerId=<%=layerId%>"><IMG src="/fsmch/images/btncheck.gif" alt="�鿴" border="0" /></a></td>
		      	  <td><a href="/fsmch/FSM/cosmicStandard/mapping/editFunctionProcess.jsp?peerCompId=<%=peerCompId%>&funcProsId=<%=funcProsId%>"><IMG src="/fsmch/images/btnedit.gif" alt="�޸�" border="0" /></a></td>
		          <td>
		            <a href="/fsmch/FSM/cosmicStandard/mapping/delFunctionProcess.jsp?funcProsId=<%=funcProsId%>" onclick="return confirmdel();"><IMG src="/fsmch/images/btndel.gif" alt="ɾ��" width="15" height="12" border="0" /></a>	          
		          </td>
	         </tr>  
          <%}%>
           </table>
         <%} %>
  <hr>
     <h3>��ӹ�������</h3>
     <form action="/fsmch/FSM/addFunctionProcess.do" name="functionProcessForm" method="post" onSubmit="return verifyInput();"> 
      <table>
         <tr>
            <td width="10%">������������</td>
  			<td ><input type="text" name="funcProsName" value=""/></td>        
         </tr>
         <tr>
  			<td width="10%">��������������</td>
  			<td >
  			    <textarea name="funcProsDesp" wrap="soft" cols="25" rows="5"></textarea>
            </td>
  		</tr>
         
         
         <tr>
            <td> <input type="submit" name="submit" value="��ӹ�������"/> </td>        
         </tr>
      </table>   
      <!--0����δ���й��㣬1����������ֱ����㣬2�������ȫ�������� -->
      <input type="hidden" name="measureStatus" value="0"/>
      <input type="hidden" name="peerCompId" value="<%=peerCompId%>"/>
    </form>

  <%} %>
</body>
</html>
