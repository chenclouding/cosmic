 <%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%> 
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%> 
<%@ page contentType="text/html; charset=gb2312" language="java" %>
<%@ page import="business.FSM.UserInfo" %>
<%@ page import="hibernate.FSM.FsmReg" %>
<%@ page import="java.util.*" %>
<HTML>
<HEAD>
<TITLE>CMMI-Based Management Tool</TITLE>
<!--CharSet-->
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=gb2312">
<link rel="stylesheet" href="/fsmch/images/CSS.CSS" type="text/css">
<style type="text/css">
<!--
.style1 {color: #006600}
.style2 {font-size: 16px}
.style3 {color: #CC3300}
.style4 {
	font-family: "华文隶书";
	font-size: 24px;
	color: #FF0000;
}
.style6 {
	font-size: 36px;
	font-family: "华文隶书";
}
.style8 {font-size: 24px; font-family: "华文隶书";}
-->
</style>
<script language="JavaScript" src="javascript/verify.js"></script>
<script language="JavaScript">
function check(){
if(form1.username.value==null||form1.username.value==""){
alert("请输入用户名!!!");
}else if(form1.password.value==null||form1.password.value==""){
alert("请输入密码!!!");
}else{
form1.submit();
}

}

function register(){
window.location.href="/fsmch/register.jsp";

}

   function confirmdel(){
           return confirm("确定删除吗？");
  }

</script>
</HEAD>
<BODY BGCOLOR=#669966 leftmargin="0" topmargin="0" marginwidth="0" marginheight="0" >
<!--Counter-->
<!--Something Here-->
<table width="778" border="0" cellspacing="0" cellpadding="0" align="center" height="130">
  <tr>
    <td background="/fsmch/images/index_topPP1.jpg" valign="top">
     
    </td>
  </tr>
</table>
<table width="778" border="0" cellspacing="0" cellpadding="0" align="center" background="/fsmch/images/index_bg.gif">
  <tr>
    <td valign="top" width="215" rowspan="2">
      <table width="215" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td>
            <table width="215" border="0" cellspacing="0" cellpadding="0" height="20" background="/fsmch/images/01.gif">
              <tr>
                <td> <img src="/fsmch/images/index_pic.gif" width="215" height="155"></td>
              </tr>
            </table>
          </td>
        </tr>
        <tr>
          <td>
            <table width="215" border="0" cellspacing="0" cellpadding="0" height="15">
              <tr>
                <td>
                  <div align="center">
<!--Language-->
<!--Something Here-->
</div>
                </td>
              </tr>
            </table>
            <table width="215" border="0" cellspacing="0" cellpadding="0" height="40" background="/fsmch/images/index_lm.gif">
              <tr>
                <td> <div align="center"><b><a href="index.jsp">首页</a></b> </div></td>
              </tr>
            </table>

<!--Button9.Content.Begin-->
            <table width="215" border="0" cellspacing="0" cellpadding="0" height="40" background="/fsmch/images/index_lm.gif">
              <tr>
                <td>
                  <div align="center"><b>
<!--Button9.Link-->
<a href="/fsmch/admin.jsp">
    <!--Button9-->管理页面 
</a></b></div>
                </td>
              </tr>
            </table>
<!--Button9.Content.End-->

<!--Button10.Content.Begin-->
            <table width="215" border="0" cellspacing="0" cellpadding="0" height="40" background="/fsmch/images/index_lm.gif">
              <tr>
                <td>
                  <div align="center"><b>
<!--Button10.Link-->
<a href="/fsmch/index.jsp">
<!--Button10-->
退出系统
</a></b></div>
                </td>
              </tr>
            </table>
<!--Button10.Content.End-->


          </td>
        </tr>
      </table>
    </td>
    <td valign="top" width="563"><img src="/fsmch/images/index_top2.gif" width="563" height="70"></td>
  </tr>
  <tr>
    <td valign="top">
      <table width="100%" border="0" cellspacing="0" cellpadding="0">
     
        <tr>
          <td>
           <!--IndexPage.Content.Begin-->
            <table width="90%" border="0" cellspacing="0" cellpadding="0" align="center">
            <tr>
              <td>
                  <div align="left" class="style2 style3">
                     <p class="style2 style4">欢迎访问管理页面 ！</p>
                    </div> 
              </td>
             </tr>
             <tr>
                <td bgcolor="#000000"><img src="/fsmch/images/Spacer.gif" width="1" height="1"></td>
             </tr>
             <tr>
                <td height="128">
<!--Page.Content.Begin-->
<!--Something Here-->
<div style=" height:300px; overflow:scroll; overflow-x:hidden;">
 <%
           //get all the register users from database
           List userlist = UserInfo.getAllRegUsers();
           FsmReg user = null;
        %>
       <%
        /*If no users information, prompts to add;*/
        if(userlist==null ||userlist.size()==0 ){%>  
         <h1 style="color:red">现在无用户，请先添加用户！</h1> 
       <%}else{ %>
         <table>
	       <tr> 
	            <td>序号</td>
		        <td >用户名</td> 
		        <td>删除</td>
	       </tr> 
	    <%   for(Object obj:userlist){ 
	         user = (FsmReg)obj; 
	         Integer userId = user.getId();
	        
	     %>
	         <tr>
		          <td><%= userlist.indexOf(obj)+1 %></td>
		           
		          <td>
		          	<%=user.getUserName() %>	          		         	  				
		          </td>		         
		          <td>
		             <a href="/fsmch/deleteUser.jsp?userId=<%=userId%>"
		                 onclick="return confirmdel();">
		                 <IMG src="/fsmch/images/btndel.gif" alt="Delete" width="15" height="12" border="0" />
		              </a>
		           </td>
		         
	         </tr>  
          <%}%>
           </table>
        <%}%>  
 </div>
<p>&nbsp; </p>

<!--Page.Content.End-->
       </td>
          </tr>
</table>
<!--IndexPage.Content.End-->


            <table width="90%" border="0" cellspacing="0" cellpadding="0" align="center" height="1">
              <tr>
                <td bgcolor="#000000"> </td>
              </tr>
            </table>

          </td>
        </tr>
      </table>
    </td>
  </tr>
</table>
<table width="778" border="0" cellspacing="0" cellpadding="0" align="center">
  <tr>
    <td><img src="/fsmch/images/index_bottom.gif" width="778" height="50"></td>
  </tr>
</table>
</BODY>

 </HTML>
