<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@ page import="business.FSM.MappingPhase" %>
<%@ page import="hibernate.FSM.FsmFunctionProcess" %>
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
    
    <title>My JSP 'functionProcessEvent.jsp' starting page</title>
    
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
	  function event()
	     {	
	     
		var e = document.getElementsByName( "eventId");
 		var i=0;
		var isSel=false;	
		for(i=0;i<e.length;i++){
		   if(e[i].checked){
		     isSel=true;
		     break;
		   }
		}		
		if(isSel==false)
		{
		  alert("请选择事件！");		 
		  return isSel;
		}		
		else {		 
		  return isSel;		  
		}				
	}	  		
	</script>
  </head>
  
  <body>
  <% 
    if(projectMeasureBean.getProductId()==null || projectMeasureBean.getPeerCompId()==null||projectMeasureBean.getLayerId()==null)
          response.sendRedirect("/fsmch/FSM/cosmicStandard/mapping/alertFunctionProcess.jsp");
  else{  
  
  //获取对等组件Id，id存于projectMeasureBean中
      String back = "funcProsEvent";
      Integer productId = projectMeasureBean.getProductId();
      Integer layerId = projectMeasureBean.getLayerId();
      Integer peerCompId = projectMeasureBean.getPeerCompId();
      //Integer funcProsId = projectMeasureBean.getFuncProsId();
      
      //根据对等组件id取出功能流程,事件和兴趣对象
      MappingPhase mp = new MappingPhase();
      //measureStatus=1表示功能流程已经与兴趣对象建立了关联，=0表示未与兴趣对象建立关联
      List ffpListComplMapping = mp.getFunctionProcessByPeerCompIdAndMappingEventStatus(peerCompId,1);
      List ffpListUnMapping = mp.getFunctionProcessByPeerCompIdAndMappingEventStatus(peerCompId,0);     
      List eList = mp.getEventByPeerCompId(peerCompId);
  %>
  
	<h2>已与事件关联的功能流程</h2>
	<table>
	  <tr>
	     <th>序号</th>
	     <th>功能流程名称</th>
	     <th>查看</th>
	     <th>删除</th>
	  </tr>
	  <% if(ffpListComplMapping==null || ffpListComplMapping.size()==0){ %>
	  <tr>
	    <td>
	      <h2 style="color:rgb(255,0,0)">暂时无已建立关联的功能流程，请选择相应功能流程建立关联<h2>
	    <td>
	  </tr>
	  <%}else{ %>
      <% for(Object obj:ffpListComplMapping){
             FsmFunctionProcess ffp = (FsmFunctionProcess)obj; 
             Integer funcProsId = ffp.getId(); 
              
      %>
	         <tr>
		          <td><%= ffpListComplMapping.indexOf(obj)+1 %></td> 
		          <td><%= ffp.getFuncProsName() %></td>
		      	  <td><a href="/fsmch/FSM/cosmicStandard/mapping/funcProsEventDescription.jsp?funcProsId=<%=funcProsId%>&back=<%=back%>"><IMG src="/fsmch/images/btncheck.gif" alt="查看" border="0" /></a></td>
		         <td>
		            <a href="/fsmch/FSM/cosmicStandard/mapping/delFunctionProcessEvent.jsp?funcProsId=<%=funcProsId%>" onclick="return confirmdel();"><IMG src="/fsmch/images/btndel.gif" alt="删除" width="15" height="12" border="0" /></a>		          
		          </td>
	         </tr>  
          <%}
       }%>
	</table>
  <hr>	
	<h2>对于未与事件关联的功能流程，建立功能流程与事件的关联</h2>
   <form  name="form1" action="/fsmch/FSM/addFunctionProcessEvent.do" method="post" onSubmit="return event();">
	<table id=“table2”>
	  <tr>
	     <th>选择功能流程</th>
	     <th>选择事件</th>
	  </tr>
	  <tr>
	    <td valign=top>
	    <% if(ffpListUnMapping==null || ffpListUnMapping.size()==0){ %>
	      <h2 style="color:rgb(255,0,0)">暂时无未建立关联的功能流程，请先添加<h2>
		<%}else{ %>
	        <select name="funcProsId" style="width:160px">     
               <% if((ffpListUnMapping!=null && ffpListUnMapping.size()!=0)){
                    for(Object obj:ffpListUnMapping){
                       FsmFunctionProcess ffp = (FsmFunctionProcess)obj; %>
  					<option value="<%=ffp.getId()%>"><%=ffp.getFuncProsName()%></option>
  			   <% }
  			   } %>
	  	   </select>
	     <%}%>
	    </td>
	    <td> 
	    <!-- table2嵌套了table3 -->
	      <table id=“table3”>  
	      <% if(eList==null || eList.size()==0) {  %>
	      <tr><td> <h2 style="color:red">无事件信息，请添加</h2></td></tr>
	     <%}else{ %>
           <tr> 
              <th>事件名称</th>
	          <th> 选择</th>
	         
	        </tr>
	       
	         <%for(Object obj:eList){
	            FsmEvent fe = (FsmEvent)obj;%>
	             <tr>
		            <td> 
		              <%=fe.getEventName()%>
		             </td>
		            <td>
		             <input type="checkbox" name="eventId" value="<%=fe.getId()%>" title="选择/不选择"/>
		            </td>
		         </tr>
	         <%}
	       } %>
	        </table>
	     </td>
	  </tr>
	 </table>
	 <% if(ffpListUnMapping==null || ffpListUnMapping.size()==0){ %>
	 <input type="submit" name="submit" value="提交" disabled /><%}
	 else {    	 
     	%>
     	<input type="submit" name="submit" value="提交" />
     <%} %>	
         
	 <input type="reset" name="reset" value="重置" onclick="reset()">
	</form>	
<%} %>
	
  </body>
</html>
