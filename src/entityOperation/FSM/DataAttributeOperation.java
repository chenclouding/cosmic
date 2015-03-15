package entityOperation.FSM;

import java.util.List;

import net.sf.hibernate.HibernateException;
//import entityOperation.BaseEntityOperation;

public class DataAttributeOperation extends BaseEntityOperation{
	/**
	 *  ������������
	 */		
	public boolean insertDataAttribute(Object dataObject) throws HibernateException{
		return insert(dataObject);
	}
	/**
	 *  ��ʵ������ɾ����������
	 */	
	public boolean delDataAttribute(Object dataObject) throws HibernateException{
		return del(dataObject);
	}
	/**
	 *  ��ID��ɾ����������
	 */	
	public boolean delDataAttributeById(Integer id) throws HibernateException{
		Object obj = queryById("FsmDataAttribute",id);
		return del(obj);
	}
	/**
	 *  ������������
	 */	
	public boolean updateDataAttribute(Object dataObject) throws HibernateException {
		return update(dataObject);
	}

	/**
	 *  ��ѯ���е���������
	 */
	public List queryAllDataAttribute() throws HibernateException {	
        return queryAll("FsmDataAttribute");
	}

	/**
	 *  ��id������������������ȡ����
	 */
	public Object queryDataAttributeById(Integer id) {    	
        return queryById("FsmDataAttribute",id);

    }

	/**
	 *  dataGroupId�����������������ȡ����
	 */	
	public List queryByDataGroupId(Integer dataGroupId) {    	
		 return queryByFkey("FsmDataAttribute","dataGroupId",dataGroupId); 
	 }



}
