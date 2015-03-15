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
        return confirm("确定删除？");
	}	  
		function verifyInput()
	  {	
		var frm = document.functionProcessForm;
	   
			if(isEmpty(frm.funcProsName.value)) 
			{
				alert("请填写功能流程名称！");
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
   //从projectMeasureBean获得productId，peerCompId，layerId   
   Integer productId = projectMeasureBean.getProductId();
   Integer peerCompId = projectMeasureBean.getPeerCompId();
   Integer layerId = projectMeasureBean.getLayerId();
   //按照各自ID将名称取出来
   ProductMeasureBusiness pmb = new ProductMeasureBusiness();
   StrategyPhase sp = new StrategyPhase();
   String productName = ((FsmProduct)pmb.getProductById(productId)).getProductName();
   String peerCompName = ((FsmPeerComponent)sp.getPeerComponentById(peerCompId)).getPeerCompName();
   String layerName  = ((FsmLayer)sp.getLayerById(layerId)).getLayerName();   
%>
   <h1> 软件描述</h1>
    <table>
      <tr> 
          <td width="15%">所属软件:</td> <td><%=productName%></td>
      </tr>
       <tr> 
          <td width="15%">所属层次:</td> <td><%=layerName%></td>
      </tr>
       <tr> 
          <td width="15%">所属组件:</td> <td><%=peerCompName%></td>
      </tr>
    </table>
    <hr>
    <h2> 功能流程列表</h2>
       <%
       //从数据库中把次对等组件的功能流程信息全部取出
       MappingPhase mp = new MappingPhase();
       List funcProsList = mp.getFunctionProcessByPeerCompId(peerCompId);
       FsmFunctionProcess funcPros = new FsmFunctionProcess();   //定义实体Bean
       //若无功能流程信息，提示添加；若有功能流程信息，列出功能流程列表
       if(funcProsList==null ||funcProsList.size()==0 ){%>  
         <h1 style="color:red">目前无功能流程信息，请添加功能流程</h1> 
       <%}else{ %>
	    <table>
	      <tr> 
	          <th>序号</th>
	          <th>功能流程</th>
	          <th>估算状态</th>
	          <th>描述</th>
	          <th>修改</th>
	          <th>删除</th>
	      </tr>
  	     <%   for(Object f:funcProsList){ 
	         funcPros = (FsmFunctionProcess)f; 
	         Integer funcProsId = funcPros.getId();	        
	         //根据状态的返回值，对状态赋值 
	         Integer measureStatus = funcPros.getMeasureStatus();
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
		          <td><%= funcProsList.indexOf(f)+1 %></td> 
		          <td><%= funcPros.getFuncProsName() %></td>
		          <td><%= measureStatusName %></td>
		          <td><a href="/fsmch/FSM/cosmicStandard/mapping/functionProcessDescription.jsp?funcProsId=<%=funcProsId%>&peerCompId=<%=peerCompId%>&productId=<%=productId%>&layerId=<%=layerId%>"><IMG src="/fsmch/images/btncheck.gif" alt="查看" border="0" /></a></td>
		      	  <td><a href="/fsmch/FSM/cosmicStandard/mapping/editFunctionProcess.jsp?peerCompId=<%=peerCompId%>&funcProsId=<%=funcProsId%>"><IMG src="/fsmch/images/btnedit.gif" alt="修改" border="0" /></a></td>
		          <td>
		            <a href="/fsmch/FSM/cosmicStandard/mapping/delFunctionProcess.jsp?funcProsId=<%=funcProsId%>" onclick="return confirmdel();"><IMG src="/fsmch/images/btndel.gif" alt="删除" width="15" height="12" border="0" /></a>	          
		          </td>
	         </tr>  
          <%}%>
           </table>
         <%} %>
  <hr>
     <h3>添加功能流程</h3>
     <form action="/fsmch/FSM/addFunctionProcess.do" name="functionProcessForm" method="post" onSubmit="return verifyInput();"> 
      <table>
         <tr>
            <td width="10%">功能流程名称</td>
  			<td ><input type="text" name="funcProsName" value=""/></td>        
         </tr>
         <tr>
  			<td width="10%">功能流程描述：</td>
  			<td >
  			    <textarea name="funcProsDesp" wrap="soft" cols="25" rows="5"></textarea>
            </td>
  		</tr>
         
         
         <tr>
            <td> <input type="submit" name="submit" value="添加功能流程"/> </td>        
         </tr>
      </table>   
      <!--0代表未进行估算，1代表软件部分被估算，2代表软件全部被估算 -->
      <input type="hidden" name="measureStatus" value="0"/>
      <input type="hidden" name="peerCompId" value="<%=peerCompId%>"/>
    </form>

  <%} %>
</body>
</html>
