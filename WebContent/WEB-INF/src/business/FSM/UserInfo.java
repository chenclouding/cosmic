package business.FSM;

import java.util.List;

import net.sf.hibernate.HibernateException;

import hibernate.FSM.FsmReg;
import entityOperation.FSM.Login;
import entityOperation.FSM.ProductMeasureOperation;

public class UserInfo {

	//get user registerId by userName
	public static int getRegIdByUserName(String userName){
		Login login = new Login();
		return ((FsmReg)login.queryRegByUserName(userName)).getId();
	}
	
	//get user  by userName
	public static Object getUserByName(String userName){
		Login login = new Login();
		return ((FsmReg)login.queryRegByUserName(userName));
	}
	//get all of the users registered
	public static List getAllRegUsers(){
		Login login = new Login();
		List users;
		try {
			users = login.getAllRegUsers();
			return users;
		} catch (HibernateException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
		
	}
	
	//del user registerId by id
	public static boolean delUserById(int userId){
		Login login = new Login();
		return login.delUserById(userId);
	}
}
