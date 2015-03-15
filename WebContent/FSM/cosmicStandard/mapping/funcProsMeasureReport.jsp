<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@ page import="business.FSM.MappingPhase" %>
<%@ page import="business.FSM.MeasurePhase" %>
<%@ page import="hibernate.FSM.FsmFunctionProcess" %>
<%@ page import="hibernate.FSM.FsmDataMovement" %>
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
    
    <title>My JSP 'funcProsMeasureReport.jsp' starting page</title>
    
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
      String  back = "funcProsMearRep";
      Integer funcProsId = new Integer(request.getParameter("funcProsId"));//��ȡ��ҳ��functionProcessDescription.jsp������funcProsId    
      MappingPhase mp = new MappingPhase();
      MeasurePhase mp1 = new MeasurePhase();   
      List dataMoveList = mp1.getDataMovementByFuncProsId(funcProsId);
      FsmFunctionProcess ffp = (FsmFunctionProcess) mp.getFunctionProcessById(funcProsId);
      Integer measureStatus = ffp.getMeasureStatus();
	  String measureStatusName = null;
	  switch (measureStatus)  
	         {
		         case 0:measureStatusName = "δ����";break;
		         case 1:measureStatusName = "���ֹ���";break;
		         case 2:measureStatusName = "ȫ������";break;
		         default:measureStatusName = "״̬����";
	         }       
  %>
  
  
	<h2>�ù������̵Ĺ��ܵ����Ϊ<%=dataMoveList.size()%>�����������</h2>
	<table  border="1" width="80" >
	  
	    <tr>
	    <th>������������</th>
	    <td align="center"><%=ffp.getFuncProsName()%></td>
	    </tr>
	    <tr> 
	    <th>��������</th>
	    <td><a href="/fsmch/FSM/cosmicStandard/mapping/funcProsEventDescription.jsp?funcProsId=<%=funcProsId%>&back=<%=back%>">�¼�</a><br>
		     <a href="/fsmch/FSM/cosmicStandard/mapping/funcProsIODescription.jsp?funcProsId=<%=funcProsId%>&back=<%=back%>">��Ȥ����</a><br>
		     <a href="/fsmch/FSM/cosmicStandard/mapping/funcProsUserDescription.jsp?funcProsId=<%=funcProsId%>&back=<%=back%>">�����û�</a><br></td>
		     </tr>
	     <tr>
	     <th>����״̬</th>
	     <td><%=measureStatusName%></td>
	     </tr>
	     <tr>
	     <th>������������</th>
	     <td>

	       <%if(dataMoveList==null ||dataMoveList.size()==0){%>  
           Ŀǰ����������Ϣ���������������Ϣ
          <%}else{ %>
	       <%for(Object obj:dataMoveList){
		    FsmDataMovement fdm = (FsmDataMovement)obj;
		    Integer dataGroupId = fdm.getDataGroupId();
		    String dataGroupName = ((FsmDataGroup)mp.getDataGroupById(dataGroupId)).getDataGroupName();
		    %><%=dataGroupName%><br>	     		 		         		    
		 <%}
		 }%>
		
	      </td>
	     </tr>	     
	     <tr>
	     <th>�����ƶ�����</th>
	     <td>
	     
	      <%if(dataMoveList==null ||dataMoveList.size()==0 ){%>  
           Ŀǰ�������ƶ���Ϣ������������ƶ���Ϣ 
          <%}else{ %>
		 <%for(Object obj:dataMoveList){
		    FsmDataMovement fdm = (FsmDataMovement)obj;
		    Integer dataMoveType = fdm.getDataMoveType();
	        String dataMoveName = null;
	       switch (dataMoveType)  
	          {
		         case 0:dataMoveName = "Entry";break;
		         case 1:dataMoveName = "Exit";break;
		         case 2:dataMoveName = "Write";break;
		         case 3:dataMoveName = "Read";break;
		         default:dataMoveName = "״̬����";
	          }    	        
		 %><%=dataMoveName%><br>	     		 		         		    
		 <%}
		 }%>
		
	     </td>
	    </tr>
	     <tr>
	     <th>���ܵ����</th>
	     <td><%=dataMoveList.size()%></td>
	  </tr>	  
	   
	</table>
	<a  href="javascript:window.name=='contentFrame'?window.location='/fsmch/FSM/cosmicStandard/mapping/functionProcess.jsp':parent.location.href='/fsmch/FSM/cosmicStandard/mapping/functionProcess.jsp'">����</a> 
  </body>
</html>
