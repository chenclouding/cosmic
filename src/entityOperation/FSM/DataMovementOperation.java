package entityOperation.FSM;

import java.util.List;

import net.sf.hibernate.HibernateException;
//import entityOperation.BaseEntityOperation;

public class DataMovementOperation extends BaseEntityOperation {
	/**
	 *  插入数据移动
	 */		
	public boolean insertDataMovement(Object dataObject) throws HibernateException{
		return insert(dataObject);
	}
	/**
	 *  按实体名字删除数据移动
	 */	
	public boolean delDataMovement(Object dataObject) throws HibernateException{
		return del(dataObject);
	}
	/**
	 *  按ID号删除数据移动
	 */	
	public boolean delDataMovementById(Integer id) throws HibernateException{
		Object obj = queryById("FsmDataMovement",id);
		return del(obj);
	}
	/**
	 *  按外键funProsId删除数据移动
	 */	
	public boolean delDataMovementByFuncProsId(Integer funcProsId) throws HibernateException{		
		return delByFKey("FsmDataMovement","funcProsId",funcProsId);
	}
	/**
	 *  更新数据移动
	 */	
	public boolean updateDataMovement(Object dataObject) throws HibernateException {
		return update(dataObject);
	}

	/**
	 *  查询所有的数据移动
	 */
	public List queryAllDataMovement() throws HibernateException {	
        return queryAll("FsmDataMovement");
	}

	/**
	 *  按id（主键）将数据移动取出来
	 */
	public Object queryDataMovementById(Integer id) {    	
        return queryById("FsmDataMovement",id);

    }

	/**
	 *  funcProsId（外键）将数据移动取出来
	 */	
	public List queryByFuncProsId(Integer funcProsId) {    	
		 return queryByFkey("FsmDataMovement","funcProsId",funcProsId); 
	 }
	
	/**
	 *  dataMoveType（外键）将数据移动取出来
	 */	
	public List queryByDataMoveTypeAndFuncProsId(Integer dataMoveType,Integer funcProsId) {    	
		 return queryByColumnNames("FsmDataMovement","dataMoveType",dataMoveType,"funcProsId",funcProsId); 
	 }

}
