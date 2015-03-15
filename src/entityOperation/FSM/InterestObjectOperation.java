package entityOperation.FSM;

import java.util.List;

import net.sf.hibernate.HibernateException;
//import entityOperation.BaseEntityOperation;

public class InterestObjectOperation extends BaseEntityOperation{
	/**
	 *  插入兴趣对象
	 */		
	public boolean insertInterestObject(Object dataObject) throws HibernateException{
		return insert(dataObject);
	}
	/**
	 *  按实体名字删除兴趣对象
	 */	
	public boolean delInterestObject(Object dataObject) throws HibernateException{
		return del(dataObject);
	}
	/**
	 *  按ID号删除兴趣对象
	 */	
	public boolean delInterestObjectById(Integer id) throws HibernateException{
		Object obj = queryById("FsmInterestObject",id);
		return del(obj);
	}
	/**
	 *  更新兴趣对象
	 */	
	public boolean updateInterestObject(Object dataObject) throws HibernateException {
		return update(dataObject);
	}

	/**
	 *  查询所有的兴趣对象
	 */
	public List queryAllInterestObject() throws HibernateException {	
        return queryAll("FsmInterestObject");
	}

	/**
	 *  按id（主键）将兴趣对象取出来
	 */
	public Object queryInterestObjectById(Integer id) {    	
        return queryById("FsmInterestObject",id);

    }

	/**
	 *  peerCompId（外键）将兴趣对象取出来
	 */	
	public List queryByPeerCompId(Integer peerCompId) {    	
		 return queryByFkey("FsmInterestObject","peerCompId",peerCompId); 
	 }
	
	

}
