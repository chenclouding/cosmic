package entityOperation.FSM;

import hibernate.FSM.FsmProduct;
import hibernate.FSM.FsmReg;

import java.util.Iterator;
import java.util.List;

import business.FSM.ProductMeasureBusiness;

import net.sf.hibernate.HibernateException;
import net.sf.hibernate.Query;
import net.sf.hibernate.Session;
import net.sf.hibernate.Transaction;
//import entityOperation.BaseEntityOperation;

//封装了对待估软件的数据库操作
public class ProductMeasureOperation extends BaseEntityOperation {

	/**
	 *  插入层次
	 */		
	public boolean insertProduct(Object dataObject) throws HibernateException{
		return insert(dataObject);
	}
	/**
	 *  按实体名字删除层次
	 */	
	public boolean delProduct(Object dataObject) throws HibernateException{
		return del(dataObject);
	}
	/**
	 *  按ID号删除层次
	 */	
	public boolean delProductById(Integer id) throws HibernateException{
		Object obj = queryById("FsmProduct",id);
		return del(obj);
	}
	/**
	 *  更新层次
	 */	
	public boolean updateProduct(Object dataObject) throws HibernateException {
		return update(dataObject);
	}

	/**
	 *  查询所有的层次
	 */
	public List queryAllProduct() throws HibernateException {	
        return queryAll("FsmProduct");
	}

	/**
	 *  按id（主键）将层次取出来
	 */
	public Object queryProductById(Integer id) {    	
        return queryById("FsmProduct",id);

    }
	
	/**
	 *  按getId（外键）将层次取出来
	 */
public List queryProductsByRegId(Integer regId) {    	
        return queryByFkey("FsmProduct","regId",regId);
}


/**
 *  按getId（外键）将层次取出来
 */
public List queryProductsByUserName(String userName) {   
	FsmReg fr = (FsmReg)queryByColumnName("FsmReg","userName",userName);
	int regId = fr.getId();
    return queryProductsByRegId(regId);
}
	

public boolean delById(String id) throws HibernateException {
	// TODO Auto-generated method stub
	return false;
}
public List queryAll() throws HibernateException {
	// TODO Auto-generated method stub
	return null;
}
public Object queryById(String id) throws HibernateException {
	// TODO Auto-generated method stub
	return null;
}

public static  void  main(String args[]) throws HibernateException{
	ProductMeasureOperation pmo = new ProductMeasureOperation();
	//List list = pmo.queryProductsByUserName("xiao");
	List list = pmo.queryProductsByRegId(20);
	System.out.println(list.size());

	//FsmProduct fp = (FsmProduct)pmo.queryProductById(1);
	//System.out.println(fp.getProductDesp());
}

}
