<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@ page import="business.FSM.StrategyPhase" %>
<%@ page import="business.FSM.ProductMeasureBusiness" %>
<%@ page import="hibernate.FSM.FsmProduct" %>
<%@ page import="hibernate.FSM.FsmLayer" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'editProduct.jsp' starting page</title>
    
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
		function verifyInput(productUn,productPart,productAll)
	  {	
		    var frm = document.productForm;		    		    	   
			if(isEmpty(frm.productName.value)) 
			{	
			    alert("����д������ƣ�");
				frm.productName.focus();
				return false;
			}									
			if(isEmpty(frm.productType.value)) 
			{
				alert("����д������ͣ�");
				frm.productType.focus();
				return false;
			}		
			if(isEmpty(frm.developType.value)) 
			{
				alert("����д��Ŀ���ͣ�");
				frm.developType.focus();
				return false;
			}
			
			if(isEmpty(frm.measureMethod.value)) 
			{
				alert("����д���㷽����");
				frm.measureMethod.focus();
				return false;
			}
			
			if(isEmpty(frm.lifecyclePhase.value)) 
			{
				alert("����д�������ڽ׶Σ�");
				frm.lifecyclePhase.focus();
				return false;
			}
			
			if(isEmpty(frm.measureStatus.value)) 
			{
				alert("��ѡ���������״̬��");
				frm.measureStatus.focus();
				return false;
			}else
			{			    
			        switch(frm.measureStatus.value)
			        {
			          case '0': //����Ϊδ����״̬
			            { if(productUn==false)
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
			          { if(productPart==false)
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
			          { if(productAll==false )
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
       /*��ȡ��ҳ��projectMeasure.jsp����productId*/  
      Integer productId = new Integer(request.getParameter("productId"));
      
      /*�����ݿ��а�idΪproductId�����ȡ��*/
      StrategyPhase sp = new StrategyPhase(); //ҵ��㣬��Ӧ��COSMIC�����Ĳ��Խ׶�
      ProductMeasureBusiness pmb= new ProductMeasureBusiness();
      FsmProduct product = (FsmProduct)pmb.getProductById(productId);
     
      //��֤����״̬�Ƿ�ɱ��޸�
      boolean productUn = true;
      boolean productPart = true;
      boolean productAll = true;
      
      List layerList = sp.getLayerByProductId(productId);
      List layerStatus0List = sp.getLayerByProductIdAndMeasureStatus(productId,0);
      List layerStatus1List = sp.getLayerByProductIdAndMeasureStatus(productId,1);
      List layerStatus2List = sp.getLayerByProductIdAndMeasureStatus(productId,2);        
	  if((layerStatus1List!=null&&layerStatus1List.size()!=0) || (layerStatus2List!=null&&layerStatus2List.size()!=0)) 
	     productUn = false; //���ò�ΰ����ĶԵ�������Ѿ��б����ֹ������ȫ������ģ��򲻿��޸�     
      if((layerStatus1List==null||layerStatus1List.size()==0) && (layerStatus2List==null||layerStatus2List.size()==0)) //�޸�Ϊ���ֹ���
	     productPart = false; //���ò�ΰ����ĶԵ������û�б����ֹ����ȫ������ģ��򲻿��޸�     
      if(layerList==null || layerList.size()==0)//��Ϊȫ��������
	     productAll = false;//�����û�жԵ���������ܱ��޸�
      if((layerStatus0List!=null&&layerStatus0List.size()!=0) || (layerStatus1List!=null&&layerStatus1List.size()!=0)) 
	     productAll = false; //���ò�ΰ����ĶԵ�������б����ֹ������δ����ģ��򲻿��޸�  
      %>
      
      <form action="/fsmch/FSM/editProduct.do" name="productForm" method="post" onSubmit="return verifyInput(<%=productUn%>,<%=productPart%>,<%=productAll%>);">
      
      <table>
         <tr>
            <td width="15%">�����������</td>
            <td> <input type="text" name="productName" value="<%=product.getProductName()%>"/> </td>        
         </tr>
        <tr>
            <td width="15%">�������������</td> 
            <td><input type="text" name="productDesp" value="<%=product.getProductDesp() %>"/>   </td>     
         </tr>
         <tr>
  			<td width="10%">�������</td>
  			<% 
  			//����������͵ķ���ֵ�������͸�ֵ 
	         Integer productType = product.getProductType();
	         String productTypeName = null;
	         switch (productType)  
	         {
		         case 0:productTypeName = "MIS";break;
		         case 1:productTypeName = "Web";break;			           
		         default:productTypeName = "״̬����";
	         }
	         %>
  			<td >
  			 	<select name="productType" style="width:160px" >
  			 	    <option value="<%=productType %>"><%=productTypeName %></option>
  			 	    <!--0����MISϵͳ��1����webϵͳ  -->
  					<option value="0" >MIS</option>
  					<option value="1">Web</option>
  				</select>
            </td>
  		</tr>
  		<tr>
  			<td width="10%">��Ŀ����</td>
  			<% 
  			//������Ŀ���͵ķ���ֵ�������͸�ֵ 
	         Integer developType = product.getDevelopType();
	         String developTypeName = null;
	         switch (developType)  
	         {
		         case 0:developTypeName = "�¿���";break;
		         case 1:developTypeName = "���ο���";break;	
		         case 2:developTypeName = "��ǿ��";break;	        
		         default:developTypeName = "״̬����";
	         }
	         %>
  			<td >
  			 	<select name="developType" style="width:160px">
  			 	    <option value="<%=developType %>"><%=developTypeName %></option>
  			 	    <!--0����newDevelop��1������ο�����2������ǿ�� -->
  					<option value="0" >�¿���</option>
  					<option value="1">���ο���</option>
  					<option value="2">��ǿ��</option>
  				</select>
            </td>
  		</tr>
  		<tr>
  			<td>���㷽��</td>
  			<% 
  			//���ݹ��㷽���ķ���ֵ���Է�����ֵ 
	         Integer measureMethod = product.getMeasureMethod();
	         String measureMethodName = null;
	         switch (measureMethod)  
	         {
		         case 0:measureMethodName = "COSMIC��׼����ֱ�ӹ���";break;
		         case 1:measureMethodName = "COSMIC���ƹ���";break;		        
		         default:measureMethodName = "״̬����";
	         }
	         %>
  			<td width="40px">
  			 	<select name="measureMethod" style="width:160px">
  			 	    <option value="<%=measureMethod %>"><%=measureMethodName %></option>
  			 	    <!--0����COSMIC��׼����ֱ�ӹ��㣬1����COSMIC���ƹ���  -->
  			 	    <option value="0" >COSMIC��׼����ֱ�ӹ���</option> 					
  					<option value="1">COSMIC���ƹ���</option>
  				</select>
            </td>
  		</tr>
  		<tr>
  			<td>�������ڽ׶�</td>
  			<% 
  			//�����������ڽ׶εķ���ֵ�������ڸ�ֵ 
	         Integer lifecycle = product.getLifecyclePhase();
	         String lifecycleName = null;
	         switch (lifecycle)  
	         {
		         case 0:lifecycleName = "�����Ժ�";break;
		         case 1:lifecycleName = "��ϸ��ƺ�";break;
		         case 2:lifecycleName = "������ɺ�";break;
		         case 3:lifecycleName = "��Ʒ������";break;
		         default:lifecycleName = "״̬����";
	         }
	         %>
  			<td >
  			 	<select name="lifecyclePhase" style="width:160px">
  			 	    <option value="<%=lifecycle %>"><%=lifecycleName %></option>
  			 	    <!--0�����������1������ϸ��ƺ�2���������ɺ�3�����Ʒ������  -->
  					<option value="0" >�������</option>
  					<option value="1">��ϸ��ƺ�</option>
  					<option value="2">������ɺ�</option>
  					<option value="3">��Ʒ������</option>
  				</select>
            </td>
  		</tr>
  	    <tr>
  			<td>����״̬</td>
  			<% 
  			//����״̬�ķ���ֵ����״̬��ֵ 
	         Integer measureStatus = product.getMeasureStatus();
	         String measureStatusName = null;
	         switch (measureStatus)  
	         {
		         case 0:measureStatusName = "δ����";break;
		         case 1:measureStatusName = "���ֹ���";break;
		         case 2:measureStatusName = "ȫ������";break;
		         default:measureStatusName = "״̬����";
	         }
	         %>
  			<td >
  			 	<select name="measureStatus" style="width:160px">
  			 	    <option value="<%=measureStatus %>"><%=measureStatusName %></option>
  			 	    <!--0����δ���й��㣬1�������ȫ�������㣬2����������ֱ����� -->
  			 	    <option value="0" >δ����</option>
  					<option value="1">���ֹ���</option>
  					<option value="2">ȫ������</option>
  				</select>
            </td>
  		</tr>
  	
         <tr>
            <td> <input type="submit" name="submit" value="�޸����"/> </td>        
         </tr>
         
      </table>
      <input type="hidden" name="id" value="<%=productId%>"/>  
     
    </form> 
         
  </body>
</html>
