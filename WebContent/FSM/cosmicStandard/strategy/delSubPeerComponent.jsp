<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@ page import="business.FSM.StrategyPhase" %>
<%@ page import="business.FSM.MappingPhase" %>
<%@ page import="hibernate.FSM.FsmPeerComponent" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'delSubPeerComponent.jsp' starting page</title>
    
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
      Integer layerId = new Integer(request.getParameter("layerId"));//获取从页面addSubPeerComponent.jsp传来layerId,用于转跳回到addSubPeerComponent.jsp
      Integer fatherId = new Integer(request.getParameter("fatherId"));//获取从页面addSubPeerComponent.jsp传来fatherId,用于删除操作
      Integer productId = new Integer(request.getParameter("productId"));
      Integer peerCompId = new Integer(request.getParameter("peerCompId"));//获取从页面addSubPeerComponent.jsp传来peerCompId,用于删除操作
      StrategyPhase sp = new StrategyPhase();  //业务层函数，封装了对等组件进行的增删改查等操作
      MappingPhase mp = new MappingPhase();
      FsmPeerComponent fpc = (FsmPeerComponent)sp.getPeerComponentById(peerCompId);// 按peerCompId从数据库中取出对等组件
      if(fpc.getCompType()==1){  //如果组件类型为原子组件，判断其是否包含功能流程
        List funcList = mp.getFunctionProcessByPeerCompId(peerCompId); 
        //System.out.println(funcList.isEmpty());
        if(funcList!=null && funcList.size()!=0){ //若对等组件包含功能流程则不能被删除
           response.sendRedirect("/fsmch/FSM/cosmicStandard/strategy/alertDelSubPeerCompnent.jsp?layerId="+layerId+"&fatherId="+fatherId+"&productId="+productId); 
        }else{ //可以安全删除
           sp.delPeerComponent(peerCompId);
           response.sendRedirect("/fsmch/FSM/cosmicStandard/strategy/peerComponent.jsp?layerId="+layerId+"&fatherId="+fatherId+"&productId="+productId);
        } 
      }
      else{  //如果组件类型为组合对等组件，然后再判断其是否包含其它对等组件
          List peerCompList = sp.getPeerComponentByFatherId(peerCompId);
          if(peerCompList!=null && peerCompList.size()!=0){  //若对等组件包含其它对等组件则不能被删除
             response.sendRedirect("/fsmch/FSM/cosmicStandard/strategy/alertDelSubPeerCompnent.jsp?layerId="+layerId+"&productId="+productId+"&fatherId="+fatherId); 
          }else{  //可以安全删除
             sp.delPeerComponent(peerCompId);
             response.sendRedirect("/fsmch/FSM/cosmicStandard/strategy/addSubPeerComponent.jsp?layerId="+layerId+"&productId="+productId+"&fatherId="+fatherId);
        }
      } 
      
   %>
  </body>
</html>
