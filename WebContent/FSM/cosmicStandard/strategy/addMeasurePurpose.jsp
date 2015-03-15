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
    
    <title>My JSP 'addMeasurePurpose.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
    <link rel="stylesheet" type="text/css" href="/fsmch/images/screen.css">
  </head>
  
  <body>
   <% 
     ProductMeasureBusiness pmb = new ProductMeasureBusiness(); 
     Iterator it = pmb.getAllProduct().iterator();              //Iterator to get all the software to be estimated    
   %>
   <table>
     <tr>
       <td>
       ÇëÑ¡Ôñ²úÆ·
		    <form  action="/fsmch/FSM/cosmicStandard/strategy/measurePurpose.jsp"  method="post" target="staregyFrame" >
		      	<select name="productId" style="width:160px">
		      	<option value="0">=Please Select=</option>
		      	 <%
		      	    while(it.hasNext()){
		      	        FsmProduct fp = (FsmProduct)it.next();%>		      	        
		      	        <option value="<%=fp.getId()%>"><%=fp.getProductName()%></option>
		      	  <%}%>
			 	   
			    </select>
			     <input type="submit" name="submit" value="Submitted">
		    </form>
		</td>
	  </tr>
	</table>
	<hr>
    
    <iFrame name="staregyFrame" frameborder="0" height="400px" width="100%" scrolling="auto"/>
    
    
  </body>
</html>
