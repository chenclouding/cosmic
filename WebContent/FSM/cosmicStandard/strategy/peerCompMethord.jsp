<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'peerCompMethord.jsp' starting page</title>
    
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
   //��ȡ��peerComponentDescription.jsp����strategyPhase.jspҳ�洫���Ĳ���
    String back = new String(request.getParameter("back"));
    Integer productId = new Integer(request.getParameter("productId"));
    Integer layerId = new Integer(request.getParameter("layerId"));
    Integer fatherId = new Integer(request.getParameter("fatherId"));
   
  
   %>
	
   <h1> ��������</h1>
	    <table>
	      <tr> 
	          <th>����</th>
	          <th>��������</th>	          
	      </tr>
	      <tr>
		          <td>�Ե����</td> 
		          <td>1:��һ�����ڵ�һ������Ĺ������û�����ֽ�ɻ�������Ĳ��֣�ÿ�������������������û�������ض����֣���ÿ�����־���һ���Ե������<br>
		              2:�Ե������ʶ��ԭ���ǣ��Ե����������ͬһ������ϣ��Ե������û������������������ϵ�������Ե�������������ݱ�һ�µض���ͽ��͡�<br>
		              3:ȫ���ܵ��ģ��������ڹ����������ȼ����Ͻ��еġ��������̵�ʶ��ԭ���ǣ�һ������������ȫ�����ҽ�����ĳһ���һ�������һ�����ܹ������ٰ������������ƶ���һ��Entry��һ��Exit��Write��
		          </td>
		          
	         </tr>  	     
	      
         
           </table>        
   <!-- �ж��Ƿ񷵻�strategyPhase.jspҳ�滹��peerComponent.jspҳ�滹��addSubPeerComponent.jspҳ�� -->     
      <%if(back.equals("peerComp")){ %>
     <a href="javascript:window.name=='contentFrame'?window.location='/fsmch/FSM/cosmicStandard/strategy/peerComponent.jsp?productId=<%=productId%>&layerId=<%=layerId %>':parent.location.href='/fsmch/FSM/cosmicStandard/strategy/peerComponent.jsp?productId=<%=productId%>&layerId=<%=layerId %>'">����</a>
     <%} if(back.equals("subPeerComp")){%>
      <a href="javascript:window.name=='contentFrame'?window.location='/fsmch/FSM/cosmicStandard/strategy/addSubPeerComponent.jsp?productId=<%=productId%>&layerId=<%=layerId %>&fatherId=<%=fatherId %>':parent.location.href='/fsmch/FSM/cosmicStandard/strategy/addSubPeerComponent.jsp?productId=<%=productId%>&layerId=<%=layerId %>&fatherId=<%=fatherId %>'">����</a>
     <% }if(back.equals("strategyPhase")){%>
      <a href="javascript:window.name=='contentFrame'?window.location='/fsmch/FSM/cosmicStandard/strategy/strategyPhase.jsp?productId=<%=productId%>':parent.location.href='/fsmch/FSM/cosmicStandard/strategy/strategyPhase.jsp?productId=<%=productId%>'">����</a>
     <% }%>  
  </body>
</html>
