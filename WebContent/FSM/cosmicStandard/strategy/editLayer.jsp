<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@ page import="business.FSM.StrategyPhase" %>
<%@ page import="business.FSM.MappingPhase" %>
<%@ page import="hibernate.FSM.FsmLayer" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'editLayer.jsp' starting page</title>
    
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
		function verifyInput(layerUn,layerPart,layerAll)
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
			}else
			{			    
			        switch(frm.measureStatus.value)
			        {
			          case '0': //����Ϊδ����״̬
			            { if(layerUn==false)
			              {
					     	 alert("�˹���״̬�����޸ģ�");
				             frm.measureStatus.focus();
				             return false;break;
                          }else
				          {
				             return true; break;      
				          } 
			            }
			         case '1': //����Ϊ���ֹ���
			          { if(layerPart==false)
			              {
					     	 alert("�˹���״̬�����޸ģ�");
				             frm.measureStatus.focus();
				             return false;break;
                          }else
				          {
				             return true; break;      
				          } 
			            }
			          case '2': //����Ϊȫ������
			          { if(layerAll==false )
			              {
					     	 alert("�˹���״̬�����޸ģ�");
				             frm.measureStatus.focus();
				             return false;break;
                          }else
				          {
				             return true; break;      
				          } 
			            }   
			        } 		
			  }
		
		function test()
		{
		  alert("test");
		  return false;
		}
      }
		
	</script>
  </head>
  
  <body>
      <%
       /*��ȡ��ҳ��layer.jsp����layerId��productId*/
      Integer layerId = new Integer(request.getParameter("layerId")); %>
      
      <%   
      Integer productId = new Integer(request.getParameter("productId"));
      
      /*�����ݿ��а�idΪlayerId�Ĳ��ȡ��*/
      StrategyPhase sp = new StrategyPhase(); //ҵ��㣬��Ӧ��COSMIC�����Ĳ��Խ׶�
      FsmLayer layer = (FsmLayer)sp.getLayerById(layerId);
     
      //��֤����״̬�Ƿ�ɱ��޸�
      boolean layerUn = true;
      boolean layerPart = true;
      boolean layerAll = true;
      
      List peerCompList = sp.getPeerComponentByLayerId(layerId);
      List peerCompStatus0List = sp.getPeerComponentByLayerIdAndMeasureStatus(layerId,0);
      List peerCompStatus1List = sp.getPeerComponentByLayerIdAndMeasureStatus(layerId,1);
      List peerCompStatus2List = sp.getPeerComponentByLayerIdAndMeasureStatus(layerId,2);        
	  if((peerCompStatus1List!=null&&peerCompStatus1List.size()!=0) || (peerCompStatus2List!=null&&peerCompStatus2List.size()!=0)) 
	     layerUn = false; //���ò�ΰ����ĶԵ�������Ѿ��б����ֹ������ȫ������ģ��򲻿��޸�     
      if((peerCompStatus1List==null||peerCompStatus1List.size()==0) && (peerCompStatus2List==null||peerCompStatus2List.size()==0)) //�޸�Ϊ���ֹ���
	     layerPart = false; //���ò�ΰ����ĶԵ������û�б����ֹ����ȫ������ģ��򲻿��޸�     
      if(peerCompList==null || peerCompList.size()==0)//��Ϊȫ��������
	     layerAll = false;//�����û�жԵ���������ܱ��޸�
      if((peerCompStatus0List!=null&&peerCompStatus0List.size()!=0) || (peerCompStatus1List!=null&&peerCompStatus1List.size()!=0)) 
	     layerAll = false; //���ò�ΰ����ĶԵ�������б����ֹ������δ����ģ��򲻿��޸�  
      %> 
         
  <form action="/fsmch/FSM/editLayer.do" name="layerForm" method="post" onSubmit="return verifyInput(<%=layerUn%>,<%=layerPart%>,<%=layerAll%>);">
 
      <table>
         <tr>
            <td width="15%">�����</td>
            <td> <input type="text" name="layerName" value="<%=layer.getLayerName()%>"/> </td>        
         </tr>
        <tr>
            <td width="15%">�������</td> 
            <td><input type="text" name="layerDesp" value="<%=layer.getLayerDesp() %>"/>   </td>     
         </tr>
         <tr>
  			<td width="15%">����״̬</td>
  			<% 
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
  			<td>
  			 	<select name="measureStatus" style="width:160px">
  			 	    <option value="<%=measureStatus %>"><%=measureStatusName %></option>
  			 	    <option value="0" >δ����</option>
  					<option value="1">���ֹ���</option>
  					<option value="2">ȫ������</option>
  				</select>
            </td>
  		</tr>
       
         <tr>
            <td> <input type="submit" name="submit" value="�޸Ĳ��"/> </td>        
         </tr>
         
      </table>
      <input type="hidden" name="id" value="<%=layerId%>"/>  
      <input type="hidden" name="productId" value="<%=productId%>"/> 
    </form>
  </body>
</html>
