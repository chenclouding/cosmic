<%@ page language="java" pageEncoding="GB2312"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html>
	<head>
		<title></title>
		
		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">    
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">

		<link rel="stylesheet" type="text/css" href="/fsmch/images/screen.css">
	
	</head> 
	<body>

    <%
       
       String addr = "/fsmch/FSM/cosmicStandard/projectMeasure.jsp";
    %>
    
	<script language="javascript" type="text/javascript"> 
      
		window.location.href = "<%=addr%>";
		alert("此待估软件不能删除，请先删除此软件包含的层次！");
    </script>
    
	</body>
</html>
