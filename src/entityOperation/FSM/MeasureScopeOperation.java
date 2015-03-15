package entityOperation.FSM;

import java.util.List;

import net.sf.hibernate.HibernateException;
//import entityOperation.BaseEntityOperation;

public class MeasureScopeOperation extends BaseEntityOperation{
	/**
	 *  ������㷶Χ
	 */		
	public boolean insertMeasureScope(Object dataObject) throws HibernateException{
		return insert(dataObject);
	}
	/**
	 *  ��ʵ������ɾ�����㷶Χ
	 */	
	public boolean delMeasureScope(Object dataObject) throws HibernateException{
		return del(dataObject);
	}
	/**
	 *  ��ID��ɾ�����㷶Χ
	 */	
	public boolean delMeasureScopeById(Integer id) throws HibernateException{
		Object obj = queryById("FsmMeasureScope",id);
		return del(obj);
	}
	/**
	 *  ���¹��㷶Χ
	 */	
	public boolean updateMeasureScope(Object dataObject) throws HibernateException {
		return update(dataObject);
	}

	/**
	 *  ��ѯ���еĹ��㷶Χ
	 */
	public List queryAllMeasureScope() throws HibernateException {	
        return queryAll("FsmMeasureScope");
	}

	/**
	 *  ��id�������������㷶Χȡ����
	 */
	public Object queryMeasureScopeById(Integer id) {    	
        return queryById("FsmMeasureScope",id);

    }

	/**
	 *  productId�����������������ȡ����
	 */	
	public List queryByProductId(Integer productId) {    	
		 return queryByFkey("FsmMeasureScope","productId",productId); 
	 }



}
