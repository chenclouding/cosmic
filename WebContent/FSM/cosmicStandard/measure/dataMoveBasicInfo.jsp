<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@ page import="hibernate.FSM.FsmDataMovement" %>
<%@ page import="hibernate.FSM.FsmDataGroup" %>
<%@ page import="business.FSM.MeasurePhase" %>
<%@ page import="business.FSM.MappingPhase" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'dataMoveBasicInfo.jsp' starting page</title>
    
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
    Integer dataMoveId = (Integer)session.getAttribute("dataMoveId");
    MeasurePhase mp = new MeasurePhase(); //业务层，对应于COSMIC方法的策略阶段
    MappingPhase mp1 = new MappingPhase();
    FsmDataMovement dataMove = (FsmDataMovement)mp.getDataMovementById(dataMoveId);
    Integer dataMoveType = dataMove.getDataMoveType();
	         String dataMoveTypeName = null;
	         switch (dataMoveType)  
	         {
		         case 0:dataMoveTypeName = "Entry";break;
		         case 1:dataMoveTypeName = "Exit";break;
		         case 2:dataMoveTypeName = "Write";break;
		         case 3:dataMoveTypeName = "Read";break;
		         default:dataMoveTypeName = "类型错误";
	         }
    %>
    <table>
         <tr>
            <td width="15%">数据移动名</td>
            <td> <input type="text" name="dataMoveName" value="<%=dataMove.getDataMoveName()%>"/> </td>        
         </tr>
        <tr>
            <td width="15%">数据移动描述</td> 
            <td><input type="text" name="dataMoveDesp" value="<%=dataMove.getDataMoveDesp() %>"/>   </td>     
         </tr>
         <tr>
  			<td width="15%">数据移动类型</td>
  			
  		<td><input type="text" name="dataMoveType" value="<%=dataMoveTypeName %>"/>   </td>
            
  		</tr>		     		          
         
      </table>
       
        <a  href="javascript:window.name=='contentFrame'?window.location='/fsmch/FSM/cosmicStandard/measure/dataMovement.jsp':parent.location.href='/fsmch/FSM/cosmicStandard/measure/dataMovement.jsp'">返回</a>
  </body>
</html>