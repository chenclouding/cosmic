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
    
    <title>My JSP 'editSubPeerComponent.jsp' starting page</title>
    
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
	  
		function verifyInput(peerComp1,peerComp2,peerComp3,funcPros1,funcPros2,funcPros3,funcDel,peerCompDel)
	  {	
		var frm = document.peerCompForm;
	    
			if(isEmpty(frm.peerCompName.value)) 
			{
				alert("����д�Ե�������ƣ�");
				frm.peerCompName.focus();
				return false;
			}
			if(isEmpty(frm.measureStatus.value)) 
			{
				alert("��ѡ��Ե����״̬��");
				frm.measureStatus.focus();
				return false;
			}else
			{
			    if(frm.compType.value==0) //�Ե����Ϊ������
			     {
			        switch(frm.measureStatus.value)
			        {
			          case '0': //����Ϊδ����״̬
			            { if(peerComp1==false)
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
			          { if(peerComp2==false)
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
			          { if(peerComp3==false )
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
			     }else	 //�Ե����Ϊԭ�����
			     {
			        switch(frm.measureStatus.value)
			        {
			          case '0': //����Ϊδ����״̬
			            { if(funcPros1==false)
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
			          { if(funcPros2==false)
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
			          { if(funcPros3==false)
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
			
			}
			
			if(isEmpty(frm.compType.value)) 
			{
				alert("��ѡ��Ե�������ͣ�");
				frm.compType.focus();
				return false;
			}else
			{
				switch(frm.compType.value)
		         {
			        case '0': //���޸�Ϊ�������
				       { if(funcDel==false) //��ԭ���������Ϊԭ��������������������̣����ܱ��޸�
				        { 
				        	 alert("�����Ͳ����޸ģ�");
				             frm.compType.focus();
				             return false;break;
				        }else
				        {
				             return true;break;     
				        }
				       }
				    case '1': //���޸�Ϊԭ������
				      { alert(frm.compType.value);
				       if(peerCompDel==false)  //���Ե����Ϊ�������������������Ե���������ܱ��޸�
					   {
					     	 alert("�����Ͳ����޸ģ�");
				             frm.compType.focus();
				             return false;break;
                        }else
				        {
				             return true; break;      
				        } 
				       }
				     default:return true;
				    
			      }
			  }
		}
		function test()
		{
		  alert("test");
		  return false;
		}
		//�˺�����ʱû��
		function setCompSelect()
		{	
		   var selectTag = null; //select���
		   selectTag = document.getElementById("_compType"); //��ȡselect��ǣ�Ԫ�أ�
		   var index = selectTag.selectedIndex;//��ȡ��ѡ�е�optionԪ�ص��±�
		   selectTag.options[index].selected=true;//��Ǳ�ѡ�е�optionsԪ�أ����������������
		}
	</script>
  </head>
  
  <body>
      <%
       /*��ȡ��ҳ��peerComponent.jsp����peerCompId��layerId*/
      Integer peerCompId = new Integer(request.getParameter("peerCompId"));     
      Integer layerId = new Integer(request.getParameter("layerId"));
       Integer fatherId = new Integer(request.getParameter("fatherId"));
       Integer productId = new Integer(request.getParameter("productId"));
      
      /*�����ݿ��а�idΪpeerCompId�ĶԵ����ȡ��*/
      StrategyPhase sp = new StrategyPhase(); //ҵ��㣬��Ӧ��COSMIC�����Ĳ��Խ׶�
      MappingPhase mp = new MappingPhase();
      FsmPeerComponent peerComp = (FsmPeerComponent)sp.getPeerComponentById(peerCompId);
     
      //��֤����״̬�Ƿ�ɱ��޸�
      boolean peerCompUn = true;
      boolean peerCompPart = true;
      boolean peerCompAll = true;
      boolean funcProsUn = true;
      boolean funcProsPart = true;
      boolean funcProsAll = true;
      List peerCompList = sp.getPeerComponentByFatherId(peerCompId);
      List peerCompStatus0List = sp.getPeerComponentByFatherIdAndMeasureStatus(peerCompId,0);
      List peerCompStatus1List = sp.getPeerComponentByFatherIdAndMeasureStatus(peerCompId,1);
      List peerCompStatus2List = sp.getPeerComponentByFatherIdAndMeasureStatus(peerCompId,2);
      List funcProsStatus0List = mp.getFunctionProcessByPeerCompIdAndMeasureStatus(peerCompId,0);
      List funcProsStatus1List = mp.getFunctionProcessByPeerCompIdAndMeasureStatus(peerCompId,1);
      List funcProsStatus2List = mp.getFunctionProcessByPeerCompIdAndMeasureStatus(peerCompId,2);     
	  if((peerCompStatus1List!=null&&peerCompStatus1List.size()!=0) || (peerCompStatus2List!=null&&peerCompStatus2List.size()!=0)) 
	     peerCompUn = false; //��ԭ���������Ϊ�����������������������Ѿ��б����ֹ������ȫ������ģ��򲻿��޸�
      if((funcProsStatus1List!=null&&funcProsStatus1List.size()!=0) || (funcProsStatus2List!=null&&funcProsStatus2List.size()!=0))
	     funcProsUn = false;//���Ե����Ϊԭ�������������Ĺ����������Ѿ��б����ֹ������ȫ������ģ����ܱ��޸�
      if((peerCompStatus1List==null||peerCompStatus1List.size()==0) && (peerCompStatus2List==null||peerCompStatus2List.size()==0)) //�޸�Ϊ���ֹ���
	     peerCompPart = false; //��ԭ���������Ϊ����������������������û�б����ֹ����ȫ������ģ��򲻿��޸�
      if((funcProsStatus1List==null||funcProsStatus1List.size()==0) && (funcProsStatus2List==null||funcProsStatus2List.size()==0))
	     funcProsPart = false;//���Ե����Ϊԭ�������������Ĺ���������û�б����ֹ����ȫ������ģ����ܱ��޸�
      if(peerCompList==null || peerCompList.size()==0)//��Ϊȫ��������
	     peerCompAll = false;//���Ե����Ϊ����������û������������ܱ��޸�
      if((peerCompStatus0List!=null&&peerCompStatus0List.size()!=0) || (peerCompStatus1List!=null&&peerCompStatus1List.size()!=0)) 
	     peerCompAll = false; //��ԭ���������Ϊ�����������������������б����ֹ������δ����ģ��򲻿��޸�
      if((funcProsStatus0List!=null&&funcProsStatus0List.size()!=0) || (funcProsStatus1List!=null&&funcProsStatus1List.size()!=0))
	     funcProsAll = false;//���Ե����Ϊԭ�������������Ĺ����������б����ֹ������δ����ģ����ܱ��޸�
      //����javascript,������֤compType�Ƿ��ܱ��޸�	  
	  List funcList = mp.getFunctionProcessByPeerCompId(peerCompId); 	
	  	  
	  boolean funcDel = true;
	  boolean peerCompDel = true;
	  if(funcList!=null && funcList.size()!=0) 
	     funcDel = false; //��ԭ���������Ϊԭ��������������������̣����ܱ��޸�
	  if(peerCompList!=null && peerCompList.size()!=0)
	     peerCompDel = false;//���Ե����Ϊ�������������������Ե���������ܱ��޸�
	  
      %> 
     
      
         
  <form action="/fsmch/FSM/editSubPeerComponent.do?productId=<%=productId %>&fatherId=<%=fatherId %>" name="peerCompForm" method="post" onSubmit="return verifyInput(<%=peerCompUn%>,<%=peerCompPart%>,<%=peerCompAll%>,<%=funcProsUn%>,<%=funcProsPart%>,<%=funcProsAll%>,<%=funcDel%>,<%=peerCompDel%>);">
      <table>
         <tr>
            <td width="15%">�Ե������</td>
            <td> <input type="text" name="peerCompName" value="<%=peerComp.getPeerCompName()%>"/> </td>        
         </tr>
        <tr>
            <td width="15%">�Ե��������</td> 
            <td><input type="text" name="peerCompDesp" value="<%=peerComp.getPeerCompDesp() %>"/>   </td>     
         </tr>
         <tr>
  			<td width="15%">����״̬</td>
  			<% 
  			//����״̬�ķ���ֵ����״̬��ֵ 
	         Integer measureStatus = peerComp.getMeasureStatus();
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
  			 	    <option value="<%=measureStatus %>"><%=measureStatusName %></option>
  			 	    <option value="0">δ����</option>
  					<option value="1">���ֹ���</option>
  					<option value="2">ȫ������</option>
  				</select>
            </td>
  		</tr>
        <tr>
  		    <td width="15%">�Ե��������</td>
  		    <% 
  			//����������͵ķ���ֵ�������͸�ֵ 
	         Integer compType = peerComp.getCompType();
	         String compTypeName = null;
	         switch (compType)  
	         {
		         case 0:compTypeName = "������";break;
		         case 1:compTypeName = "ԭ�����";break;		         
		         default:compTypeName = "״̬����";
	         }
	         %>
  			<td>
  			 	<select name="compType" style="width:160px">
  			 	    <option value="<%=compType %>"><%=compTypeName %></option>
  			 	    <!-- 0������������1����ԭ����� -->
  			 	    <option value="0">������</option>
  					<option value="1">ԭ�����</option>
  				</select>
            </td>
  		</tr>
         <tr>
            <td> <input type="submit" name="submit" value="�޸ĶԵ����"/> </td>        
         </tr>
         
      </table>
      <input type="hidden" name="id" value="<%=peerCompId%>"/>
      
      <input type="hidden" name="layerId" value="<%=layerId%>"/> 
     
    </form>
  </body>
</html>
