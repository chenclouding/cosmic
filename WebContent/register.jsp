 <%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%> 
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%> 
<%@ page contentType="text/html; charset=gb2312" language="java" %>
<HTML>
<HEAD>
<TITLE>����CMMI���̹�����</TITLE>
<!--CharSet-->
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=gb2312">
<link rel="stylesheet" href="/fsmch/images/CSS.CSS" type="text/css">
<style type="text/css">
<!--
.style1 {color: #006600}
.style2 {font-size: 16px}
.style3 {color: #CC3300}
.style4 {
	font-family: "��������";
	font-size: 24px;
	color: #FF0000;
}
.style6 {
	font-size: 36px;
	font-family: "��������";
}
.style8 {font-size: 24px; font-family: "��������";}
-->
</style>
<script language="JavaScript" src="javascript/verify.js"></script>
<script language="JavaScript">
function verifyInput(){
	if(registerForm.username.value==null||registerForm.username.value==""){
		alert("�������û���!!!");
		registerForm.username.focus();
		return false;
	}else if(registerForm.password1.value==null||registerForm.password1.value==""){
		registerForm.password1.focus();
		alert("����������!!!");
		return false;
	}else if(registerForm.password2.value==null||registerForm.password2.value==""){
		registerForm.password2.focus();
		alert("���ٴ���������!!!");
		return false;
	}else if(registerForm.password1.value!=registerForm.password2.value){
		registerForm.password2.focus();
		alert("��������ͬ������!!!");
		return false;
	}else{
	    registerForm.submit();
    }
}

</script>
</HEAD>
<BODY BGCOLOR=#669966 leftmargin="0" topmargin="0" marginwidth="0" marginheight="0" onload=document.form1.userName.focus()>
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
                <td> <div align="center"><b><a href="index.jsp">��ҳ</a></b> </div></td>
              </tr>
            </table>



<!--Button10.Content.Begin-->
            <table width="215" border="0" cellspacing="0" cellpadding="0" height="40" background="/fsmch/images/index_lm.gif">
              <tr>
                <td>
                  <div align="center"><b>
<!--Button10.Link-->
<a href="index.jsp">
<!--Button10-->
�˳�ϵͳ
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
                     <p class="style2 style4">��ӭ�������ǵ���վ��</p>
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
<form action="/fsmch/FSM/addRegister.do" name="registerForm" method="post" onSubmit="return verifyInput();">
	<table style="width:500px">
		<tr>
			<td>�û���:</td>
			<td><input type="text" name="username" ></td>
		</tr>
		<tr>
			<td>����:</td>
			<td><input type="password" name="password1"></td>
		</tr>
		<tr>
			<td>�ٴ���������:</td>
			<td><input type="password" name="password2"></td>
		</tr>
	</table>
  <input type="submit" name="submit" value="ע��" /> 
  <input type='button' onclick="Javascript:window.location='/fsmch/index.jsp'" value="���� "> 
</form>
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
            <table width="90%" border="0" cellspacing="0" cellpadding="4" align="center">
              <tr>
                <td>
                  <p align="center">
<!--Your Company Name-->
���������
<!--TCopyRight-->
 ��Ȩ���� @2011<br>
<!--TAddress-->
��ַ�������к�����ѧԺ·37��
<!--Address-->
<br>
<!--TTelephone-->
�绰:010��82316288
<!--Telephone-->
<br>
<!--TEMail-->

<!--EMail-->

<!--Email-->
</p>
                </td>
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
