package entityOperation.FSM;

import java.util.List;

import net.sf.hibernate.HibernateException;
//import entityOperation.BaseEntityOperation;

public class MeasureScopeOperation extends BaseEntityOperation{
	/**
	 *  插入估算范围
	 */		
	public boolean insertMeasureScope(Object dataObject) throws HibernateException{
		return insert(dataObject);
	}
	/**
	 *  按实体名字删除估算范围
	 */	
	public boolean delMeasureScope(Object dataObject) throws HibernateException{
		return del(dataObject);
	}
	/**
	 *  按ID号删除估算范围
	 */	
	public boolean delMeasureScopeById(Integer id) throws HibernateException{
		Object obj = queryById("FsmMeasureScope",id);
		return del(obj);
	}
	/**
	 *  更新估算范围
	 */	
	public boolean updateMeasureScope(Object dataObject) throws HibernateException {
		return update(dataObject);
	}

	/**
	 *  查询所有的估算范围
	 */
	public List queryAllMeasureScope() throws HibernateException {	
        return queryAll("FsmMeasureScope");
	}

	/**
	 *  按id（主键）将估算范围取出来
	 */
	public Object queryMeasureScopeById(Integer id) {    	
        return queryById("FsmMeasureScope",id);

    }

	/**
	 *  productId（外键）将数据属性取出来
	 */	
	public List queryByProductId(Integer productId) {    	
		 return queryByFkey("FsmMeasureScope","productId",productId); 
	 }



}
