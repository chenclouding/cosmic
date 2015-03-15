<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@ page import="business.FSM.StrategyPhase" %>
<%@ page import="hibernate.FSM.FsmPeerComponent" %>
<jsp:useBean id="projectMeasureBean" scope="session" class="javaBeans.fsm.ProjectMeasureBean"/>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'addSubPeerComponent.jsp' starting page</title>
    
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
	<script language="JavaScript">
	  function confirmdel(){
        return confirm("确定删除？");
	}
	  function verifyInput()
	  {	
		var frm = document.peerCompForm;
	
				
			if(isEmpty(frm.peerCompName.value)) 
			{
				alert("请填写对等组件名称！");
				frm.employeeName.focus();
				return false;
			}
			if(isEmpty(frm.measureStatus.value)) 
			{
				alert("请选择对等组件状态！");
				frm.measureStatus.focus();
				return false;
			}
			if(isEmpty(frm.compType.value)) 
			{
				alert("请选择对等组件类型！");
				frm.compType.focus();
				return false;
			}
		}
		//此函数暂时没用
		function setCompSelect()
		{	
		   var selectTag = null; //select标记
		   selectTag = document.getElementById("_compType"); //获取select标记（元素）
		   var index = selectTag.selectedIndex;//获取被选中的option元素的下标
		   selectTag.options[index].selected=true;//标记被选中的options元素，出现在下拉表框中
		}
	</script>
  </head>
  
  <body>
      <%
      String back = "subPeerComp";
      Integer stratetyProductId = new Integer(request.getParameter("productId"));//从addPeerComponent.jsp获得，用于转向mappingPhase.jsp
      Integer fatherId = new Integer(request.getParameter("fatherId"));//获取从页面peerComponent.jsp传来peerCompId || 获取从页面addSubPeerComponent.jsp传来peerCompId
      Integer layerId = new Integer(request.getParameter("layerId"));//获取从页面layer.jsp||peerComponent.jsp||addSubPeerComponent.jsp传来layerId 
     
      %>
     
      <h4> 对等组件列表</h4>
      <% 
       /*从数据库中把本层的对等组件信息取出*/
       StrategyPhase sp = new StrategyPhase(); //业务层，对应于COSMIC方法的策略阶段
       List peerCompList = sp.getPeerComponentByLayerIdAndFatherId(layerId,fatherId);
       FsmPeerComponent peerComp = new FsmPeerComponent();//定义实体Bean
       /*若无对等组件信息，提示添加；若有对等组件信息，列出对等组件列表*/
       if(peerCompList==null ||peerCompList.size()==0 ){%>  
         <h1 style="color:red">目前无对等组件信息，请添加对等组件</h1> 
       <%}else{ %>
         <table>
	       <tr> 
		        <td >序号</td> 
		        <td>对等组件名称</td>
		        <td>估算状态</td>
		        <td>查看</td>
		        <td>修改</td>
		        <td>删除</td>
		        <td>添加功能流程</td>
		        <td>导出度量报告</td>
	       </tr> 
	    <%   for(Object p:peerCompList){ 
	         peerComp = (FsmPeerComponent)p; 
	         Integer peerCompId = peerComp.getId();
	         //根据状态的返回值，对状态赋值 
	         Integer measureStatus = peerComp.getMeasureStatus();
	         String measureStatusName = null;
	         switch (measureStatus)  
	         {
		         case 0:measureStatusName = "未估算";break;
		         case 1:measureStatusName = "部分估算";break;
		         case 2:measureStatusName = "全部估算";break;
		         default:measureStatusName = "状态错误";
	         }
	         Integer compType = peerComp.getCompType();//跟据对等组件的类型，判断是给对等组件添加功能流程还是子组件
	     %>
	         <tr>
		          <td><%= peerCompList.indexOf(p)+1 %></td> 
		          <td><%= peerComp.getPeerCompName() %></td>
		          <td><%= measureStatusName %></td>
		          <td><a href="/fsmch/FSM/cosmicStandard/strategy/peerComponentDescription.jsp?peerCompId=<%=peerCompId%>&productId=<%=stratetyProductId%>&layerId=<%=layerId %>&back=<%=back%>&fatherId=<%=fatherId %>"><IMG src="/fsmch/images/btncheck.gif" alt="查看" border="0" /></a></td>
		          <td><a href="/fsmch/FSM/cosmicStandard/strategy/editSubPeerComponent.jsp?peerCompId=<%=peerCompId%>&layerId=<%=layerId%>&productId=<%=stratetyProductId%>&fatherId=<%=fatherId %>"><IMG src="/fsmch/images/btnedit.gif" alt="修改" border="0" /></a></td>
		          <td><a href="/fsmch/FSM/cosmicStandard/strategy/delSubPeerComponent.jsp?peerCompId=<%=peerCompId%>&layerId=<%=layerId%>&productId=<%=stratetyProductId%>&fatherId=<%=fatherId %>" onclick="return confirmdel();"><IMG src="/fsmch/images/btndel.gif" alt="删除" width="15" height="12" border="0" /></a></td>
		         <%if(compType==0 && measureStatus!=2){//组件类型是组合组件并且没有结束估算，则连接处是"添加对等组件" %>
		            <td><a href="javascript:window.name=='contentFrame'?window.location='/fsmch/FSM/cosmicStandard/strategy/addSubPeerComponent.jsp?fatherId=<%=peerCompId%>&layerId=<%=layerId%>&productId=<%=stratetyProductId%>':parent.location.href='/fsmch/FSM/cosmicStandard/strategy/addSubPeerComponent.jsp?fatherId=<%=peerCompId%>&layerId=<%=layerId%>'">添加子对等组件</a></td>
	             <%}else if(compType==1 && measureStatus!=2){//组件类型是原子组件并且没有结束估算，则连接处是"添加功能流程"{ %>
	                 <jsp:setProperty name="projectMeasureBean" property="productId" value="<%=stratetyProductId%>" />
                     <jsp:setProperty name="projectMeasureBean" property="layerId" value="<%=layerId%>" />
                     <jsp:setProperty name="projectMeasureBean" property="peerCompId" value="<%=peerCompId%>" />                     
	                <td><a href="javascript:window.name=='compFrame'?parent.location='/fsmch/FSM/cosmicStandard/mapping/functionProcess.jsp?back=<%=back %>':window.location.href='/fsmch/FSM/cosmicStandard/mapping/functionProcess.jsp?back=<%=back %>'">添加功能流程</a></td>
	             <%}else{ %>
	                <td>估算完成，不能添加</td>
	             <%}%>
	              <td><a href="javascript:window.name=='compFrame'?parent.location='/fsmch/FSM/cosmicStandard/strategy/peerCompMeasureReport1.jsp?peerCompId=<%=peerCompId%>&productId=<%=stratetyProductId%>&back=<%=back %>&layerId=<%=layerId %>&fatherId=<%=fatherId %>':window.location.href='/fsmch/FSM/cosmicStandard/strategy/peerCompMeasureReport1.jsp?peerCompId=<%=peerCompId%>&productId=<%=stratetyProductId%>&back=<%=back %>&layerId=<%=layerId %>&fatherId=<%=fatherId %>'">导出度量报告</a></td>
	         </tr>  
          <%}%>
           </table>
        <%}%> 
     <!--form表单，添加对等组件  -->   
     <form action="/fsmch/FSM/addPeerComponent.do?productId=<%=stratetyProductId %>" name="peerCompForm" method="post" onSubmit="return verifyInput();">
      <table>
         <tr>
            <td width="15%">对等组件名</td>
            <td> <input type="text" name="peerCompName" value=""/> </td>        
         </tr>
        <tr>
            <td width="15%">对等组件描述</td> 
            <td><input type="text" name="peerCompDesp" value=""/>   </td>     
         </tr>
        <tr>
  		    <td width="15%">对等组件类型</td>
  			<td>
  			 	<select name="compType" id="_compType" style="width:160px">
  			 	    <option value="">=请选择=</option>
  			 	    <!-- 0代表组合组件，1代表原子组件 -->
  			 	    <option value="0">组合组件</option>
  					<option value="1">原子组件</option>
  				</select>
            </td>
  		</tr>
         <tr>
            <td> 
              <input type="submit" name="submit" value="添加对等组件"/> 
            </td> 
            <td>
              <input type="reset" name="reset" value="重置"/>
            </td>            
         </tr>
      </table>
      <!--0代表未进行估算，1代表软件部分被估算，2代表软件全部被估算 -->
      <input type="hidden" name="measureStatus" value="0"/>
      <input type="hidden" name="layerId" value="<%=layerId%>"/>
      <input type="hidden" name="fatherId" value="<%=fatherId%>"/> 
    </form>
     <hr>
     <a href="/fsmch/FSM/cosmicStandard/strategy/peerComponent.jsp?layerId=<%=layerId%>&productId=<%=stratetyProductId %>">返回原始组件列表</a> 

  </body>
</html>
