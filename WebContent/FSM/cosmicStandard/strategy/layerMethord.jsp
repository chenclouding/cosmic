<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'layerMethord.jsp' starting page</title>
    
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
  
    String back = new String(request.getParameter("back"));//��ȡ��layerDescription.jsp����strategyPhase.jsp������back
    Integer productId = new Integer(request.getParameter("productId"));
  
   %>	
   <h1> ��������</h1>
	    <table>
	      <tr> 
	          <th>����</th>
	          <th>��������</th>	          
	      </tr>
	      <tr>
		          <td>���</td> 
		          <td> 1������������ϵ�ܹ��Ĺ��ֽܷ��γɵķָ�����ϵ�ܹ���Ӳ��һ���γ������������ϵͳ��<br>
		                1���㱻��֯Ϊ��νṹ<br>
                        2���ڲ�νṹ��ÿ�����𣬽���һ����<br>
                        3���������ϵ�ṹ�У��κ��������ṩ�ķ������һ������/�¡����������������֮��ֱ�ӽ�������<br>
                        4���������ϵ�ṹ�У��������ݵ�������������������һ�µؽ��Ͳ�������<br>
		               2�����ʶ����һ���������̡�����ӳ����̵ķ�չ������������ȷ�ز㡣һ��ʶ��ÿ����ѡ�Ĳ������������ԭ��͹���<br>
                        a) һ��������ͨ����Ӧ�Ĺ��ܹ�������һ���������������ݡ�<br>
                        b) ��εġ�����������������ģ��κβ���������ʹ������֮�µ��κβ���κ�����Ĺ��ܷ���<br>
                              �ڴ�������ʹ�ù�ϵ�ĵط�������ָ��ʹ������Ĳ�Ϊ���ϡ���������ʹ������Ĳ�Ϊ���¡����ϲ����������²����ͨ���ķ��������������У������ȥ�������������
                              �෴�أ��²����������������κ��²���������ڲ���Ҫ�κ��ϲ�����ṩ�ķ��������£����������С�<br>
                        c) һ��������û�б�Ҫʹ�������²��ṩ�����й��ܷ���<br>
		             
		          </td>
		          
	         </tr>  	     
	      
         
           </table>        
      <!-- �жϷ���strategyPhase.jspҳ�滹��layerDescription.jspҳ�� -->
      <%if(back.equals("strategyPhase")){ %>
     <a href="/fsmch/FSM/cosmicStandard/strategy/strategyPhase.jsp?productId=<%=productId%>">����</a>
     <%} else{%>
       <a  href="javascript:window.name=='contentFrame'?window.location='/fsmch/FSM/cosmicStandard/strategy/layer.jsp?productId=<%=productId%>':parent.location.href='/fsmch/FSM/cosmicStandard/strategy/layer.jsp?productId=<%=productId%>'">����</a>
     <% }%>
  </body>
</html>
