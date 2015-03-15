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
				alert("请填写对等组件名称！");
				frm.peerCompName.focus();
				return false;
			}
			if(isEmpty(frm.measureStatus.value)) 
			{
				alert("请选择对等组件状态！");
				frm.measureStatus.focus();
				return false;
			}else
			{
			    if(frm.compType.value==0) //对等组件为组合组件
			     {
			        switch(frm.measureStatus.value)
			        {
			          case '0': //若改为未估算状态
			            { if(peerComp1==false)
			              {
					     	 alert("此估算状态不能修改！");
				             frm.measureStatus.focus();
				             return false;break;
                          }else
				          {
				             return true; break;      
				          } 
			            }
			         case '1': //若改为部分估算
			          { if(peerComp2==false)
			              {
					     	 alert("此估算状态不能修改！");
				             frm.measureStatus.focus();
				             return false;break;
                          }else
				          {
				             return true; break;      
				          } 
			            }
			          case '2': //若改为全部估算
			          { if(peerComp3==false )
			              {
					     	 alert("此估算状态不能修改！");
				             frm.measureStatus.focus();
				             return false;break;
                          }else
				          {
				             return true; break;      
				          } 
			            }   
			        } 
			     }else	 //对等组件为原子组件
			     {
			        switch(frm.measureStatus.value)
			        {
			          case '0': //若改为未估算状态
			            { if(funcPros1==false)
			              {
					     	 alert("此估算状态不能修改！");
				             frm.measureStatus.focus();
				             return false;break;
                          }else
				          {
				             return true; break;      
				          } 
			            }
			         case '1': //若改为部分估算
			          { if(funcPros2==false)
			              {
					     	 alert("此估算状态不能修改！");
				             frm.measureStatus.focus();
				             return false;break;
                          }else
				          {
				             return true; break;      
				          } 
			            }
			          case '2': //若改为全部估算
			          { if(funcPros3==false)
			              {
					     	 alert("此估算状态不能修改！");
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
				alert("请选择对等组件类型！");
				frm.compType.focus();
				return false;
			}else
			{
				switch(frm.compType.value)
		         {
			        case '0': //若修改为组合类型
				       { if(funcDel==false) //若原来组件类型为原子组件，并包含功能流程，则不能被修改
				        { 
				        	 alert("此类型不能修改！");
				             frm.compType.focus();
				             return false;break;
				        }else
				        {
				             return true;break;     
				        }
				       }
				    case '1': //若修改为原子类型
				      { alert(frm.compType.value);
				       if(peerCompDel==false)  //若对等组件为组合组件，并包含其它对等组件，则不能被修改
					   {
					     	 alert("此类型不能修改！");
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
       /*获取从页面peerComponent.jsp传来peerCompId和layerId*/
      Integer peerCompId = new Integer(request.getParameter("peerCompId"));     
      Integer layerId = new Integer(request.getParameter("layerId"));
       Integer fatherId = new Integer(request.getParameter("fatherId"));
       Integer productId = new Integer(request.getParameter("productId"));
      
      /*从数据库中把id为peerCompId的对等组件取出*/
      StrategyPhase sp = new StrategyPhase(); //业务层，对应于COSMIC方法的策略阶段
      MappingPhase mp = new MappingPhase();
      FsmPeerComponent peerComp = (FsmPeerComponent)sp.getPeerComponentById(peerCompId);
     
      //验证估算状态是否可被修改
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
	     peerCompUn = false; //若原来组件类型为组合组件，其包含的子组件中已经有被部分估算或者全部估算的，则不可修改
      if((funcProsStatus1List!=null&&funcProsStatus1List.size()!=0) || (funcProsStatus2List!=null&&funcProsStatus2List.size()!=0))
	     funcProsUn = false;//若对等组件为原子组件，其包含的功能流程中已经有被部分估算或者全部估算的，则不能被修改
      if((peerCompStatus1List==null||peerCompStatus1List.size()==0) && (peerCompStatus2List==null||peerCompStatus2List.size()==0)) //修改为部分估算
	     peerCompPart = false; //若原来组件类型为组合组件，其包含的子组件中没有被部分估算和全部估算的，则不可修改
      if((funcProsStatus1List==null||funcProsStatus1List.size()==0) && (funcProsStatus2List==null||funcProsStatus2List.size()==0))
	     funcProsPart = false;//若对等组件为原子组件，其包含的功能流程中没有被部分估算和全部估算的，则不能被修改
      if(peerCompList==null || peerCompList.size()==0)//改为全部被估算
	     peerCompAll = false;//若对等组件为组合组件，而没有子组件，则不能被修改
      if((peerCompStatus0List!=null&&peerCompStatus0List.size()!=0) || (peerCompStatus1List!=null&&peerCompStatus1List.size()!=0)) 
	     peerCompAll = false; //若原来组件类型为组合组件，其包含的子组件中有被部分估算或者未估算的，则不可修改
      if((funcProsStatus0List!=null&&funcProsStatus0List.size()!=0) || (funcProsStatus1List!=null&&funcProsStatus1List.size()!=0))
	     funcProsAll = false;//若对等组件为原子组件，其包含的功能流程中有被部分估算或者未估算的，则不能被修改
      //传给javascript,用于验证compType是否能被修改	  
	  List funcList = mp.getFunctionProcessByPeerCompId(peerCompId); 	
	  	  
	  boolean funcDel = true;
	  boolean peerCompDel = true;
	  if(funcList!=null && funcList.size()!=0) 
	     funcDel = false; //若原来组件类型为原子组件，并包含功能流程，则不能被修改
	  if(peerCompList!=null && peerCompList.size()!=0)
	     peerCompDel = false;//若对等组件为组合组件，并包含其它对等组件，则不能被修改
	  
      %> 
     
      
         
  <form action="/fsmch/FSM/editSubPeerComponent.do?productId=<%=productId %>&fatherId=<%=fatherId %>" name="peerCompForm" method="post" onSubmit="return verifyInput(<%=peerCompUn%>,<%=peerCompPart%>,<%=peerCompAll%>,<%=funcProsUn%>,<%=funcProsPart%>,<%=funcProsAll%>,<%=funcDel%>,<%=peerCompDel%>);">
      <table>
         <tr>
            <td width="15%">对等组件名</td>
            <td> <input type="text" name="peerCompName" value="<%=peerComp.getPeerCompName()%>"/> </td>        
         </tr>
        <tr>
            <td width="15%">对等组件描述</td> 
            <td><input type="text" name="peerCompDesp" value="<%=peerComp.getPeerCompDesp() %>"/>   </td>     
         </tr>
         <tr>
  			<td width="15%">估算状态</td>
  			<% 
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
	         %>
  			<td>
  			 	<select name="measureStatus" style="width:160px">
  			 	    <option value="<%=measureStatus %>"><%=measureStatusName %></option>
  			 	    <option value="0">未估算</option>
  					<option value="1">部分估算</option>
  					<option value="2">全部估算</option>
  				</select>
            </td>
  		</tr>
        <tr>
  		    <td width="15%">对等组件类型</td>
  		    <% 
  			//根据组件类型的返回值，对类型赋值 
	         Integer compType = peerComp.getCompType();
	         String compTypeName = null;
	         switch (compType)  
	         {
		         case 0:compTypeName = "组合组件";break;
		         case 1:compTypeName = "原子组件";break;		         
		         default:compTypeName = "状态错误";
	         }
	         %>
  			<td>
  			 	<select name="compType" style="width:160px">
  			 	    <option value="<%=compType %>"><%=compTypeName %></option>
  			 	    <!-- 0代表组合组件，1代表原子组件 -->
  			 	    <option value="0">组合组件</option>
  					<option value="1">原子组件</option>
  				</select>
            </td>
  		</tr>
         <tr>
            <td> <input type="submit" name="submit" value="修改对等组件"/> </td>        
         </tr>
         
      </table>
      <input type="hidden" name="id" value="<%=peerCompId%>"/>
      
      <input type="hidden" name="layerId" value="<%=layerId%>"/> 
     
    </form>
  </body>
</html>
