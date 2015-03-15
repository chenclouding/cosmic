package entityOperation.FSM;

import java.util.List;

import net.sf.hibernate.HibernateException;
//import entityOperation.BaseEntityOperation;

public class EventOperation extends BaseEntityOperation{

	/**
	 *  插入事件
	 */		
	public boolean insertEvent(Object dataObject) throws HibernateException{
		return insert(dataObject);
	}
	/**
	 *  按实体名字删除事件
	 */	
	public boolean delEvent(Object dataObject) throws HibernateException{
		return del(dataObject);
	}
	/**
	 *  按ID号删除事件
	 */	
	public boolean delEventById(Integer id) throws HibernateException{
		Object obj = queryById("FsmEvent",id);
		return del(obj);
	}
	/**
	 *  更新事件
	 */	
	public boolean updateEvent(Object dataObject) throws HibernateException {
		return update(dataObject);
	}

	/**
	 *  查询所有的事件
	 */
	public List queryAllEvent() throws HibernateException {	
        return queryAll("FsmEvent");
	}

	/**
	 *  按id（主键）将事件取出来
	 */
	public Object queryEventById(Integer id) {    	
        return queryById("FsmEvent",id);

    }

	/**
	 *  peerCompId（外键）将事件取出来
	 */	
	public List queryByPeerCompId(Integer peerCompId) {    	
		 return queryByFkey("FsmEvent","peerCompId",peerCompId); 
	 }

}
