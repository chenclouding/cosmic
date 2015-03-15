<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@ page import="business.FSM.StrategyPhase" %>
<%@ page import="business.FSM.ProductMeasureBusiness" %>
<%@ page import="hibernate.FSM.FsmProduct" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'delProduct.jsp' starting page</title>
    
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
      Integer productId =  new Integer(request.getParameter("productId"));//获取从页面projectMeasure.jsp传来productId,用于转跳回到projectMeasure.jsp     
      StrategyPhase sp = new StrategyPhase();  //业务层函数，封装了层次进行的增删改查等操作
      ProductMeasureBusiness pmb = new ProductMeasureBusiness();
      FsmProduct fl = (FsmProduct)pmb.getProductById(productId);// 按ProductId从数据库中取出待估算的软件
      List layerList = sp.getLayerByProductId(productId);      
       if(layerList!=null && layerList.size()!=0){ //若软件包含层次则不能被删除
           response.sendRedirect("/fsmch/FSM/cosmicStandard/strategy/alertDelProduct.jsp"); 
        }else{ //可以安全删除
           pmb.delProduct(productId);
           response.sendRedirect("/fsmch/FSM/cosmicStandard/projectMeasure.jsp");
        }       
   %>
  </body>
</html>
