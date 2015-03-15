<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@ page import="business.FSM.ProductMeasureBusiness" %>
<%@ page import="business.FSM.MappingPhase" %>
<%@ page import="business.FSM.StrategyPhase" %>
<%@ page import="business.FSM.MappingPhase" %>
<%@ page import="hibernate.FSM.FsmProduct" %>
<%@ page import="hibernate.FSM.FsmLayer" %>
<%@ page import="hibernate.FSM.FsmPeerComponent" %>
<%@ page import="hibernate.FSM.FsmInterestObject" %>
<jsp:useBean id="projectMeasureBean" scope="session" class="javaBeans.fsm.ProjectMeasureBean"/> 
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'dataGroup.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
  <link rel="stylesheet" type="text/css" href="/fsmch/images/screen.css">
 <script language="JavaScript">
     
     function confirmdel(){
        return confirm("ȷ��ɾ����");
	}	  
		function verifyInput()
	  {	
		var frm = document.dataGroupForm;
	   
			if(isEmpty(frm.dataGroupName.value)) 
			{
				alert("����д���������ƣ�");
				frm.dataGroupName.focus();
				return false;
			}
			
		}
		</script>
		
	
  </head>
  
  <body>
    <% 
       if(projectMeasureBean.getProductId()==null || projectMeasureBean.getPeerCompId()==null||projectMeasureBean.getLayerId()==null)
          response.sendRedirect("/fsmch/FSM/cosmicStandard/mapping/alertFunctionProcess.jsp");
       else{
	   //��projectMeasureBean���productId��peerCompId��layerId
	   Integer productId = projectMeasureBean.getProductId();
	   Integer peerCompId = projectMeasureBean.getPeerCompId();
	   Integer layerId = projectMeasureBean.getLayerId();
	   //���ո���ID������ȡ����
	   ProductMeasureBusiness pmb = new ProductMeasureBusiness();
	   StrategyPhase sp = new StrategyPhase();
	   String productName = ((FsmProduct)pmb.getProductById(productId)).getProductName();
	   String peerCompName = ((FsmPeerComponent)sp.getPeerComponentById(peerCompId)).getPeerCompName();
	   String layerName  = ((FsmLayer)sp.getLayerById(layerId)).getLayerName(); 
	    //���ݶԵ����idȡ����Ȥ����
      MappingPhase mp = new MappingPhase();     
      List ioList = mp.getInterestObjectByPeerCompId(peerCompId); 
	%>
	
	
   <h1> �������</h1>
    <table>
      <tr> 
          <td width="15%">�������:</td> <td><%=productName%></td>
      </tr>
       <tr> 
          <td width="15%">�������:</td> <td><%=peerCompName%></td>
      </tr>
       <tr> 
          <td width="15%">�������:</td> <td><%=layerName %></td>
      </tr>
    </table>
    <hr>
    <table>
     <% 
        if(ioList==null || ioList.size()==0)
          response.sendRedirect("/fsmch/FSM/cosmicStandard/mapping/alertAddInterestObject.jsp?peerCompId="+peerCompId);%>
        <% if(ioList!=null && ioList.size()!=0){ %>
           <tr>
	          <td> ��ѡ����Ȥ����</td>
	          <td> 
	            <form name="form0" action="/fsmch/FSM/cosmicStandard/mapping/addDataGroup.jsp?productId=<%=productId%>&layerId=<%=layerId%>&peerCompId=<%=peerCompId %>"  method="post" target="dataGroupFrame" >
	         	<select name="interestObjId">     
                <% for(Object obj:ioList){
                       FsmInterestObject fio = (FsmInterestObject)obj; %>
	  					<option value="<%=fio.getId()%>"><%=fio.getInterestObjName()%></option>
	  			<%} %>
	  		    </select>
	  		       <input type="submit" name="submit" value="�ύ"/>
	  		     </form>
	           </td>        
	        </tr> 
	    <%}%>
	    </table>
	    <iFrame name="dataGroupFrame" frameborder="0" height="800px" width="100%" scrolling="no"/>
      </iFrame>
     
   <%} %>
  </body>
</html>
