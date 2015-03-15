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
     
       String addr = "/fsmch/FSM/cosmicStandard/strategy/addMeasureScope.jsp";
    %>
    
	<script language="javascript" type="text/javascript"> 
        if(window.name=='contentFrame')
		   window.location.href = "<%=addr%>";
		else{
		   parent.location.href="<%=addr%>";
		}
		alert("ÇëÑ¡Ôñ²úÆ·£¡");
    </script>
    
	</body>
</html>
