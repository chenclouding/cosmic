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
      Integer productId =  new Integer(request.getParameter("productId"));//��ȡ��ҳ��projectMeasure.jsp����productId,����ת���ص�projectMeasure.jsp     
      StrategyPhase sp = new StrategyPhase();  //ҵ��㺯������װ�˲�ν��е���ɾ�Ĳ�Ȳ���
      ProductMeasureBusiness pmb = new ProductMeasureBusiness();
      FsmProduct fl = (FsmProduct)pmb.getProductById(productId);// ��ProductId�����ݿ���ȡ������������
      List layerList = sp.getLayerByProductId(productId);      
       if(layerList!=null && layerList.size()!=0){ //���������������ܱ�ɾ��
           response.sendRedirect("/fsmch/FSM/cosmicStandard/strategy/alertDelProduct.jsp"); 
        }else{ //���԰�ȫɾ��
           pmb.delProduct(productId);
           response.sendRedirect("/fsmch/FSM/cosmicStandard/projectMeasure.jsp");
        }       
   %>
  </body>
</html>
