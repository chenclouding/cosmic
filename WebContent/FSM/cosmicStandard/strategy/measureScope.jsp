<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@ page import="business.FSM.ProductMeasureBusiness" %>
<%@ page import="hibernate.FSM.FsmProduct" %>
<%@ page import="hibernate.FSM.FsmMeasureScope" %>
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
    
    <title>My JSP 'measureScope.jsp' starting page</title>
    
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
		var frm = document.measureScopeForm;
	   
			if(isEmpty(frm.measureScopeName.value)) 
			{
				alert("请填写估算范围名称！");
				frm.measureScopeName.focus();
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
      <h4> 估算范围列表</h4>
      <% /*从数据库中把估算范围信息取出*/
       StrategyPhase sp = new StrategyPhase(); //业务层，对应于COSMIC方法的策略阶段
       List measScopeList = sp.getMeasureScopeByProductId(productId);
       FsmMeasureScope measureScope = new FsmMeasureScope();//定义实体Bean
     
       /*若无估算范围信息，提示添加；若有估算范围信息，列出估算范围列表*/
       if(measScopeList==null ||measScopeList.size()==0 ){%>  
         <h1 style="color:red">目前无度量范围信息，请添加度量范围</h1> 
       <%}else{ %>
         <table>
	       <tr> 
		        <td >序号</td> 
		        <td>估算范围名称</td>		        
		        <td>查看</td>
		        <td>修改</td>
		        <td>删除</td>
	       </tr> 
	    <%   for(Object p:measScopeList){ 
	         measureScope = (FsmMeasureScope)p; 
	         Integer measScopeId = measureScope.getId(); 
	         
	    %>
	         <tr>
		          <td><%= measScopeList.indexOf(p)+1 %></td> 
		          <td><%= measureScope.getMeasureScopeName() %></td>
		          <td><a href="/fsmch/FSM/cosmicStandard/strategy/measureScopeDescription.jsp?productId=<%=productId%>&measScopeId=<%=measScopeId %>"><IMG src="/fsmch/images/btncheck.gif" alt="查看" border="0" /></a></td>
		          <td><a href="/fsmch/FSM/cosmicStandard/strategy/editMeasureScope.jsp?measScopeId=<%=measScopeId%>&productId=<%=productId%>"><IMG src="/fsmch/images/btnedit.gif" alt="修改" border="0" /></a></td>
		          <td><a href="/fsmch/FSM/cosmicStandard/strategy/delMeasureScope.jsp?measScopeId=<%=measScopeId%>&productId=<%=productId%>" onclick="return confirmdel();"><IMG src="/fsmch/images/btndel.gif" alt="删除" width="15" height="12" border="0" /></a></td>		          
	         </tr>  
          <%}%>
           </table>
        <%}%>  
     
   
   
    <form action="/fsmch/FSM/addMeasureScope.do" name="measureScopeForm" method="post" onSubmit="return verifyInput();">
      <table>
         <tr>
            <td width="15%">估算范围名称</td>
            <td> <input type="text" name="measureScopeName" value=""/> </td>        
         </tr>
         
        <tr>
  			<td width="10%">估算范围描述</td>
  			<td >
  			    <textarea name="measureScopeDesp" wrap="soft" cols="25" rows="5"></textarea>
            </td>
  		</tr>
        
         <tr>
            <td> <input type="submit" name="submit" value="添加估算范围"/> </td>        
         
              <td><input type="reset" name="reset" value="重置"/></td>
            </tr> 
      </table>
      
      <input type="hidden" name="productId" value="<%=productId%>"/>
    </form>
     <hr>
   
  <%} %>
  </body>
</html>
