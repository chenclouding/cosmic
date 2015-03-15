<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@ page import="business.FSM.ProductMeasureBusiness" %>
<%@ page import="hibernate.FSM.FsmProduct" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'strategy.jsp' starting page</title>
    
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
     <script language="javascript">
       var http_request = false;
       
       function verifyInput()
	  {	
		var frm = document.form0;
	   
			if(frm.productId.value==0) 
			{
				alert("请选择产品！");
				frm.productId.focus();
				return false;
			}			
					
		}
		 </script>
  </head>
  
  <body>
   <% 
     ProductMeasureBusiness pmb = new ProductMeasureBusiness(); 
     Iterator it = pmb.getAllProduct().iterator();              //迭代器获得所有待估算软件    
   %>
   <table>
     <tr>
       <td>
       请选择产品
		    <form  name="form0" action="/fsmch/FSM/cosmicStandard/strategy/strategyPhase.jsp"  method="post" target="staregyFrame" onSubmit="return verifyInput();"  >
		      	<select name="productId" style="width:160px">
		      	<option value="0">=请选择=</option>
		      	 <%
		      	    while(it.hasNext()){
		      	        FsmProduct fp = (FsmProduct)it.next();%>		      	        
		      	        <option value="<%=fp.getId()%>"><%=fp.getProductName()%></option>
		      	  <%}%>
			 	   
			    </select>
			     <input type="submit" name="submit" value="提交">
		    </form>
		</td>
	  </tr>
	</table>
	<hr>
    
    <iFrame name="staregyFrame" frameborder="0" height="400px" width="100%" scrolling="auto"/>
    
    
  </body>
</html>
