package entityOperation.FSM;

import java.util.List;

import net.sf.hibernate.HibernateException;
//import entityOperation.BaseEntityOperation;

public class FunctionProcessInterestObjectOperation extends BaseEntityOperation{
	
	/**
	 *  插入功能流程—兴趣对象
	 */		
	public boolean insertFunctionProcessInterestObject(Object dataObject) throws HibernateException{
		return insert(dataObject);
	}
	/**
	 *  按实体名字删除功能流程—兴趣对象
	 */	
	public boolean delFunctionProcessInterestObject(Object dataObject) throws HibernateException{
		return del(dataObject);
	}
	
	/**
	 *  按ID号删除功能流程—兴趣对象
	 */	
	public boolean delFunctionProcessInterestObjectById(Integer id) throws HibernateException{
		Object obj = queryById("FsmFunctionProcessInterestObject",id);
		return del(obj);
	}
	
	/**
	 *  按外键funProsId删除功能流程—兴趣对象
	 */	
	public boolean delFunctionProcessInterestObjectByFuncProsId(Integer funcProsId) throws HibernateException{		
		return delByFKey("FsmFunctionProcessInterestObject","funcProsId",funcProsId);
	}
	/**
	 *  更新功能流程—兴趣对象
	 */	
	public boolean updateFunctionProcessInterestObject(Object dataObject) throws HibernateException {
		return update(dataObject);
	}

	/**
	 *  查询所有的功能流程—兴趣对象
	 */
	public List queryAllFunctionProcessInterestObject() throws HibernateException {	
        return queryAll("FsmFunctionProcessInterestObject");
	}

	/**
	 *  按id（主键）将功能流程—兴趣对象取出来
	 */
	public Object queryFunctionProcessInterestObjectById(Integer id) {    	
        return queryById("FsmFunctionProcessInterestObject",id);

    }

	/**
	 *  funcProsId（外键）将功能流程—兴趣对象取出来
	 */	
	public List queryByFuncProsId(Integer funcProsId) {    	
		 return queryByFkey("FsmFunctionProcessInterestObject","funcProsId",funcProsId); 
	 }
	
	/**
	 *  interObjId（外键）将功能流程—兴趣对象取出来
	 */	
	public List queryByInterestObjId(Integer interestObjId) {    	
		 return queryByFkey("FsmFunctionProcessInterestObject","interestObjId",interestObjId); 
	 }
	
	
	
	public static void main(String[] str) throws HibernateException{
	
		FunctionProcessInterestObjectOperation fpioo = new FunctionProcessInterestObjectOperation();
		List list = fpioo.queryByFkey("FsmFunctionProcessInterestObject","funcProsId",27);
		System.out.println(list.size());
   
	}
}
