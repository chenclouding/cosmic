<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@ page import="hibernate.FSM.FsmFunctionProcessInterestObject" %>
<%@ page import="hibernate.FSM.FsmFunctionProcess" %>
<%@ page import="hibernate.FSM.FsmInterestObject" %>
<%@ page import="business.FSM.MappingPhase" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'funcProsIODescription.jsp' starting page</title>
    
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
    //��ȡ��functionProcessInterestObject.jspҳ�����funcProsMeasureReport.jspҳ�洫����back��funcProsId 
    String back = new String(request.getParameter("back"));
    Integer funcProsId = new Integer(request.getParameter("funcProsId"));
    MappingPhase mp = new MappingPhase();//ҵ��㣬��Ӧ��COSMIC�����Ĳ��Խ׶�
   
    FsmFunctionProcess funcPros = (FsmFunctionProcess)mp.getFunctionProcessById(funcProsId);
    FsmFunctionProcessInterestObject funcProsIO = new FsmFunctionProcessInterestObject();
    List ioList = mp.getFunctionProcessInterestObjectByFuncProsId(funcProsId);
    
    %>
   
    <table>
         <tr>
            <td width="15%">����������</td>
            <td> <%=funcPros.getFuncProsName()%> </td>        
         </tr>
         <tr>
            <td width="15%">��֮���������Ȥ����</td>
         <% if((ioList!=null && ioList.size()!=0)){%>
                    <% for(Object obj:ioList){
                       FsmFunctionProcessInterestObject ffpio = (FsmFunctionProcessInterestObject)obj;
                       FsmInterestObject fio = (FsmInterestObject)mp.getInterestObjectById(ffpio.getInterestObjId()); %>        
            <td>  
  				<%=fio.getInterestObjName()%>
  			       
  			</td>             
         <%}
         }%>
          <% if((ioList==null || ioList.size()==0)){%> 
  			 <td>  
  				��   
  			 </td> 
  			<%} %>  
         </tr>  		          
         
      </table>
      <!-- �жϷ���functionProcessInterestObject.jspҳ�滹��funcProsMeasureReport.jspҳ�� -->
      <%if(back.equals("funcProsIntObj")){ %>
     <a href="/fsmch/FSM/cosmicStandard/mapping/functionProcessInterestObject.jsp">����</a>
     <%} %>
     
     <%if(back.equals("funcProsMearRep")){ %>
     <a href="/fsmch/FSM/cosmicStandard/mapping/funcProsMeasureReport.jsp?funcProsId=<%=funcProsId%>">����</a>
     <%} %>
  </body>
</html>
