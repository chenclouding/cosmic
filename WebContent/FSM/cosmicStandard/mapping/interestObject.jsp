<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@ page import="business.FSM.ProductMeasureBusiness" %>
<%@ page import="business.FSM.StrategyPhase" %>
<%@ page import="business.FSM.MappingPhase" %>
<%@ page import="hibernate.FSM.FsmProduct" %>
<%@ page import="hibernate.FSM.FsmLayer" %>
<%@ page import="hibernate.FSM.FsmPeerComponent" %>
<%@ page import="hibernate.FSM.FsmInterestObject" %>
<jsp:useBean id="projectMeasureBean" scope="session" class="javaBeans.fsm.ProjectMeasureBean"/> 
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'interestObject.jsp' starting page</title>
    
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
		var frm = document.interestObjectForm;
	   
			if(isEmpty(frm.interestObjName.value)) 
			{
				alert("请填写兴趣对象名称！");
				frm.interestObjName.focus();
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
          <td width="15%">所属层次:</td> <td><%=peerCompName%></td>
      </tr>
       <tr> 
          <td width="15%">所属组件:</td> <td><%=layerName %></td>
      </tr>
    </table>
    <hr>
   <h2> 兴趣对象列表</h2>
       <%
       //从数据库中把此对等组件的兴趣对象信息全部取出
       MappingPhase mp = new MappingPhase();
       List interObjList = mp.getInterestObjectByPeerCompId(peerCompId);
       FsmInterestObject fio = new FsmInterestObject();   //定义实体Bean
       //若无兴趣对象信息，提示添加；若有兴趣对象信息，列出兴趣对象列表
       if(interObjList==null ||interObjList.size()==0 ){%>  
         <h1 style="color:red">目前无兴趣对象信息，请添加兴趣对象</h1> 
       <%}else{ %>
	    <table>
	      <tr> 
	          <th>序号</th>
	          <th>兴趣对象</th>
	          <th>描述</th>
	          <th>修改</th>
	          <th>删除</th>
	          <th>添加数据组</th>
	      </tr>
  	     <%   for(Object obj:interObjList){ 
	         fio = (FsmInterestObject)obj; 
	         Integer interestObjId = fio.getId(); 
	          
	     %>
	         <tr>
		          <td><%= interObjList.indexOf(obj)+1 %></td> 
		          <td><%= fio.getInterestObjName() %></td>
		          <td><a href="/fsmch/FSM/cosmicStandard/mapping/interestObjectDescription.jsp?interestObjId=<%=interestObjId%>&peerCompId=<%=peerCompId%>&productId=<%=productId%>&layerId=<%=layerId%>"><IMG src="/fsmch/images/btncheck.gif" alt="查看" border="0" /></a></td>
		      	  <td><a href="/fsmch/FSM/cosmicStandard/mapping/editInterestObject.jsp?interestObjId=<%=interestObjId%>&peerCompId=<%=peerCompId%>"><IMG src="/fsmch/images/btnedit.gif" alt="修改" border="0" /></a></td>
		          <td>
		            <a href="/fsmch/FSM/cosmicStandard/mapping/delInterestObject.jsp?interestObjId=<%=interestObjId%>&peerCompId=<%=peerCompId%>" onclick="return confirmdel();"><IMG src="/fsmch/images/btndel.gif" alt="删除" width="15" height="12" border="0" /></a>
		          </td>
		          <td><a href="/fsmch/FSM/cosmicStandard/mapping/addDataGroup.jsp?interestObjId=<%=interestObjId%>&productId=<%=productId%>&layerId=<%=layerId%>&peerCompId=<%=peerCompId%>">添加数据组</a></td>
	         </tr>  
          <%}%>
           </table>
         <%} %>
  <hr>
      <h3>添加兴趣对象</h3>
     <form action="/fsmch/FSM/addInterestObject.do" name="interestObjectForm" method="post" onSubmit="return verifyInput();"> 
      <table>
        <tr>
  			<td width="10%">兴趣对象名称</td>
  			<td >
  			    <input type="text" name="interestObjName" style="width:160px" value=""/ >
            </td>
  		</tr>
  		<tr>
  			<td width="10%">兴趣对象描述</td>
  			<td >
  			    <textarea name="interestObjDesp" wrap="soft" cols="25" rows="5"></textarea>
            </td>
  		</tr>
        
         
         <tr>
            <td> <input type="submit" name="submit" value="添加兴趣对象"/> </td>        
         </tr>
      </table>   
      
      <input type="hidden" name="peerCompId" value="<%=peerCompId%>"/>
    </form>
    <%} %>
  </body>
</html>
