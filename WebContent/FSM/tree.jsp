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
	font-family: "����"; 
	font-size: 12px; 
	font-weight: normal;}
a{
	font-family: "����"; 
	font-size: 12px; 
	color: #000000; 
	font-weight: normal; 
}
</style>
	</head>
	<body bgcolor="#e7f3f8">
	<%String projectId = "";
	projectId =  (String)session.getAttribute("projectId");
	//��ȡFSM�õ��ı���
	String productId = (String)request.getAttribute("productId");  %>
		<div class="dtree">
			<script type="text/javascript">
		<!--
		d = new dTree('d');

		d.add(0,-1,'��ģ����');
		d.add(22,0,'���㹤��','cosmicStandard/methordAndHelp.jsp');
		    d.add(23,22,'ȫ���ܵ��ģ����','cosmicStandard/projectMeasure.jsp');
		    d.add(24,22,'ʶ��Ե�����׶�','cosmicStandard/strategy/methordAndHelp.jsp');
		       d.add(28,24,'�������','cosmicStandard/strategy/strategy.jsp');
		       d.add(31,24,'��ӹ����û�','cosmicStandard/strategy/functionUser.jsp');
		       d.add(32,24,'��ӹ���Ŀ��','cosmicStandard/strategy/measurePurpose.jsp');
		       d.add(33,24,'��ӹ��㷶Χ','cosmicStandard/strategy/measureScope.jsp');
		       d.add(34,24,'��Ӳ��','cosmicStandard/strategy/layer.jsp');
		       d.add(35,24,'��ӶԵ����','cosmicStandard/strategy/addPeerComponent.jsp?productId=1');//1û���κ����壬������Ϊ�˴��ݲ���	       
		    d.add(25,22,'ʶ�������̽׶�','cosmicStandard/mapping/methordAndHelp.jsp');
		       d.add(40,25,'�������','cosmicStandard/mapping/mapping.jsp');
		       d.add(41,25,'��ӹ�������','cosmicStandard/mapping/functionProcess.jsp?back="a"');
		       d.add(42,25,'�����Ȥ����','cosmicStandard/mapping/interestObject.jsp');
		       d.add(43,25,'���������','cosmicStandard/mapping/dataGroup.jsp');
		       d.add(44,25,'����¼�','cosmicStandard/mapping/event.jsp');  
		       d.add(45,25,'����������������Ȥ�������','cosmicStandard/mapping/functionProcessInterestObject.jsp');   
		       d.add(46,25,'���������������¼�����','cosmicStandard/mapping/functionProcessEvent.jsp'); 
		       d.add(47,25,'�������������빦���û�����','cosmicStandard/mapping/functionProcessUser.jsp');    
		    d.add(26,22,'ʶ�������ƶ��׶�','cosmicStandard/measure/methordAndHelp.jsp');
		       d.add(50,26,'�������','cosmicStandard/measure/measure.jsp');
		       d.add(51,26,'��������ƶ�','cosmicStandard/measure/dataMovement.jsp');  
		    d.add(27,22,'������������','cosmicStandard/measure/measureReport.jsp');
	    d.add(208,22,'����ģ�͹����ģ');
	    d.add(209,22,'����������');
	            
        
	    d.config.target = "contentFrame";

		document.write(d);
		//-->		
	</script>
		</div>
		<p>
			<a href="javascript: d.openAll();">չ��Ŀ¼</a> | <a href="javascript: d.closeAll();">����Ŀ¼</a>
		</p>

	</body>

</html>
