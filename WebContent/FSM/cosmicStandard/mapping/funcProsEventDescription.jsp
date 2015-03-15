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
    //获取从functionProcessInterestObject.jsp或者funcProsMeasureReport.jsp页面传来的back、funcProsId 
    String back = new String(request.getParameter("back"));
    Integer funcProsId = new Integer(request.getParameter("funcProsId"));
    MappingPhase mp = new MappingPhase();//业务层，对应于COSMIC方法的策略阶段
   
    FsmFunctionProcess funcPros = (FsmFunctionProcess)mp.getFunctionProcessById(funcProsId);
    FsmFunctionProcessEvent funcProsEvent = new FsmFunctionProcessEvent();
    List eList = mp.getFunctionProcessEventByFuncProsId(funcProsId);
    
    %>
    <table>
         <tr>
            <td width="15%">功能流程名</td>
            <td> <%=funcPros.getFuncProsName()%> </td>        
         </tr>
         <tr>
            <td width="15%">与之相关联的事件</td> 
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
  				无   
  			 </td> 
  			<%} %>  
         </tr>
           		          
         
      </table>
     <!-- 判断返回functionProcessInterestObject.jsp页面还是funcProsMeasureReport.jsp页面 -->
      <%if(back.equals("funcProsEvent")){ %>
     <a href="/fsmch/FSM/cosmicStandard/mapping/functionProcessEvent.jsp">返回</a>
     <%} %>
     
     <%if(back.equals("funcProsMearRep")){ %>
     <a href="/fsmch/FSM/cosmicStandard/mapping/funcProsMeasureReport.jsp?funcProsId=<%=funcProsId%>">返回</a>
     <%} %>
  </body>
</html>
