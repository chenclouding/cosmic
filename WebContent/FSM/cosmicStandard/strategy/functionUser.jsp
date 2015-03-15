<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@ page import="business.FSM.StrategyPhase" %>
<%@ page import="hibernate.FSM.FsmUser" %>
<jsp:useBean id="projectMeasureBean" scope="session" class="javaBeans.fsm.ProjectMeasureBean"/> 
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'functionUser.jsp' starting page</title>
    
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
		var frm = document.userForm;
	   
			if(isEmpty(frm.userName.value)) 
			{
				alert("请填写功能用户名称！");
				frm.userName.focus();				
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
      <h4> 功能用户列表</h4>
      <% /*从数据库中把软件信息取出*/
       StrategyPhase sp = new StrategyPhase(); //业务层，对应于COSMIC方法的策略阶段
       List userList = sp.getFunctionUserByProductId(productId);
       FsmUser user = new FsmUser();//定义实体Bean
     
       /*若无功能用户信息，提示添加；若有功能用户信息，列出功能用户列表*/
       if(userList==null ||userList.size()==0 ){%>  
         <h1 style="color:red">目前无功能用户信息，请添加功能用户</h1> 
       <%}else{ %>
         <table>
	       <tr> 
		        <td >序号</td> 
		        <td>功能用户名称</td>		        
		        <td>查看</td>
		        <td>修改</td>
		        <td>删除</td>		       
	       </tr> 
	    <%   for(Object p:userList){ 
	         user = (FsmUser)p; 
	         Integer userId = user.getId(); %>
	         <tr>
		          <td><%= userList.indexOf(p)+1 %></td> 
		          <td><%= user.getUserName() %></td>		          
		          <td><a href="/fsmch/FSM/cosmicStandard/strategy/functionUserDescription.jsp?userId=<%=userId%>&productId=<%=productId%>"><IMG src="/fsmch/images/btncheck.gif" alt="查看" border="0" /></a></td>
		          <td><a href="/fsmch/FSM/cosmicStandard/strategy/editFunctionUser.jsp?productId=<%=productId%>&userId=<%=userId%>"><IMG src="/fsmch/images/btnedit.gif" alt="修改" border="0" /></a></td>
		          <td><a href="/fsmch/FSM/cosmicStandard/strategy/delFunctionUser.jsp?productId=<%=productId%>&userId=<%=userId%>" onclick="return confirmdel();"><IMG src="/fsmch/images/btndel.gif" alt="删除" width="15" height="12" border="0" /></a></td>
		         
	         </tr>  
          <%}%>
           </table>
        <%}%>  
     
   
   
    <form action="/fsmch/FSM/addFunctionUser.do?productId=<%=productId %>" name="userForm" method="post" onSubmit="return verifyInput();">
      <table>
         <tr>
            <td width="15%">功能用户名</td>
            <td> <input type="text" name="userName" value=""/> </td>        
         </tr>
        <tr>
  			<td width="10%">功能用户描述</td>
  			<td >
  			    <textarea name="userDesp" wrap="soft" cols="25" rows="5"></textarea>
            </td>
  		</tr>     
         <tr>
            <td> <input type="submit" name="submit" value="添加用户"/> </td>        
         </tr>
         
      </table>
     <%}%>    
    </form>
     <hr>
   
 
  </body>
</html>
