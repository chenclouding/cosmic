package entityOperation.FSM;

import java.util.Iterator;
import java.util.List;

import net.sf.hibernate.HibernateException;
import net.sf.hibernate.Query;
import net.sf.hibernate.Session;
import net.sf.hibernate.Transaction;
//import entityOperation.BaseEntityOperation;

/*��װ�˶ԡ�COSMIC�в�Ρ������ݿ����*/
public class LayerOperation extends BaseEntityOperation {
	
	/**
	 *  ������
	 */		
	public boolean insertLayer(Object dataObject) throws HibernateException{
		return insert(dataObject);
	}
	
	public boolean insertRegister(Object registerObject) throws HibernateException{
		return insert(registerObject);
	}
	/**
	 *  ��ʵ������ɾ�����
	 */	
	public boolean delLayer(Object dataObject) throws HibernateException{
		return del(dataObject);
	}
	/**
	 *  ��ID��ɾ�����
	 */	
	public boolean delLayerById(Integer id) throws HibernateException{
		Object obj = queryById("FsmLayer",id);
		return del(obj);
	}
	/**
	 *  ���²��
	 */	
	public boolean updateLayer(Object dataObject) throws HibernateException {
		return update(dataObject);
	}

	/**
	 *  ��ѯ���еĲ��
	 */
	public List queryAllLayer() throws HibernateException {	
        return queryAll("FsmLayer");
	}

	/**
	 *  ��id�������������ȡ����
	 */
	public Object queryLayerById(Integer id) {    	
        return queryById("FsmLayer",id);

    }

	/**
	 *  productId������������ȡ����
	 */	
	public List queryByProductId(Integer productId) {    	
		 return queryByFkey("FsmLayer","productId",productId); 
	 }
	
	public List queryByProductIdAndMeasureStatus(Integer productId,Integer measureStatus) { 
		 return queryByColumnNames("FsmLayer","productId",productId,"measureStatus",measureStatus);	
	}
}
