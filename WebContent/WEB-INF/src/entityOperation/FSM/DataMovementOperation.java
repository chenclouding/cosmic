package entityOperation.FSM;

import java.util.List;

import net.sf.hibernate.HibernateException;
//import entityOperation.BaseEntityOperation;

public class DataMovementOperation extends BaseEntityOperation {
	/**
	 *  ���������ƶ�
	 */		
	public boolean insertDataMovement(Object dataObject) throws HibernateException{
		return insert(dataObject);
	}
	/**
	 *  ��ʵ������ɾ�������ƶ�
	 */	
	public boolean delDataMovement(Object dataObject) throws HibernateException{
		return del(dataObject);
	}
	/**
	 *  ��ID��ɾ�������ƶ�
	 */	
	public boolean delDataMovementById(Integer id) throws HibernateException{
		Object obj = queryById("FsmDataMovement",id);
		return del(obj);
	}
	/**
	 *  �����funProsIdɾ�������ƶ�
	 */	
	public boolean delDataMovementByFuncProsId(Integer funcProsId) throws HibernateException{		
		return delByFKey("FsmDataMovement","funcProsId",funcProsId);
	}
	/**
	 *  ���������ƶ�
	 */	
	public boolean updateDataMovement(Object dataObject) throws HibernateException {
		return update(dataObject);
	}

	/**
	 *  ��ѯ���е������ƶ�
	 */
	public List queryAllDataMovement() throws HibernateException {	
        return queryAll("FsmDataMovement");
	}

	/**
	 *  ��id���������������ƶ�ȡ����
	 */
	public Object queryDataMovementById(Integer id) {    	
        return queryById("FsmDataMovement",id);

    }

	/**
	 *  funcProsId��������������ƶ�ȡ����
	 */	
	public List queryByFuncProsId(Integer funcProsId) {    	
		 return queryByFkey("FsmDataMovement","funcProsId",funcProsId); 
	 }
	
	/**
	 *  dataMoveType��������������ƶ�ȡ����
	 */	
	public List queryByDataMoveTypeAndFuncProsId(Integer dataMoveType,Integer funcProsId) {    	
		 return queryByColumnNames("FsmDataMovement","dataMoveType",dataMoveType,"funcProsId",funcProsId); 
	 }

}
