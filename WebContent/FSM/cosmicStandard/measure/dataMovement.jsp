<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@ page import="business.FSM.ProductMeasureBusiness" %>
<%@ page import="business.FSM.StrategyPhase" %>
<%@ page import="business.FSM.MappingPhase" %>
<%@ page import="business.FSM.MeasurePhase" %>
<%@ page import="hibernate.FSM.FsmProduct" %>
<%@ page import="hibernate.FSM.FsmLayer" %>
<%@ page import="hibernate.FSM.FsmPeerComponent" %>
<%@ page import="hibernate.FSM.FsmFunctionProcess" %>
<%@ page import="hibernate.FSM.FsmDataMovement" %>
<%@ page import="hibernate.FSM.FsmInterestObject" %>
<%@ page import="hibernate.FSM.FsmFunctionProcessInterestObject" %>
<%@ page import="hibernate.FSM.FsmDataGroup" %>
<jsp:useBean id="projectMeasureBean" scope="session" class="javaBeans.fsm.ProjectMeasureBean"/> 
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'dataMovement.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
  <link rel="stylesheet" type="text/css" href="/fsmch/images/screen.css">
  <script language="JavaScript">
      function confirmdel(){
        return confirm("确定删除？");
	}
	
	  function verifyInput()
	  {	
		var frm = document.all.form1;	
		var typeSelect = frm.dataMoveType;
		//alert(typeSelect.innerHTML);
		var dgSelect = frm.dataGroupId;		
		if(frm.dataMoveName.value==null || frm.dataMoveName.value=="") {
			alert("请填写数据移动名称！");
			frm.dataMoveName.focus();
			return false;
		}
		for(var i=0; i<typeSelect.length; i++){ 
		  if(typeSelect[i].selected==true && typeSelect[i].value=="" ){
			alert("请选择数据移动类型！");
			frm.dataMoveType.focus();
			return false;
		   }		   		
		}
		for(var i=0; i<dgSelect.length; i++){
		   if(dgSelect[i].selected==true && dgSelect[i].value=="" ){
			alert("请选择数据组类型！");
			frm.dataGroupId.focus();
			return false;
		   }		  	
		}				
	  }
	  
	  function endMeasureHttpRequest(funcProsId){
	       
	       var  endMeasure1 = document.getElementById("_endMeasure1");       
	       endMeasure1.disabled = true; 
	       var http_request = creatHttpRequest();	      
           http_request.open('GET', "/fsm/servlet/EndMeasureAjax?funcProsId="+funcProsId, true);
           http_request.send(null);             
       }
       function creatHttpRequest(){

	        if (window.XMLHttpRequest) { // Mozilla, Safari,...
	            http_request = new XMLHttpRequest();
	            if (http_request.overrideMimeType) {
	                http_request.overrideMimeType('text/xml');
	            }
	        } else if (window.ActiveXObject) { // IE
	            try {
	                http_request = new ActiveXObject("Msxml2.XMLHTTP");
	            } catch (e) {
	                try {
	                    http_request = new ActiveXObject("Microsoft.XMLHTTP");
	                } catch (e) {}
	            }       
	        }
	        if (!http_request) {
	            alert('Giving up :( Cannot create an XMLHTTP instance');
	            return false;
	        }
	       return http_request;
       }
   </script>
	  
  </head>
  
  <body>
 <% 
   if(projectMeasureBean.getProductId()==null || projectMeasureBean.getPeerCompId()==null||projectMeasureBean.getLayerId()==null||projectMeasureBean.getFuncProsId()==null)
          response.sendRedirect("/fsmch/FSM/cosmicStandard/mapping/alertFunctionProcess.jsp");
   else{
   //从projectMeasureBean获得productId，peerCompId，layerId,funcProsId
   Integer productId = projectMeasureBean.getProductId();
   Integer peerCompId = projectMeasureBean.getPeerCompId();
   Integer layerId = projectMeasureBean.getLayerId();
   Integer funcProsId = projectMeasureBean.getFuncProsId();
   //获取AddFunctionProcessInterestObjectAction.do设置的session中的funcProsId
  // Integer funcProsId = Integer.valueOf(session.getAttribute("funcProsId").toString());
 
   //按照各自ID将名称取出来
   ProductMeasureBusiness pmb = new ProductMeasureBusiness();
   StrategyPhase sp = new StrategyPhase();
   MappingPhase mp = new MappingPhase();
   String productName = ((FsmProduct)pmb.getProductById(productId)).getProductName();
   String peerCompName = ((FsmPeerComponent)sp.getPeerComponentById(peerCompId)).getPeerCompName();
   String layerName  = ((FsmLayer)sp.getLayerById(layerId)).getLayerName();   
   String funcProsName = ((FsmFunctionProcess)mp.getFunctionProcessById(funcProsId)).getFuncProsName();
   
   //根据funcProsId把查找FunctionProcessInterestObject把所有兴趣对象取出来
   //然后根据InterestObjectId把相应数据组取出来，放入dgList
   List fpioList = mp.getFunctionProcessInterestObjectByFuncProsId(funcProsId) ;
   FsmFunctionProcessInterestObject o = new FsmFunctionProcessInterestObject();
   List dgList  = new ArrayList();
   for(Object obj:fpioList){  
    Integer ioId = ((FsmFunctionProcessInterestObject)obj).getInterestObjId();
    List subDgList = mp.getDataGroupByInterestObjId(ioId); 
    dgList.addAll(subDgList);
   }
%>
	  <h1> 软件描述</h1>
	    <table>
	      <tr> 
	          <td width="15%">所属软件:</td> <td><%=productName%></td>
	      </tr>
	       <tr> 
	          <td width="15%">所属层次:</td> <td><%=layerName%></td>
	      </tr>
	       <tr> 
	          <td width="15%">所属组件:</td> <td><%=peerCompName%></td>
	      </tr>
	      <tr> 
	          <td width="15%">所属功能流程:</td> <td><%=funcProsName%></td>
	      </tr>
	    </table>
	    <hr>
	   <h2> 数据移动列表</h2>
       <%
       //从数据库中把此数据移动的数据移动信息全部取出
       MeasurePhase msp = new MeasurePhase();
       FsmFunctionProcess ffp = (FsmFunctionProcess)mp.getFunctionProcessById(funcProsId);
       List dataMoveList = msp.getDataMovementByFuncProsId(funcProsId);
       List dataMoveEntryList = msp.getDataMovementByDataMoveTypeAndFuncProsId(0,funcProsId);
       List dataMoveExitList = msp.getDataMovementByDataMoveTypeAndFuncProsId(1,funcProsId);
       List dataMoveWriteList = msp.getDataMovementByDataMoveTypeAndFuncProsId(2,funcProsId);
       
       //若无数据移动信息，提示添加；若有数据移动信息，列出数据移动列表
       if(dataMoveList==null ||dataMoveList.size()==0 ){%>  
         <h1 style="color:red">目前无数据移动信息，请添加数据移动</h1> 
       <%}else{ %>
	    <table>
	      <tr> 
	          <th>序号</th>
	          <th>数据移动名称</th>
	          <th>数据移动类型</th>
	          <th>描述</th>
	          <th>修改</th>
	          <th>删除</th>
	      </tr> 
        <% for(Object obj:dataMoveList){ 
	         FsmDataMovement fdm = (FsmDataMovement)obj; 
	         Integer dataMoveId = fdm.getId(); 
	         //根据状态的返回值，对状态赋值 
	         Integer dataMoveType = fdm.getDataMoveType();
	         String dataMoveTypeName = null;
	         switch (dataMoveType)  
	         {
		         case 0:dataMoveTypeName = "Entry";break;
		         case 1:dataMoveTypeName = "Exit";break;
		         case 2:dataMoveTypeName = "Write";break;
		         case 3:dataMoveTypeName = "Read";break;
		         default:dataMoveTypeName = "类型错误";
	         }
	         %>
	         <tr>
		          <td><%= dataMoveList.indexOf(obj)+1 %></td> 
		          <td><%= fdm.getDataMoveName() %></td>
		          <td><%= dataMoveTypeName %></td>
		          <td><a href="/fsmch/FSM/cosmicStandard/measure/dataMovementDescription.jsp?dataMoveId=<%=dataMoveId%>"><IMG src="/fsmch/images/btncheck.gif" alt="查看" border="0" /></a></td>
		      	  <td><a href="/fsmch/FSM/cosmicStandard/measure/editDataMovement.jsp?funcProsId=<%=funcProsId%>&dataMoveId=<%=dataMoveId%>"><IMG src="/fsmch/images/btnedit.gif" alt="修改" border="0" /></a></td>
		          <td><a href="/fsmch/FSM/cosmicStandard/measure/delDataMovement.jsp?funcProsId=<%=funcProsId%>&dataMoveId=<%=dataMoveId%>" onclick="return confirmdel();"><IMG src="/fsmch/images/btndel.gif" alt="删除" width="15" height="12" border="0" />
		          </a></td>
	         </tr>  
          <%}%>
         </table>
     <%}%>
     
       
      <%
     	if (((dataMoveEntryList!=null&&dataMoveEntryList.size()!=0)&&(dataMoveExitList!=null&&dataMoveExitList.size()!=0))||((dataMoveEntryList!=null&&dataMoveEntryList.size()!=0)&&(dataMoveWriteList!=null&&dataMoveWriteList.size()!=0))){
     	%>
     	<button class="btn3" name="endMeasure1" id="_endMeasure1" onClick="endMeasureHttpRequest(<%=funcProsId%>,endMeasure1);">结束此功能流程的估算！</button>
     	<%
     	}
     	else {
     	%>
     	<button class="btn3" onClick="" disabled>结束此功能流程的估算！</button>
     	<%
     	}
     %>    
     <a href="/fsmch/FSM/cosmicStandard/mapping/funcProsMeasureReport.jsp?funcProsId=<%=funcProsId %>">查看此功能流程的功能点！</a>
     
     
     <hr> 
     <form name="form1" action="/fsmch/FSM/addDataMovement.do" onSubmit="return verifyInput();"> 
      <table>
         <tr>
            <td>数据移动名：<input type="text" name="dataMoveName" value=""/> </td>        
         </tr>
         <tr>
            <td>数据移动描述：<input type="text" name="dataMoveDesp" value=""/> </td>        
         </tr>
         <tr>    
            <td>
                 选择数据移动类型：
         	 	<select name="dataMoveType">
  			 	    <option value="">=请选择=</option>
  			 	    <!--0代表entry，1代表exit，2代表write，3代表read  -->
  					<option value="0">Entry</option>
  					<option value="1">Exit</option>
  				    <option value="2">Write</option>
  					<option value="3">Read</option>
  				</select>
            </td>        
         </tr> 
         <tr>    
            <td>
                 选择数据组：
         	 	<select name="dataGroupId" >
  			 	    <option value="">=请选择=</option>
  		         <%if(dgList!=null && dgList.size()!=0){
  		            for(Object obj:dgList){
  		            FsmDataGroup fdg = (FsmDataGroup)obj;%>
  		              <option value="<%=fdg.getId()%>"><%=fdg.getDataGroupName()%></option>
  		               
  		         <% }%>
  		    
  		        <%  }%>
  				</select>
  			
            </td>        
         </tr> 
         
                
         <tr>
            <td> <input type="submit" name="submit" value="添加数据移动" /> </td>        
         </tr>
      </table>   
      <input type="hidden" name="funcProsId" value="<%=funcProsId%>"/>
      
      
    </form>
    <a href="/fsmch/FSM/cosmicStandard/measure/measure.jsp">返回</a>
    <%} %>
  </body>
</html>
