<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@ page import="business.FSM.StrategyPhase" %>
<%@ page import="hibernate.FSM.FsmMeasurePurpose" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'editMeasurePurpose.jsp' starting page</title>
    
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
		function verifyInput()
	  {	
		var frm = document.measurePurposeForm;
	   
			if(isEmpty(frm.measurePurposeName.value)) 
			{
				alert("请填写度量目的名称！");
				frm.measurePurposeName.focus();				
				return false;
			}
			
		}
		</script>

  </head>
  
  <body>
      <%
       /*获取从页面measurePurpose.jsp传来measPurId和productId*/
      Integer measPurId = new Integer(request.getParameter("measPurId"));
      Integer productId = new Integer(request.getParameter("productId"));
      
      /*从数据库中把id为measPurId的度量目的取出*/
      StrategyPhase sp = new StrategyPhase(); //业务层，对应于COSMIC方法的策略阶段
      FsmMeasurePurpose measurePurpose = (FsmMeasurePurpose)sp.getMeasurePurposeById(measPurId);
     
     
      %>
  <form action="/fsmch/FSM/editMeasurePurpose.do" name="measurePurposeForm" method="post" onSubmit="return verifyInput();">
      <table>
         <tr>
            <td width="15%">度量目的名称</td>
            <td> <input type="text" name="measurePurposeName" value="<%=measurePurpose.getMeasurePurposeName()%>"/> </td>        
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
            <td width="15%">度量目的描述</td> 
            <td><input type="text" name="measurePurposeDesp" value="<%=measurePurpose.getMeasurePurposeDesp() %>"/>   </td>     
         </tr>
              
         <tr>
            <td> <input type="submit" name="submit" value="修改度量目的"/> </td>        
         </tr>
         
      </table>
      <input type="hidden" name="id" value="<%=measPurId%>"/>  
      <input type="hidden" name="productId" value="<%=productId%>"/> 
    </form>
  </body>
</html>
