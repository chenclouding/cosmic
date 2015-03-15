package entityOperation.FSM;

import java.util.List;

import net.sf.hibernate.HibernateException;
//import entityOperation.BaseEntityOperation;

public class MeasurePurposeOperation extends BaseEntityOperation{
	/**
	 *  插入估算目的
	 */		
	public boolean insertMeasurePurpose(Object dataObject) throws HibernateException{
		return insert(dataObject);
	}
	/**
	 *  按实体名字删除估算目的
	 */	
	public boolean delMeasurePurpose(Object dataObject) throws HibernateException{
		return del(dataObject);
	}
	/**
	 *  按ID号删除估算目的
	 */	
	public boolean delMeasurePurposeById(Integer id) throws HibernateException{
		Object obj = queryById("FsmMeasurePurpose",id);
		return del(obj);
	}
	/**
	 *  更新估算目的
	 */	
	public boolean updateMeasurePurpose(Object dataObject) throws HibernateException {
		return update(dataObject);
	}

	/**
	 *  查询所有的估算目的
	 */
	public List queryAllMeasurePurpose() throws HibernateException {	
        return queryAll("FsmMeasurePurpose");
	}

	/**
	 *  按id（主键）将估算目的取出来
	 */
	public Object queryMeasurePurposeById(Integer id) {    	
        return queryById("FsmMeasurePurpose",id);

    }

	/**
	 *  productId（外键）将数据属性取出来
	 */	
	public List queryByProductId(Integer productId) {    	
		 return queryByFkey("FsmMeasurePurpose","productId",productId); 
	 }



}
