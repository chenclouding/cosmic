<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@ page import="hibernate.FSM.FsmFunctionProcessEvent" %>
<%@ page import="hibernate.FSM.FsmFunctionProcess" %>
<%@ page import="hibernate.FSM.FsmEvent" %>
<%@ page import="business.FSM.MappingPhase" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'funcProsEventDescription.jsp' starting page</title>
    
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
    //��ȡ��functionProcessInterestObject.jsp����funcProsMeasureReport.jspҳ�洫����back��funcProsId 
    String back = new String(request.getParameter("back"));
    Integer funcProsId = new Integer(request.getParameter("funcProsId"));
    MappingPhase mp = new MappingPhase();//ҵ��㣬��Ӧ��COSMIC�����Ĳ��Խ׶�
   
    FsmFunctionProcess funcPros = (FsmFunctionProcess)mp.getFunctionProcessById(funcProsId);
    FsmFunctionProcessEvent funcProsEvent = new FsmFunctionProcessEvent();
    List eList = mp.getFunctionProcessEventByFuncProsId(funcProsId);
    
    %>
    <table>
         <tr>
            <td width="15%">����������</td>
            <td> <%=funcPros.getFuncProsName()%> </td>        
         </tr>
         <tr>
            <td width="15%">��֮��������¼�</td> 
         <% if((eList!=null && eList.size()!=0)){%>
                    <% for(Object obj:eList){
                       FsmFunctionProcessEvent ffpe = (FsmFunctionProcessEvent)obj;
                       FsmEvent fe = (FsmEvent)mp.getEventById(ffpe.getEventId()); %>       
            <td>  
  				<%=fe.getEventName()%>
  			       
  			    </td>            
         <%}
         }%>
          <% if((eList==null || eList.size()==0)){%> 
  			 <td>  
  				��   
  			 </td> 
  			<%} %>  
         </tr>
           		          
         
      </table>
     <!-- �жϷ���functionProcessInterestObject.jspҳ�滹��funcProsMeasureReport.jspҳ�� -->
      <%if(back.equals("funcProsEvent")){ %>
     <a href="/fsmch/FSM/cosmicStandard/mapping/functionProcessEvent.jsp">����</a>
     <%} %>
     
     <%if(back.equals("funcProsMearRep")){ %>
     <a href="/fsmch/FSM/cosmicStandard/mapping/funcProsMeasureReport.jsp?funcProsId=<%=funcProsId%>">����</a>
     <%} %>
  </body>
</html>
