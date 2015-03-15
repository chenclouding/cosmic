package business.FSM;

import java.util.Iterator;
import java.util.List;

import net.sf.hibernate.HibernateException;
import hibernate.FSM.FsmLayer;
import hibernate.FSM.FsmPeerComponent;
import entityOperation.FSM.BaseEntityOperation;
import entityOperation.FSM.FunctionUserOperation;
import entityOperation.FSM.MeasurePurposeOperation;
import entityOperation.FSM.MeasureScopeOperation;
import entityOperation.FSM.LayerOperation;
import entityOperation.FSM.PeerComponentOperation;
import entityOperation.FSM.ProductMeasureOperation;

public class StrategyPhase {
	
	
	public boolean insertRegister(Object registerObject) throws HibernateException {
		LayerOperation lo= new LayerOperation();
		if (lo.insertRegister(registerObject)== true)
			return true;
		else
			return false;
	}
	/*对层次的操作*/
	public boolean insertLayer(Object dataObject) throws HibernateException {
		LayerOperation lo = new LayerOperation();
		if (lo.insertLayer(dataObject)== true)
			return true;
		else
			return false;
	}
	
	public boolean delLayer(Integer id) throws HibernateException{
		LayerOperation lo = new LayerOperation();
		return lo.delLayerById(id);
	}
	
	public List getAllLayer() throws HibernateException{
		LayerOperation lo = new LayerOperation();
		return lo.queryAllLayer();
	}
	
	public Object getLayerById(Integer id) throws HibernateException{
		LayerOperation lo = new LayerOperation();
		return lo.queryLayerById(id);
	}
	
	public List getLayerByProductId(Integer productId) throws HibernateException{
		LayerOperation lo = new LayerOperation();
		return lo.queryByProductId(productId);
	}
	
	public List getLayerByProductIdAndMeasureStatus(Integer productId,Integer measureStatus) throws HibernateException{
		LayerOperation lo = new LayerOperation();
		return lo.queryByProductIdAndMeasureStatus(productId, measureStatus);
	}
	
	public boolean updateLayer(Object dataObject) throws HibernateException {
		LayerOperation lo = new LayerOperation();
		if (lo.updateLayer(dataObject) == true)
			return true;
		else
			return false;
	}
	
	/*对等组件的业务层操作*/
	public boolean insertPeerComponent(Object dataObject) throws HibernateException {
		PeerComponentOperation pco = new PeerComponentOperation();
		if (pco.insertPeerComponent(dataObject) == true)
			return true;
		else
			return false;
	}
	public boolean delPeerComponent(Integer id) throws HibernateException{
		PeerComponentOperation pco = new PeerComponentOperation();
		return pco.delPeerComponentById(id);
	}
	/*与updatePeerComponent(Integer componentId)不同，按组件信息进行更新,参数中的组件信息为游离态*/
	public boolean updatePeerComponent(Object dataObject) throws HibernateException {
		PeerComponentOperation pco = new PeerComponentOperation();
		if (pco.updatePeerComponent(dataObject) == true)
			return true;
		else
			return false;
	}
	
	/*与updatePeerComponent(Object)不同，按组件id和对等组件信息进行更新,一般不用这个函数*/
	public boolean updatePeerComponent(Object dataObject,Integer componentId) throws HibernateException {
		PeerComponentOperation pco = new PeerComponentOperation();
		FsmPeerComponent obj = (FsmPeerComponent)pco.queryPeerComponentById(componentId);
		FsmPeerComponent dobj = (FsmPeerComponent)dataObject;
		obj.setLayerId(dobj.getLayerId());
		obj.setPeerCompName(dobj.getPeerCompName());
		obj.setPeerCompDesp(dobj.getPeerCompDesp());
		obj.setCompType(dobj.getCompType());
		obj.setMeasureStatus(dobj.getMeasureStatus());	
		if (pco.updatePeerComponent(obj) == true)
			return true;
		else
			return false;
	}
	
	public List getAllPeerComponent() throws HibernateException{
		PeerComponentOperation pco = new PeerComponentOperation();
		return pco.queryAllPeerComponent();
	}
	
	public Object getPeerComponentById(Integer id) throws HibernateException{
		PeerComponentOperation pco = new PeerComponentOperation();
		return pco.queryPeerComponentById(id);
	}
	
	public List getPeerComponentByLayerId(Integer layerId) throws HibernateException{
		PeerComponentOperation pco = new PeerComponentOperation();
		return pco.queryByLayerId(layerId);
	}

	public List getPeerComponentByFatherId(Integer fatherId) throws HibernateException{
		PeerComponentOperation pco = new PeerComponentOperation();
		return pco.queryByFatherId(fatherId);
	}
	
	public List getPeerComponentByLayerIdAndFatherId(Integer layerId,Integer fatherId) throws HibernateException{
		PeerComponentOperation pco = new PeerComponentOperation();
		return pco.queryByFatherIdAndLayerId(fatherId, layerId);
	}
	
	public List getPeerComponentByLayerIdAndCompType(Integer compType,Integer layerId) throws HibernateException{
		PeerComponentOperation pco = new PeerComponentOperation();
		return pco.queryByCompTypeAndLayerId(compType, layerId);
	}
	
	public List getPeerComponentByFatherIdAndMeasureStatus(Integer fatherId,Integer measureStatus) throws HibernateException{
		PeerComponentOperation pco = new PeerComponentOperation();
		return pco.queryByFatherIdAndMeasureStatus(fatherId, measureStatus);
	}
	
	public List getPeerComponentByLayerIdAndMeasureStatus(Integer layerId,Integer measureStatus) throws HibernateException{
		PeerComponentOperation pco = new PeerComponentOperation();
		return pco.queryByLayerIdAndMeasureStatus(layerId, measureStatus);
	}
	
	
	/*对估算目的的操作*/
	public boolean insertMeasurePurpose(Object dataObject) throws HibernateException {
		MeasurePurposeOperation mpo = new MeasurePurposeOperation();
		if (mpo.insertMeasurePurpose(dataObject)== true)
			return true;
		else
			return false;
	}
	
	public boolean delMeasurePurpose(Integer id) throws HibernateException{
		MeasurePurposeOperation  mpo = new MeasurePurposeOperation();
		return mpo.delMeasurePurposeById(id);
	}
	
	public List getAllMeasurePurpose() throws HibernateException{
		MeasurePurposeOperation  mpo = new MeasurePurposeOperation();
		return mpo.queryAllMeasurePurpose();
	}
	
	public Object getMeasurePurposeById(Integer id) throws HibernateException{
		MeasurePurposeOperation  mpo = new MeasurePurposeOperation();
		return mpo.queryMeasurePurposeById(id);
	}
	
	public List getMeasurePurposeByProductId(Integer productId) throws HibernateException{
		MeasurePurposeOperation  mpo = new MeasurePurposeOperation();
		return mpo.queryByProductId(productId);
	}
	
	public boolean updateMeasurePurpose(Object dataObject) throws HibernateException {
		MeasurePurposeOperation  mpo = new MeasurePurposeOperation();
		if (mpo.updateMeasurePurpose(dataObject) == true)
			return true;
		else
			return false;
	}
	
	/*对估算范围的操作*/
	public boolean insertMeasureScope(Object dataObject) throws HibernateException {
		MeasureScopeOperation mso = new MeasureScopeOperation();
		if (mso.insertMeasureScope(dataObject)== true)
			return true;
		else
			return false;
	}
	
	public boolean delMeasureScope(Integer id) throws HibernateException{
		MeasureScopeOperation  mso = new MeasureScopeOperation();
		return mso.delMeasureScopeById(id);
	}
	
	public List getAllMeasureScope() throws HibernateException{
		MeasureScopeOperation  mso = new MeasureScopeOperation();
		return mso.queryAllMeasureScope();
	}
	
	public Object getMeasureScopeById(Integer id) throws HibernateException{
		MeasureScopeOperation  mso = new MeasureScopeOperation();
		return mso.queryMeasureScopeById(id);
	}
	
	public List getMeasureScopeByProductId(Integer productId) throws HibernateException{
		MeasureScopeOperation  mso = new MeasureScopeOperation();
		return mso.queryByProductId(productId);
	}
	
	public boolean updateMeasureScope(Object dataObject) throws HibernateException {
		MeasureScopeOperation  mso = new MeasureScopeOperation();
		if (mso.updateMeasureScope(dataObject) == true)
			return true;
		else
			return false;
	}
	
	
	/*对功能用户的操作*/
	public boolean insertFunctionUser(Object dataObject) throws HibernateException {
		FunctionUserOperation fuo = new FunctionUserOperation();
		if (fuo.insertFunctionUser(dataObject)== true)
			return true;
		else
			return false;
	}
	
	public boolean delFunctionUser(Integer id) throws HibernateException{
		FunctionUserOperation fuo = new FunctionUserOperation();
		return fuo.delFunctionUserById(id);
	}
	
	public List getAllFunctionUser() throws HibernateException{
		FunctionUserOperation fuo = new FunctionUserOperation();
		return fuo.queryAllFunctionUser();
	}
	
	public Object getFunctionUserById(Integer id) throws HibernateException{
		FunctionUserOperation fuo = new FunctionUserOperation();
		return fuo.queryFunctionUserById(id);
	}
	
	public List getFunctionUserByProductId(Integer productId) throws HibernateException{
		FunctionUserOperation fuo = new FunctionUserOperation();
		return fuo.queryByProductId(productId);
	}
	
	public boolean updateFunctionUser(Object dataObject) throws HibernateException {
		FunctionUserOperation puo = new FunctionUserOperation();
		if (puo.updateFunctionUser(dataObject) == true)
			return true;
		else
			return false;
	}
	
	


	/**
	 * 做测试用的
	 * @param str
	 * @throws HibernateException
	 */
	public static void main(String[] str) throws HibernateException{
		StrategyPhase sp = new StrategyPhase();
		FsmPeerComponent fpc = new FsmPeerComponent();
		//fpc.setId(1);
		//fpc.setLayerId(layerId)
		//fpc.setPeerCompDesp("sdhfks");
		//fpc.setCompType(1);
//		fpc.setLayerId(1);
//		fpc.setMeasureStatus("undo");
//		fpc.setPeerCompName("s");
		//sp.updatePeerComponent(fpc, 2);
		//sp.updatePeerComponent(fpc);
/*		List list = sp.getPeerComponentByFatherIdAndMeasureStatus(39, 1);
		if(list!=null)
			System.out.println(list.size());*/
		//else
			//System.out.println(list.size());
		MappingPhase mp = new MappingPhase();
		List list = sp.getLayerByProductId(1);
	
	     boolean b = mp.delFunctionProcessInterestObjectByFuncProsId(27);	
	     System.out.println(list.size());
	}
}
