<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@ page import="business.FSM.StrategyPhase" %>
<%@ page import="business.FSM.MappingPhase" %>
<%@ page import="business.FSM.MeasurePhase" %>
<%@ page import="hibernate.FSM.FsmFunctionProcess" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'editFunctionProcess.jsp' starting page</title>
    
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
		function verifyInput(funcProsUn,funcProPart,funcProAll)
	  {	
		var frm = document.functionProcessForm;
	   
			if(isEmpty(frm.funcProsName.value)) 
			{
				alert("����д�����������ƣ�");
				frm.funcProsName.focus();
				return false;
			}
			if(isEmpty(frm.measureStatus.value)) 
			{
				alert("��ѡ��������״̬��");
				frm.measureStatus.focus();
				return false;
			}else
			{			    
			        switch(frm.measureStatus.value)
			        {
			          case '0': //����Ϊδ����״̬
			            { if(funcProsUn== false )
			              {
					     	 alert("�˹���״̬�����޸ģ�");
				             frm.measureStatus.focus();
				             return false;break;
                          }else
				          {
				             return true; break;      
				          } 
			            }
			         case '1': //����Ϊ���ֹ���
			          { if(funcProsPart==false)
			              {
					     	 alert("�˹���״̬�����޸ģ�");
				             frm.measureStatus.focus();
				             return false;break;
                          }else
				          {
				             return true; break;      
				          } 
			            }
			          case '2': //����Ϊȫ������
			          { if(funcProsAll==false )
			              {
					     	 alert("�˹���״̬�����޸ģ�");
				             frm.measureStatus.focus();
				             return false;break;
                          }else
				          {
				             return true; break;      
				          } 
			            }   
			        } 		
			  }
		
		function test()
		{
		  alert("test");
		  return false;
		}
      }
		
	</script>
  </head>
  
  <body>
      <%
       /*��ȡ��ҳ��functionProcess.jsp����peerCompId��funcProsId*/
      Integer peerCompId = new Integer(request.getParameter("peerCompId")); 
      Integer funcProsId = new Integer(request.getParameter("funcProsId"));%>
      
      <%            
      /*�����ݿ��а�idΪfuncProsId�Ĺ�������ȡ��*/
      StrategyPhase sp = new StrategyPhase(); //ҵ��㣬��Ӧ��COSMIC�����Ĳ��Խ׶�
      MappingPhase mp = new MappingPhase();
      MeasurePhase msp = new MeasurePhase();
      FsmFunctionProcess funcPros = (FsmFunctionProcess)mp.getFunctionProcessById(funcProsId);
     
      //��֤����״̬�Ƿ�ɱ��޸�
       boolean funcProsUn = true;
       boolean funcProsPart = true;
       boolean funcProsAll = true;
       List dataMoveList = msp.getDataMovementByFuncProsId(funcProsId);          
       List dataMoveEntryList = msp.getDataMovementByDataMoveTypeAndFuncProsId(0,funcProsId);
       List dataMoveExitList = msp.getDataMovementByDataMoveTypeAndFuncProsId(1,funcProsId);
       List dataMoveWriteList = msp.getDataMovementByDataMoveTypeAndFuncProsId(2,funcProsId);       
	  if(dataMoveList!=null&&dataMoveList.size()!=0) 
	     funcProsUn = false; //���ù��������Ѿ������������ƶ����򲻿��޸�     
      if(dataMoveList==null||dataMoveList.size()==0){ //�޸�Ϊ���ֹ���
	     funcProsPart = false;
	     funcProsAll = false;
	     } //���ù������̲����������ƶ����򲻿��޸�          
      if(((dataMoveEntryList==null||dataMoveEntryList.size()==0)&&(dataMoveExitList==null||dataMoveExitList.size()==0))&&((dataMoveEntryList==null||dataMoveEntryList.size()==0)&&(dataMoveWriteList==null||dataMoveWriteList.size()==0))) 
	     funcProsAll = false; //���ù������̲��������ٰ���һ��Entry��Exit����Entry��Write���򲻿��޸�  
      %> 
         
  <form action="/fsmch/FSM/editFunctionProcess.do" name="functionProcessForm" method="post" onSubmit="return verifyInput(<%=funcProsUn%>,<%=funcProsPart%>,<%=funcProsAll%>);">
 
      <table>
         <tr>
            <td width="15%">����������</td>
            <td> <input type="text" name="funcProsName" value="<%=funcPros.getFuncProsName()%>"/> </td>        
         </tr>
        <tr>
            <td width="15%">������������</td> 
            <td><input type="text" name="funcProsDesp" value="<%=funcPros.getFuncProsDesp() %>"/>   </td>     
         </tr>
         <tr>
  			<td width="15%">����״̬</td>
  			<% 
  			//����״̬�ķ���ֵ����״̬��ֵ 
	         Integer measureStatus = funcPros.getMeasureStatus();
	         String measureStatusName = null;
	         switch (measureStatus)  
	         {
		         case 0:measureStatusName = "δ����";break;
		         case 1:measureStatusName = "���ֹ���";break;
		         case 2:measureStatusName = "ȫ������";break;
		         default:measureStatusName = "״̬����";
	         }
	         %>
  			<td>
  			 	<select name="measureStatus" style="width:160px">
  			 	    <option value="<%=measureStatus %>" selected><%=measureStatusName %></option>
  			 	    <option value="0" >δ����</option>
  					<option value="1">���ֹ���</option>
  					<option value="2">ȫ������</option>
  				</select>
            </td>
  		</tr>
       
         <tr>
            <td> <input type="submit" name="submit" value="�޸Ĺ�������"/> </td>        
         </tr>
         
      </table>
      <input type="hidden" name="id" value="<%=funcProsId%>"/>  
      <input type="hidden" name="peerCompId" value="<%=peerCompId%>"/> 
    </form>
  </body>
</html>
