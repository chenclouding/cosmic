package business.FSM;

import java.util.List;

import net.sf.hibernate.HibernateException;
import entityOperation.FSM.DataMovementOperation;
import entityOperation.FSM.FunctionProcessEventOperation;

public class MeasurePhase {
	/*�����ƶ���ҵ������*/
	public boolean insertDataMovement(Object dataObject) throws HibernateException {
	
		DataMovementOperation dmo = new DataMovementOperation();
		if (dmo.insertDataMovement(dataObject) == true)
			return true;
		else
			return false;
	}
	
	public boolean delDataMovement(Integer id) throws HibernateException{
		DataMovementOperation dmo = new DataMovementOperation();
		return dmo.delDataMovementById(id);
	}
	//ͨ�����ɾ�������ƶ�
	public boolean delDataMovementByFuncProsId(Integer id) throws HibernateException{
		DataMovementOperation dmo = new DataMovementOperation();
		return dmo.delDataMovementByFuncProsId(id);
	}
	/*��updateDataMovement(Integer componentId)��ͬ���������Ϣ���и���,�����е������ϢΪ����̬*/
	public boolean updateDataMovement(Object dataObject) throws HibernateException {
		DataMovementOperation dmo = new DataMovementOperation();
		if (dmo.updateDataMovement(dataObject) == true)
			return true;
		else
			return false;
	}
	
	
	public List getAllDataMovement() throws HibernateException{
		DataMovementOperation dmo = new DataMovementOperation();
		return dmo.queryAllDataMovement();
	}
	
	public Object getDataMovementById(Integer id) throws HibernateException{
		DataMovementOperation dmo = new DataMovementOperation();
		return dmo.queryDataMovementById(id);
	}
	
	public List getDataMovementByFuncProsId(Integer funcProsId) throws HibernateException{
		DataMovementOperation dmo = new DataMovementOperation();
		return dmo.queryByFuncProsId(funcProsId);
	}
	
	public List getDataMovementByDataMoveTypeAndFuncProsId(Integer dataMoveType,Integer funcProsId) throws HibernateException{
		DataMovementOperation dmo = new DataMovementOperation();
		return dmo.queryByDataMoveTypeAndFuncProsId(dataMoveType,funcProsId);
	}
	
	

}
