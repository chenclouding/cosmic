<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@ page import="business.FSM.StrategyPhase" %>
<%@ page import="hibernate.FSM.FsmMeasureScope" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'editMeasureScope.jsp' starting page</title>
    
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
		var frm = document.measureScopeForm;
	   
			if(isEmpty(frm.measureScopeName.value)) 
			{
				alert("����д������Χ���ƣ�");
				frm.measureScopeName.focus();				
				return false;
			}
			
		}
		</script>

  </head>
  
  <body>
      <%
       /*��ȡ��ҳ��measureScope.jsp����measScopeId��productId*/
      Integer measScopeId = new Integer(request.getParameter("measScopeId"));
      Integer productId = new Integer(request.getParameter("productId"));
      
      /*�����ݿ��а�idΪmeasScopeId�Ķ�����Χȡ��*/
      StrategyPhase sp = new StrategyPhase(); //ҵ��㣬��Ӧ��COSMIC�����Ĳ��Խ׶�
      FsmMeasureScope measureScope = (FsmMeasureScope)sp.getMeasureScopeById(measScopeId);
     
     
      %>
  <form action="/fsmch/FSM/editMeasureScope.do" name="measureScopeForm" method="post" onSubmit="return verifyInput();">
      <table>
         <tr>
            <td width="15%">������Χ����</td>
            <td> <input type="text" name="measureScopeName" value="<%=measureScope.getMeasureScopeName()%>"/> </td>        
         </tr>
         
        <tr>
            <td width="15%">������Χ����</td> 
            <td><input type="text" name="measureScopeDesp" value="<%=measureScope.getMeasureScopeDesp() %>"/>   </td>     
         </tr>
              
         <tr>
            <td> <input type="submit" name="submit" value="�޸Ķ�����Χ"/> </td>        
         </tr>
         
      </table>
      <input type="hidden" name="id" value="<%=measScopeId%>"/>  
      <input type="hidden" name="productId" value="<%=productId%>"/> 
    </form>
  </body>
</html>
