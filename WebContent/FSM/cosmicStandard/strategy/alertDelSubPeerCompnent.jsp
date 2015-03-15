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
    //获取从addSubPeerComponent.jsp页面传来的fatherId、layerId、productId
       String fatherId =  request.getParameter("fatherId");
       String layerId =  request.getParameter("layerId");
       String productId =  request.getParameter("productId");
       String addr = "/fsmch/FSM/cosmicStandard/strategy/addSubPeerComponent.jsp?layerId="+layerId+"&fatherId="+fatherId+"&productId="+productId;
    %>
    
	<script language="javascript" type="text/javascript"> 
      
		window.location.href = "<%=addr%>";
		alert("此对等组件不能删除，请先删除此对等组件包含的功能流程或对等组件！");
    </script>
    
	</body>
</html>
