<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@ page import="business.FSM.StrategyPhase" %>
<%@ page import="hibernate.FSM.FsmPeerComponent" %>
<jsp:useBean id="projectMeasureBean" scope="session" class="javaBeans.fsm.ProjectMeasureBean"/>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'addSubPeerComponent.jsp' starting page</title>
    
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
		var frm = document.peerCompForm;
	
				
			if(isEmpty(frm.peerCompName.value)) 
			{
				alert("����д�Ե�������ƣ�");
				frm.employeeName.focus();
				return false;
			}
			if(isEmpty(frm.measureStatus.value)) 
			{
				alert("��ѡ��Ե����״̬��");
				frm.measureStatus.focus();
				return false;
			}
			if(isEmpty(frm.compType.value)) 
			{
				alert("��ѡ��Ե�������ͣ�");
				frm.compType.focus();
				return false;
			}
		}
		//�˺�����ʱû��
		function setCompSelect()
		{	
		   var selectTag = null; //select���
		   selectTag = document.getElementById("_compType"); //��ȡselect��ǣ�Ԫ�أ�
		   var index = selectTag.selectedIndex;//��ȡ��ѡ�е�optionԪ�ص��±�
		   selectTag.options[index].selected=true;//��Ǳ�ѡ�е�optionsԪ�أ����������������
		}
	</script>
  </head>
  
  <body>
      <%
      String back = "subPeerComp";
      Integer stratetyProductId = new Integer(request.getParameter("productId"));//��addPeerComponent.jsp��ã�����ת��mappingPhase.jsp
      Integer fatherId = new Integer(request.getParameter("fatherId"));//��ȡ��ҳ��peerComponent.jsp����peerCompId || ��ȡ��ҳ��addSubPeerComponent.jsp����peerCompId
      Integer layerId = new Integer(request.getParameter("layerId"));//��ȡ��ҳ��layer.jsp||peerComponent.jsp||addSubPeerComponent.jsp����layerId 
     
      %>
     
      <h4> �Ե�����б�</h4>
      <% 
       /*�����ݿ��аѱ���ĶԵ������Ϣȡ��*/
       StrategyPhase sp = new StrategyPhase(); //ҵ��㣬��Ӧ��COSMIC�����Ĳ��Խ׶�
       List peerCompList = sp.getPeerComponentByLayerIdAndFatherId(layerId,fatherId);
       FsmPeerComponent peerComp = new FsmPeerComponent();//����ʵ��Bean
       /*���޶Ե������Ϣ����ʾ��ӣ����жԵ������Ϣ���г��Ե�����б�*/
       if(peerCompList==null ||peerCompList.size()==0 ){%>  
         <h1 style="color:red">Ŀǰ�޶Ե������Ϣ������ӶԵ����</h1> 
       <%}else{ %>
         <table>
	       <tr> 
		        <td >���</td> 
		        <td>�Ե��������</td>
		        <td>����״̬</td>
		        <td>�鿴</td>
		        <td>�޸�</td>
		        <td>ɾ��</td>
		        <td>��ӹ�������</td>
		        <td>������������</td>
	       </tr> 
	    <%   for(Object p:peerCompList){ 
	         peerComp = (FsmPeerComponent)p; 
	         Integer peerCompId = peerComp.getId();
	         //����״̬�ķ���ֵ����״̬��ֵ 
	         Integer measureStatus = peerComp.getMeasureStatus();
	         String measureStatusName = null;
	         switch (measureStatus)  
	         {
		         case 0:measureStatusName = "δ����";break;
		         case 1:measureStatusName = "���ֹ���";break;
		         case 2:measureStatusName = "ȫ������";break;
		         default:measureStatusName = "״̬����";
	         }
	         Integer compType = peerComp.getCompType();//���ݶԵ���������ͣ��ж��Ǹ��Ե������ӹ������̻��������
	     %>
	         <tr>
		          <td><%= peerCompList.indexOf(p)+1 %></td> 
		          <td><%= peerComp.getPeerCompName() %></td>
		          <td><%= measureStatusName %></td>
		          <td><a href="/fsmch/FSM/cosmicStandard/strategy/peerComponentDescription.jsp?peerCompId=<%=peerCompId%>&productId=<%=stratetyProductId%>&layerId=<%=layerId %>&back=<%=back%>&fatherId=<%=fatherId %>"><IMG src="/fsmch/images/btncheck.gif" alt="�鿴" border="0" /></a></td>
		          <td><a href="/fsmch/FSM/cosmicStandard/strategy/editSubPeerComponent.jsp?peerCompId=<%=peerCompId%>&layerId=<%=layerId%>&productId=<%=stratetyProductId%>&fatherId=<%=fatherId %>"><IMG src="/fsmch/images/btnedit.gif" alt="�޸�" border="0" /></a></td>
		          <td><a href="/fsmch/FSM/cosmicStandard/strategy/delSubPeerComponent.jsp?peerCompId=<%=peerCompId%>&layerId=<%=layerId%>&productId=<%=stratetyProductId%>&fatherId=<%=fatherId %>" onclick="return confirmdel();"><IMG src="/fsmch/images/btndel.gif" alt="ɾ��" width="15" height="12" border="0" /></a></td>
		         <%if(compType==0 && measureStatus!=2){//�������������������û�н������㣬�����Ӵ���"��ӶԵ����" %>
		            <td><a href="javascript:window.name=='contentFrame'?window.location='/fsmch/FSM/cosmicStandard/strategy/addSubPeerComponent.jsp?fatherId=<%=peerCompId%>&layerId=<%=layerId%>&productId=<%=stratetyProductId%>':parent.location.href='/fsmch/FSM/cosmicStandard/strategy/addSubPeerComponent.jsp?fatherId=<%=peerCompId%>&layerId=<%=layerId%>'">����ӶԵ����</a></td>
	             <%}else if(compType==1 && measureStatus!=2){//���������ԭ���������û�н������㣬�����Ӵ���"��ӹ�������"{ %>
	                 <jsp:setProperty name="projectMeasureBean" property="productId" value="<%=stratetyProductId%>" />
                     <jsp:setProperty name="projectMeasureBean" property="layerId" value="<%=layerId%>" />
                     <jsp:setProperty name="projectMeasureBean" property="peerCompId" value="<%=peerCompId%>" />                     
	                <td><a href="javascript:window.name=='compFrame'?parent.location='/fsmch/FSM/cosmicStandard/mapping/functionProcess.jsp?back=<%=back %>':window.location.href='/fsmch/FSM/cosmicStandard/mapping/functionProcess.jsp?back=<%=back %>'">��ӹ�������</a></td>
	             <%}else{ %>
	                <td>������ɣ��������</td>
	             <%}%>
	              <td><a href="javascript:window.name=='compFrame'?parent.location='/fsmch/FSM/cosmicStandard/strategy/peerCompMeasureReport1.jsp?peerCompId=<%=peerCompId%>&productId=<%=stratetyProductId%>&back=<%=back %>&layerId=<%=layerId %>&fatherId=<%=fatherId %>':window.location.href='/fsmch/FSM/cosmicStandard/strategy/peerCompMeasureReport1.jsp?peerCompId=<%=peerCompId%>&productId=<%=stratetyProductId%>&back=<%=back %>&layerId=<%=layerId %>&fatherId=<%=fatherId %>'">������������</a></td>
	         </tr>  
          <%}%>
           </table>
        <%}%> 
     <!--form������ӶԵ����  -->   
     <form action="/fsmch/FSM/addPeerComponent.do?productId=<%=stratetyProductId %>" name="peerCompForm" method="post" onSubmit="return verifyInput();">
      <table>
         <tr>
            <td width="15%">�Ե������</td>
            <td> <input type="text" name="peerCompName" value=""/> </td>        
         </tr>
        <tr>
            <td width="15%">�Ե��������</td> 
            <td><input type="text" name="peerCompDesp" value=""/>   </td>     
         </tr>
        <tr>
  		    <td width="15%">�Ե��������</td>
  			<td>
  			 	<select name="compType" id="_compType" style="width:160px">
  			 	    <option value="">=��ѡ��=</option>
  			 	    <!-- 0������������1����ԭ����� -->
  			 	    <option value="0">������</option>
  					<option value="1">ԭ�����</option>
  				</select>
            </td>
  		</tr>
         <tr>
            <td> 
              <input type="submit" name="submit" value="��ӶԵ����"/> 
            </td> 
            <td>
              <input type="reset" name="reset" value="����"/>
            </td>            
         </tr>
      </table>
      <!--0����δ���й��㣬1����������ֱ����㣬2�������ȫ�������� -->
      <input type="hidden" name="measureStatus" value="0"/>
      <input type="hidden" name="layerId" value="<%=layerId%>"/>
      <input type="hidden" name="fatherId" value="<%=fatherId%>"/> 
    </form>
     <hr>
     <a href="/fsmch/FSM/cosmicStandard/strategy/peerComponent.jsp?layerId=<%=layerId%>&productId=<%=stratetyProductId %>">����ԭʼ����б�</a> 

  </body>
</html>
