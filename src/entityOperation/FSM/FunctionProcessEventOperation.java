package entityOperation.FSM;

import java.util.List;

import net.sf.hibernate.HibernateException;
//import entityOperation.BaseEntityOperation;

public class FunctionProcessEventOperation extends BaseEntityOperation {
	/**
	 *  ���빦�����̡��¼�
	 */		
	public boolean insertFunctionProcessEvent(Object dataObject) throws HibernateException{
		return insert(dataObject);
	}
	/**
	 *  ��ʵ������ɾ���������̡��¼�
	 */	
	public boolean delFunctionProcessEvent(Object dataObject) throws HibernateException{
		return del(dataObject);
	}
	/**
	 *  ��ID��ɾ���������̡��¼�
	 */	
	public boolean delFunctionProcessEventById(Integer id) throws HibernateException{
		Object obj = queryById("FsmFunctionProcessEvent",id);
		return del(obj);
	}
	/**
	 *  �����funProsIdɾ���������̡��¼�
	 */	
	public boolean delFunctionProcessEventByFuncProsId(Integer funcProsId) throws HibernateException{		
		return delByFKey("FsmFunctionProcessEvent","funcProsId",funcProsId);
	}
	/**
	 *  ���¹������̡��¼�
	 */	
	public boolean updateFunctionProcessEvent(Object dataObject) throws HibernateException {
		return update(dataObject);
	}

	/**
	 *  ��ѯ���еĹ������̡��¼�
	 */
	public List queryAllFunctionProcessEvent() throws HibernateException {	
        return queryAll("FsmFunctionProcessEvent");
	}

	/**
	 *  ��id�����������������̡��¼�ȡ����
	 */
	public Object queryFunctionProcessEventById(Integer id) {    	
        return queryById("FsmFunctionProcessEvent",id);

    }

	/**
	 *  funcProsId����������������̡��¼�ȡ����
	 */	
	public List queryByFuncProsId(Integer funcProsId) {    	
		 return queryByFkey("FsmFunctionProcessEvent","funcProsId",funcProsId); 
	 }
	
	/**
	 *  eventId����������������̡��¼�ȡ����
	 */	
	public List queryByEventId(Integer eventId) {    	
		 return queryByFkey("FsmFunctionProcessEvent","eventId",eventId); 
	 }
}
