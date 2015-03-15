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
  
    String back = new String(request.getParameter("back"));//获取从layerDescription.jsp或者strategyPhase.jsp传来的back
    Integer productId = new Integer(request.getParameter("productId"));
  
   %>	
   <h1> 方法介绍</h1>
	    <table>
	      <tr> 
	          <th>名称</th>
	          <th>方法介绍</th>	          
	      </tr>
	      <tr>
		          <td>层次</td> 
		          <td> 1：层次是软件体系架构的功能分解形成的分割，软件体系架构和硬件一起形成了整个计算机系统：<br>
		                1）层被组织为层次结构<br>
                        2）在层次结构的每个级别，仅有一个层<br>
                        3）在软件体系结构中，任何两个层提供的服务存在一个“上/下”层次依赖，两个层之间直接交换数据<br>
                        4）在软件体系结构中，交换数据的任意两个层的软件仅仅一致地解释部分数据<br>
		               2：层的识别是一个迭代过程。随着映射过程的发展，可以提炼精确地层。一旦识别，每个候选的层必须符合下面的原则和规则：<br>
                        a) 一个层的软件通过相应的功能过程与另一个层的软件交换数据。<br>
                        b) 层次的‘层次依赖’是这样的，任何层的软件可以使用在它之下的任何层的任何软件的功能服务。<br>
                              在存在这种使用关系的地方，我们指定使用软件的层为‘上’，包含被使用软件的层为‘下’。上层的软件依赖下层软件通过的服务来正常的运行，如此下去到整个层结束。
                              相反地，下层的软件和它依赖的任何下层软件，能在不需要任何上层软件提供的服务的情况下，正常的运行。<br>
                        c) 一个层的软件没有必要使用它的下层提供的所有功能服务。<br>
		             
		          </td>
		          
	         </tr>  	     
	      
         
           </table>        
      <!-- 判断返回strategyPhase.jsp页面还是layerDescription.jsp页面 -->
      <%if(back.equals("strategyPhase")){ %>
     <a href="/fsmch/FSM/cosmicStandard/strategy/strategyPhase.jsp?productId=<%=productId%>">返回</a>
     <%} else{%>
       <a  href="javascript:window.name=='contentFrame'?window.location='/fsmch/FSM/cosmicStandard/strategy/layer.jsp?productId=<%=productId%>':parent.location.href='/fsmch/FSM/cosmicStandard/strategy/layer.jsp?productId=<%=productId%>'">返回</a>
     <% }%>
  </body>
</html>
