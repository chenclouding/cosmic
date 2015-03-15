<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@ page import="java.util.Iterator"%>
<%@ page import="java.sql.Date"%>
<%@ page import="java.util.Calendar"%>
<%@ page import="business.FSM.ProductMeasureBusiness" %>
<%@ page import="hibernate.FSM.FsmProduct" %>
<jsp:useBean id="projectMeasureBean" scope="session" class="javaBeans.fsm.ProjectMeasureBean"/>  


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
     <html:base/>
    <title>My JSP 'projectMeasure.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">	
    <link rel="stylesheet" type="text/css" href="/fsmch/images/screen.css">
    <script language="JavaScript" src="/fsmch/javascript/verify.js"></script>
    <script type="text/javascript" src="./timejs.js"></script>
	<script language="JavaScript">
	
	   function confirmdel(){
          return confirm("ȷ��ɾ����");
	   }
	  
		function verifyInput()
	  {	
		    var frm = document.productForm;
		    var endTime1=frm.endTime.value;
		    var data1=frm.endTime.value.split("-");
		    var data2=frm.startTime.value.split("-");
		    var data3=frm.estimateStartTime.value.split("-");
		    var data4=frm.estimateEndTime.value.split("-");
		    
		    for(var i=0;i<3;i++)
		    { 
		       if(data1[i]<data2[i])
		        {
		        alert("������ѡ����Ŀ����ʱ�䣬Ӧ�ô�����Ŀ��ʼʱ�䣡");
		        return false;
		        break;
		        }
		     }
		     
		      for(var j=0;j<3;j++)
		    { 
		       if(data4[j]<data3[j])
		        {
		        alert("������ѡ��������ʱ�䣬Ӧ�ô��ڹ��㿪ʼʱ�䣡");
		        return false;
		        break;
		        }
		     }
		      		    	   
			if(isEmpty(frm.productName.value)) 
			{	
			    alert("����д������ƣ�");
				frm.productName.focus();
				return false;
			}	
			if(isEmpty(frm.startTime.value)) 
			{	
			    alert("��ѡ����Ŀ��ʼʱ�䣡");
				frm.startTime.focus();
				return false;
			}	
			if(isEmpty(frm.endTime.value)) 
			{	
			    alert("��ѡ����Ŀ����ʱ�䣡");
				frm.endTime.focus();
				return false;
			}	
			if(isEmpty(frm.estimateStartTime.value)) 
			{	
			    alert("��ѡ��ʼ����ʱ�䣡");
				frm.estimateStartTime.focus();
				return false;
			}	
			if(isEmpty(frm.estimateEndTime.value)) 
			{	
			    alert("��ѡ���������ʱ�䣡");
				frm.estimateEndTime.focus();
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
			}
		}
		     
	</script> 
  </head>
  
  <body>
    <h1>��������б�</h1>
    <table>
       <tr>
         <td>���</td> 
         <td>�������</td>
         <td>����״̬</td>
         <td>�鿴</td>
         <td>�޸�</td>
         <td>ɾ��</td>
         <td>��ʼ����</td>
       </tr>
       <% 
       /*�����ݿ��а���������Ĺ�����Ϣȡ��*/
       ProductMeasureBusiness pmb = new ProductMeasureBusiness(); 
       List productList = pmb.getAllProduct();  
       FsmProduct product = new FsmProduct();//����ʵ��Bean
       
        Calendar cal = Calendar.getInstance();
		Date now = new Date(cal.getTimeInMillis());
     
       /*���������Ϣ����ʾ��ӣ����������Ϣ���г���������б�*/
       if(productList==null ||productList.size()==0 ){%>  
       <h1 style="color:red">Ŀǰ�޹��������Ϣ������Ӵ���������<h1>
       <%}else{ 
	       for(Object p:productList){ 
	         product = (FsmProduct)p; 
	         Integer productId = product.getId();
	         session.setAttribute("productId",productId);
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
	         <tr>
	          <td><%= productList.indexOf(p)+1%></td> 
	          <td><%= product.getProductName() %></td>
	          <td><%= measureStatusName %></td>
	          <td><a href="/fsmch/FSM/cosmicStandard/strategy/productDescription.jsp?productId=<%=productId%>"><IMG src="/fsmch/images/btncheck.gif" alt="�鿴" border="0" /></a></td>
	          <td><a href="/fsmch/FSM/cosmicStandard/strategy/editProduct.jsp?productId=<%=productId%>"> <IMG src="/fsmch/images/btnedit.gif" alt="�޸�" border="0" /></a></td>
	          <td>
	          <a href="/fsmch/FSM/cosmicStandard/strategy/delProduct.jsp?productId=<%=productId%>" onclick="return confirmdel();"><IMG src="/fsmch/images/btndel.gif" alt="ɾ��" width="15" height="12" border="0" /></a>
	          </td>
	          <td><a href="/fsmch/FSM/cosmicStandard/strategy/strategyPhase.jsp?productId=<%=productId%>">ʶ��Ե�����׶�</a></td>
	         </tr>  
          <%}
       }%>  
    </table>
    <form  action="/fsmch/FSM/addProduct.do"  name="productForm" method="post" onSubmit="return verifyInput();">
  	<table>
  		<tr>
  			<td width="10%">�������������</td>
  			<td >
  			    <input type="text" name="productName" style="width:160px" value=""/ >
            </td>
  		</tr>
  		<tr>
  			<td width="10%">�������������</td>
  			<td >
  			    <textarea name="productDesp" wrap="soft" cols="25" rows="5"></textarea>
            </td>
  		</tr>
  	
  		<tr>
  			<td width="10%">�������</td>
  			<td >
  			 	<select name="productType" style="width:160px" >
  			 	    <option value="">=��ѡ��=</option>
  			 	    <!--0����MISϵͳ��1����webϵͳ  -->
  					<option value="0" selected>MIS</option>
  					<option value="1">Web</option>
  				</select>
            </td>
  		</tr>
  		<tr>
  			<td width="10%">��Ŀ����</td>
  			<td >
  			 	<select name="developType" style="width:160px">
  			 	    <option value="">=��ѡ��=</option>
  			 	    <!--0����newDevelop��1������ο�����2������ǿ�� -->
  					<option value="0" selected>�¿���</option>
  					<option value="1">���ο���</option>
  					<option value="2">��ǿ��</option>
  				</select>
            </td>
  		</tr>
  		<tr>
  			<td>���㷽��</td>
  			<td width="40px">
  			 	<select name="measureMethod" style="width:160px">
  			 	    <option value="">=��ѡ��=</option>
  			 	    <!--0����COSMIC��׼����ֱ�ӹ��㣬1����COSMIC���ƹ���  -->
  			 	    <option value="0" selected>COSMIC��׼����ֱ�ӹ���</option> 				
  					<option value="1">COSMIC���ƹ���</option>
  				</select>
            </td>
  		</tr>
  		<tr>
  			<td>�������ڽ׶�</td>
  			<td >
  			 	<select name="lifecyclePhase" style="width:160px">
  			 	    <option value="">=��ѡ��=</option>
  			 	    <!--0�����������1������ϸ��ƺ�2���������ɺ�3�����Ʒ������  -->
  					<option value="0" selected>�������</option>
  					<option value="1">��ϸ��ƺ�</option>
  					<option value="2">������ɺ�</option>
  					<option value="3">��Ʒ������</option>
  				</select>
            </td>
  		</tr>
  		<tr>
  			<td width="10%">������Ա</td>
  			<td >    
  			  <input type="text" name="estimator" style="width:160px" value=""/ >         
            </td>
  		</tr>
  		<tr>
           <td> ��Ŀ��ʼ����</td>
           <td>
               <input type="text" name="startTime" style="width:160px" value=""/ >
               <input size="20" type="button" name="start1Time" id="start1Time" value="ѡ������" readOnly  onClick="javascript:fPopCalendar(this, startTime)"/>
           </td>
           </tr>
           <tr>
           <td> ��Ŀ��������</td>
           <td>
             <input type="text" name="endTime" style="width:160px" value="" / >
             <input size="20" type="button" name="end1Time" id="end1Time" value="ѡ������" readOnly  onClick="javascript:fPopCalendar(this, endTime) "  />
          
           </td>
          </tr>
          
       <tr>
           <td> ���㿪ʼ����</td>
           <td>
             <input type="text" name="estimateStartTime" style="width:160px" value=""/ >
             <input size="20" type="button" name="estimateStart1Time" id="estimateStart1Time" value="ѡ������" readOnly  onClick="javascript:fPopCalendar(this, estimateStartTime)"/>
           </td>
           </tr>
           <tr>
           <td> �����������</td>
           <td>
              <input type="text" name="estimateEndTime" style="width:160px" value=""/ >
             <input size="20" type="button" name="estimateEnd1Time" id="estimateEnd1Time" value="ѡ������" readOnly  onClick="javascript:fPopCalendar(this, estimateEndTime)"/>
           </td>
           </tr>
  	   
  	
  		<tr>
  		    <td>
  				<input type="submit" name="submit" value="�������"/>
  			</td>
  			<td>
  				<input type="reset" name="reset" value="���"/>
  			</td>
  		</tr>
  	</table>
  	<!--0����δ���й��㣬1����������ֱ����㣬2�������ȫ�������� -->
      <input type="hidden" name="measureStatus" value="0"/>
  	</form>
  	
  			
  </body>
  
</html>
