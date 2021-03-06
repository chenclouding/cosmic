<%@ page contentType="text/html;charset=gbk" pageEncoding="GBK"%>
<%request.setCharacterEncoding("gbk");%>
<%@ page language="java" import="java.util.*"%>
<%@ page import="business.FSM.ProductMeasureBusiness" %>
<%@ page import="hibernate.FSM.FsmProduct" %>
<%@ page import="business.FSM.StrategyPhase" %>
<%@ page import="hibernate.FSM.FsmLayer" %>
<%@ page import="hibernate.FSM.FsmPeerComponent" %>
<%--<jsp:useBean id="projectMeasureBean" scope="session" class="javaBeans.fsm.ProjectMeasureBean"/--%>   
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";

%>


<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'mapping.jsp' starting page</title>
    
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
       function productSelect(){
          window.location.href("/fsmch/FSM/cosmicStandard/mapping/mapping2.jsp?productId="+document.form0.productId.value);   
       }
       function layerSelect(){
         window.location.href("/fsmch/FSM/cosmicStandard/mapping/mapping3.jsp?productId="+document.form0.productId.value+"&layerId="+document.form0.layerId.value);   
       }
       function verifyInput()
	  {	
		var frm = document.form0;
	   
			if(isEmpty(frm.productId.value)) 
			{
				alert("请选择产品！");
				frm.productId.focus();
				return false;
			}
			if(isEmpty(frm.layerId.value)) 
			{
				alert("请选择层次！");
				frm.layerId.focus();
				return false;
			}
			if(isEmpty(frm.peerCompId.value)) 
			{
				alert("请选择对等组件！");
				frm.peerCompId.focus();
				return false;
			}		
		}

        
    </script>
   
  </head>
  
  <body>
<%--   <jsp:getProperty name="projectMeasureBean" property="productId" />
     <jsp:getProperty name="projectMeasureBean" property="layerId" /> --%>  
   <% 
     int productId = new Integer(request.getParameter("productId")); 
     /*Information from the database to remove the software*/
     ProductMeasureBusiness pmb = new ProductMeasureBusiness(); 
     Iterator itP = pmb.getAllProduct().iterator();    //Iterator to get all the software to be estimated  
     StrategyPhase sp = new StrategyPhase();
     Iterator itL = sp.getLayerByProductId(productId).iterator();    //Iterator to obtain the level of product
     FsmProduct fp = null;
   %>
   <table>
        <tr>
         <form name="form0" action="/fsmch/FSM/cosmicStandard/mapping/mappingPhase.jsp"  method="post" target="compFrame" onSubmit="return verifyInput();" >
         
              <td>
	                请选择产品
			      	<select name="productId" id="productId" style="width:160px" onChange="productSelect();">
			      	   <option value="">=请选择=</option>
			      	 <%
			      	    while(itP.hasNext()){
			      	        fp = (FsmProduct)itP.next();
			      	 		if(fp.getId()==productId){%>
			      	           <option value="<%=fp.getId()%>" selected> <%=fp.getProductName()%> </option>
			      	         <%}else{%>
			      	           <option value="<%=fp.getId()%>"> <%=fp.getProductName()%> </option>
			      	         <%}%>
			      	  <%}%>  	 
				    </select>
		        </td>
		         <td>
		            Please Select a lovel
			      	<select name="layerId" id="layerId" style="width:160px" onChange="layerSelect();" >	
			        	<option value="">=请选择=</option>
			         <%
			      	    while(itL.hasNext()){
			      	        FsmLayer fl = (FsmLayer)itL.next();%>
			      	        <option value="<%=fl.getId()%>"><%=fl.getLayerName()%></option>
			      	  <%}%> 	      
				    </select>	     
				</td>		
		         <td>
		            请选择对等组件
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
