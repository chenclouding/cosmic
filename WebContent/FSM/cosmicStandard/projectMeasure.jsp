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
          return confirm("确定删除？");
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
		        alert("请重新选择项目结束时间，应该大于项目开始时间！");
		        return false;
		        break;
		        }
		     }
		     
		      for(var j=0;j<3;j++)
		    { 
		       if(data4[j]<data3[j])
		        {
		        alert("请重新选择估算结束时间，应该大于估算开始时间！");
		        return false;
		        break;
		        }
		     }
		      		    	   
			if(isEmpty(frm.productName.value)) 
			{	
			    alert("请填写软件名称！");
				frm.productName.focus();
				return false;
			}	
			if(isEmpty(frm.startTime.value)) 
			{	
			    alert("请选择项目开始时间！");
				frm.startTime.focus();
				return false;
			}	
			if(isEmpty(frm.endTime.value)) 
			{	
			    alert("请选择项目结束时间！");
				frm.endTime.focus();
				return false;
			}	
			if(isEmpty(frm.estimateStartTime.value)) 
			{	
			    alert("请选择开始估算时间！");
				frm.estimateStartTime.focus();
				return false;
			}	
			if(isEmpty(frm.estimateEndTime.value)) 
			{	
			    alert("请选择结束估算时间！");
				frm.estimateEndTime.focus();
				return false;
			}									
			if(isEmpty(frm.productType.value)) 
			{
				alert("请填写软件类型！");
				frm.productType.focus();
				return false;
			}		
			if(isEmpty(frm.developType.value)) 
			{
				alert("请填写项目类型！");
				frm.developType.focus();
				return false;
			}
			
			if(isEmpty(frm.measureMethod.value)) 
			{
				alert("请填写估算方法！");
				frm.measureMethod.focus();
				return false;
			}
			
			if(isEmpty(frm.lifecyclePhase.value)) 
			{
				alert("请填写生命周期阶段！");
				frm.lifecyclePhase.focus();
				return false;
			}
			
			if(isEmpty(frm.measureStatus.value)) 
			{
				alert("请选择软件估算状态！");
				frm.measureStatus.focus();
				return false;
			}
		}
		     
	</script> 
  </head>
  
  <body>
    <h1>估算软件列表</h1>
    <table>
       <tr>
         <td>序号</td> 
         <td>软件名称</td>
         <td>估算状态</td>
         <td>查看</td>
         <td>修改</td>
         <td>删除</td>
         <td>开始估算</td>
       </tr>
       <% 
       /*从数据库中把所有软件的估算信息取出*/
       ProductMeasureBusiness pmb = new ProductMeasureBusiness(); 
       List productList = pmb.getAllProduct();  
       FsmProduct product = new FsmProduct();//定义实体Bean
       
        Calendar cal = Calendar.getInstance();
		Date now = new Date(cal.getTimeInMillis());
     
       /*若无软件信息，提示添加；若有软件信息，列出估算软件列表*/
       if(productList==null ||productList.size()==0 ){%>  
       <h1 style="color:red">目前无估算软件信息，请添加待估算的软件<h1>
       <%}else{ 
	       for(Object p:productList){ 
	         product = (FsmProduct)p; 
	         Integer productId = product.getId();
	         session.setAttribute("productId",productId);
	         //根据状态的返回值，对状态赋值 
	         Integer measureStatus = product.getMeasureStatus();
	         String measureStatusName = null;
	         switch (measureStatus)  
	         {
		         case 0:measureStatusName = "未估算";break;
		         case 1:measureStatusName = "部分估算";break;
		         case 2:measureStatusName = "全部估算";break;
		         default:measureStatusName = "状态错误";
	         }
	          %>
	         <tr>
	          <td><%= productList.indexOf(p)+1%></td> 
	          <td><%= product.getProductName() %></td>
	          <td><%= measureStatusName %></td>
	          <td><a href="/fsmch/FSM/cosmicStandard/strategy/productDescription.jsp?productId=<%=productId%>"><IMG src="/fsmch/images/btncheck.gif" alt="查看" border="0" /></a></td>
	          <td><a href="/fsmch/FSM/cosmicStandard/strategy/editProduct.jsp?productId=<%=productId%>"> <IMG src="/fsmch/images/btnedit.gif" alt="修改" border="0" /></a></td>
	          <td>
	          <a href="/fsmch/FSM/cosmicStandard/strategy/delProduct.jsp?productId=<%=productId%>" onclick="return confirmdel();"><IMG src="/fsmch/images/btndel.gif" alt="删除" width="15" height="12" border="0" /></a>
	          </td>
	          <td><a href="/fsmch/FSM/cosmicStandard/strategy/strategyPhase.jsp?productId=<%=productId%>">识别对等组件阶段</a></td>
	         </tr>  
          <%}
       }%>  
    </table>
    <form  action="/fsmch/FSM/addProduct.do"  name="productForm" method="post" onSubmit="return verifyInput();">
  	<table>
  		<tr>
  			<td width="10%">待估算软件名称</td>
  			<td >
  			    <input type="text" name="productName" style="width:160px" value=""/ >
            </td>
  		</tr>
  		<tr>
  			<td width="10%">待估算软件描述</td>
  			<td >
  			    <textarea name="productDesp" wrap="soft" cols="25" rows="5"></textarea>
            </td>
  		</tr>
  	
  		<tr>
  			<td width="10%">软件类型</td>
  			<td >
  			 	<select name="productType" style="width:160px" >
  			 	    <option value="">=请选择=</option>
  			 	    <!--0代表MIS系统，1代表web系统  -->
  					<option value="0" selected>MIS</option>
  					<option value="1">Web</option>
  				</select>
            </td>
  		</tr>
  		<tr>
  			<td width="10%">项目类型</td>
  			<td >
  			 	<select name="developType" style="width:160px">
  			 	    <option value="">=请选择=</option>
  			 	    <!--0代表newDevelop，1代表二次开发，2代表增强型 -->
  					<option value="0" selected>新开发</option>
  					<option value="1">二次开发</option>
  					<option value="2">增强型</option>
  				</select>
            </td>
  		</tr>
  		<tr>
  			<td>估算方法</td>
  			<td width="40px">
  			 	<select name="measureMethod" style="width:160px">
  			 	    <option value="">=请选择=</option>
  			 	    <!--0代表COSMIC标准方法直接估算，1代表COSMIC近似估算  -->
  			 	    <option value="0" selected>COSMIC标准方法直接估算</option> 				
  					<option value="1">COSMIC近似估算</option>
  				</select>
            </td>
  		</tr>
  		<tr>
  			<td>生命周期阶段</td>
  			<td >
  			 	<select name="lifecyclePhase" style="width:160px">
  			 	    <option value="">=请选择=</option>
  			 	    <!--0代表需求定义后，1代表详细设计后，2代表编码完成后，3代表产品交付后  -->
  					<option value="0" selected>需求定义后</option>
  					<option value="1">详细设计后</option>
  					<option value="2">编码完成后</option>
  					<option value="3">产品交付后</option>
  				</select>
            </td>
  		</tr>
  		<tr>
  			<td width="10%">估算人员</td>
  			<td >    
  			  <input type="text" name="estimator" style="width:160px" value=""/ >         
            </td>
  		</tr>
  		<tr>
           <td> 项目开始日期</td>
           <td>
               <input type="text" name="startTime" style="width:160px" value=""/ >
               <input size="20" type="button" name="start1Time" id="start1Time" value="选择日期" readOnly  onClick="javascript:fPopCalendar(this, startTime)"/>
           </td>
           </tr>
           <tr>
           <td> 项目结束日期</td>
           <td>
             <input type="text" name="endTime" style="width:160px" value="" / >
             <input size="20" type="button" name="end1Time" id="end1Time" value="选择日期" readOnly  onClick="javascript:fPopCalendar(this, endTime) "  />
          
           </td>
          </tr>
          
       <tr>
           <td> 估算开始日期</td>
           <td>
             <input type="text" name="estimateStartTime" style="width:160px" value=""/ >
             <input size="20" type="button" name="estimateStart1Time" id="estimateStart1Time" value="选择日期" readOnly  onClick="javascript:fPopCalendar(this, estimateStartTime)"/>
           </td>
           </tr>
           <tr>
           <td> 估算结束日期</td>
           <td>
              <input type="text" name="estimateEndTime" style="width:160px" value=""/ >
             <input size="20" type="button" name="estimateEnd1Time" id="estimateEnd1Time" value="选择日期" readOnly  onClick="javascript:fPopCalendar(this, estimateEndTime)"/>
           </td>
           </tr>
  	   
  	
  		<tr>
  		    <td>
  				<input type="submit" name="submit" value="增加软件"/>
  			</td>
  			<td>
  				<input type="reset" name="reset" value="清除"/>
  			</td>
  		</tr>
  	</table>
  	<!--0代表未进行估算，1代表软件部分被估算，2代表软件全部被估算 -->
      <input type="hidden" name="measureStatus" value="0"/>
  	</form>
  	
  			
  </body>
  
</html>
