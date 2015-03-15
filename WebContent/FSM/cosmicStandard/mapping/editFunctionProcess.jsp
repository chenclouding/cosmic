<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@ page import="business.FSM.StrategyPhase" %>
<%@ page import="business.FSM.MappingPhase" %>
<%@ page import="business.FSM.MeasurePhase" %>
<%@ page import="hibernate.FSM.FsmFunctionProcess" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'editFunctionProcess.jsp' starting page</title>
    
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
		function verifyInput(funcProsUn,funcProPart,funcProAll)
	  {	
		var frm = document.functionProcessForm;
	   
			if(isEmpty(frm.funcProsName.value)) 
			{
				alert("请填写功能流程名称！");
				frm.funcProsName.focus();
				return false;
			}
			if(isEmpty(frm.measureStatus.value)) 
			{
				alert("请选择功能流程状态！");
				frm.measureStatus.focus();
				return false;
			}else
			{			    
			        switch(frm.measureStatus.value)
			        {
			          case '0': //若改为未估算状态
			            { if(funcProsUn== false )
			              {
					     	 alert("此估算状态不能修改！");
				             frm.measureStatus.focus();
				             return false;break;
                          }else
				          {
				             return true; break;      
				          } 
			            }
			         case '1': //若改为部分估算
			          { if(funcProsPart==false)
			              {
					     	 alert("此估算状态不能修改！");
				             frm.measureStatus.focus();
				             return false;break;
                          }else
				          {
				             return true; break;      
				          } 
			            }
			          case '2': //若改为全部估算
			          { if(funcProsAll==false )
			              {
					     	 alert("此估算状态不能修改！");
				             frm.measureStatus.focus();
				             return false;break;
                          }else
				          {
				             return true; break;      
				          } 
			            }   
			        } 		
			  }
		
		function test()
		{
		  alert("test");
		  return false;
		}
      }
		
	</script>
  </head>
  
  <body>
      <%
       /*获取从页面functionProcess.jsp传来peerCompId和funcProsId*/
      Integer peerCompId = new Integer(request.getParameter("peerCompId")); 
      Integer funcProsId = new Integer(request.getParameter("funcProsId"));%>
      
      <%            
      /*从数据库中把id为funcProsId的功能流程取出*/
      StrategyPhase sp = new StrategyPhase(); //业务层，对应于COSMIC方法的策略阶段
      MappingPhase mp = new MappingPhase();
      MeasurePhase msp = new MeasurePhase();
      FsmFunctionProcess funcPros = (FsmFunctionProcess)mp.getFunctionProcessById(funcProsId);
     
      //验证估算状态是否可被修改
       boolean funcProsUn = true;
       boolean funcProsPart = true;
       boolean funcProsAll = true;
       List dataMoveList = msp.getDataMovementByFuncProsId(funcProsId);          
       List dataMoveEntryList = msp.getDataMovementByDataMoveTypeAndFuncProsId(0,funcProsId);
       List dataMoveExitList = msp.getDataMovementByDataMoveTypeAndFuncProsId(1,funcProsId);
       List dataMoveWriteList = msp.getDataMovementByDataMoveTypeAndFuncProsId(2,funcProsId);       
	  if(dataMoveList!=null&&dataMoveList.size()!=0) 
	     funcProsUn = false; //若该功能流程已经包含了数据移动，则不可修改     
      if(dataMoveList==null||dataMoveList.size()==0){ //修改为部分估算
	     funcProsPart = false;
	     funcProsAll = false;
	     } //若该功能流程不包含数据移动，则不可修改          
      if(((dataMoveEntryList==null||dataMoveEntryList.size()==0)&&(dataMoveExitList==null||dataMoveExitList.size()==0))&&((dataMoveEntryList==null||dataMoveEntryList.size()==0)&&(dataMoveWriteList==null||dataMoveWriteList.size()==0))) 
	     funcProsAll = false; //若该功能流程不满足至少包含一组Entry和Exit或者Entry和Write，则不可修改  
      %> 
         
  <form action="/fsmch/FSM/editFunctionProcess.do" name="functionProcessForm" method="post" onSubmit="return verifyInput(<%=funcProsUn%>,<%=funcProsPart%>,<%=funcProsAll%>);">
 
      <table>
         <tr>
            <td width="15%">功能流程名</td>
            <td> <input type="text" name="funcProsName" value="<%=funcPros.getFuncProsName()%>"/> </td>        
         </tr>
        <tr>
            <td width="15%">功能流程描述</td> 
            <td><input type="text" name="funcProsDesp" value="<%=funcPros.getFuncProsDesp() %>"/>   </td>     
         </tr>
         <tr>
  			<td width="15%">估算状态</td>
  			<% 
  			//根据状态的返回值，对状态赋值 
	         Integer measureStatus = funcPros.getMeasureStatus();
	         String measureStatusName = null;
	         switch (measureStatus)  
	         {
		         case 0:measureStatusName = "未估算";break;
		         case 1:measureStatusName = "部分估算";break;
		         case 2:measureStatusName = "全部估算";break;
		         default:measureStatusName = "状态错误";
	         }
	         %>
  			<td>
  			 	<select name="measureStatus" style="width:160px">
  			 	    <option value="<%=measureStatus %>" selected><%=measureStatusName %></option>
  			 	    <option value="0" >未估算</option>
  					<option value="1">部分估算</option>
  					<option value="2">全部估算</option>
  				</select>
            </td>
  		</tr>
       
         <tr>
            <td> <input type="submit" name="submit" value="修改功能流程"/> </td>        
         </tr>
         
      </table>
      <input type="hidden" name="id" value="<%=funcProsId%>"/>  
      <input type="hidden" name="peerCompId" value="<%=peerCompId%>"/> 
    </form>
  </body>
</html>
