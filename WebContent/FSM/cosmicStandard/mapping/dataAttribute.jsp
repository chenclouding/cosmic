<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@ taglib uri="/WEB-INF/displaytag-11.tld" prefix="display"%>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-bean" prefix="bean"%>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-html" prefix="html"%>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-logic" prefix="logic"%>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-tiles" prefix="tiles"%>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-template" prefix="template"%>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-nested" prefix="nested"%>
<%@ page import="business.FSM.MappingPhase" %>
<%@ page import="hibernate.FSM.FsmDataAttribute" %>
<%@ page import="java.util.List"%>
<jsp:useBean id="projectMeasureBean" scope="session" class="javaBeans.fsm.ProjectMeasureBean"/> 
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'addDataAttribute.jsp' starting page</title>
    
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
        return confirm("确定删除？");
	}	
		  
		function verifyInput()
	  {	
		var frm = document.dataAttributeForm;
	   
			if(isEmpty(frm.dataAttriName.value)) 
			{
				alert("请填写数据属性名称！");
				frm.dataAttriName.focus();
				return false;
			}
			
		}
		</script>
  </head>
  
  <body>
     <%    
     //获取从addDataGroup.jsp页面传来的productId、layerId、peerCompId、interestObjId,datagroupId
         Integer dataGroupId = new Integer(request.getParameter("dataGroupId")); 
         Integer interestObjId = new Integer(request.getParameter("interestObjId")); 
      %>
   
    <hr>
    <h2> 数据属性列表</h2>
       <%
       //从数据库中把此数据组的数据属性信息全部取出
       MappingPhase mp = new MappingPhase();
       List dataAttributeList = mp.getDataAttributeByDataGroupId(dataGroupId);
       FsmDataAttribute fda = new FsmDataAttribute();   //定义实体Bean
       //若无数据属性信息，提示添加；若有数据属性信息，列出数据属性列表
       if(dataAttributeList==null ||dataAttributeList.size()==0 ){%>  
         <h1 style="color:red">目前无数据属性信息，请添加数据属性</h1> 
       <%}else{ %>
	    <table>
	      <tr> 
	          <th>序号</th>
	          <th>数据属性</th>
	          <th>描述</th>
	          <th>修改</th>
	          <th>删除</th>
	      </tr>
  	     <%   for(Object obj:dataAttributeList){ 
	         fda = (FsmDataAttribute)obj; 
	         Integer dataAttriId = fda.getId();
	         
	      %>
	         <tr>
		          <td><%= dataAttributeList.indexOf(obj)+1 %></td> 
		          <td><%= fda.getDataAttriName() %></td>
		          <td><a href="/fsmch/FSM/cosmicStandard/mapping/dataAttributeDescription.jsp?dataGroupId=<%=dataGroupId%>&dataAttriId=<%=dataAttriId%>&interestObjId=<%=interestObjId %>"><IMG src="/fsmch/images/btncheck.gif" alt="查看" border="0" /></a></td>
		      	  <td><a href="/fsmch/FSM/cosmicStandard/mapping/editDataAttribute.jsp?dataGroupId=<%=dataGroupId%>&dataAttriId=<%=dataAttriId%>&interestObjId=<%=interestObjId %>"><IMG src="/fsmch/images/btnedit.gif" alt="修改" border="0" /></a></td>
		          <td>
		            <a href="/fsmch/FSM/cosmicStandard/mapping/delDataAttribute.jsp?dataGroupId=<%=dataGroupId%>&dataAttriId=<%=dataAttriId%>&interestObjId=<%=interestObjId %>" onclick="return confirmdel();"><IMG src="/fsmch/images/btndel.gif" alt="删除" width="15" height="12" border="0" />	</a>	          
		          </td>
	         </tr>  
          <%}%>
           </table>
         <%} %>
  <hr>
      <h3>添加数据属性</h3>
     <form action="/fsmch/FSM/addDataAttribute.do" name="dataAttributeForm" method="post" onSubmit="return verifyInput();"> 
      <table>
         <tr>
  			<td width="10%">数据属性名称</td>
  			<td >
  			    <input type="text" name="dataAttriName" style="width:160px" value=""/ >
            </td>
  		</tr>
  		<tr>
  			<td width="10%">数据属性描述</td>
  			<td >
  			    <textarea name="dataAttriDesp" wrap="soft" cols="25" rows="5"></textarea>
            </td>
  		</tr>
         
         
         <tr>
            <td> <input type="submit" name="submit" value="添加数据属性"/> </td>        
         </tr>
      </table>   
     
      <input type="hidden" name="dataGroupId" value="<%=dataGroupId%>"/>
      <input type="hidden" name="interestObjId" value="<%=interestObjId%>"/>
    </form>

   <a href="/fsmch/FSM/cosmicStandard/mapping/addDataGroup.jsp?interestObjId=<%=interestObjId%>">返回</a>
 
    </body>
</html>
