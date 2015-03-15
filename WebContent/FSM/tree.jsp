<%@ page contentType="text/html; charset=gb2312" language="java" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%> 
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>

<html>
	<head>
		<title></title>
		<link rel="StyleSheet" href="../javascript/dtree.css" type="text/css" />
		<script type="text/javascript" src="../javascript/dtree.js"></script>
		<style>
body{
	font-family: "宋体"; 
	font-size: 12px; 
	font-weight: normal;}
a{
	font-family: "宋体"; 
	font-size: 12px; 
	color: #000000; 
	font-weight: normal; 
}
</style>
	</head>
	<body bgcolor="#e7f3f8">
	<%String projectId = "";
	projectId =  (String)session.getAttribute("projectId");
	//获取FSM用到的变量
	String productId = (String)request.getAttribute("productId");  %>
		<div class="dtree">
			<script type="text/javascript">
		<!--
		d = new dTree('d');

		d.add(0,-1,'规模估算');
		d.add(22,0,'估算工具','cosmicStandard/methordAndHelp.jsp');
		    d.add(23,22,'全功能点规模估算','cosmicStandard/projectMeasure.jsp');
		    d.add(24,22,'识别对等组件阶段','cosmicStandard/strategy/methordAndHelp.jsp');
		       d.add(28,24,'任务概述','cosmicStandard/strategy/strategy.jsp');
		       d.add(31,24,'添加功能用户','cosmicStandard/strategy/functionUser.jsp');
		       d.add(32,24,'添加估算目的','cosmicStandard/strategy/measurePurpose.jsp');
		       d.add(33,24,'添加估算范围','cosmicStandard/strategy/measureScope.jsp');
		       d.add(34,24,'添加层次','cosmicStandard/strategy/layer.jsp');
		       d.add(35,24,'添加对等组件','cosmicStandard/strategy/addPeerComponent.jsp?productId=1');//1没有任何意义，仅仅是为了传递参数	       
		    d.add(25,22,'识别功能流程阶段','cosmicStandard/mapping/methordAndHelp.jsp');
		       d.add(40,25,'任务概述','cosmicStandard/mapping/mapping.jsp');
		       d.add(41,25,'添加功能流程','cosmicStandard/mapping/functionProcess.jsp?back="a"');
		       d.add(42,25,'添加兴趣对象','cosmicStandard/mapping/interestObject.jsp');
		       d.add(43,25,'添加数据组','cosmicStandard/mapping/dataGroup.jsp');
		       d.add(44,25,'添加事件','cosmicStandard/mapping/event.jsp');  
		       d.add(45,25,'建立功能流程与兴趣对象关联','cosmicStandard/mapping/functionProcessInterestObject.jsp');   
		       d.add(46,25,'建立功能流程与事件关联','cosmicStandard/mapping/functionProcessEvent.jsp'); 
		       d.add(47,25,'建立功能流程与功能用户关联','cosmicStandard/mapping/functionProcessUser.jsp');    
		    d.add(26,22,'识别数据移动阶段','cosmicStandard/measure/methordAndHelp.jsp');
		       d.add(50,26,'任务概述','cosmicStandard/measure/measure.jsp');
		       d.add(51,26,'添加数据移动','cosmicStandard/measure/dataMovement.jsp');  
		    d.add(27,22,'导出度量报告','cosmicStandard/measure/measureReport.jsp');
	    d.add(208,22,'用例模型估算规模');
	    d.add(209,22,'工作量估算');
	            
        
	    d.config.target = "contentFrame";

		document.write(d);
		//-->		
	</script>
		</div>
		<p>
			<a href="javascript: d.openAll();">展开目录</a> | <a href="javascript: d.closeAll();">收起目录</a>
		</p>

	</body>

</html>
