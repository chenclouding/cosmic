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
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'editDataMovement.jsp' starting page</title>
    
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
       /*��ȡ��ҳ��peerComponent.jsp����peerCompId��layerId*/
      Integer dataMoveId = new Integer(request.getParameter("dataMoveId"));
      Integer funcProsId = new Integer(request.getParameter("funcProsId"));
      
      /*�����ݿ��а�idΪdataMoveId�������ƶ�ȡ��*/
      MeasurePhase mp = new MeasurePhase(); //ҵ��㣬��Ӧ��COSMIC�����Ĳ��Խ׶�
       MappingPhase mp1 = new MappingPhase();
      FsmDataMovement dataMove = (FsmDataMovement)mp.getDataMovementById(dataMoveId);
       List fpioList = mp1.getFunctionProcessInterestObjectByFuncProsId(funcProsId) ;
       FsmFunctionProcessInterestObject o = new FsmFunctionProcessInterestObject();
        List dgList  = new ArrayList();
           for(Object obj:fpioList){  
         Integer ioId = ((FsmFunctionProcessInterestObject)obj).getInterestObjId();
         List subDgList = mp1.getDataGroupByInterestObjId(ioId); 
         dgList.addAll(subDgList);
     }
     
      %>
  <form action="/fsmch/FSM/editDataMovement.do">
      <table>
         <tr>
            <td width="15%">�����ƶ���</td>
            <td> <input type="text" name="dataMoveName" value="<%=dataMove.getDataMoveName()%>"/> </td>        
         </tr>
        <tr>
            <td width="15%">�����ƶ�����</td> 
            <td><input type="text" name="dataMoveDesp" value="<%=dataMove.getDataMoveDesp() %>"/>   </td>     
         </tr>
         <tr>
  			<td width="15%">�����ƶ�����</td>
  			<% 
  			//����״̬�ķ���ֵ����״̬��ֵ 
	         Integer dataMoveType = dataMove.getDataMoveType();
	         String dataMoveTypeName = null;
	         switch (dataMoveType)  
	         {
		         case 0:dataMoveTypeName = "Entry";break;
		         case 1:dataMoveTypeName = "Exit";break;
		         case 2:dataMoveTypeName = "Write";break;
		         case 3:dataMoveTypeName = "Read";break;
		         default:dataMoveTypeName = "״̬����";
	         }
	         %>
  			<td>
  			 	<select name="dataMoveType" style="width:160px">
  			 	    <option value="<%=dataMoveType %>"><%=dataMoveTypeName %></option>
  			 	    <option value="0">Entry</option>
  					<option value="1">Exit</option>
  				    <option value="2">Write</option>
  					<option value="3">Read</option>
  				</select>
            </td>
  		</tr>
  		 <tr> 
  		     <td width="15%">��ѡ��������</td>  		    
            <td>               
         	 	<select name="dataGroupId" >
  			 	    <option value=""></option>
  		         <%if(dgList!=null && dgList.size()!=0){
  		            for(Object obj:dgList){%>
  		              <option value="<%=((FsmDataGroup)obj).getId() %>"><%=((FsmDataGroup)obj).getDataGroupName()%></option>
  		         <% }
  		         }%>
  				</select>
            </td>        
         </tr>   
  		  
        
         <tr>
            <td> <input type="submit" name="submit" value="�޸������ƶ�"/> </td>        
         </tr>
         
      </table>
      <input type="hidden" name="id" value="<%=dataMoveId%>"/>  
      <input type="hidden" name="funcProsId" value="<%=funcProsId%>"/> 
    </form>
  </body>
</html>
