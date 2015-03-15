package entityOperation.FSM;

import java.util.Iterator;
import java.util.List;

import net.sf.hibernate.HibernateException;
import net.sf.hibernate.Query;
import net.sf.hibernate.Session;
import net.sf.hibernate.Transaction;
//import entityOperation.BaseEntityOperation;

/*封装了对”COSMIC中层次“的数据库操作*/
public class LayerOperation extends BaseEntityOperation {
	
	/**
	 *  插入层次
	 */		
	public boolean insertLayer(Object dataObject) throws HibernateException{
		return insert(dataObject);
	}
	
	public boolean insertRegister(Object registerObject) throws HibernateException{
		return insert(registerObject);
	}
	/**
	 *  按实体名字删除层次
	 */	
	public boolean delLayer(Object dataObject) throws HibernateException{
		return del(dataObject);
	}
	/**
	 *  按ID号删除层次
	 */	
	public boolean delLayerById(Integer id) throws HibernateException{
		Object obj = queryById("FsmLayer",id);
		return del(obj);
	}
	/**
	 *  更新层次
	 */	
	public boolean updateLayer(Object dataObject) throws HibernateException {
		return update(dataObject);
	}

	/**
	 *  查询所有的层次
	 */
	public List queryAllLayer() throws HibernateException {	
        return queryAll("FsmLayer");
	}

	/**
	 *  按id（主键）将层次取出来
	 */
	public Object queryLayerById(Integer id) {    	
        return queryById("FsmLayer",id);

    }

	/**
	 *  productId（外键）将层次取出来
	 */	
	public List queryByProductId(Integer productId) {    	
		 return queryByFkey("FsmLayer","productId",productId); 
	 }
	
	public List queryByProductIdAndMeasureStatus(Integer productId,Integer measureStatus) { 
		 return queryByColumnNames("FsmLayer","productId",productId,"measureStatus",measureStatus);	
	}
}
