package business.FSM;

import hibernate.FSM.FsmProduct;

import java.util.List;

import net.sf.hibernate.HibernateException;
import entityOperation.FSM.PeerComponentOperation;
import entityOperation.FSM.ProductMeasureOperation;

public class ProductMeasureBusiness {
	//插入待估算的软件信息
	public boolean insertProduct(Object dataObject) throws HibernateException {
		ProductMeasureOperation pmo = new ProductMeasureOperation();
		if (pmo.insertProduct(dataObject) == true)
			return true;
		else
			return false;
	}
	//删除待估算的软件信息
	public boolean delProduct(Integer id) throws HibernateException{
		ProductMeasureOperation pmo = new ProductMeasureOperation();
		return pmo.delProductById(id);
	}
	//查询所有软件的信息，返回所有软件的信息列表
	public List getAllProduct() throws HibernateException{
		ProductMeasureOperation pmo = new ProductMeasureOperation();
		return pmo.queryAllProduct();
	}
	
	/**
	 *  按getId（外键）将层次取出来
	 */
	public List queryProductsByRegId(Integer regId) {  
		ProductMeasureOperation pmo = new ProductMeasureOperation();
		return pmo.queryProductsByRegId(regId);
	}
	
	/**
	 *  按userName将层次取出来
	 */
	public List queryProductsByUserName(String useName) {  
		ProductMeasureOperation pmo = new ProductMeasureOperation();
		return pmo.queryProductsByUserName(useName);
	}
	
	public Object getProductById(Integer id) throws HibernateException{
		ProductMeasureOperation pmo = new ProductMeasureOperation();
		return pmo.queryProductById(id);
	}
	
	//更新软件信息
	public boolean updateProduct(Object dataObject) throws HibernateException {
		ProductMeasureOperation pmo = new ProductMeasureOperation();
		if (pmo.updateProduct(dataObject) == true)
			return true;
		else
			return false;
	}
	
	public static  void  main(String args[]) throws HibernateException{
		
		ProductMeasureBusiness pmb = new ProductMeasureBusiness();
		List list = pmb.getAllProduct();
		System.out.println(list.size());
		//FsmProduct fp = (FsmProduct)pmb.getProductById(1);
		//System.out.println(fp.getProductName());
	}
	
	
}
