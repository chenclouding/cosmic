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
        return confirm("确定删除？");
	}	  
		function verifyInput()
	  {	
		var frm = document.dataGroupForm;
	   
			if(isEmpty(frm.dataGroupName.value)) 
			{
				alert("请填写数据组名称！");
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
	   //从projectMeasureBean获得productId，peerCompId，layerId
	   Integer productId = projectMeasureBean.getProductId();
	   Integer peerCompId = projectMeasureBean.getPeerCompId();
	   Integer layerId = projectMeasureBean.getLayerId();
	   //按照各自ID将名称取出来
	   ProductMeasureBusiness pmb = new ProductMeasureBusiness();
	   StrategyPhase sp = new StrategyPhase();
	   String productName = ((FsmProduct)pmb.getProductById(productId)).getProductName();
	   String peerCompName = ((FsmPeerComponent)sp.getPeerComponentById(peerCompId)).getPeerCompName();
	   String layerName  = ((FsmLayer)sp.getLayerById(layerId)).getLayerName(); 
	    //根据对等组件id取出兴趣对象
      MappingPhase mp = new MappingPhase();     
      List ioList = mp.getInterestObjectByPeerCompId(peerCompId); 
	%>
	
	
   <h1> 软件描述</h1>
    <table>
      <tr> 
          <td width="15%">所属软件:</td> <td><%=productName%></td>
      </tr>
       <tr> 
          <td width="15%">所属层次:</td> <td><%=peerCompName%></td>
      </tr>
       <tr> 
          <td width="15%">所属组件:</td> <td><%=layerName %></td>
      </tr>
    </table>
    <hr>
    <table>
     <% 
        if(ioList==null || ioList.size()==0)
          response.sendRedirect("/fsmch/FSM/cosmicStandard/mapping/alertAddInterestObject.jsp?peerCompId="+peerCompId);%>
        <% if(ioList!=null && ioList.size()!=0){ %>
           <tr>
	          <td> 请选择兴趣对象</td>
	          <td> 
	            <form name="form0" action="/fsmch/FSM/cosmicStandard/mapping/addDataGroup.jsp?productId=<%=productId%>&layerId=<%=layerId%>&peerCompId=<%=peerCompId %>"  method="post" target="dataGroupFrame" >
	         	<select name="interestObjId">     
                <% for(Object obj:ioList){
                       FsmInterestObject fio = (FsmInterestObject)obj; %>
	  					<option value="<%=fio.getId()%>"><%=fio.getInterestObjName()%></option>
	  			<%} %>
	  		    </select>
	  		       <input type="submit" name="submit" value="提交"/>
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
