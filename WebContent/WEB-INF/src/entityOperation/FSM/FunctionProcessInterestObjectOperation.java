package entityOperation.FSM;

import java.util.List;

import net.sf.hibernate.HibernateException;
//import entityOperation.BaseEntityOperation;

public class FunctionProcessInterestObjectOperation extends BaseEntityOperation{
	
	/**
	 *  ���빦�����̡���Ȥ����
	 */		
	public boolean insertFunctionProcessInterestObject(Object dataObject) throws HibernateException{
		return insert(dataObject);
	}
	/**
	 *  ��ʵ������ɾ���������̡���Ȥ����
	 */	
	public boolean delFunctionProcessInterestObject(Object dataObject) throws HibernateException{
		return del(dataObject);
	}
	
	/**
	 *  ��ID��ɾ���������̡���Ȥ����
	 */	
	public boolean delFunctionProcessInterestObjectById(Integer id) throws HibernateException{
		Object obj = queryById("FsmFunctionProcessInterestObject",id);
		return del(obj);
	}
	
	/**
	 *  �����funProsIdɾ���������̡���Ȥ����
	 */	
	public boolean delFunctionProcessInterestObjectByFuncProsId(Integer funcProsId) throws HibernateException{		
		return delByFKey("FsmFunctionProcessInterestObject","funcProsId",funcProsId);
	}
	/**
	 *  ���¹������̡���Ȥ����
	 */	
	public boolean updateFunctionProcessInterestObject(Object dataObject) throws HibernateException {
		return update(dataObject);
	}

	/**
	 *  ��ѯ���еĹ������̡���Ȥ����
	 */
	public List queryAllFunctionProcessInterestObject() throws HibernateException {	
        return queryAll("FsmFunctionProcessInterestObject");
	}

	/**
	 *  ��id�����������������̡���Ȥ����ȡ����
	 */
	public Object queryFunctionProcessInterestObjectById(Integer id) {    	
        return queryById("FsmFunctionProcessInterestObject",id);

    }

	/**
	 *  funcProsId����������������̡���Ȥ����ȡ����
	 */	
	public List queryByFuncProsId(Integer funcProsId) {    	
		 return queryByFkey("FsmFunctionProcessInterestObject","funcProsId",funcProsId); 
	 }
	
	/**
	 *  interObjId����������������̡���Ȥ����ȡ����
	 */	
	public List queryByInterestObjId(Integer interestObjId) {    	
		 return queryByFkey("FsmFunctionProcessInterestObject","interestObjId",interestObjId); 
	 }
	
	
	
	public static void main(String[] str) throws HibernateException{
	
		FunctionProcessInterestObjectOperation fpioo = new FunctionProcessInterestObjectOperation();
		List list = fpioo.queryByFkey("FsmFunctionProcessInterestObject","funcProsId",27);
		System.out.println(list.size());
   
	}
}
