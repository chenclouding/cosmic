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
        return confirm("确定删除？");
	}		  
		function verifyInput()
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
			}
		}
		
	</script>
  </head>
  
  <body>
      <%
      if(projectMeasureBean.getProductId()==null )
          response.sendRedirect("/fsmch/FSM/cosmicStandard/strategy/alertStrategy.jsp");
      else{
        //从projectMeasureBean获得productId  
        Integer productId = projectMeasureBean.getProductId();
        
      %>
      <h4> 层次列表</h4>
      <% /*从数据库中把软件的层次信息取出*/
       StrategyPhase sp = new StrategyPhase(); //业务层，对应于COSMIC方法的策略阶段
       List layerList = sp.getLayerByProductId(productId);
       FsmLayer layer = new FsmLayer();//定义实体Bean
     
       /*若无层次信息，提示添加；若有层次信息，列出层次列表*/
       if(layerList==null ||layerList.size()==0 ){%>  
         <h1 style="color:red">目前无层次信息，请添加层次</h1> 
       <%}else{ %>
         <table>
	       <tr> 
		        <td >序号</td> 
		        <td>层次名称</td>
		        <td>估算状态</td>
		        <td>查看</td>
		        <td>修改</td>
		        <td>删除</td>
		        <td>进行映射</td>
		        <td>导出度量报告</td>
	       </tr> 
	    <%   for(Object p:layerList){ 
	         layer = (FsmLayer)p; 
	         Integer layerId = layer.getId(); 
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
	         <tr>
		          <td><%= layerList.indexOf(p)+1 %></td> 
		          <td><%= layer.getLayerName() %></td>
		          <td><%= measureStatusName %></td>
		          <td><a href="/fsmch/FSM/cosmicStandard/strategy/layerDescription.jsp?layerId=<%=layerId%>&productId=<%=productId%>"><IMG src="/fsmch/images/btncheck.gif" alt="查看" border="0" /></a></td>
		          <td><a href="/fsmch/FSM/cosmicStandard/strategy/editLayer.jsp?layerId=<%=layerId%>&productId=<%=productId%>"><IMG src="/fsmch/images/btnedit.gif" alt="修改" border="0" /></a></td>
		          <td><a href="/fsmch/FSM/cosmicStandard/strategy/delLayer.jsp?layerId=<%=layerId%>&productId=<%=productId%>" onclick="return confirmdel();"><IMG src="/fsmch/images/btndel.gif" alt="删除" width="15" height="12" border="0" /></a></td>
		          <td><a href="/fsmch/FSM/cosmicStandard/strategy/peerComponent.jsp?layerId=<%=layerId%>&productId=<%=productId%>">添加对等组件</a></td>
		          <td><a href="/fsmch/FSM/cosmicStandard/strategy/layerMeasureReport1.jsp?layerId=<%=layerId%>&productId=<%=productId%>">导出度量报告</a></td>
	         </tr>  
          <%}%>
           </table>
        <%}%>  
     
   
   
    <form action="/fsmch/FSM/addLayer.do" name="layerForm" method="post" onSubmit="return verifyInput();">
      <table>
         <tr>
            <td width="15%">层次名</td>
            <td> <input type="text" name="layerName" value=""/> </td>        
         </tr>
        <tr>
  			<td width="10%">层次描述</td>
  			<td >
  			    <textarea name="layerDesp" wrap="soft" cols="25" rows="5"></textarea>
            </td>
  		</tr>
        
         <tr>
            <td> <input type="submit" name="submit" value="添加层次"/> </td>        
         
              <td><input type="reset" name="reset" value="重置"/></td>
            </tr> 
      </table>
       <!--0代表未进行估算，1代表软件部分被估算，2代表软件全部被估算 -->
      <input type="hidden" name="measureStatus" value="0"/>
      <input type="hidden" name="productId" value="<%=productId%>"/>
    </form>
     <hr>
   
  <%} %>
  </body>
</html>
