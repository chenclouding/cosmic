<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@ page import="business.FSM.StrategyPhase" %>
<%@ page import="hibernate.FSM.FsmMeasurePurpose" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'editMeasurePurpose.jsp' starting page</title>
    
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
		function verifyInput()
	  {	
		var frm = document.measurePurposeForm;
	   
			if(isEmpty(frm.measurePurposeName.value)) 
			{
				alert("����д����Ŀ�����ƣ�");
				frm.measurePurposeName.focus();				
				return false;
			}
			
		}
		</script>

  </head>
  
  <body>
      <%
       /*��ȡ��ҳ��measurePurpose.jsp����measPurId��productId*/
      Integer measPurId = new Integer(request.getParameter("measPurId"));
      Integer productId = new Integer(request.getParameter("productId"));
      
      /*�����ݿ��а�idΪmeasPurId�Ķ���Ŀ��ȡ��*/
      StrategyPhase sp = new StrategyPhase(); //ҵ��㣬��Ӧ��COSMIC�����Ĳ��Խ׶�
      FsmMeasurePurpose measurePurpose = (FsmMeasurePurpose)sp.getMeasurePurposeById(measPurId);
     
     
      %>
  <form action="/fsmch/FSM/editMeasurePurpose.do" name="measurePurposeForm" method="post" onSubmit="return verifyInput();">
      <table>
         <tr>
            <td width="15%">����Ŀ������</td>
            <td> <input type="text" name="measurePurposeName" value="<%=measurePurpose.getMeasurePurposeName()%>"/> </td>        
         </tr>
          <tr>
            <td width="15%">��ѡĿ��</td> 
            <td>
            <input type="checkbox" name="measure" value="����FUR���������֮ǰ����������ĵ������ݽ��������С�����㿪��������" />1������FUR���������֮ǰ����������ĵ������ݽ��������С�����㿪����������<br>
            <input type="checkbox" name="measure" value="��FUR��׼��Ϊ������Ŀ�ġ���Χ���ӡ�������������ֵĴ�С" />2����FUR��׼��Ϊ������Ŀ�ġ���Χ���ӡ�������������ֵĴ�С��<br>
            <input type="checkbox" name="measure" value="���������������FUR��С���Զ��������ߵ�Ч��" />3�����������������FUR��С���Զ��������ߵ�Ч�ʣ�<br>
            <input type="checkbox" name="measure" value="�����ܵĽ��������FUR��С���Լ��������������FUR��С������ù������õĶ���" />4�������ܵĽ��������FUR��С���Լ��������������FUR��С������ù������õĶ�����<br>
            <input type="checkbox" name="measure" value="�����Ѵ��������FUR��С���������������ά����֧�ֵ���Ա��Ч��" />5�������Ѵ��������FUR��С���������������ά����֧�ֵ���Ա��Ч�ʣ�<br>
            <input type="checkbox" name="measure" value="����һ���������ϵͳ�ı�����ֵĴ�С��������һ����ǿ����Ŀ�ŶӵĲ���" />6������һ���������ϵͳ�ı�����ֵĴ�С��������һ����ǿ����Ŀ�ŶӵĲ�����<br>
            <input type="checkbox" name="measure" value="����һ����������ṩ����Ȼ�˹����û��Ĺ��ܴ�С" />7������һ����������ṩ����Ȼ�˹����û��Ĺ��ܴ�С.<br>
           </td>     
         </tr>
        <tr>
            <td width="15%">����Ŀ������</td> 
            <td><input type="text" name="measurePurposeDesp" value="<%=measurePurpose.getMeasurePurposeDesp() %>"/>   </td>     
         </tr>
              
         <tr>
            <td> <input type="submit" name="submit" value="�޸Ķ���Ŀ��"/> </td>        
         </tr>
         
      </table>
      <input type="hidden" name="id" value="<%=measPurId%>"/>  
      <input type="hidden" name="productId" value="<%=productId%>"/> 
    </form>
  </body>
</html>
