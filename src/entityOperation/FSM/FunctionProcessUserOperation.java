package entityOperation.FSM;

import java.util.List;

import net.sf.hibernate.HibernateException;
//import entityOperation.BaseEntityOperation;

public class FunctionProcessUserOperation extends BaseEntityOperation{
	/**
	 *  ���빦�����̡��û�
	 */		
	public boolean insertFunctionProcessUser(Object dataObject) throws HibernateException{
		return insert(dataObject);
	}
	/**
	 *  ��ʵ������ɾ���������̡��û�
	 */	
	public boolean delFunctionProcessUser(Object dataObject) throws HibernateException{
		return del(dataObject);
	}
	/**
	 *  ��ID��ɾ���������̡��û�
	 */	
	public boolean delFunctionProcessUserById(Integer id) throws HibernateException{
		Object obj = queryById("FsmFunctionProcessUser",id);
		return del(obj);
	}
	/**
	 *  �����funProsIdɾ���������̡��û�
	 */	
	public boolean delFunctionProcessUserByFuncProsId(Integer funcProsId) throws HibernateException{		
		return delByFKey("FsmFunctionProcessUser","funcProsId",funcProsId);
	}
	/**
	 *  ���¹������̡��û�
	 */	
	public boolean updateFunctionProcessUser(Object dataObject) throws HibernateException {
		return update(dataObject);
	}

	/**
	 *  ��ѯ���еĹ������̡��û�
	 */
	public List queryAllFunctionProcessUser() throws HibernateException {	
        return queryAll("FsmFunctionProcessUser");
	}

	/**
	 *  ��id�����������������̡��û�ȡ����
	 */
	public Object queryFunctionProcessUserById(Integer id) {    	
        return queryById("FsmFunctionProcessUser",id);

    }

	/**
	 *  funcProsId����������������̡��û�ȡ����
	 */	
	public List queryByFuncProsId(Integer funcProsId) {    	
		 return queryByFkey("FsmFunctionProcessUser","funcProsId",funcProsId); 
	 }
	
	/**
	 *  userId����������������̡��û�ȡ����
	 */	
	public List queryByUserId(Integer userId) {    	
		 return queryByFkey("FsmFunctionProcessUser","userId",userId); 
	 }
}
