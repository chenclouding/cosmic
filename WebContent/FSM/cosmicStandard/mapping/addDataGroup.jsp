<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@ taglib uri="/WEB-INF/displaytag-11.tld" prefix="display"%>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-bean" prefix="bean"%>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-html" prefix="html"%>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-logic" prefix="logic"%>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-tiles" prefix="tiles"%>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-template" prefix="template"%>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-nested" prefix="nested"%>
<%@ page import="business.FSM.MappingPhase" %>
<%@ page import="hibernate.FSM.FsmDataGroup" %>
<%@ page import="java.util.List"%>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'addDataGroup.jsp' starting page</title>
    
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
        return confirm("ȷ��ɾ����");
	}	
		  
		function verifyInput()
	  {	
		var frm = document.dataGroupForm;
	   
			if(isEmpty(frm.dataGroupName.value)) 
			{
				alert("����д���������ƣ�");
				frm.dataGroupName.focus();
				return false;
			}
			
		}
		</script>
  
  </head>
  
  <body> 
     
      <%       
      //��ȡ��dataGroup.jspҳ�洫����interestObjId         
        Integer interestObjId = new Integer(request.getParameter("interestObjId")); 
      %>
     <h4> �������б�</h4>
      <% /*�����ݿ��а��������������Ϣȡ��*/
       MappingPhase mp = new MappingPhase(); //ҵ��㣬��Ӧ��COSMIC�����Ĳ��Խ׶�
       List dataGroupList = mp.getDataGroupByInterestObjId(interestObjId);
       FsmDataGroup dataGroup = new FsmDataGroup();//����ʵ��Bean
     
       /*������������Ϣ����ʾ��ӣ�������������Ϣ���г��������б�*/
       if(dataGroupList==null ||dataGroupList.size()==0 ){%>  
         <h1 style="color:red">Ŀǰ����������Ϣ�������������</h1> 
       <%}else{ %>
         <table>
	       <tr> 
		        <td >���</td> 
		        <td>����������</td>		        
		        <td>����</td>
		        <td>�޸�</td>
		        <td>ɾ��</td>
		        <td>�����������</td>
	       </tr> 
	    <%   for(Object p:dataGroupList){ 
	         dataGroup = (FsmDataGroup)p; 
	         Integer dataGroupId = dataGroup.getId();
	        
	     %>
	         <tr>
		          <td><%= dataGroupList.indexOf(p)+1 %></td>
		           
		          <td>
		          	<%=dataGroup.getDataGroupName()  %>	          		         	  				
		          </td>		         
		          <td><a href="/fsmch/FSM/cosmicStandard/mapping/dataGroupDescription.jsp?dataGroupId=<%=dataGroupId%>&interestObjId=<%=interestObjId%>"><IMG src="/fsmch/images/btncheck.gif" alt="�鿴" border="0" /></a></td>
		          <td><a href="/fsmch/FSM/cosmicStandard/mapping/editDataGroup.jsp?interestObjId=<%=interestObjId%>&dataGroupId=<%=dataGroupId%>"><IMG src="/fsmch/images/btnedit.gif" alt="�޸�" border="0" /></a></td>
		          <td><a href="/fsmch/FSM/cosmicStandard/mapping/delDataGroup.jsp?interestObjId=<%=interestObjId%>&dataGroupId=<%=dataGroupId%>" onclick="return confirmdel();"><IMG src="/fsmch/images/btndel.gif" alt="ɾ��" width="15" height="12" border="0" /></a></td>
		          <td><a href="javascript:window.name=='dataGroupFrame'?parent.location='/fsmch/FSM/cosmicStandard/mapping/dataAttribute.jsp?interestObjId=<%=interestObjId %>&dataGroupId=<%=dataGroupId %>':window.location.href='/fsmch/FSM/cosmicStandard/mapping/dataAttribute.jsp?interestObjId=<%=interestObjId %>&dataGroupId=<%=dataGroupId %>'">�����������</a></td>
	         </tr>  
          <%}%>
           </table>
        <%}%>  
     
   
   
    <form action="/fsmch/FSM/addDataGroup.do?interestObjId=<%=interestObjId%>" name="dataGroupForm" method="post" onSubmit="return verifyInput();">
      <table>
         <tr>
  			<td width="10%">����������</td>
  			<td >
  			    <input type="text" name="dataGroupName" style="width:160px" value=""/ >
            </td>
  		</tr>
  		<tr>
  			<td width="10%">����������</td>
  			<td >
  			    <textarea name="dataGroupDesp" wrap="soft" cols="25" rows="5"></textarea>
            </td>
  		</tr>
         
         <tr>
            <td> <input type="submit" name="submit" value="���������"/> </td>        
         </tr>
         
      </table>
      <input type="hidden" name="interestObjId" value="<%=interestObjId%>"/>
    </form>
     <hr>
   
   <a  href="javascript:window.name=='dataGroupFrame'?parent.location='/fsmch/FSM/cosmicStandard/mapping/dataGroup.jsp':window.location.href='/fsmch/FSM/cosmicStandard/mapping/dataGroup.jsp'">����</a>
 
      </body>
</html>
