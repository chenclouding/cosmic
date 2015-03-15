<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@ page import="business.FSM.ProductMeasureBusiness" %>
<%@ page import="hibernate.FSM.FsmProduct" %>
<%@ page import="business.FSM.StrategyPhase" %>
<%@ page import="hibernate.FSM.FsmLayer" %>
<jsp:useBean id="projectMeasureBean" scope="session" class="javaBeans.fsm.ProjectMeasureBean"/> 
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'layer.jsp' starting page</title>
    
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
		var frm = document.layerForm;
	   
			if(isEmpty(frm.layerName.value)) 
			{
				alert("����д������ƣ�");
				frm.layerName.focus();
				return false;
			}
			if(isEmpty(frm.measureStatus.value)) 
			{
				alert("��ѡ����״̬��");
				frm.measureStatus.focus();
				return false;
			}
		}
		
	</script>
  </head>
  
  <body>
      <%
      if(projectMeasureBean.getProductId()==null )
          response.sendRedirect("/fsmch/FSM/cosmicStandard/strategy/alertStrategy.jsp");
      else{
        //��projectMeasureBean���productId  
        Integer productId = projectMeasureBean.getProductId();
        
      %>
      <h4> ����б�</h4>
      <% /*�����ݿ��а�����Ĳ����Ϣȡ��*/
       StrategyPhase sp = new StrategyPhase(); //ҵ��㣬��Ӧ��COSMIC�����Ĳ��Խ׶�
       List layerList = sp.getLayerByProductId(productId);
       FsmLayer layer = new FsmLayer();//����ʵ��Bean
     
       /*���޲����Ϣ����ʾ��ӣ����в����Ϣ���г�����б�*/
       if(layerList==null ||layerList.size()==0 ){%>  
         <h1 style="color:red">Ŀǰ�޲����Ϣ������Ӳ��</h1> 
       <%}else{ %>
         <table>
	       <tr> 
		        <td >���</td> 
		        <td>�������</td>
		        <td>����״̬</td>
		        <td>�鿴</td>
		        <td>�޸�</td>
		        <td>ɾ��</td>
		        <td>����ӳ��</td>
		        <td>������������</td>
	       </tr> 
	    <%   for(Object p:layerList){ 
	         layer = (FsmLayer)p; 
	         Integer layerId = layer.getId(); 
	         //����״̬�ķ���ֵ����״̬��ֵ 
	         Integer measureStatus = layer.getMeasureStatus();
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
		          <td><%= layerList.indexOf(p)+1 %></td> 
		          <td><%= layer.getLayerName() %></td>
		          <td><%= measureStatusName %></td>
		          <td><a href="/fsmch/FSM/cosmicStandard/strategy/layerDescription.jsp?layerId=<%=layerId%>&productId=<%=productId%>"><IMG src="/fsmch/images/btncheck.gif" alt="�鿴" border="0" /></a></td>
		          <td><a href="/fsmch/FSM/cosmicStandard/strategy/editLayer.jsp?layerId=<%=layerId%>&productId=<%=productId%>"><IMG src="/fsmch/images/btnedit.gif" alt="�޸�" border="0" /></a></td>
		          <td><a href="/fsmch/FSM/cosmicStandard/strategy/delLayer.jsp?layerId=<%=layerId%>&productId=<%=productId%>" onclick="return confirmdel();"><IMG src="/fsmch/images/btndel.gif" alt="ɾ��" width="15" height="12" border="0" /></a></td>
		          <td><a href="/fsmch/FSM/cosmicStandard/strategy/peerComponent.jsp?layerId=<%=layerId%>&productId=<%=productId%>">��ӶԵ����</a></td>
		          <td><a href="/fsmch/FSM/cosmicStandard/strategy/layerMeasureReport1.jsp?layerId=<%=layerId%>&productId=<%=productId%>">������������</a></td>
	         </tr>  
          <%}%>
           </table>
        <%}%>  
     
   
   
    <form action="/fsmch/FSM/addLayer.do" name="layerForm" method="post" onSubmit="return verifyInput();">
      <table>
         <tr>
            <td width="15%">�����</td>
            <td> <input type="text" name="layerName" value=""/> </td>        
         </tr>
        <tr>
  			<td width="10%">�������</td>
  			<td >
  			    <textarea name="layerDesp" wrap="soft" cols="25" rows="5"></textarea>
            </td>
  		</tr>
        
         <tr>
            <td> <input type="submit" name="submit" value="��Ӳ��"/> </td>        
         
              <td><input type="reset" name="reset" value="����"/></td>
            </tr> 
      </table>
       <!--0����δ���й��㣬1����������ֱ����㣬2�������ȫ�������� -->
      <input type="hidden" name="measureStatus" value="0"/>
      <input type="hidden" name="productId" value="<%=productId%>"/>
    </form>
     <hr>
   
  <%} %>
  </body>
</html>
