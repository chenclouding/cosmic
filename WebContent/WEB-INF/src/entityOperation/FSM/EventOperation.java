package entityOperation.FSM;

import java.util.List;

import net.sf.hibernate.HibernateException;
//import entityOperation.BaseEntityOperation;

public class EventOperation extends BaseEntityOperation{

	/**
	 *  �����¼�
	 */		
	public boolean insertEvent(Object dataObject) throws HibernateException{
		return insert(dataObject);
	}
	/**
	 *  ��ʵ������ɾ���¼�
	 */	
	public boolean delEvent(Object dataObject) throws HibernateException{
		return del(dataObject);
	}
	/**
	 *  ��ID��ɾ���¼�
	 */	
	public boolean delEventById(Integer id) throws HibernateException{
		Object obj = queryById("FsmEvent",id);
		return del(obj);
	}
	/**
	 *  �����¼�
	 */	
	public boolean updateEvent(Object dataObject) throws HibernateException {
		return update(dataObject);
	}

	/**
	 *  ��ѯ���е��¼�
	 */
	public List queryAllEvent() throws HibernateException {	
        return queryAll("FsmEvent");
	}

	/**
	 *  ��id�����������¼�ȡ����
	 */
	public Object queryEventById(Integer id) {    	
        return queryById("FsmEvent",id);

    }

	/**
	 *  peerCompId����������¼�ȡ����
	 */	
	public List queryByPeerCompId(Integer peerCompId) {    	
		 return queryByFkey("FsmEvent","peerCompId",peerCompId); 
	 }

}
