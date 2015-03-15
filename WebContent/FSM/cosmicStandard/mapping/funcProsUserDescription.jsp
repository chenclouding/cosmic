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
    //获取从functionProcessUser.jsp页面或者funcProsMeasureReport.jsp页面传来的back、funcProsId 
    String back = new String(request.getParameter("back"));
    Integer funcProsId = new Integer(request.getParameter("funcProsId"));
    StrategyPhase sp = new StrategyPhase();//业务层，对应于COSMIC方法的策略阶段
    MappingPhase mp = new MappingPhase();
    FsmFunctionProcess funcPros = (FsmFunctionProcess)mp.getFunctionProcessById(funcProsId);   
    List uList = mp.getFunctionProcessUserByFuncProsId(funcProsId);
    
    %>
    <table>
         <tr>
            <td width="15%">功能流程名</td>
            <td> <%=funcPros.getFuncProsName()%> </td>        
         </tr>
         <tr>
            <td width="15%">与之相关联的功能用户</td>
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
  				无   
  			 </td> 
  			<%} %>  
         </tr>
         
           		          
         
      </table>
     <!-- 判断返回functionProcessUser.jsp页面还是funcProsMeasureReport.jsp页面 -->
      <%if(back.equals("funcProsUser")){ %>
     <a href="/fsmch/FSM/cosmicStandard/mapping/functionProcessUser.jsp">返回</a>
     <%} %>
     
     <%if(back.equals("funcProsMearRep")){ %>
     <a href="/fsmch/FSM/cosmicStandard/mapping/funcProsMeasureReport.jsp?funcProsId=<%=funcProsId%>">返回</a>
     <%} %>
  </body>
</html>
