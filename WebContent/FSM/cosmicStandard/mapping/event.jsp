<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@ page import="business.FSM.ProductMeasureBusiness" %>
<%@ page import="business.FSM.StrategyPhase" %>
<%@ page import="business.FSM.MappingPhase" %>
<%@ page import="hibernate.FSM.FsmProduct" %>
<%@ page import="hibernate.FSM.FsmLayer" %>
<%@ page import="hibernate.FSM.FsmPeerComponent" %>
<%@ page import="hibernate.FSM.FsmEvent" %>
<jsp:useBean id="projectMeasureBean" scope="session" class="javaBeans.fsm.ProjectMeasureBean"/> 
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'event.jsp' starting page</title>
    
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
		var frm = document.eventForm;
	   
			if(isEmpty(frm.eventName.value)) 
			{
				alert("请填写事件名称！");
				frm.eventName.focus();
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
          <td width="15%">所属组件:</td> <td><%=peerCompName %></td>
      </tr>
    </table>
    <hr>
   <h2> 事件列表</h2>
       <%
       //从数据库中把此事件的事件信息全部取出
       MappingPhase mp = new MappingPhase();
       List eventList = mp.getEventByPeerCompId(peerCompId);
       FsmEvent fe = new FsmEvent();   //定义实体Bean
       //若无事件信息，提示添加；若有事件信息，列出事件列表
       if(eventList==null ||eventList.size()==0 ){%>  
         <h1 style="color:red">目前无事件信息，请添加事件</h1> 
       <%}else{ %>
	    <table>
	      <tr> 
	          <th>序号</th>
	          <th>事件</th>
	          <th>描述</th>
	          <th>修改</th>
	          <th>删除</th>
	      </tr>
  	     <%   for(Object obj:eventList){ 
	         fe = (FsmEvent)obj; 
	         Integer eventId = fe.getId(); 
	        
	        
	     %>
	         <tr>
		          <td><%= eventList.indexOf(obj)+1 %></td> 
		          <td><%= fe.getEventName() %></td>
		          <td><a href="/fsmch/FSM/cosmicStandard/mapping/eventDescription.jsp?peerCompId=<%=peerCompId%>&eventId=<%=eventId%>&productId=<%=productId%>&layerId=<%=layerId%>"><IMG src="/fsmch/images/btncheck.gif" alt="查看" border="0" /></a></td>
		      	  <td><a href="/fsmch/FSM/cosmicStandard/mapping/editEvent.jsp?peerCompId=<%=peerCompId%>&eventId=<%=eventId%>"><IMG src="/fsmch/images/btnedit.gif" alt="修改" border="0" /></a></td>
		          <td>
		            <a href="/fsmch/FSM/cosmicStandard/mapping/delEvent.jsp?eventId=<%=eventId%>" onclick="return confirmdel();"><IMG src="/fsmch/images/btndel.gif" alt="删除" width="15" height="12" border="0" /></a>		          
		          </td>
	         </tr>  
          <%}%>
           </table>
         <%} %>
  <hr>
      <h3>添加事件</h3>
     <form action="/fsmch/FSM/addEvent.do" name="eventForm" method="post" onSubmit="return verifyInput();"> 
      <table>
        <tr>
  			<td width="10%">事件名称</td>
  			<td >
  			    <input type="text" name="eventName" style="width:160px" value=""/ >
            </td>
  		</tr>
  		<tr>
  			<td width="10%">事件描述</td>
  			<td >
  			    <textarea name="eventDesp" wrap="soft" cols="25" rows="5"></textarea>
            </td>
  		</tr>
         
         <tr>
            <td> <input type="submit" name="submit" value="添加事件"/> </td>        
         </tr>
      </table>   
      
      <input type="hidden" name="peerCompId" value="<%=peerCompId%>"/>
    </form>
    <%} %>
  </body>
</html>
