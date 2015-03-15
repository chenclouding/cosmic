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
        return confirm("ȷ��ɾ����");
	}
	
	  function verifyInput()
	  {	
		var frm = document.all.form1;	
		var typeSelect = frm.dataMoveType;
		//alert(typeSelect.innerHTML);
		var dgSelect = frm.dataGroupId;		
		if(frm.dataMoveName.value==null || frm.dataMoveName.value=="") {
			alert("����д�����ƶ����ƣ�");
			frm.dataMoveName.focus();
			return false;
		}
		for(var i=0; i<typeSelect.length; i++){ 
		  if(typeSelect[i].selected==true && typeSelect[i].value=="" ){
			alert("��ѡ�������ƶ����ͣ�");
			frm.dataMoveType.focus();
			return false;
		   }		   		
		}
		for(var i=0; i<dgSelect.length; i++){
		   if(dgSelect[i].selected==true && dgSelect[i].value=="" ){
			alert("��ѡ�����������ͣ�");
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
   //��projectMeasureBean���productId��peerCompId��layerId,funcProsId
   Integer productId = projectMeasureBean.getProductId();
   Integer peerCompId = projectMeasureBean.getPeerCompId();
   Integer layerId = projectMeasureBean.getLayerId();
   Integer funcProsId = projectMeasureBean.getFuncProsId();
   //��ȡAddFunctionProcessInterestObjectAction.do���õ�session�е�funcProsId
  // Integer funcProsId = Integer.valueOf(session.getAttribute("funcProsId").toString());
 
   //���ո���ID������ȡ����
   ProductMeasureBusiness pmb = new ProductMeasureBusiness();
   StrategyPhase sp = new StrategyPhase();
   MappingPhase mp = new MappingPhase();
   String productName = ((FsmProduct)pmb.getProductById(productId)).getProductName();
   String peerCompName = ((FsmPeerComponent)sp.getPeerComponentById(peerCompId)).getPeerCompName();
   String layerName  = ((FsmLayer)sp.getLayerById(layerId)).getLayerName();   
   String funcProsName = ((FsmFunctionProcess)mp.getFunctionProcessById(funcProsId)).getFuncProsName();
   
   //����funcProsId�Ѳ���FunctionProcessInterestObject��������Ȥ����ȡ����
   //Ȼ�����InterestObjectId����Ӧ������ȡ����������dgList
   List fpioList = mp.getFunctionProcessInterestObjectByFuncProsId(funcProsId) ;
   FsmFunctionProcessInterestObject o = new FsmFunctionProcessInterestObject();
   List dgList  = new ArrayList();
   for(Object obj:fpioList){  
    Integer ioId = ((FsmFunctionProcessInterestObject)obj).getInterestObjId();
    List subDgList = mp.getDataGroupByInterestObjId(ioId); 
    dgList.addAll(subDgList);
   }
%>
	  <h1> �������</h1>
	    <table>
	      <tr> 
	          <td width="15%">�������:</td> <td><%=productName%></td>
	      </tr>
	       <tr> 
	          <td width="15%">�������:</td> <td><%=layerName%></td>
	      </tr>
	       <tr> 
	          <td width="15%">�������:</td> <td><%=peerCompName%></td>
	      </tr>
	      <tr> 
	          <td width="15%">������������:</td> <td><%=funcProsName%></td>
	      </tr>
	    </table>
	    <hr>
	   <h2> �����ƶ��б�</h2>
       <%
       //�����ݿ��аѴ������ƶ��������ƶ���Ϣȫ��ȡ��
       MeasurePhase msp = new MeasurePhase();
       FsmFunctionProcess ffp = (FsmFunctionProcess)mp.getFunctionProcessById(funcProsId);
       List dataMoveList = msp.getDataMovementByFuncProsId(funcProsId);
       List dataMoveEntryList = msp.getDataMovementByDataMoveTypeAndFuncProsId(0,funcProsId);
       List dataMoveExitList = msp.getDataMovementByDataMoveTypeAndFuncProsId(1,funcProsId);
       List dataMoveWriteList = msp.getDataMovementByDataMoveTypeAndFuncProsId(2,funcProsId);
       
       //���������ƶ���Ϣ����ʾ��ӣ����������ƶ���Ϣ���г������ƶ��б�
       if(dataMoveList==null ||dataMoveList.size()==0 ){%>  
         <h1 style="color:red">Ŀǰ�������ƶ���Ϣ������������ƶ�</h1> 
       <%}else{ %>
	    <table>
	      <tr> 
	          <th>���</th>
	          <th>�����ƶ�����</th>
	          <th>�����ƶ�����</th>
	          <th>����</th>
	          <th>�޸�</th>
	          <th>ɾ��</th>
	      </tr> 
        <% for(Object obj:dataMoveList){ 
	         FsmDataMovement fdm = (FsmDataMovement)obj; 
	         Integer dataMoveId = fdm.getId(); 
	         //����״̬�ķ���ֵ����״̬��ֵ 
	         Integer dataMoveType = fdm.getDataMoveType();
	         String dataMoveTypeName = null;
	         switch (dataMoveType)  
	         {
		         case 0:dataMoveTypeName = "Entry";break;
		         case 1:dataMoveTypeName = "Exit";break;
		         case 2:dataMoveTypeName = "Write";break;
		         case 3:dataMoveTypeName = "Read";break;
		         default:dataMoveTypeName = "���ʹ���";
	         }
	         %>
	         <tr>
		          <td><%= dataMoveList.indexOf(obj)+1 %></td> 
		          <td><%= fdm.getDataMoveName() %></td>
		          <td><%= dataMoveTypeName %></td>
		          <td><a href="/fsmch/FSM/cosmicStandard/measure/dataMovementDescription.jsp?dataMoveId=<%=dataMoveId%>"><IMG src="/fsmch/images/btncheck.gif" alt="�鿴" border="0" /></a></td>
		      	  <td><a href="/fsmch/FSM/cosmicStandard/measure/editDataMovement.jsp?funcProsId=<%=funcProsId%>&dataMoveId=<%=dataMoveId%>"><IMG src="/fsmch/images/btnedit.gif" alt="�޸�" border="0" /></a></td>
		          <td><a href="/fsmch/FSM/cosmicStandard/measure/delDataMovement.jsp?funcProsId=<%=funcProsId%>&dataMoveId=<%=dataMoveId%>" onclick="return confirmdel();"><IMG src="/fsmch/images/btndel.gif" alt="ɾ��" width="15" height="12" border="0" />
		          </a></td>
	         </tr>  
          <%}%>
         </table>
     <%}%>
     
       
      <%
     	if (((dataMoveEntryList!=null&&dataMoveEntryList.size()!=0)&&(dataMoveExitList!=null&&dataMoveExitList.size()!=0))||((dataMoveEntryList!=null&&dataMoveEntryList.size()!=0)&&(dataMoveWriteList!=null&&dataMoveWriteList.size()!=0))){
     	%>
     	<button class="btn3" name="endMeasure1" id="_endMeasure1" onClick="endMeasureHttpRequest(<%=funcProsId%>,endMeasure1);">�����˹������̵Ĺ��㣡</button>
     	<%
     	}
     	else {
     	%>
     	<button class="btn3" onClick="" disabled>�����˹������̵Ĺ��㣡</button>
     	<%
     	}
     %>    
     <a href="/fsmch/FSM/cosmicStandard/mapping/funcProsMeasureReport.jsp?funcProsId=<%=funcProsId %>">�鿴�˹������̵Ĺ��ܵ㣡</a>
     
     
     <hr> 
     <form name="form1" action="/fsmch/FSM/addDataMovement.do" onSubmit="return verifyInput();"> 
      <table>
         <tr>
            <td>�����ƶ�����<input type="text" name="dataMoveName" value=""/> </td>        
         </tr>
         <tr>
            <td>�����ƶ�������<input type="text" name="dataMoveDesp" value=""/> </td>        
         </tr>
         <tr>    
            <td>
                 ѡ�������ƶ����ͣ�
         	 	<select name="dataMoveType">
  			 	    <option value="">=��ѡ��=</option>
  			 	    <!--0����entry��1����exit��2����write��3����read  -->
  					<option value="0">Entry</option>
  					<option value="1">Exit</option>
  				    <option value="2">Write</option>
  					<option value="3">Read</option>
  				</select>
            </td>        
         </tr> 
         <tr>    
            <td>
                 ѡ�������飺
         	 	<select name="dataGroupId" >
  			 	    <option value="">=��ѡ��=</option>
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
            <td> <input type="submit" name="submit" value="��������ƶ�" /> </td>        
         </tr>
      </table>   
      <input type="hidden" name="funcProsId" value="<%=funcProsId%>"/>
      
      
    </form>
    <a href="/fsmch/FSM/cosmicStandard/measure/measure.jsp">����</a>
    <%} %>
  </body>
</html>
