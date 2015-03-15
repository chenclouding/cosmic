package business.FSM;

import java.util.List;

import net.sf.hibernate.HibernateException;
import entityOperation.FSM.DataMovementOperation;
import entityOperation.FSM.FunctionProcessEventOperation;

public class MeasurePhase {
	/*数据移动的业务层操作*/
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
	//通过外键删除数据移动
	public boolean delDataMovementByFuncProsId(Integer id) throws HibernateException{
		DataMovementOperation dmo = new DataMovementOperation();
		return dmo.delDataMovementByFuncProsId(id);
	}
	/*与updateDataMovement(Integer componentId)不同，按组件信息进行更新,参数中的组件信息为游离态*/
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
