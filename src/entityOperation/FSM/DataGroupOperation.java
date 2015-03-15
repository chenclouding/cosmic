package entityOperation.FSM;

import java.util.List;

import net.sf.hibernate.HibernateException;
//import entityOperation.BaseEntityOperation;

public class DataGroupOperation extends BaseEntityOperation {
	/**
	 *  ����������
	 */		
	public boolean insertDataGroup(Object dataObject) throws HibernateException{
		return insert(dataObject);
	}
	/**
	 *  ��ʵ������ɾ��������
	 */	
	public boolean delDataGroup(Object dataObject) throws HibernateException{
		return del(dataObject);
	}
	/**
	 *  ��ID��ɾ��������
	 */	
	public boolean delDataGroupById(Integer id) throws HibernateException{
		Object obj = queryById("FsmDataGroup",id);
		return del(obj);
	}
	/**
	 *  ����������
	 */	
	public boolean updateDataGroup(Object dataObject) throws HibernateException {
		return update(dataObject);
	}

	/**
	 *  ��ѯ���е�������
	 */
	public List queryAllDataGroup() throws HibernateException {	
        return queryAll("FsmDataGroup");
	}

	/**
	 *  ��id����������������ȡ����
	 */
	public Object queryDataGroupById(Integer id) {    	
        return queryById("FsmDataGroup",id);

    }

	/**
	 *  interestObjId���������������ȡ����
	 */	
	public List queryByInterestObjId(Integer interestObjId) {    	
		 return queryByFkey("FsmDataGroup","interestObjId",interestObjId); 
	 }


}
