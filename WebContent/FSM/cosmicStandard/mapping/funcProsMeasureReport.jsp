<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@ page import="business.FSM.MappingPhase" %>
<%@ page import="business.FSM.MeasurePhase" %>
<%@ page import="hibernate.FSM.FsmFunctionProcess" %>
<%@ page import="hibernate.FSM.FsmDataMovement" %>
<%@ page import="hibernate.FSM.FsmDataGroup" %>

<jsp:useBean id="projectMeasureBean" scope="session" class="javaBeans.fsm.ProjectMeasureBean"/>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'funcProsMeasureReport.jsp' starting page</title>
    
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
      String  back = "funcProsMearRep";
      Integer funcProsId = new Integer(request.getParameter("funcProsId"));//获取从页面functionProcessDescription.jsp传来的funcProsId    
      MappingPhase mp = new MappingPhase();
      MeasurePhase mp1 = new MeasurePhase();   
      List dataMoveList = mp1.getDataMovementByFuncProsId(funcProsId);
      FsmFunctionProcess ffp = (FsmFunctionProcess) mp.getFunctionProcessById(funcProsId);
      Integer measureStatus = ffp.getMeasureStatus();
	  String measureStatusName = null;
	  switch (measureStatus)  
	         {
		         case 0:measureStatusName = "未估算";break;
		         case 1:measureStatusName = "部分估算";break;
		         case 2:measureStatusName = "全部估算";break;
		         default:measureStatusName = "状态错误";
	         }       
  %>
  
  
	<h2>该功能流程的功能点个数为<%=dataMoveList.size()%>：其具体如下</h2>
	<table  border="1" width="80" >
	  
	    <tr>
	    <th>功能流程名称</th>
	    <td align="center"><%=ffp.getFuncProsName()%></td>
	    </tr>
	    <tr> 
	    <th>其他关联</th>
	    <td><a href="/fsmch/FSM/cosmicStandard/mapping/funcProsEventDescription.jsp?funcProsId=<%=funcProsId%>&back=<%=back%>">事件</a><br>
		     <a href="/fsmch/FSM/cosmicStandard/mapping/funcProsIODescription.jsp?funcProsId=<%=funcProsId%>&back=<%=back%>">兴趣对象</a><br>
		     <a href="/fsmch/FSM/cosmicStandard/mapping/funcProsUserDescription.jsp?funcProsId=<%=funcProsId%>&back=<%=back%>">功能用户</a><br></td>
		     </tr>
	     <tr>
	     <th>估算状态</th>
	     <td><%=measureStatusName%></td>
	     </tr>
	     <tr>
	     <th>包含的数据组</th>
	     <td>

	       <%if(dataMoveList==null ||dataMoveList.size()==0){%>  
           目前无数据组信息，请添加数据组信息
          <%}else{ %>
	       <%for(Object obj:dataMoveList){
		    FsmDataMovement fdm = (FsmDataMovement)obj;
		    Integer dataGroupId = fdm.getDataGroupId();
		    String dataGroupName = ((FsmDataGroup)mp.getDataGroupById(dataGroupId)).getDataGroupName();
		    %><%=dataGroupName%><br>	     		 		         		    
		 <%}
		 }%>
		
	      </td>
	     </tr>	     
	     <tr>
	     <th>数据移动类型</th>
	     <td>
	     
	      <%if(dataMoveList==null ||dataMoveList.size()==0 ){%>  
           目前无数据移动信息，请添加数据移动信息 
          <%}else{ %>
		 <%for(Object obj:dataMoveList){
		    FsmDataMovement fdm = (FsmDataMovement)obj;
		    Integer dataMoveType = fdm.getDataMoveType();
	        String dataMoveName = null;
	       switch (dataMoveType)  
	          {
		         case 0:dataMoveName = "Entry";break;
		         case 1:dataMoveName = "Exit";break;
		         case 2:dataMoveName = "Write";break;
		         case 3:dataMoveName = "Read";break;
		         default:dataMoveName = "状态错误";
	          }    	        
		 %><%=dataMoveName%><br>	     		 		         		    
		 <%}
		 }%>
		
	     </td>
	    </tr>
	     <tr>
	     <th>功能点个数</th>
	     <td><%=dataMoveList.size()%></td>
	  </tr>	  
	   
	</table>
	<a  href="javascript:window.name=='contentFrame'?window.location='/fsmch/FSM/cosmicStandard/mapping/functionProcess.jsp':parent.location.href='/fsmch/FSM/cosmicStandard/mapping/functionProcess.jsp'">返回</a> 
  </body>
</html>
