<%@ page language="java" import="java.util.*" pageEncoding="GB2312"%>
<%@ page import="business.FSM.MappingPhase" %>
<%@ page import="business.FSM.StrategyPhase" %>
<%@ page import="hibernate.FSM.FsmFunctionProcess" %>
<%@ page import="hibernate.FSM.FsmEvent" %>
<%@ page import="hibernate.FSM.FsmInterestObject" %>
<%@ page import="business.FSM.ProductMeasureBusiness" %>
<%@ page import="hibernate.FSM.FsmProduct" %>
<%@ page import="hibernate.FSM.FsmLayer" %>
<%@ page import="hibernate.FSM.FsmPeerComponent" %>
<jsp:useBean id="projectMeasureBean" scope="session" class="javaBeans.fsm.ProjectMeasureBean"/> 
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'measure.jsp' starting page</title>
    
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

      //���ݶԵ����idȡ����������,�¼�����Ȥ����
      MappingPhase mp = new MappingPhase();
      //measureStatus=1�����ֶ�����=0����δ������=2����ȫ������
      List ffpListCompMeasure = mp.getFunctionProcessByPeerCompIdAndMeasureStatus(peerCompId,1);
      List ffpListUnMeasure = mp.getFunctionProcessByPeerCompIdAndMeasureStatus(peerCompId,0);
      List eList = mp.getEventByPeerCompId(peerCompId);
      List ioList = mp.getInterestObjectByPeerCompId(peerCompId);
    %>
	  <h1> �������</h1>
	    <table>
	      <tr> 
	          <td width="15%">�������:</td> <td><%=productName%></td>
	      </tr>
	       <tr> 
	          <td width="15%">�������:</td> <td><%=layerName %></td>
	      </tr>
	       <tr> 
	          <td width="15%">�������:</td> <td><%=peerCompName%></td>
	      </tr>
	    </table>
	    <hr>  
	<h2>���ֶ����Ĺ�������</h2>
	<table>
	  <tr>
	     <th>���</th>
	     <th>������������</th>
	     <th>�޸ļ��鿴</th>
	     <th>����������</th>
	  </tr>
	  <% if(ffpListCompMeasure==null || ffpListCompMeasure.size()==0){ %>
	  <tr>
	    <td>
	      <h2 style="color:rgb(255,0,0)">��ʱ������ɶ����Ĺ������̣���ѡ�������̽��ж���<h2>
	    <td>
	   </tr>
	  <%}else{ %>
      <% for(Object obj:ffpListCompMeasure){
             FsmFunctionProcess ffp = (FsmFunctionProcess)obj; 
             Integer funcProsId = ffp.getId(); %>
	         <tr>
		          <td><%= ffpListCompMeasure.indexOf(obj)+1 %></td> 
		          <td><%= ffp.getFuncProsName() %></td>
		      	  <td><a href="/fsmch/FSM/cosmicStandard/measure/editDataMoveOfFuncPros.jsp?funcProsId=<%=funcProsId%>">�޸ļ��鿴</a></td>
		          <td><a href="/fsmch/FSM/cosmicStandard/mapping/delFuncProsMeasure.jsp?funcProsId=<%=funcProsId%>">����������</a></td>
	         </tr>  
          <%}
       }%>
 
	</table>
	    
    <form action="/fsm/servlet/SetFuncProsId"> 
     <table name="table0">
      <!--��ѡ��δ��ɶ����Ĺ������̣����ж��� -->
      <% if(ffpListUnMeasure!=null && ffpListUnMeasure.size()!=0){ %>
           <tr>
	          <td> ��ѡ��������</td>
	          <td> 
	         	<select name="funcProsId">     
                <% if((ffpListUnMeasure!=null && ffpListUnMeasure.size()!=0)){
                     for(Object obj:ffpListUnMeasure){
                        FsmFunctionProcess ffp = (FsmFunctionProcess)obj; %>
	  					<option value="<%=ffp.getId()%>"><%=ffp.getFuncProsName()%></option>
	  			   <% }
	  			   } %>
	  		    </select>
	           </td>        
	        </tr> 
	    <%}else{%>
	    
	      <tr><td><h1 style="color:RED">û�д������Ĺ������̣������</h1></td></tr>
	    <% }%>


	

      <%-- if(eList!=null && eList.size()!=0){ %>
           <tr>
	          <td> ��ѡ���¼�</td>
	          <td> 
	         	<select name="event">     
                <% for(Object obj:eList){
                       FsmEvent fe = (FsmEvent)obj; %>
	  					<option value="<%=fe.getId()%>"><%=fe.getEventName()%></option>
	  			<%} %>
	  		    </select>
	           </td>        
	        </tr> 
	    <%}--%>
     <%--if(ioList!=null && ioList.size()!=0){ %>
           <tr>
	          <td> ��ѡ����Ȥ����</td>
	          <td> 
	         	<select name="interestObjId">     
                <% for(Object obj:ioList){
                       FsmInterestObject fio = (FsmInterestObject)obj; %>
	  					<option value="<%=fio.getId()%>"><%=fio.getInterestObjName()%></option>
	  			<%} %>
	  		    </select>
	           </td>        
	        </tr> 
	    <%}--%>

	   
         <tr>
            <td> <input type="submit" name="submit" value="��������ƶ�" onClick="addMovement()"/> </td>        
         </tr>         
      </table>
    </form>
    
    <%} %>

  </body>
</html>
