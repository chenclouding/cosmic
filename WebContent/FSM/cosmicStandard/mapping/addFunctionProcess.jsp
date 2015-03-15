<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@ page import="business.FSM.ProductMeasureBusiness" %>
<%@ page import="hibernate.FSM.FsmProduct" %>
<%@ page import="business.FSM.StrategyPhase" %>
<%@ page import="hibernate.FSM.FsmLayer" %>
<%@ page import="hibernate.FSM.FsmPeerComponent" %>
<jsp:useBean id="projectMeasureBean" scope="session" class="javaBeans.fsm.ProjectMeasureBean"/> 
<%--<jsp:useBean id="projectMeasureBean" scope="session" class="javaBeans.fsm.ProjectMeasureBean"/--%>   
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>


<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'addFunctionProcess.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">


	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
   <link rel="stylesheet" type="text/css" href="/fsmch/images/screen.css">
     <script language="javascript">
       var http_request = false;
       function layerSelectAjax(){    
	    if (http_request.readyState == 4) {
            if (http_request.status == 200) {
               var layers = http_request.responseText;
               
               while(document.getElementById("layerId").options.length>0){
                   document.getElementById("layerId").options.remove(0);
               }
               if(layers!=""){
	               var layers2 = layers.split(",");
	                var i =0 ;     
	                while(i<layers2.length){
	                  var aOption = document.createElement("OPTION");
	                  aOption.value = layers2[i];
	                  aOption.text = layers2[i+1];
	                  document.getElementById("layerId").add(aOption);
	                  i = i+2;
	               
	                }
                }              
            } else {
                alert('There was a problem with the request.');
                alert("http_request.status:"+http_request.status);
            }
	     }
	    }     
       function peerCompSelectAjax(){    
	    if (http_request.readyState == 4) {
            if (http_request.status == 200) {
               var peerComps = http_request.responseText;
               
               while(document.getElementById("peerCompId").options.length>0){
                   document.getElementById("peerCompId").options.remove(0);
               }
               if(peerComps!=""){
	               var peerComps2 = peerComps.split(",");
	                var i =0 ;
	               
	                while(i<peerComps2.length){
	                 var aOption = document.createElement("OPTION");
	                  aOption.value = peerComps2[i];
	                  aOption.text = peerComps2[i+1];
	                  document.getElementById("peerCompId").add(aOption);
	                  i = i+2;
	               
	                }
                }              
            } else {
                alert('There was a problem with the request.');
                alert("http_request.status:"+http_request.status);
            }
	     }
	    }   
       
       function layerHttpRequest(){
	       var http_request = creatHttpRequest();
	       http_request.onreadystatechange = layerSelectAjax;
           http_request.open('GET', "/fsm/servlet/LayerRequestAjax?productId="+document.form0.productId.value, true);
           http_request.send(null);     
       }
      function peerCompHttpRequest(){
	       var http_request = creatHttpRequest();
	       http_request.onreadystatechange = peerCompSelectAjax;
           http_request.open('GET', "/fsm/servlet/PeerCompRequestAjax?layerId="+document.form0.layerId.value, true);
           http_request.send(null);     
       }
       function creatHttpRequest(){

	        if (window.XMLHttpRequest) { // Mozilla, Safari,...
	            http_request = new XMLHttpRequest();
	            if (http_request.overrideMimeType) {
	                http_request.overrideMimeType('text/xml');
	            }
	        } else if (window.ActiveXObject) { // IE
	            try {
	                http_request = new ActiveXObject("Msxml2.XMLHTTP");
	            } catch (e) {
	                try {
	                    http_request = new ActiveXObject("Microsoft.XMLHTTP");
	                } catch (e) {}
	            }       
	        }
	        if (!http_request) {
	            alert('Giving up :( Cannot create an XMLHTTP instance');
	            return false;
	        }
	       return http_request;
       }
        
    </script>
   
  </head>
  
  <body>
<%--   <jsp:getProperty name="projectMeasureBean" property="productId" />
     <jsp:getProperty name="projectMeasureBean" property="layerId" /> --%>  
   <% 
      if(projectMeasureBean.getProductId()!=null && projectMeasureBean.getPeerCompId()!=null||projectMeasureBean.getLayerId()!=null)
          response.sendRedirect("/fsmch/FSM/cosmicStandard/mapping/functionProcess.jsp");
      else{
     /*从数据库中把软件信息取出*/
     ProductMeasureBusiness pmb = new ProductMeasureBusiness(); 
     Iterator itP = pmb.getAllProduct().iterator();    //迭代器获得所有待估算软件  

   %>
   <table>
        <tr>
         <form name="form0" action="/fsmch/FSM/cosmicStandard/mapping/functionProcess.jsp"  method="post" target="compFrame" >
         
              <td>
	                请选择产品
			      	<select name="productId" id="productId" style="width:160px" onChange="layerHttpRequest();">
			      	   <option value="">=请选择=</option>
			      	 <%
			      	    while(itP.hasNext()){
			      	        FsmProduct fp = (FsmProduct)itP.next();%>
			      	        <option value="<%=fp.getId()%>"><%=fp.getProductName()%></option>
			      	  <%}%> 	 
				    </select>
		        </td>
		         <td>
		            请选择层次
			      	<select name="layerId" id="layerId" style="width:160px" onChange="peerCompHttpRequest();">	
			        	<option value="">=请选择=</option>	      
			      	 <%--
			      	    while(it2.hasNext()){
			      	        FsmLayer fp = (FsmLayer)it2.next();%>
			      	        <option value="<%=fp.getId()%>"><%=fp.getLayerName()%></option>
			      	  <%}--%>
				    </select>	     
				</td>		
		         <td>
		            请选择对等组件
			      	<select name="peerCompId" id="peerCompId" style="width:160px">	
			      	<option value="">=请选择=</option>	      
			
				    </select>	     
				</td>	 
				<td>
				  <input type="submit" name="submit" value="添加功能流程"/>
				</td>
           </form>
      </tr>
   	</table> 
    <iFrame name="compFrame" frameborder="0" height="800px" width="100%" scrolling="no"/>
  <%} %>
  </body>
</html>
