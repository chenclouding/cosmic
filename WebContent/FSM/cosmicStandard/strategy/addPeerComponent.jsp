<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@ page import="business.FSM.ProductMeasureBusiness" %>
<%@ page import="hibernate.FSM.FsmProduct" %>
<%@ page import="business.FSM.StrategyPhase" %>
<%@ page import="hibernate.FSM.FsmLayer" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'addPeerComponent.jsp' starting page</title>
    
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
    <script language="javascript">
       function productSelect(){
        // alert(document.getElementById("1").id);
        //alert(document.getElementsByName("form0")[0].name); 
        //alert(document.form0.productId.value);
        //alert(document.form[0].productId.value);  
       // self.location("/fsmch/FSM/cosmicStandard/strategy/addPeerComponent.jsp?productId="+document.form0.productId.value);
        window.location.href("/fsmch/FSM/cosmicStandard/strategy/addPeerComponent1.jsp?productId="+document.form0.productId.value);   
       }
       
        function verifyInput()
	  {	
		   var frm = document.form0;			
			if(isEmpty(frm.productId.value)) 
			{
				alert("��ѡ���Ʒ��");
				frm.productId.focus();
				return false;
			}													
		}
    </script>
   
  </head>
  
  <body>

   <% 
    
     int productId = new Integer(request.getParameter("productId"));  //��ʵ�����壬Ϊ�����������������    
    // int productId  = 2;
     /*�����ݿ��а������Ϣȡ��*/
     ProductMeasureBusiness pmb = new ProductMeasureBusiness(); 
     Iterator it1 = pmb.getAllProduct().iterator();    //������������д��������  
       
     /*�����ݿ��а�����Ĳ����Ϣȡ��*/
     StrategyPhase sp = new StrategyPhase(); //ҵ��㣬��Ӧ��COSMIC�����Ĳ��Խ׶�
     Iterator it2 = sp.getLayerByProductId(productId).iterator();
       
      FsmLayer layer = new FsmLayer();//����ʵ��Bean
   %>
   <table>
        <tr>
         <form name="form0" action="/fsmch/FSM/cosmicStandard/strategy/peerComponent.jsp?productId=<%=productId %>"  method="post" target="compFrame" onSubmit="return verifyInput();" >        
              <td>
	                ��ѡ���Ʒ
			      	<select name="productId"  style="width:160px" onChange="productSelect();">
			      	   <option value="">=��ѡ��=</option>
			      	 <%
			      	    while(it1.hasNext()){
			      	        FsmProduct fp = (FsmProduct)it1.next();%>
			      	        <option value="<%=fp.getId()%>"><%=fp.getProductName()%></option>
			      	  <%}%> 	   
				    </select>
		        </td>
		         <td>
		            ��ѡ����
			      	<select name="layerId" style="width:160px">
			       	 <option value="">=��ѡ��=</option>
			      	 <%
			      	    while(it2.hasNext()){
			      	        FsmLayer fl = (FsmLayer)it2.next();%>
			      	        <option value="<%=fl.getId()%>"><%=fl.getLayerName()%></option>
			      	  <%}%>
				    </select>	     
				</td>		 
				<td>
				  <input type="submit" name="submit" value="��ӶԵ����"/>
				</td>
		   </form>
      </tr>
   	</table> 
    <iFrame name="compFrame" frameborder="0" height="800px" width="100%" scrolling="no"/>
   
  </body>
</html>
