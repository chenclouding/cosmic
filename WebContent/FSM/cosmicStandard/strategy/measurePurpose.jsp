<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@ page import="business.FSM.ProductMeasureBusiness" %>
<%@ page import="hibernate.FSM.FsmProduct" %>
<%@ page import="hibernate.FSM.FsmMeasurePurpose" %>
<%@ page import="business.FSM.StrategyPhase" %>
<%@ page import="hibernate.FSM.FsmLayer" %>
<jsp:useBean id="projectMeasureBean" scope="session" class="javaBeans.fsm.ProjectMeasureBean"/> 
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'measurePurpose.jsp' starting page</title>
    
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
		var frm = document.measurePurposeForm;
		var mId= document.getElementsByName( "measure");
		var isSel=false;
		for(i=0;i<mId.length;i++){
		   if(mId[i].checked){
		     isSel=true;
		     break;
		   }
		}
		   if(isSel==false)
		  {
		  alert("请选择估算目的！");		 
		  return isSel;
		  }
	   
			if(isEmpty(frm.measurePurposeName.value)) 
			{
				alert("请填写估算目的名称！");
				frm.measurePurposeName.focus();
				return false;
			}
			if(isEmpty(frm.measure.value)) 
			{
				alert("请选择可选目的！");
				frm.measure.focus();
				return false;
			}
			
		}
		
	</script>
  </head>
  
  <body>
      <%
     if(projectMeasureBean.getProductId()==null )
          response.sendRedirect("/fsmch/FSM/cosmicStandard/strategy/alertStrategy.jsp");
      else{
        //从projectMeasureBean获得productId  
        Integer productId = projectMeasureBean.getProductId();
      %>
      <h4> 估算目的列表</h4>
      <% /*从数据库中把估算目的信息取出*/
       StrategyPhase sp = new StrategyPhase(); //业务层，对应于COSMIC方法的策略阶段
       List measPurList = sp.getMeasurePurposeByProductId(productId);
       FsmMeasurePurpose measurePurpose = new FsmMeasurePurpose();//定义实体Bean
     
       /*若无估算目的信息，提示添加；若有估算目的信息，列出估算目的列表*/
       if(measPurList==null ||measPurList.size()==0 ){%>  
         <h1 style="color:red">目前无估算目的信息，请添加估算目的</h1> 
       <%}else{ %>
         <table>
	       <tr> 
		        <td >序号</td> 
		        <td>估算目的名称</td>		        
		        <td>查看</td>
		        <td>修改</td>
		        <td>删除</td>
	       </tr> 
	    <%   for(Object p:measPurList){ 
	         measurePurpose = (FsmMeasurePurpose)p; 
	         Integer measPurId = measurePurpose.getId(); 
	         
	    %>
	         <tr>
		          <td><%= measPurList.indexOf(p)+1 %></td> 
		          <td><%= measurePurpose.getMeasurePurposeName() %></td>
		          <td><a href="/fsmch/FSM/cosmicStandard/strategy/measurePurposeDescription.jsp?productId=<%=productId%>&measPurId=<%=measPurId %>"><IMG src="/fsmch/images/btncheck.gif" alt="查看" border="0" /></a></td>
		          <td><a href="/fsmch/FSM/cosmicStandard/strategy/editMeasurePurpose.jsp?measPurId=<%=measPurId%>&productId=<%=productId%>"><IMG src="/fsmch/images/btnedit.gif" alt="修改" border="0" /></a></td>
		          <td><a href="/fsmch/FSM/cosmicStandard/strategy/delMeasurePurpose.jsp?measPurId=<%=measPurId%>&productId=<%=productId%>" onclick="return confirmdel();"><IMG src="/fsmch/images/btndel.gif" alt="删除" width="15" height="12" border="0" /></a></td>		          
	         </tr>  
          <%}%>
           </table>
        <%}%>  
     
   
   
    <form action="/fsmch/FSM/addMeasurePurpose.do" name="measurePurposeForm" method="post" onSubmit="return verifyInput();">
      <table>
         <tr>
            <td width="15%">估算目的名称</td>
            <td> <input type="text" name="measurePurposeName" value=""/> </td>        
         </tr>
         <tr>
            <td width="15%">可选目的</td> 
            <td>
            <input type="checkbox" name="measure" value="随着FUR（软件开发之前产生的软件文档）的演进度量其大小，估算开发工作量" />1：随着FUR（软件开发之前产生的软件文档）的演进度量其大小，估算开发工作量；<br>
            <input type="checkbox" name="measure" value="在FUR批准后，为管理项目的“范围蔓延”，度量变更部分的大小" />2：在FUR批准后，为管理项目的“范围蔓延”，度量变更部分的大小；<br>
            <input type="checkbox" name="measure" value="度量所交付软件的FUR大小，以度量开发者的效率" />3：度量所交付软件的FUR大小，以度量开发者的效率；<br>
            <input type="checkbox" name="measure" value="度量总的交付软件的FUR大小，以及所开发的软件的FUR大小，来获得功能重用的度量" />4：度量总的交付软件的FUR大小，以及所开发的软件的FUR大小，来获得功能重用的度量；<br>
            <input type="checkbox" name="measure" value="度量已存在软件的FUR大小，来度量负责软件维护和支持的人员的效率" />5：度量已存在软件的FUR大小，来度量负责软件维护和支持的人员的效率；<br>
            <input type="checkbox" name="measure" value="度量一个现有软件系统的变更部分的大小，来度量一个增强型项目团队的产出" />6：度量一个现有软件系统的变更部分的大小，来度量一个增强型项目团队的产出；<br>
            <input type="checkbox" name="measure" value="度量一个现有软件提供给自然人功能用户的功能大小" />7：度量一个现有软件提供给自然人功能用户的功能大小.<br>             			           
           </td>               
         </tr>
         <tr>
            <td width="15%">估算目的补充说明</td>
            <td>
              <textarea name="measurePurposeDesp" wrap="soft" cols="25" rows="5"></textarea>
            </td>
         </tr>      
        
         <tr>
            <td> <input type="submit" name="submit" value="添加估算目的"/> </td>        
         
              <td><input type="reset" name="reset" value="重置"/></td>
            </tr> 
      </table>
      
      <input type="hidden" name="productId" value="<%=productId%>"/>
    </form>
     <hr>
   
    <%} %>
  </body>
</html>
