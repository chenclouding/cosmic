package business.FSM;

import java.util.List;

import net.sf.hibernate.HibernateException;
import entityOperation.FSM.*;

public class MappingPhase {
	
	/*�������̵�ҵ������*/
	public boolean insertFunctionProcess(Object dataObject) throws HibernateException {
	
		FunctionProcessOperation fpo = new FunctionProcessOperation();
		if (fpo.insertFunctionProcess(dataObject) == true)
			return true;
		else
			return false;
	}
	
	public boolean delFunctionProcess(Integer id) throws HibernateException{
		FunctionProcessOperation fpo = new FunctionProcessOperation();
		return fpo.delFunctionProcessById(id);
	}
	/*��updateFunctionProcess(Integer componentId)��ͬ���������Ϣ���и���,�����е������ϢΪ����̬*/
	public boolean updateFunctionProcess(Object dataObject) throws HibernateException {
		FunctionProcessOperation fpo = new FunctionProcessOperation();
		if (fpo.updateFunctionProcess(dataObject) == true)
			return true;
		else
			return false;
	}
	
	
	public List getAllFunctionProcess() throws HibernateException{
		FunctionProcessOperation fpo = new FunctionProcessOperation();
		return fpo.queryAllFunctionProcess();
	}
	
	public Object getFunctionProcessById(Integer id) throws HibernateException{
		FunctionProcessOperation fpo = new FunctionProcessOperation();
		return fpo.queryFunctionProcessById(id);
	}
	
	public List getFunctionProcessByPeerCompId(Integer peerCompId) throws HibernateException{
		FunctionProcessOperation fpo = new FunctionProcessOperation();
		return fpo.queryByPeerCompId(peerCompId);
	}
	
	public List getFunctionProcessByPeerCompIdAndMeasureStatus(Integer peerCompId,Integer measureStatus) throws HibernateException{
		FunctionProcessOperation fpo = new FunctionProcessOperation();
		return fpo.queryByPeerCompIdAndMeasureStatus(peerCompId,measureStatus);
	}
	
	public List getFunctionProcessByPeerCompIdAndMappingUserStatus(Integer peerCompId,Integer mappingUserStatus) throws HibernateException{
		FunctionProcessOperation fpo = new FunctionProcessOperation();
		return fpo.queryByPeerCompIdAndMappingUserStatus(peerCompId,mappingUserStatus);
	}

	public List getFunctionProcessByPeerCompIdAndMappingEventStatus(Integer peerCompId,Integer mappingEventStatus) throws HibernateException{
		FunctionProcessOperation fpo = new FunctionProcessOperation();
		return fpo.queryByPeerCompIdAndMappingEventStatus(peerCompId,mappingEventStatus);
	}
	
	public List getFunctionProcessByPeerCompIdAndMappingIOStatus(Integer peerCompId,Integer mappingIOStatus) throws HibernateException{
		FunctionProcessOperation fpo = new FunctionProcessOperation();
		return fpo.queryByPeerCompIdAndMappingIOStatus(peerCompId,mappingIOStatus);
	}
	/*��Ȥ�����ҵ������*/
	public boolean insertInterestObject(Object dataObject) throws HibernateException {
	
		InterestObjectOperation iio = new InterestObjectOperation();
		if (iio.insertInterestObject(dataObject) == true)
			return true;
		else
			return false;
	}
	
	public boolean delInterestObject(Integer id) throws HibernateException{
		InterestObjectOperation iio = new InterestObjectOperation();
		return iio.delInterestObjectById(id);
	}
	/*��updateInterestObject(Integer componentId)��ͬ���������Ϣ���и���,�����е������ϢΪ����̬*/
	public boolean updateInterestObject(Object dataObject) throws HibernateException {
		InterestObjectOperation iio = new InterestObjectOperation();
		if (iio.updateInterestObject(dataObject) == true)
			return true;
		else
			return false;
	}
	
	
	public List getAllInterestObject() throws HibernateException{
		InterestObjectOperation iio = new InterestObjectOperation();
		return iio.queryAllInterestObject();
	}
	
	public Object getInterestObjectById(Integer id) throws HibernateException{
		InterestObjectOperation iio = new InterestObjectOperation();
		return iio.queryInterestObjectById(id);
	}
	
	public List getInterestObjectByPeerCompId(Integer peerCompId) throws HibernateException{
		InterestObjectOperation iio = new InterestObjectOperation();
		return iio.queryByPeerCompId(peerCompId);
	}
	
	/*�¼���ҵ������*/
	public boolean insertEvent(Object dataObject) throws HibernateException {
	
		EventOperation eo = new EventOperation();
		if (eo.insertEvent(dataObject) == true)
			return true;
		else
			return false;
	}
	
	public boolean delEvent(Integer id) throws HibernateException{
		EventOperation eo = new EventOperation();
		return eo.delEventById(id);
	}
	/*��updateEvent(Integer componentId)��ͬ���������Ϣ���и���,�����е������ϢΪ����̬*/
	public boolean updateEvent(Object dataObject) throws HibernateException {
		EventOperation eo = new EventOperation();
		if (eo.updateEvent(dataObject) == true)
			return true;
		else
			return false;
	}
	
	
	public List getAllEvent() throws HibernateException{
		EventOperation eo = new EventOperation();
		return eo.queryAllEvent();
	}
	
	public Object getEventById(Integer id) throws HibernateException{
		EventOperation eo = new EventOperation();
		return eo.queryEventById(id);
	}
	
	public List getEventByPeerCompId(Integer peerCompId) throws HibernateException{
		EventOperation eo = new EventOperation();
		return eo.queryByPeerCompId(peerCompId);
	}

	
	/*�������ҵ������*/
	public boolean insertDataGroup(Object dataObject) throws HibernateException {
	
		DataGroupOperation iio = new DataGroupOperation();
		if (iio.insertDataGroup(dataObject) == true)
			return true;
		else
			return false;
	}
	
	public boolean delDataGroup(Integer id) throws HibernateException{
		DataGroupOperation iio = new DataGroupOperation();
		return iio.delDataGroupById(id);
	}
	/*��updateDataGroup(Integer componentId)��ͬ���������Ϣ���и���,�����е������ϢΪ����̬*/
	public boolean updateDataGroup(Object dataObject) throws HibernateException {
		DataGroupOperation iio = new DataGroupOperation();
		if (iio.updateDataGroup(dataObject) == true)
			return true;
		else
			return false;
	}
	
	
	public List getAllDataGroup() throws HibernateException{
		DataGroupOperation iio = new DataGroupOperation();
		return iio.queryAllDataGroup();
	}
	

	public Object getDataGroupById(Integer id) throws HibernateException{
		DataGroupOperation iio = new DataGroupOperation();
		return iio.queryDataGroupById(id);
	}
	
	public List getDataGroupByInterestObjId(Integer interestObjId) throws HibernateException{
		DataGroupOperation iio = new DataGroupOperation();
		return iio.queryByInterestObjId(interestObjId);
	}
	
	/*�������Ե�ҵ������*/
	public boolean insertDataAttribute(Object dataObject) throws HibernateException {
	
		DataAttributeOperation iio = new DataAttributeOperation();
		if (iio.insertDataAttribute(dataObject) == true)
			return true;
		else
			return false;
	}
	
	public boolean delDataAttribute(Integer id) throws HibernateException{
		DataAttributeOperation iio = new DataAttributeOperation();
		return iio.delDataAttributeById(id);
	}
	/*��updateDataAttribute(Integer componentId)��ͬ���������Ϣ���и���,�����е������ϢΪ����̬*/
	public boolean updateDataAttribute(Object dataObject) throws HibernateException {
		DataAttributeOperation dao = new DataAttributeOperation();
		if (dao.updateDataAttribute(dataObject) == true)
			return true;
		else
			return false;
	}
	
	
	public List getAllDataAttribute() throws HibernateException{
		DataAttributeOperation iio = new DataAttributeOperation();
		return iio.queryAllDataAttribute();
	}
	
	public Object getDataAttributeById(Integer id) throws HibernateException{
		DataAttributeOperation iio = new DataAttributeOperation();
		return iio.queryDataAttributeById(id);
	}
	
	public List getDataAttributeByDataGroupId(Integer dataGroupId) throws HibernateException{
		DataAttributeOperation iio = new DataAttributeOperation();
		return iio.queryByDataGroupId(dataGroupId);
	}
	
	

	/*��������-�¼���ҵ������*/
	public boolean insertFunctionProcessEvent(Object dataObject) throws HibernateException {
	
		FunctionProcessEventOperation fpeo = new FunctionProcessEventOperation();
		if (fpeo.insertFunctionProcessEvent(dataObject) == true)
			return true;
		else
			return false;
	}
	
	public boolean delFunctionProcessEvent(Integer id) throws HibernateException{
		FunctionProcessEventOperation fpeo = new FunctionProcessEventOperation();
		return fpeo.delFunctionProcessEventById(id);
	}
	
	public boolean delFunctionProcessEventByFuncProsId(Integer id) throws HibernateException{
		FunctionProcessEventOperation fpeo = new FunctionProcessEventOperation();
		return fpeo.delFunctionProcessEventByFuncProsId(id);
	}
	/*��updateFunctionProcessEvent(Integer componentId)��ͬ���������Ϣ���и���,�����е������ϢΪ����̬*/
	public boolean updateFunctionProcessEvent(Object dataObject) throws HibernateException {
		FunctionProcessEventOperation fpeo = new FunctionProcessEventOperation();
		if (fpeo.updateFunctionProcessEvent(dataObject) == true)
			return true;
		else
			return false;
	}
	
	
	public List getAllFunctionProcessEvent() throws HibernateException{
		FunctionProcessEventOperation fpeo = new FunctionProcessEventOperation();
		return fpeo.queryAllFunctionProcessEvent();
	}
	
	public Object getFunctionProcessEventById(Integer id) throws HibernateException{
		FunctionProcessEventOperation fpeo = new FunctionProcessEventOperation();
		return fpeo.queryFunctionProcessEventById(id);
	}
	
	public List getFunctionProcessEventByFuncProsId(Integer funcProsId) throws HibernateException{
		FunctionProcessEventOperation fpeo = new FunctionProcessEventOperation();
		return fpeo.queryByFuncProsId(funcProsId);
	}
	
	public List getFunctionProcessEventByEventId(Integer eventId) throws HibernateException{
		FunctionProcessEventOperation fpeo = new FunctionProcessEventOperation();
		return fpeo.queryByEventId(eventId);
	}
	
	/*��������-��Ȥ�����ҵ������*/
	public boolean insertFunctionProcessInterestObject(Object dataObject) throws HibernateException {
	
		FunctionProcessInterestObjectOperation fpioo = new FunctionProcessInterestObjectOperation();
		if (fpioo.insertFunctionProcessInterestObject(dataObject) == true)
			return true;
		else
			return false;
	}
	
	public boolean delFunctionProcessInterestObject(Integer id) throws HibernateException{
		FunctionProcessInterestObjectOperation fpioo = new FunctionProcessInterestObjectOperation();
		return fpioo.delFunctionProcessInterestObjectById(id);
	}
	
	public boolean delFunctionProcessInterestObjectByFuncProsId(Integer id) throws HibernateException{
		FunctionProcessInterestObjectOperation fpioo = new FunctionProcessInterestObjectOperation();
		return fpioo.delFunctionProcessInterestObjectByFuncProsId(id);
	}
	/*��updateFunctionProcessInterestObject(Integer componentId)��ͬ���������Ϣ���и���,�����е������ϢΪ����̬*/
	public boolean updateFunctionProcessInterestObject(Object dataObject) throws HibernateException {
		FunctionProcessInterestObjectOperation fpioo = new FunctionProcessInterestObjectOperation();
		if (fpioo.updateFunctionProcessInterestObject(dataObject) == true)
			return true;
		else
			return false;
	}
	
	
	public List getAllFunctionProcessInterestObject() throws HibernateException{
		FunctionProcessInterestObjectOperation fpioo = new FunctionProcessInterestObjectOperation();
		return fpioo.queryAllFunctionProcessInterestObject();
	}
	
	public Object getFunctionProcessInterestObjectById(Integer id) throws HibernateException{
		FunctionProcessInterestObjectOperation fpioo = new FunctionProcessInterestObjectOperation();
		return fpioo.queryFunctionProcessInterestObjectById(id);
	}
	
	
	
	public List getFunctionProcessInterestObjectByFuncProsId(Integer funcProsId) throws HibernateException{
		FunctionProcessInterestObjectOperation fpioo = new FunctionProcessInterestObjectOperation();
		return fpioo.queryByFuncProsId(funcProsId);
	}
	
	public List getFunctionProcessInterestObjectByInterestObjId(Integer interestObjId) throws HibernateException{
		FunctionProcessInterestObjectOperation fpioo = new FunctionProcessInterestObjectOperation();
		return fpioo.queryByInterestObjId(interestObjId);
	}
	
	/*��������-�û���ҵ������*/
	public boolean insertFunctionProcessUser(Object dataObject) throws HibernateException {
	
		FunctionProcessUserOperation fpuo = new FunctionProcessUserOperation();
		if (fpuo.insertFunctionProcessUser(dataObject) == true)
			return true;
		else
			return false;
	}
	
	public boolean delFunctionProcessUser(Integer id) throws HibernateException{
		FunctionProcessUserOperation fpuo = new FunctionProcessUserOperation();
		return fpuo.delFunctionProcessUserById(id);
	}
	
	public boolean delFunctionProcessUserByFuncProsId(Integer id) throws HibernateException{
		FunctionProcessUserOperation fpuo = new FunctionProcessUserOperation();
		return fpuo.delFunctionProcessUserByFuncProsId(id);
	}
	/*��updateFunctionProcessUser(Integer componentId)��ͬ���������Ϣ���и���,�����е������ϢΪ����̬*/
	public boolean updateFunctionProcessUser(Object dataObject) throws HibernateException {
		FunctionProcessUserOperation fpuo = new FunctionProcessUserOperation();
		if (fpuo.updateFunctionProcessUser(dataObject) == true)
			return true;
		else
			return false;
	}
	
	
	public List getAllFunctionProcessUser() throws HibernateException{
		FunctionProcessUserOperation fpuo = new FunctionProcessUserOperation();
		return fpuo.queryAllFunctionProcessUser();
	}
	
	public Object getFunctionProcessUserById(Integer id) throws HibernateException{
		FunctionProcessUserOperation fpuo = new FunctionProcessUserOperation();
		return fpuo.queryFunctionProcessUserById(id);
	}
	
	public List getFunctionProcessUserByFuncProsId(Integer funcProsId) throws HibernateException{
		FunctionProcessUserOperation fpuo = new FunctionProcessUserOperation();
		return fpuo.queryByFuncProsId(funcProsId);
	}
	
	public List getFunctionProcessUserByUserId(Integer userId) throws HibernateException{
		FunctionProcessUserOperation fpuo = new FunctionProcessUserOperation();
		return fpuo.queryByUserId(userId);
	}
	
}
