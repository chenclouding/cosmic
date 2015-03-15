package entityOperation.FSM;

import java.util.List;

import net.sf.hibernate.HibernateException;
//import entityOperation.BaseEntityOperation;

public class FunctionProcessEventOperation extends BaseEntityOperation {
	/**
	 *  插入功能流程—事件
	 */		
	public boolean insertFunctionProcessEvent(Object dataObject) throws HibernateException{
		return insert(dataObject);
	}
	/**
	 *  按实体名字删除功能流程—事件
	 */	
	public boolean delFunctionProcessEvent(Object dataObject) throws HibernateException{
		return del(dataObject);
	}
	/**
	 *  按ID号删除功能流程—事件
	 */	
	public boolean delFunctionProcessEventById(Integer id) throws HibernateException{
		Object obj = queryById("FsmFunctionProcessEvent",id);
		return del(obj);
	}
	/**
	 *  按外键funProsId删除功能流程—事件
	 */	
	public boolean delFunctionProcessEventByFuncProsId(Integer funcProsId) throws HibernateException{		
		return delByFKey("FsmFunctionProcessEvent","funcProsId",funcProsId);
	}
	/**
	 *  更新功能流程—事件
	 */	
	public boolean updateFunctionProcessEvent(Object dataObject) throws HibernateException {
		return update(dataObject);
	}

	/**
	 *  查询所有的功能流程—事件
	 */
	public List queryAllFunctionProcessEvent() throws HibernateException {	
        return queryAll("FsmFunctionProcessEvent");
	}

	/**
	 *  按id（主键）将功能流程—事件取出来
	 */
	public Object queryFunctionProcessEventById(Integer id) {    	
        return queryById("FsmFunctionProcessEvent",id);

    }

	/**
	 *  funcProsId（外键）将功能流程—事件取出来
	 */	
	public List queryByFuncProsId(Integer funcProsId) {    	
		 return queryByFkey("FsmFunctionProcessEvent","funcProsId",funcProsId); 
	 }
	
	/**
	 *  eventId（外键）将功能流程—事件取出来
	 */	
	public List queryByEventId(Integer eventId) {    	
		 return queryByFkey("FsmFunctionProcessEvent","eventId",eventId); 
	 }
}
