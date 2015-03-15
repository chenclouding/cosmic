package business.FSM;

import hibernate.FSM.FsmProduct;

import java.util.List;

import net.sf.hibernate.HibernateException;
import entityOperation.FSM.PeerComponentOperation;
import entityOperation.FSM.ProductMeasureOperation;

public class ProductMeasureBusiness {
	//���������������Ϣ
	public boolean insertProduct(Object dataObject) throws HibernateException {
		ProductMeasureOperation pmo = new ProductMeasureOperation();
		if (pmo.insertProduct(dataObject) == true)
			return true;
		else
			return false;
	}
	//ɾ��������������Ϣ
	public boolean delProduct(Integer id) throws HibernateException{
		ProductMeasureOperation pmo = new ProductMeasureOperation();
		return pmo.delProductById(id);
	}
	//��ѯ�����������Ϣ�����������������Ϣ�б�
	public List getAllProduct() throws HibernateException{
		ProductMeasureOperation pmo = new ProductMeasureOperation();
		return pmo.queryAllProduct();
	}
	
	/**
	 *  ��getId������������ȡ����
	 */
	public List queryProductsByRegId(Integer regId) {  
		ProductMeasureOperation pmo = new ProductMeasureOperation();
		return pmo.queryProductsByRegId(regId);
	}
	
	/**
	 *  ��userName�����ȡ����
	 */
	public List queryProductsByUserName(String useName) {  
		ProductMeasureOperation pmo = new ProductMeasureOperation();
		return pmo.queryProductsByUserName(useName);
	}
	
	public Object getProductById(Integer id) throws HibernateException{
		ProductMeasureOperation pmo = new ProductMeasureOperation();
		return pmo.queryProductById(id);
	}
	
	//���������Ϣ
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
