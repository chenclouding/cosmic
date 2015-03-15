package entityOperation.FSM;

import java.util.List;

import net.sf.hibernate.HibernateException;
//import entityOperation.BaseEntityOperation;

public class MeasurePurposeOperation extends BaseEntityOperation{
	/**
	 *  �������Ŀ��
	 */		
	public boolean insertMeasurePurpose(Object dataObject) throws HibernateException{
		return insert(dataObject);
	}
	/**
	 *  ��ʵ������ɾ������Ŀ��
	 */	
	public boolean delMeasurePurpose(Object dataObject) throws HibernateException{
		return del(dataObject);
	}
	/**
	 *  ��ID��ɾ������Ŀ��
	 */	
	public boolean delMeasurePurposeById(Integer id) throws HibernateException{
		Object obj = queryById("FsmMeasurePurpose",id);
		return del(obj);
	}
	/**
	 *  ���¹���Ŀ��
	 */	
	public boolean updateMeasurePurpose(Object dataObject) throws HibernateException {
		return update(dataObject);
	}

	/**
	 *  ��ѯ���еĹ���Ŀ��
	 */
	public List queryAllMeasurePurpose() throws HibernateException {	
        return queryAll("FsmMeasurePurpose");
	}

	/**
	 *  ��id��������������Ŀ��ȡ����
	 */
	public Object queryMeasurePurposeById(Integer id) {    	
        return queryById("FsmMeasurePurpose",id);

    }

	/**
	 *  productId�����������������ȡ����
	 */	
	public List queryByProductId(Integer productId) {    	
		 return queryByFkey("FsmMeasurePurpose","productId",productId); 
	 }



}
