package entityOperation.FSM;

import java.util.Iterator;
import java.util.List;

import net.sf.hibernate.HibernateException;
import net.sf.hibernate.Query;
import net.sf.hibernate.Session;
import net.sf.hibernate.Transaction;
//import entityOperation.BaseEntityOperation;

/*��װ�˶ԡ�COSMIC�й����û��������ݿ����*/
public class FunctionUserOperation extends BaseEntityOperation {
	
	/**
	 *  ���빦���û�
	 */		
	public boolean insertFunctionUser(Object dataObject) throws HibernateException{
		return insert(dataObject);
	}
	/**
	 *  ��ʵ������ɾ�������û�
	 */	
	public boolean delFunctionUser(Object dataObject) throws HibernateException{
		return del(dataObject);
	}
	/**
	 *  ��ID��ɾ�������û�
	 */	
	public boolean delFunctionUserById(Integer id) throws HibernateException{
		Object obj = queryById("FsmUser",id);
		return del(obj);
	}
	/**
	 *  ���¹����û�
	 */	
	public boolean updateFunctionUser(Object dataObject) throws HibernateException {
		return update(dataObject);
	}

	/**
	 *  ��ѯ���еĹ����û�
	 */
	public List queryAllFunctionUser() throws HibernateException {	
        return queryAll("FsmUser");
	}

	/**
	 *  ��id���������������û�ȡ����
	 */
	public Object queryFunctionUserById(Integer id) {    	
        return queryById("FsmUser",id);

    }

	/**
	 *  productId��������������û�ȡ����
	 */	
	public List queryByProductId(Integer productId) {    	
		 return queryByFkey("FsmUser","productId",productId); 
	 }
}

