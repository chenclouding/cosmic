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
				alert("请填写层次名称！");
				frm.layerName.focus();
				return false;
			}
			if(isEmpty(frm.measureStatus.value)) 
			{
				alert("请选择层次状态！");
				frm.measureStatus.focus();
				return false;
			}else
			{			    
			        switch(frm.measureStatus.value)
			        {
			          case '0': //若改为未估算状态
			            { if(layerUn==false)
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
			          { if(layerPart==false)
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
			          { if(layerAll==false )
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
       /*获取从页面layer.jsp传来layerId和productId*/
      Integer layerId = new Integer(request.getParameter("layerId")); %>
      
      <%   
      Integer productId = new Integer(request.getParameter("productId"));
      
      /*从数据库中把id为layerId的层次取出*/
      StrategyPhase sp = new StrategyPhase(); //业务层，对应于COSMIC方法的策略阶段
      FsmLayer layer = (FsmLayer)sp.getLayerById(layerId);
     
      //验证估算状态是否可被修改
      boolean layerUn = true;
      boolean layerPart = true;
      boolean layerAll = true;
      
      List peerCompList = sp.getPeerComponentByLayerId(layerId);
      List peerCompStatus0List = sp.getPeerComponentByLayerIdAndMeasureStatus(layerId,0);
      List peerCompStatus1List = sp.getPeerComponentByLayerIdAndMeasureStatus(layerId,1);
      List peerCompStatus2List = sp.getPeerComponentByLayerIdAndMeasureStatus(layerId,2);        
	  if((peerCompStatus1List!=null&&peerCompStatus1List.size()!=0) || (peerCompStatus2List!=null&&peerCompStatus2List.size()!=0)) 
	     layerUn = false; //若该层次包含的对等组件中已经有被部分估算或者全部估算的，则不可修改     
      if((peerCompStatus1List==null||peerCompStatus1List.size()==0) && (peerCompStatus2List==null||peerCompStatus2List.size()==0)) //修改为部分估算
	     layerPart = false; //若该层次包含的对等组件中没有被部分估算和全部估算的，则不可修改     
      if(peerCompList==null || peerCompList.size()==0)//改为全部被估算
	     layerAll = false;//若层次没有对等组件，则不能被修改
      if((peerCompStatus0List!=null&&peerCompStatus0List.size()!=0) || (peerCompStatus1List!=null&&peerCompStatus1List.size()!=0)) 
	     layerAll = false; //若该层次包含的对等组件中有被部分估算或者未估算的，则不可修改  
      %> 
         
  <form action="/fsmch/FSM/editLayer.do" name="layerForm" method="post" onSubmit="return verifyInput(<%=layerUn%>,<%=layerPart%>,<%=layerAll%>);">
 
      <table>
         <tr>
            <td width="15%">层次名</td>
            <td> <input type="text" name="layerName" value="<%=layer.getLayerName()%>"/> </td>        
         </tr>
        <tr>
            <td width="15%">层次描述</td> 
            <td><input type="text" name="layerDesp" value="<%=layer.getLayerDesp() %>"/>   </td>     
         </tr>
         <tr>
  			<td width="15%">估算状态</td>
  			<% 
  			//根据状态的返回值，对状态赋值 
	         Integer measureStatus = layer.getMeasureStatus();
	         String measureStatusName = null;
	         switch (measureStatus)  
	         {
		         case 0:measureStatusName = "未估算";break;
		         case 1:measureStatusName = "部分估算";break;
		         case 2:measureStatusName = "全部估算";break;
		         default:measureStatusName = "状态错误";
	         }
	         %>
  			<td>
  			 	<select name="measureStatus" style="width:160px">
  			 	    <option value="<%=measureStatus %>"><%=measureStatusName %></option>
  			 	    <option value="0" >未估算</option>
  					<option value="1">部分估算</option>
  					<option value="2">全部估算</option>
  				</select>
            </td>
  		</tr>
       
         <tr>
            <td> <input type="submit" name="submit" value="修改层次"/> </td>        
         </tr>
         
      </table>
      <input type="hidden" name="id" value="<%=layerId%>"/>  
      <input type="hidden" name="productId" value="<%=productId%>"/> 
    </form>
  </body>
</html>
