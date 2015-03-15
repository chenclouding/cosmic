package entityOperation.FSM;

import java.util.List;

import net.sf.hibernate.HibernateException;
//import entityOperation.BaseEntityOperation;

public class InterestObjectOperation extends BaseEntityOperation{
	/**
	 *  ������Ȥ����
	 */		
	public boolean insertInterestObject(Object dataObject) throws HibernateException{
		return insert(dataObject);
	}
	/**
	 *  ��ʵ������ɾ����Ȥ����
	 */	
	public boolean delInterestObject(Object dataObject) throws HibernateException{
		return del(dataObject);
	}
	/**
	 *  ��ID��ɾ����Ȥ����
	 */	
	public boolean delInterestObjectById(Integer id) throws HibernateException{
		Object obj = queryById("FsmInterestObject",id);
		return del(obj);
	}
	/**
	 *  ������Ȥ����
	 */	
	public boolean updateInterestObject(Object dataObject) throws HibernateException {
		return update(dataObject);
	}

	/**
	 *  ��ѯ���е���Ȥ����
	 */
	public List queryAllInterestObject() throws HibernateException {	
        return queryAll("FsmInterestObject");
	}

	/**
	 *  ��id������������Ȥ����ȡ����
	 */
	public Object queryInterestObjectById(Integer id) {    	
        return queryById("FsmInterestObject",id);

    }

	/**
	 *  peerCompId�����������Ȥ����ȡ����
	 */	
	public List queryByPeerCompId(Integer peerCompId) {    	
		 return queryByFkey("FsmInterestObject","peerCompId",peerCompId); 
	 }
	
	

}
