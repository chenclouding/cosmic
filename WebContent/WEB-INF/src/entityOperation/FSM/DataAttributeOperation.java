package entityOperation.FSM;

import java.util.List;

import net.sf.hibernate.HibernateException;
//import entityOperation.BaseEntityOperation;

public class DataAttributeOperation extends BaseEntityOperation{
	/**
	 *  插入数据属性
	 */		
	public boolean insertDataAttribute(Object dataObject) throws HibernateException{
		return insert(dataObject);
	}
	/**
	 *  按实体名字删除数据属性
	 */	
	public boolean delDataAttribute(Object dataObject) throws HibernateException{
		return del(dataObject);
	}
	/**
	 *  按ID号删除数据属性
	 */	
	public boolean delDataAttributeById(Integer id) throws HibernateException{
		Object obj = queryById("FsmDataAttribute",id);
		return del(obj);
	}
	/**
	 *  更新数据属性
	 */	
	public boolean updateDataAttribute(Object dataObject) throws HibernateException {
		return update(dataObject);
	}

	/**
	 *  查询所有的数据属性
	 */
	public List queryAllDataAttribute() throws HibernateException {	
        return queryAll("FsmDataAttribute");
	}

	/**
	 *  按id（主键）将数据属性取出来
	 */
	public Object queryDataAttributeById(Integer id) {    	
        return queryById("FsmDataAttribute",id);

    }

	/**
	 *  dataGroupId（外键）将数据属性取出来
	 */	
	public List queryByDataGroupId(Integer dataGroupId) {    	
		 return queryByFkey("FsmDataAttribute","dataGroupId",dataGroupId); 
	 }



}
