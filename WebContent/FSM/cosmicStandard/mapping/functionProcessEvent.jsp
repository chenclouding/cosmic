<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@ page import="business.FSM.MappingPhase" %>
<%@ page import="hibernate.FSM.FsmFunctionProcess" %>
<%@ page import="hibernate.FSM.FsmEvent" %>
<jsp:useBean id="projectMeasureBean" scope="session" class="javaBeans.fsm.ProjectMeasureBean"/>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'functionProcessEvent.jsp' starting page</title>
    
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
        
        function confirmdel(){
        return confirm("ȷ��ɾ����");
	    }
	  function event()
	     {	
	     
		var e = document.getElementsByName( "eventId");
 		var i=0;
		var isSel=false;	
		for(i=0;i<e.length;i++){
		   if(e[i].checked){
		     isSel=true;
		     break;
		   }
		}		
		if(isSel==false)
		{
		  alert("��ѡ���¼���");		 
		  return isSel;
		}		
		else {		 
		  return isSel;		  
		}				
	}	  		
	</script>
  </head>
  
  <body>
  <% 
    if(projectMeasureBean.getProductId()==null || projectMeasureBean.getPeerCompId()==null||projectMeasureBean.getLayerId()==null)
          response.sendRedirect("/fsmch/FSM/cosmicStandard/mapping/alertFunctionProcess.jsp");
  else{  
  
  //��ȡ�Ե����Id��id����projectMeasureBean��
      String back = "funcProsEvent";
      Integer productId = projectMeasureBean.getProductId();
      Integer layerId = projectMeasureBean.getLayerId();
      Integer peerCompId = projectMeasureBean.getPeerCompId();
      //Integer funcProsId = projectMeasureBean.getFuncProsId();
      
      //���ݶԵ����idȡ����������,�¼�����Ȥ����
      MappingPhase mp = new MappingPhase();
      //measureStatus=1��ʾ���������Ѿ�����Ȥ�������˹�����=0��ʾδ����Ȥ����������
      List ffpListComplMapping = mp.getFunctionProcessByPeerCompIdAndMappingEventStatus(peerCompId,1);
      List ffpListUnMapping = mp.getFunctionProcessByPeerCompIdAndMappingEventStatus(peerCompId,0);     
      List eList = mp.getEventByPeerCompId(peerCompId);
  %>
  
	<h2>�����¼������Ĺ�������</h2>
	<table>
	  <tr>
	     <th>���</th>
	     <th>������������</th>
	     <th>�鿴</th>
	     <th>ɾ��</th>
	  </tr>
	  <% if(ffpListComplMapping==null || ffpListComplMapping.size()==0){ %>
	  <tr>
	    <td>
	      <h2 style="color:rgb(255,0,0)">��ʱ���ѽ��������Ĺ������̣���ѡ����Ӧ�������̽�������<h2>
	    <td>
	  </tr>
	  <%}else{ %>
      <% for(Object obj:ffpListComplMapping){
             FsmFunctionProcess ffp = (FsmFunctionProcess)obj; 
             Integer funcProsId = ffp.getId(); 
              
      %>
	         <tr>
		          <td><%= ffpListComplMapping.indexOf(obj)+1 %></td> 
		          <td><%= ffp.getFuncProsName() %></td>
		      	  <td><a href="/fsmch/FSM/cosmicStandard/mapping/funcProsEventDescription.jsp?funcProsId=<%=funcProsId%>&back=<%=back%>"><IMG src="/fsmch/images/btncheck.gif" alt="�鿴" border="0" /></a></td>
		         <td>
		            <a href="/fsmch/FSM/cosmicStandard/mapping/delFunctionProcessEvent.jsp?funcProsId=<%=funcProsId%>" onclick="return confirmdel();"><IMG src="/fsmch/images/btndel.gif" alt="ɾ��" width="15" height="12" border="0" /></a>		          
		          </td>
	         </tr>  
          <%}
       }%>
	</table>
  <hr>	
	<h2>����δ���¼������Ĺ������̣����������������¼��Ĺ���</h2>
   <form  name="form1" action="/fsmch/FSM/addFunctionProcessEvent.do" method="post" onSubmit="return event();">
	<table id=��table2��>
	  <tr>
	     <th>ѡ��������</th>
	     <th>ѡ���¼�</th>
	  </tr>
	  <tr>
	    <td valign=top>
	    <% if(ffpListUnMapping==null || ffpListUnMapping.size()==0){ %>
	      <h2 style="color:rgb(255,0,0)">��ʱ��δ���������Ĺ������̣��������<h2>
		<%}else{ %>
	        <select name="funcProsId" style="width:160px">     
               <% if((ffpListUnMapping!=null && ffpListUnMapping.size()!=0)){
                    for(Object obj:ffpListUnMapping){
                       FsmFunctionProcess ffp = (FsmFunctionProcess)obj; %>
  					<option value="<%=ffp.getId()%>"><%=ffp.getFuncProsName()%></option>
  			   <% }
  			   } %>
	  	   </select>
	     <%}%>
	    </td>
	    <td> 
	    <!-- table2Ƕ����table3 -->
	      <table id=��table3��>  
	      <% if(eList==null || eList.size()==0) {  %>
	      <tr><td> <h2 style="color:red">���¼���Ϣ�������</h2></td></tr>
	     <%}else{ %>
           <tr> 
              <th>�¼�����</th>
	          <th> ѡ��</th>
	         
	        </tr>
	       
	         <%for(Object obj:eList){
	            FsmEvent fe = (FsmEvent)obj;%>
	             <tr>
		            <td> 
		              <%=fe.getEventName()%>
		             </td>
		            <td>
		             <input type="checkbox" name="eventId" value="<%=fe.getId()%>" title="ѡ��/��ѡ��"/>
		            </td>
		         </tr>
	         <%}
	       } %>
	        </table>
	     </td>
	  </tr>
	 </table>
	 <% if(ffpListUnMapping==null || ffpListUnMapping.size()==0){ %>
	 <input type="submit" name="submit" value="�ύ" disabled /><%}
	 else {    	 
     	%>
     	<input type="submit" name="submit" value="�ύ" />
     <%} %>	
         
	 <input type="reset" name="reset" value="����" onclick="reset()">
	</form>	
<%} %>
	
  </body>
</html>
