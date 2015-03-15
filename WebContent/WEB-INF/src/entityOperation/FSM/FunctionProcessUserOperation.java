package entityOperation.FSM;

import java.util.List;

import net.sf.hibernate.HibernateException;
//import entityOperation.BaseEntityOperation;

public class FunctionProcessUserOperation extends BaseEntityOperation{
	/**
	 *  插入功能流程—用户
	 */		
	public boolean insertFunctionProcessUser(Object dataObject) throws HibernateException{
		return insert(dataObject);
	}
	/**
	 *  按实体名字删除功能流程—用户
	 */	
	public boolean delFunctionProcessUser(Object dataObject) throws HibernateException{
		return del(dataObject);
	}
	/**
	 *  按ID号删除功能流程—用户
	 */	
	public boolean delFunctionProcessUserById(Integer id) throws HibernateException{
		Object obj = queryById("FsmFunctionProcessUser",id);
		return del(obj);
	}
	/**
	 *  按外键funProsId删除功能流程—用户
	 */	
	public boolean delFunctionProcessUserByFuncProsId(Integer funcProsId) throws HibernateException{		
		return delByFKey("FsmFunctionProcessUser","funcProsId",funcProsId);
	}
	/**
	 *  更新功能流程—用户
	 */	
	public boolean updateFunctionProcessUser(Object dataObject) throws HibernateException {
		return update(dataObject);
	}

	/**
	 *  查询所有的功能流程—用户
	 */
	public List queryAllFunctionProcessUser() throws HibernateException {	
        return queryAll("FsmFunctionProcessUser");
	}

	/**
	 *  按id（主键）将功能流程—用户取出来
	 */
	public Object queryFunctionProcessUserById(Integer id) {    	
        return queryById("FsmFunctionProcessUser",id);

    }

	/**
	 *  funcProsId（外键）将功能流程—用户取出来
	 */	
	public List queryByFuncProsId(Integer funcProsId) {    	
		 return queryByFkey("FsmFunctionProcessUser","funcProsId",funcProsId); 
	 }
	
	/**
	 *  userId（外键）将功能流程—用户取出来
	 */	
	public List queryByUserId(Integer userId) {    	
		 return queryByFkey("FsmFunctionProcessUser","userId",userId); 
	 }
}
