package struts.FSM.form;

import org.apache.struts.action.ActionForm;

public class RegisterForm extends ActionForm {
 private String username=null;
 private String password1=null;
 private String password2=null;
public String getUsername() {
	return username;
}
public void setUsername(String username) {
	this.username = username;
}
public String getPassword1() {
	return password1;
}
public void setPassword1(String password1) {
	this.password1 = password1;
}
public String getPassword2() {
	return password2;
}
public void setPassword2(String password2) {
	this.password2 = password2;
}
}
