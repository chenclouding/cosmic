<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'funcProsMethord.jsp' starting page</title>
    
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
     //��ȡ��mappingPhase.jsp����functionProcessDescription.jsp������back
     String back=new String(request.getParameter("back"));
     String productId=new String(request.getParameter("productId"));
     String layerId=new String(request.getParameter("layerId"));
     String peerCompId=new String(request.getParameter("peerCompId"));
   
   %>
	
   <h1> ��������</h1>
	    <table>
	      <tr> 
	          <th>����</th>
	          <th>��������</th>	          
	      </tr>
	      <tr>
		          <td>��������</td> 
		          <td>1:һ�����������ǹ������û����󼯺ϵ�һ�������ɷ֣�������һ��Ψһ�ġ��ھ۵ģ�cohesive�����ɶ���ִ�е������ƶ���<br>
		              2:�������Թ����û��������ƶ���Entry��������֪ͨ��������û�ʶ����һ�������¼�����ִ������Ӧ�����¼����������󣬸ù��ܹ��̾ͽ����ˡ�<br>
		              3:ȫ���ܵ��ģ��������ڹ����������ȼ����Ͻ��еġ��������̵�ʶ��ԭ���ǣ�һ������������ȫ�����ҽ�����ĳһ���һ�������һ�����ܹ������ٰ������������ƶ���һ��Entry��һ��Exit��Write��
		          </td>
		          
	         </tr>  	     
	      <tr>
		          <td>ȷ���������̹���</td> 
		          <td>һ�����ܹ�ϵ�����ȸ�֪��һ�������¼���Ȼ�󴥷�һ���������̡�<br>
		                ͨ����˵������������һ��ȷ���ġ����������Ϣ����֪ͨ���һ�������¼��Ѿ������ܹ�ϵ��ȷ����<br>
		                ͬʱ����Ҳ�������������¼���ص���Ȥ�����ڴ������뱻���ܺ󣬹������̿�����Ҫ���ܲ���������������Ȥ��������롣<br>
		                �����ڷ���ȷ�����룬��������ͬ����Ҫ֪�������֤�Լ���ν�����Ӧ��
		          </td>
		          
	         </tr>  
         
           </table>        
  <!-- �жϷ���mappingPhase.jspҳ�滹��functionProcess.jspҳ�� -->
      <%if(back.equals("mapping")){ %>
     <a href="/fsmch/FSM/cosmicStandard/mapping/mappingPhase.jsp?productId=<%=productId%>&layerId=<%=layerId%>&peerCompId=<%=peerCompId%>">����</a>
     <%} else{%>
       <a  href="javascript:window.name=='contentFrame'?window.location='/fsmch/FSM/cosmicStandard/mapping/functionProcess.jsp':parent.location.href='/fsmch/FSM/cosmicStandard/mapping/functionProcess.jsp'">����</a>
     <% }%>
  </body>
</html>
