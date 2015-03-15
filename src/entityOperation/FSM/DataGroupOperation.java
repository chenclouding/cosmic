package entityOperation.FSM;

import java.util.List;

import net.sf.hibernate.HibernateException;
//import entityOperation.BaseEntityOperation;

public class DataGroupOperation extends BaseEntityOperation {
	/**
	 *  插入数据组
	 */		
	public boolean insertDataGroup(Object dataObject) throws HibernateException{
		return insert(dataObject);
	}
	/**
	 *  按实体名字删除数据组
	 */	
	public boolean delDataGroup(Object dataObject) throws HibernateException{
		return del(dataObject);
	}
	/**
	 *  按ID号删除数据组
	 */	
	public boolean delDataGroupById(Integer id) throws HibernateException{
		Object obj = queryById("FsmDataGroup",id);
		return del(obj);
	}
	/**
	 *  更新数据组
	 */	
	public boolean updateDataGroup(Object dataObject) throws HibernateException {
		return update(dataObject);
	}

	/**
	 *  查询所有的数据组
	 */
	public List queryAllDataGroup() throws HibernateException {	
        return queryAll("FsmDataGroup");
	}

	/**
	 *  按id（主键）将数据组取出来
	 */
	public Object queryDataGroupById(Integer id) {    	
        return queryById("FsmDataGroup",id);

    }

	/**
	 *  interestObjId（外键）将数据组取出来
	 */	
	public List queryByInterestObjId(Integer interestObjId) {    	
		 return queryByFkey("FsmDataGroup","interestObjId",interestObjId); 
	 }


}
