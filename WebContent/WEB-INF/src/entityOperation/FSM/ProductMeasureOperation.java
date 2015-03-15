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

//��װ�˶Դ�����������ݿ����
public class ProductMeasureOperation extends BaseEntityOperation {

	/**
	 *  ������
	 */		
	public boolean insertProduct(Object dataObject) throws HibernateException{
		return insert(dataObject);
	}
	/**
	 *  ��ʵ������ɾ�����
	 */	
	public boolean delProduct(Object dataObject) throws HibernateException{
		return del(dataObject);
	}
	/**
	 *  ��ID��ɾ�����
	 */	
	public boolean delProductById(Integer id) throws HibernateException{
		Object obj = queryById("FsmProduct",id);
		return del(obj);
	}
	/**
	 *  ���²��
	 */	
	public boolean updateProduct(Object dataObject) throws HibernateException {
		return update(dataObject);
	}

	/**
	 *  ��ѯ���еĲ��
	 */
	public List queryAllProduct() throws HibernateException {	
        return queryAll("FsmProduct");
	}

	/**
	 *  ��id�������������ȡ����
	 */
	public Object queryProductById(Integer id) {    	
        return queryById("FsmProduct",id);

    }
	
	/**
	 *  ��getId������������ȡ����
	 */
public List queryProductsByRegId(Integer regId) {    	
        return queryByFkey("FsmProduct","regId",regId);
}


/**
 *  ��getId������������ȡ����
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
