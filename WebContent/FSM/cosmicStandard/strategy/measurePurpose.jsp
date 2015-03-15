<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@ page import="business.FSM.ProductMeasureBusiness" %>
<%@ page import="hibernate.FSM.FsmProduct" %>
<%@ page import="hibernate.FSM.FsmMeasurePurpose" %>
<%@ page import="business.FSM.StrategyPhase" %>
<%@ page import="hibernate.FSM.FsmLayer" %>
<jsp:useBean id="projectMeasureBean" scope="session" class="javaBeans.fsm.ProjectMeasureBean"/> 
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'measurePurpose.jsp' starting page</title>
    
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
		var frm = document.measurePurposeForm;
		var mId= document.getElementsByName( "measure");
		var isSel=false;
		for(i=0;i<mId.length;i++){
		   if(mId[i].checked){
		     isSel=true;
		     break;
		   }
		}
		   if(isSel==false)
		  {
		  alert("��ѡ�����Ŀ�ģ�");		 
		  return isSel;
		  }
	   
			if(isEmpty(frm.measurePurposeName.value)) 
			{
				alert("����д����Ŀ�����ƣ�");
				frm.measurePurposeName.focus();
				return false;
			}
			if(isEmpty(frm.measure.value)) 
			{
				alert("��ѡ���ѡĿ�ģ�");
				frm.measure.focus();
				return false;
			}
			
		}
		
	</script>
  </head>
  
  <body>
      <%
     if(projectMeasureBean.getProductId()==null )
          response.sendRedirect("/fsmch/FSM/cosmicStandard/strategy/alertStrategy.jsp");
      else{
        //��projectMeasureBean���productId  
        Integer productId = projectMeasureBean.getProductId();
      %>
      <h4> ����Ŀ���б�</h4>
      <% /*�����ݿ��аѹ���Ŀ����Ϣȡ��*/
       StrategyPhase sp = new StrategyPhase(); //ҵ��㣬��Ӧ��COSMIC�����Ĳ��Խ׶�
       List measPurList = sp.getMeasurePurposeByProductId(productId);
       FsmMeasurePurpose measurePurpose = new FsmMeasurePurpose();//����ʵ��Bean
     
       /*���޹���Ŀ����Ϣ����ʾ��ӣ����й���Ŀ����Ϣ���г�����Ŀ���б�*/
       if(measPurList==null ||measPurList.size()==0 ){%>  
         <h1 style="color:red">Ŀǰ�޹���Ŀ����Ϣ������ӹ���Ŀ��</h1> 
       <%}else{ %>
         <table>
	       <tr> 
		        <td >���</td> 
		        <td>����Ŀ������</td>		        
		        <td>�鿴</td>
		        <td>�޸�</td>
		        <td>ɾ��</td>
	       </tr> 
	    <%   for(Object p:measPurList){ 
	         measurePurpose = (FsmMeasurePurpose)p; 
	         Integer measPurId = measurePurpose.getId(); 
	         
	    %>
	         <tr>
		          <td><%= measPurList.indexOf(p)+1 %></td> 
		          <td><%= measurePurpose.getMeasurePurposeName() %></td>
		          <td><a href="/fsmch/FSM/cosmicStandard/strategy/measurePurposeDescription.jsp?productId=<%=productId%>&measPurId=<%=measPurId %>"><IMG src="/fsmch/images/btncheck.gif" alt="�鿴" border="0" /></a></td>
		          <td><a href="/fsmch/FSM/cosmicStandard/strategy/editMeasurePurpose.jsp?measPurId=<%=measPurId%>&productId=<%=productId%>"><IMG src="/fsmch/images/btnedit.gif" alt="�޸�" border="0" /></a></td>
		          <td><a href="/fsmch/FSM/cosmicStandard/strategy/delMeasurePurpose.jsp?measPurId=<%=measPurId%>&productId=<%=productId%>" onclick="return confirmdel();"><IMG src="/fsmch/images/btndel.gif" alt="ɾ��" width="15" height="12" border="0" /></a></td>		          
	         </tr>  
          <%}%>
           </table>
        <%}%>  
     
   
   
    <form action="/fsmch/FSM/addMeasurePurpose.do" name="measurePurposeForm" method="post" onSubmit="return verifyInput();">
      <table>
         <tr>
            <td width="15%">����Ŀ������</td>
            <td> <input type="text" name="measurePurposeName" value=""/> </td>        
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
            <td width="15%">����Ŀ�Ĳ���˵��</td>
            <td>
              <textarea name="measurePurposeDesp" wrap="soft" cols="25" rows="5"></textarea>
            </td>
         </tr>      
        
         <tr>
            <td> <input type="submit" name="submit" value="��ӹ���Ŀ��"/> </td>        
         
              <td><input type="reset" name="reset" value="����"/></td>
            </tr> 
      </table>
      
      <input type="hidden" name="productId" value="<%=productId%>"/>
    </form>
     <hr>
   
    <%} %>
  </body>
</html>
