<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@ page import="business.FSM.StrategyPhase" %>
<%@ page import="hibernate.FSM.FsmUser" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'editFunctionUser.jsp' starting page</title>
    
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
		function verifyInput()
	  {	
		var frm = document.userForm;
	   
			if(isEmpty(frm.userName.value)) 
			{
				alert("����д�����û����ƣ�");
				frm.userName.focus();				
				return false;
			}
			
		}
		</script>

  </head>
  
  <body>
      <%
       /*��ȡ��ҳ��functionUser.jsp����userId��productId*/
      Integer userId = new Integer(request.getParameter("userId"));
      Integer productId = new Integer(request.getParameter("productId"));
      
      /*�����ݿ��а�idΪuserId�Ĺ����û�ȡ��*/
      StrategyPhase sp = new StrategyPhase(); //ҵ��㣬��Ӧ��COSMIC�����Ĳ��Խ׶�
      FsmUser user = (FsmUser)sp.getFunctionUserById(userId);
     
     
      %>
  <form action="/fsmch/FSM/editFunctionUser.do" name="userForm" method="post" onSubmit="return verifyInput();">
      <table>
         <tr>
            <td width="15%">�����û���</td>
            <td> <input type="text" name="userName" value="<%=user.getUserName()%>"/> </td>        
         </tr>
        <tr>
            <td width="15%">�����û�����</td> 
            <td><input type="text" name="userDesp" value="<%=user.getUserDesp() %>"/>   </td>     
         </tr>
              
         <tr>
            <td> <input type="submit" name="submit" value="�޸Ĺ����û�"/> </td>        
         </tr>
         
      </table>
      <input type="hidden" name="id" value="<%=userId%>"/>  
      <input type="hidden" name="productId" value="<%=productId%>"/> 
    </form>
  </body>
</html>
