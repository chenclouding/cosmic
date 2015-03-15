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
   //获取从peerComponentDescription.jsp或者strategyPhase.jsp页面传来的参数
    String back = new String(request.getParameter("back"));
    Integer productId = new Integer(request.getParameter("productId"));
    Integer layerId = new Integer(request.getParameter("layerId"));
    Integer fatherId = new Integer(request.getParameter("fatherId"));
   
  
   %>
	
   <h1> 方法介绍</h1>
	    <table>
	      <tr> 
	          <th>名称</th>
	          <th>方法介绍</th>	          
	      </tr>
	      <tr>
		          <td>对等组件</td> 
		          <td>1:将一个层内的一个软件的功能性用户需求分解成互相操作的部分，每个部分完成软件功能性用户需求的特定部分，这每个部分就是一个对等组件。<br>
		              2:对等组件的识别原则是：对等组件必须在同一个层次上，对等组件间没有像层次那样的依赖关系，两个对等组件交换的数据被一致地定义和解释。<br>
		              3:全功能点规模估算就是在功能流程粒度级别上进行的。功能流程的识别原则是：一个功能流程完全属于且仅属于某一层的一个软件，一个功能过程至少包含两个数据移动，一个Entry，一个Exit或Write。
		          </td>
		          
	         </tr>  	     
	      
         
           </table>        
   <!-- 判断是否返回strategyPhase.jsp页面还是peerComponent.jsp页面还是addSubPeerComponent.jsp页面 -->     
      <%if(back.equals("peerComp")){ %>
     <a href="javascript:window.name=='contentFrame'?window.location='/fsmch/FSM/cosmicStandard/strategy/peerComponent.jsp?productId=<%=productId%>&layerId=<%=layerId %>':parent.location.href='/fsmch/FSM/cosmicStandard/strategy/peerComponent.jsp?productId=<%=productId%>&layerId=<%=layerId %>'">返回</a>
     <%} if(back.equals("subPeerComp")){%>
      <a href="javascript:window.name=='contentFrame'?window.location='/fsmch/FSM/cosmicStandard/strategy/addSubPeerComponent.jsp?productId=<%=productId%>&layerId=<%=layerId %>&fatherId=<%=fatherId %>':parent.location.href='/fsmch/FSM/cosmicStandard/strategy/addSubPeerComponent.jsp?productId=<%=productId%>&layerId=<%=layerId %>&fatherId=<%=fatherId %>'">返回</a>
     <% }if(back.equals("strategyPhase")){%>
      <a href="javascript:window.name=='contentFrame'?window.location='/fsmch/FSM/cosmicStandard/strategy/strategyPhase.jsp?productId=<%=productId%>':parent.location.href='/fsmch/FSM/cosmicStandard/strategy/strategyPhase.jsp?productId=<%=productId%>'">返回</a>
     <% }%>  
  </body>
</html>
