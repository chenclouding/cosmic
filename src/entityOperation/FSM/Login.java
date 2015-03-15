package entityOperation.FSM;

import java.util.List;

import net.sf.hibernate.HibernateException;

import hibernate.FSM.FsmReg;



public class Login extends BaseEntityOperation{
	
	public boolean queryByNameAndPwd(String username, String password) {    	
        FsmReg record = (FsmReg) queryByPwdAndUser("FsmReg","userName",username,"password",password);
        System.out.println("entity:"+"name:"+username+"pwd:"+password);
        if (record == null) return false;
        else  return true;
    }
	
	/**
	 *  按username将用户信息取出来
	 */
	public Object queryRegByUserName(String userName) {
	    return queryByColumnName("FsmReg","userName",userName);

    }
	
	/**
	 *  get all of the users registered
	 * @throws HibernateException 
	 */
	public List getAllRegUsers() throws HibernateException {
	    return queryAll("FsmReg");

    }
	
	/**
	 *  delete user by Id
	 */
	public boolean delUserById(int userId) {
		Object obj = queryById("FsmReg",userId);
	    try {
			return del(obj);
		} catch (HibernateException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;

    }
}
