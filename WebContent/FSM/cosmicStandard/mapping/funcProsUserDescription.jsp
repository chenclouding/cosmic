<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@ page import="hibernate.FSM.FsmFunctionProcessUser" %>
<%@ page import="hibernate.FSM.FsmFunctionProcess" %>
<%@ page import="hibernate.FSM.FsmUser" %>
<%@ page import="business.FSM.StrategyPhase" %>
<%@ page import="business.FSM.MappingPhase" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'funcProsUserDescription.jsp' starting page</title>
    
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
    //��ȡ��functionProcessUser.jspҳ�����funcProsMeasureReport.jspҳ�洫����back��funcProsId 
    String back = new String(request.getParameter("back"));
    Integer funcProsId = new Integer(request.getParameter("funcProsId"));
    StrategyPhase sp = new StrategyPhase();//ҵ��㣬��Ӧ��COSMIC�����Ĳ��Խ׶�
    MappingPhase mp = new MappingPhase();
    FsmFunctionProcess funcPros = (FsmFunctionProcess)mp.getFunctionProcessById(funcProsId);   
    List uList = mp.getFunctionProcessUserByFuncProsId(funcProsId);
    
    %>
    <table>
         <tr>
            <td width="15%">����������</td>
            <td> <%=funcPros.getFuncProsName()%> </td>        
         </tr>
         <tr>
            <td width="15%">��֮������Ĺ����û�</td>
         <% if((uList!=null && uList.size()!=0)){%>
                    <% for(Object obj:uList){
                       FsmFunctionProcessUser ffpu = (FsmFunctionProcessUser)obj;
                       FsmUser fu = (FsmUser)sp.getFunctionUserById(ffpu.getUserId()); %>
         
            <td>  
  				<%=fu.getUserName()%>
  			       
  			    </td> 
  			    <%} %>
  			    <%}
                %>
  			 <% if((uList==null || uList.size()==0)){%> 
  			 <td>  
  				��   
  			 </td> 
  			<%} %>  
         </tr>
         
           		          
         
      </table>
     <!-- �жϷ���functionProcessUser.jspҳ�滹��funcProsMeasureReport.jspҳ�� -->
      <%if(back.equals("funcProsUser")){ %>
     <a href="/fsmch/FSM/cosmicStandard/mapping/functionProcessUser.jsp">����</a>
     <%} %>
     
     <%if(back.equals("funcProsMearRep")){ %>
     <a href="/fsmch/FSM/cosmicStandard/mapping/funcProsMeasureReport.jsp?funcProsId=<%=funcProsId%>">����</a>
     <%} %>
  </body>
</html>
