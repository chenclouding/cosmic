<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'dataAttributeMethord.jsp' starting page</title>
    
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
   Integer dataGroupId = (Integer)session.getAttribute("dataGroupId");
   Integer interestObjId = new Integer(request.getParameter("interestObjId"));    
%>
	
   <h1> ��������</h1>
	    <table>
	      <tr> 
	          <th>����</th>
	          <th>��������</th>	          
	      </tr>
	      <tr>
		          <td>��������</td> 
		          <td>1�����û���������Ĺ۵㿴���������Ծ����������г�����Ϣ����С��λ��<br>
		              2����COSMIC������3.0�汾�У�ȷ���������Բ��Ǳ���Ҫ���Ĺ���������<br>
		                   ���������������Ȥ����Ĺ����У���һ�������Ǻ��а����ġ�<br>
		              3��COSMIC�л����Ĺ��ܶ�����λ��һ�������ƶ��������ƶ��Ķ���<br>
		                  �������飬���������������Եļ��ϡ�<br>
		              4:COSMIC�ڼ��㹦�ܹ�ģʱû�п����������ԵĶ��٣������ض��Ķ���Ŀ�ģ�<br>
		                  ����Ҫ���Ӿ�ȷ�ض�����ģʱ�����Զ�COSMIC����������չ��������������<br>
		                  �ĸ���������һ����չ������
		          </td>
		          
	         </tr>  	     
	     
         
           </table>        
   <a  href="javascript:window.name=='contentFrame'?window.location='/fsmch/FSM/cosmicStandard/mapping/dataAttibute.jsp?interestObjId=<%=interestObjId %>&dataGroupId=<%=dataGroupId %>':parent.location.href='/fsmch/FSM/cosmicStandard/mapping/dataAttribute.jsp?interestObjId=<%=interestObjId %>&dataGroupId=<%=dataGroupId %>'">����</a>
  </body>
</html>
