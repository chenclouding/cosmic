<%@ page contentType="text/html;charset=gbk" pageEncoding="GBK"%>
<%request.setCharacterEncoding("gbk");%>
<%@ page language="java" import="java.util.*"%>
<%@ page import="business.FSM.ProductMeasureBusiness" %>
<%@ page import="hibernate.FSM.FsmProduct" %>
  
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";

%>


<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'selectFunctionProcess.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">

   <link rel="stylesheet" type="text/css" href="/fsmch/images/screen.css">
    <script language="JavaScript" src="/fsmch/javascript/verify.js"></script>
     <script language="javascript">
       function productSelect(){
          window.location.href("/fsmch/FSM/cosmicStandard/measure/selectFunctionProcess2.jsp?productId="+document.form0.productId.value);   
       }
       function verifyInput()
	  {	
		var frm = document.form0;
	   
			if(isEmpty(frm.productId.value)) 
			{
				alert("Please Select£¡");
				frm.productId.focus();
				return false;
			}
			if(isEmpty(frm.layerId.value)) 
			{
				alert("Please Select the level£¡");
				frm.layerId.focus();
				return false;
			}
			if(isEmpty(frm.peerCompId.value)) 
			{
				alert("Please choose the£¡");
				frm.peerCompId.focus();
				return false;
			}		
		}

        
    </script>
   
  </head>
  
  <body>
   <% 
     /*Information from the database to remove the software*/
     ProductMeasureBusiness pmb = new ProductMeasureBusiness(); 
     Iterator itP = pmb.getAllProduct().iterator();    //Iterator to get all the software to be estimated 
    
   %>
   <table>
        <tr>
         <form name="form0" action=""  method="post" target="compFrame" onSubmit="return verifyInput();" >
         
              <td>
	                Please Select
			      	<select name="productId" id="productId" style="width:160px" onChange="productSelect();">
			      	   <option value="">=Please Select=</option>
			      	 <%
			      	    while(itP.hasNext()){
			      	        FsmProduct fp = (FsmProduct)itP.next();%>
			      	        <option value="<%=fp.getId()%>"><%=fp.getProductName()%></option>
			      	  <%}%> 	 
				    </select>
		        </td>
		         <td>
		            Please Select The Level
			      	<select name="layerId" id="layerId" style="width:160px" >	
			        	<option value="">=Please Select=</option>	      
				    </select>	     
				</td>		
		         <td>
		            Please Choose The Components
			      	<select name="peerCompId" id="peerCompId" style="width:160px">	
			      	<option value="">=Please Select=</option>	      
			
				    </select>	     
				</td>	 
				<td>
				  <input type="submit" name="submit" value="Recognition process stages"/>
				</td>
           </form>
      </tr>
   	</table> 
    <iFrame name="compFrame" frameborder="0" height="800px" width="100%" scrolling="no"/>
  </body>
</html>
