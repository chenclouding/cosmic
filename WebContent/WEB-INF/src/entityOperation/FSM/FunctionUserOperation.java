package entityOperation.FSM;

import java.util.Iterator;
import java.util.List;

import net.sf.hibernate.HibernateException;
import net.sf.hibernate.Query;
import net.sf.hibernate.Session;
import net.sf.hibernate.Transaction;
//import entityOperation.BaseEntityOperation;

/*封装了对”COSMIC中功能用户“的数据库操作*/
public class FunctionUserOperation extends BaseEntityOperation {
	
	/**
	 *  插入功能用户
	 */		
	public boolean insertFunctionUser(Object dataObject) throws HibernateException{
		return insert(dataObject);
	}
	/**
	 *  按实体名字删除功能用户
	 */	
	public boolean delFunctionUser(Object dataObject) throws HibernateException{
		return del(dataObject);
	}
	/**
	 *  按ID号删除功能用户
	 */	
	public boolean delFunctionUserById(Integer id) throws HibernateException{
		Object obj = queryById("FsmUser",id);
		return del(obj);
	}
	/**
	 *  更新功能用户
	 */	
	public boolean updateFunctionUser(Object dataObject) throws HibernateException {
		return update(dataObject);
	}

	/**
	 *  查询所有的功能用户
	 */
	public List queryAllFunctionUser() throws HibernateException {	
        return queryAll("FsmUser");
	}

	/**
	 *  按id（主键）将功能用户取出来
	 */
	public Object queryFunctionUserById(Integer id) {    	
        return queryById("FsmUser",id);

    }

	/**
	 *  productId（外键）将功能用户取出来
	 */	
	public List queryByProductId(Integer productId) {    	
		 return queryByFkey("FsmUser","productId",productId); 
	 }
}

