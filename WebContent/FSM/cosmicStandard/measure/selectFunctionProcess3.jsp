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
    
    <title>My JSP 'measure/selectFunctionProcess3.jsp' starting page</title>
    
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
          window.location.href("/fsmch/FSM/cosmicStandard/measure/selectFunctionProcess2.jsp?productId="+document.form0.productId.value);   
       }
       function layerSelect(){
         window.location.href("/fsmch/FSM/cosmicStandard/measure/selectFunctionProcess3.jsp?productId="+document.form0.productId.value+"&layerId="+document.form0.layerId.value);   
       }
       function verifyInput()
	  {	
		var frm = document.form0;
	   
			if(isEmpty(frm.productId.value)) 
			{
				alert("Please Select a product£¡");
				frm.productId.focus();
				return false;
			}
			if(isEmpty(frm.layerId.value)) 
			{
				alert("Please Select a Level£¡");
				frm.layerId.focus();
				return false;
			}
			if(isEmpty(frm.peerCompId.value)) 
			{
				alert("Please Select the components£¡");
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
     int layerId = new Integer(request.getParameter("layerId"));  
     /*Information from the database to remove the software*/
     ProductMeasureBusiness pmb = new ProductMeasureBusiness(); 
     Iterator itP = pmb.getAllProduct().iterator();    //Iterator to get all the software to be estimated  
     StrategyPhase sp = new StrategyPhase();
     Iterator itL = sp.getLayerByProductId(productId).iterator();    //Iterator to get all the software to be estimated
     List pcs = sp.getPeerComponentByLayerId(layerId);    //Iterator access levels for other components
     List pcs2 = new ArrayList();
     FsmPeerComponent fpc = null;
     for(Object obj:pcs){
         fpc = (FsmPeerComponent)obj;
         if(fpc.getCompType()==1){  //On the other components for the atomic components, composite components filter
            pcs2.add(fpc);
         }
     } 
     
     
     Iterator itPe = pcs2.iterator();
    
     FsmProduct fp = null;
     FsmLayer  fl = null;
   %>
   <table>
        <tr>
         <form name="form0" action="/fsmch/FSM/cosmicStandard/measure/setProjectMeasureBean.jsp"  method="post" target="compFrame" onSubmit="return verifyInput();" >
         
              <td>
	                Please Select a Product
			      	<select name="productId" id="productId" style="width:160px" onChange="productSelect();">
			      	   <option value="">=Please Select=</option>
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
		            Please Select a level
			      	<select name="layerId" id="layerId" style="width:160px" >	
			        	<option value="">=Please Select=</option>
			      	 <%
			      	    while(itL.hasNext()){
			      	        fl = (FsmLayer)itL.next();
			      	 		if(fl.getId()==layerId){%>
			      	           <option value="<%=fl.getId()%>" selected> <%=fl.getLayerName()%> </option>
			      	         <%}else{%>
			      	           <option value="<%=fl.getId()%>"> <%=fl.getLayerName()%> </option>
			      	         <%}%>
			      	  <%}%> 	      
				    </select>	     
				</td>		
		         <td>
		            Please Select the Components
			      	<select name="peerCompId" id="peerCompId" style="width:160px">	
			      	<option value="">=Please Select=</option>	      
			         <%
			      	    while(itPe.hasNext()){
			      	        fpc = (FsmPeerComponent)itPe.next();%>
			      	        <option value="<%=fpc.getId()%>"><%=fpc.getPeerCompName()%></option>
			      	  <%}%> 			
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
