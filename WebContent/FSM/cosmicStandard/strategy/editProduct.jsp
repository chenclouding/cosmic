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
			    alert("请填写软件名称！");
				frm.productName.focus();
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
			}else
			{			    
			        switch(frm.measureStatus.value)
			        {
			          case '0': //若改为未估算状态
			            { if(productUn==false)
			              {
					     	 alert("此估算状态不能修改！");
				             frm.measureStatus.focus();
				             return false;break;
                          }else
				          {
				             return true; break;      
				          } 
			            }
			         case '1': //若改为部分估算
			          { if(productPart==false)
			              {
					     	 alert("此估算状态不能修改！");
				             frm.measureStatus.focus();
				             return false;break;
                          }else
				          {
				             return true; break;      
				          } 
			            }
			          case '2': //若改为全部估算
			          { if(productAll==false )
			              {
					     	 alert("此估算状态不能修改！");
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
       /*获取从页面projectMeasure.jsp传来productId*/  
      Integer productId = new Integer(request.getParameter("productId"));
      
      /*从数据库中把id为productId的软件取出*/
      StrategyPhase sp = new StrategyPhase(); //业务层，对应于COSMIC方法的策略阶段
      ProductMeasureBusiness pmb= new ProductMeasureBusiness();
      FsmProduct product = (FsmProduct)pmb.getProductById(productId);
     
      //验证估算状态是否可被修改
      boolean productUn = true;
      boolean productPart = true;
      boolean productAll = true;
      
      List layerList = sp.getLayerByProductId(productId);
      List layerStatus0List = sp.getLayerByProductIdAndMeasureStatus(productId,0);
      List layerStatus1List = sp.getLayerByProductIdAndMeasureStatus(productId,1);
      List layerStatus2List = sp.getLayerByProductIdAndMeasureStatus(productId,2);        
	  if((layerStatus1List!=null&&layerStatus1List.size()!=0) || (layerStatus2List!=null&&layerStatus2List.size()!=0)) 
	     productUn = false; //若该层次包含的对等组件中已经有被部分估算或者全部估算的，则不可修改     
      if((layerStatus1List==null||layerStatus1List.size()==0) && (layerStatus2List==null||layerStatus2List.size()==0)) //修改为部分估算
	     productPart = false; //若该层次包含的对等组件中没有被部分估算和全部估算的，则不可修改     
      if(layerList==null || layerList.size()==0)//改为全部被估算
	     productAll = false;//若层次没有对等组件，则不能被修改
      if((layerStatus0List!=null&&layerStatus0List.size()!=0) || (layerStatus1List!=null&&layerStatus1List.size()!=0)) 
	     productAll = false; //若该层次包含的对等组件中有被部分估算或者未估算的，则不可修改  
      %>
      
      <form action="/fsmch/FSM/editProduct.do" name="productForm" method="post" onSubmit="return verifyInput(<%=productUn%>,<%=productPart%>,<%=productAll%>);">
      
      <table>
         <tr>
            <td width="15%">待估算软件名</td>
            <td> <input type="text" name="productName" value="<%=product.getProductName()%>"/> </td>        
         </tr>
        <tr>
            <td width="15%">待估算软件描述</td> 
            <td><input type="text" name="productDesp" value="<%=product.getProductDesp() %>"/>   </td>     
         </tr>
         <tr>
  			<td width="10%">软件类型</td>
  			<% 
  			//根据软件类型的返回值，对类型赋值 
	         Integer productType = product.getProductType();
	         String productTypeName = null;
	         switch (productType)  
	         {
		         case 0:productTypeName = "MIS";break;
		         case 1:productTypeName = "Web";break;			           
		         default:productTypeName = "状态错误";
	         }
	         %>
  			<td >
  			 	<select name="productType" style="width:160px" >
  			 	    <option value="<%=productType %>"><%=productTypeName %></option>
  			 	    <!--0代表MIS系统，1代表web系统  -->
  					<option value="0" >MIS</option>
  					<option value="1">Web</option>
  				</select>
            </td>
  		</tr>
  		<tr>
  			<td width="10%">项目类型</td>
  			<% 
  			//根据项目类型的返回值，对类型赋值 
	         Integer developType = product.getDevelopType();
	         String developTypeName = null;
	         switch (developType)  
	         {
		         case 0:developTypeName = "新开发";break;
		         case 1:developTypeName = "二次开发";break;	
		         case 2:developTypeName = "增强型";break;	        
		         default:developTypeName = "状态错误";
	         }
	         %>
  			<td >
  			 	<select name="developType" style="width:160px">
  			 	    <option value="<%=developType %>"><%=developTypeName %></option>
  			 	    <!--0代表newDevelop，1代表二次开发，2代表增强型 -->
  					<option value="0" >新开发</option>
  					<option value="1">二次开发</option>
  					<option value="2">增强型</option>
  				</select>
            </td>
  		</tr>
  		<tr>
  			<td>估算方法</td>
  			<% 
  			//根据估算方法的返回值，对方法赋值 
	         Integer measureMethod = product.getMeasureMethod();
	         String measureMethodName = null;
	         switch (measureMethod)  
	         {
		         case 0:measureMethodName = "COSMIC标准方法直接估算";break;
		         case 1:measureMethodName = "COSMIC近似估算";break;		        
		         default:measureMethodName = "状态错误";
	         }
	         %>
  			<td width="40px">
  			 	<select name="measureMethod" style="width:160px">
  			 	    <option value="<%=measureMethod %>"><%=measureMethodName %></option>
  			 	    <!--0代表COSMIC标准方法直接估算，1代表COSMIC近似估算  -->
  			 	    <option value="0" >COSMIC标准方法直接估算</option> 					
  					<option value="1">COSMIC近似估算</option>
  				</select>
            </td>
  		</tr>
  		<tr>
  			<td>生命周期阶段</td>
  			<% 
  			//根据生命周期阶段的返回值，对周期赋值 
	         Integer lifecycle = product.getLifecyclePhase();
	         String lifecycleName = null;
	         switch (lifecycle)  
	         {
		         case 0:lifecycleName = "需求定以后";break;
		         case 1:lifecycleName = "详细设计后";break;
		         case 2:lifecycleName = "编码完成后";break;
		         case 3:lifecycleName = "产品交付后";break;
		         default:lifecycleName = "状态错误";
	         }
	         %>
  			<td >
  			 	<select name="lifecyclePhase" style="width:160px">
  			 	    <option value="<%=lifecycle %>"><%=lifecycleName %></option>
  			 	    <!--0代表需求定义后，1代表详细设计后，2代表编码完成后，3代表产品交付后  -->
  					<option value="0" >需求定义后</option>
  					<option value="1">详细设计后</option>
  					<option value="2">编码完成后</option>
  					<option value="3">产品交付后</option>
  				</select>
            </td>
  		</tr>
  	    <tr>
  			<td>估算状态</td>
  			<% 
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
  			<td >
  			 	<select name="measureStatus" style="width:160px">
  			 	    <option value="<%=measureStatus %>"><%=measureStatusName %></option>
  			 	    <!--0代表未进行估算，1代表软件全部被估算，2代表软件部分被估算 -->
  			 	    <option value="0" >未估算</option>
  					<option value="1">部分估算</option>
  					<option value="2">全部估算</option>
  				</select>
            </td>
  		</tr>
  	
         <tr>
            <td> <input type="submit" name="submit" value="修改软件"/> </td>        
         </tr>
         
      </table>
      <input type="hidden" name="id" value="<%=productId%>"/>  
     
    </form> 
         
  </body>
</html>
