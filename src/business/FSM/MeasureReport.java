package business.FSM;
import hibernate.FSM.FsmDataGroup;
import hibernate.FSM.FsmDataMovement;
import hibernate.FSM.FsmEvent;
import hibernate.FSM.FsmFunctionProcess;
import hibernate.FSM.FsmInterestObject;
import hibernate.FSM.FsmLayer;
import hibernate.FSM.FsmMeasurePurpose;
import hibernate.FSM.FsmMeasureScope;
import hibernate.FSM.FsmPeerComponent;
import hibernate.FSM.FsmProduct;
import hibernate.FSM.FsmUser;
import business.FSM.ProductMeasureBusiness;
import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;
import net.sf.hibernate.HibernateException;



public class MeasureReport {
	
	public MeasureReport(){}
	
	FsmPeerComponent fpc = new FsmPeerComponent();
	CountFPNumber cfpn = new CountFPNumber();
	
	
	public String exportMeasureReport(Integer productId){		
		String code = null ;		
	try{
		
		LinkedList<Object> queue = new LinkedList<Object>(); //定义空队列
		ProductMeasureBusiness pmb = new ProductMeasureBusiness();
		StrategyPhase sp = new StrategyPhase();
		MappingPhase mp = new MappingPhase();
		FsmProduct root = null;		
		root = (FsmProduct) pmb.getProductById(productId);
		//取出根产品
		//取出该产品的度量目的和度量范围以及功能用户
		List fmp = sp.getMeasurePurposeByProductId(productId);		
		List fms = sp.getMeasureScopeByProductId(productId);
		List fu = sp.getFunctionUserByProductId(productId);
		//按层次构建table
		List childNode = new ArrayList();		
		//把根节点建table	
		Integer number1 = cfpn.CountFPNumber1(root);
		Integer numberline = 64*number1;
		Integer measureStatus1 = root.getMeasureStatus();
		 String measureStatusName1 = null;
		 switch (measureStatus1)  
         {
	         case 0:measureStatusName1 = "No Estimations";break;
	         case 1:measureStatusName1 = "Some Estimations";break;
	         case 2:measureStatusName1 = "All Estimations";break;
	         default:measureStatusName1 = "Error State";
         }  
		
		childNode = sp.getLayerByProductId(productId);	
		code = "This Product "+root.getProductName()+"  The measurement results :<br><table border=2> <tr><td width='30%'>Estimation Error</td><td width='30%' >"+measureStatusName1+"</td></tr><tr><td width='30%'>Number of Function Points</td><td>"+number1+"</td><tr><td width='30%'>Line of Code </td><td>"+numberline+"</td></tr><tr><td width='30%'>This product contains layers</td><td width='30%'>";
		for(Object o:childNode){
	    FsmLayer flNode = (FsmLayer)o;
	    String layerName = flNode.getLayerName();
	    code += layerName+"<br>";
		}
		code +="</td></tr><tr><td width='20%'>Measured Objectives of the current product </td><td width='20%'>";
		for(Object o1:fmp){
			FsmMeasurePurpose fmpNode = (FsmMeasurePurpose)o1;
			String measurePurpose = fmpNode.getMeasure();
			code += measurePurpose+"<br>";
			}
		code +="</td></tr><tr><td width='20%'>Measured Scope of the current product</td><td width='20%'>";
		for(Object o2:fms){
			FsmMeasureScope fmsNode = (FsmMeasureScope)o2;
			String measureScope = fmsNode.getMeasureScopeName();
			code += measureScope+"<br>";
			}
		code +="</td></tr><tr><td width='20%'>Current product includes number of functional users</td><td width='20%'>";
		for(Object o3:fu){
			FsmUser fuNode = (FsmUser)o3;
			String user = fuNode.getUserName();
			code +=user+"<br>";
			}
		code +="</td></tr></table>";										
		if(childNode.size()!=0){ //若子节点非空，将子节点全部入队
			for(Object obj:childNode){
				queue.offer(obj);
			}
		}
		while(!queue.isEmpty()){
			
			Object node = queue.remove(); //出队，访问
			List childNode1 = new ArrayList();
			List childNode3 = new ArrayList();
			List childNode4 = new ArrayList();
			List childNode5 = new ArrayList();
			if(node instanceof hibernate.FSM.FsmLayer ){
				FsmLayer layer = (FsmLayer)node;			
				
				//对出队节点建table
			
				Integer number2 = cfpn.CountFPNumber1(layer);
				Integer measureStatus2 = layer.getMeasureStatus();
				 String measureStatusName2 = null;
				 switch (measureStatus2)  
		         {
			         case 0:measureStatusName2 = "No Estimations";break;
			         case 1:measureStatusName2 = "Some Estimations";break;
			         case 2:measureStatusName2 = "All Estimations";break;
			         default:measureStatusName2 = "Error State";
		         }  
				
				childNode1 = sp.getPeerComponentByLayerIdAndFatherId(layer.getId(), 0);
				code += "The Layer"+layer.getLayerName()+"The measurement results are as following：<br><table> <tr><td width='30%'>Estimation state</td><td width='30%'>"+measureStatusName2+"</td></tr><tr><td td width='30%'>Number of Function Points</td><td>"+number2+"</td></tr><tr><td td width='30%'>The layers of other components </td><td width='30%'>";
				for(Object o:childNode1){
					FsmPeerComponent fpcNode = (FsmPeerComponent)o;
					String peerCompName = fpcNode.getPeerCompName();
					code += peerCompName+"<br>";
				}
				
				code += "</td></tr></table>";										
				if(childNode1.size()!=0){ //若子节点非空，将子节点全部入队
					for(Object obj:childNode1){
						queue.offer(obj);
					}
			     }
			}
			if(node instanceof hibernate.FSM.FsmPeerComponent ){
				FsmPeerComponent peerComp = (FsmPeerComponent)node;			
				Integer compType =peerComp.getCompType();	
				//对出队节点建table
				childNode4 = mp.getInterestObjectByPeerCompId(peerComp.getId());
				childNode5 = mp.getEventByPeerCompId(peerComp.getId());
				Integer number3 = cfpn.CountFPNumber1(peerComp);
				Integer measureStatus3 = peerComp.getMeasureStatus();
				String measureStatusName3 = null;
				 switch (measureStatus3)  
		         {
			         case 0:measureStatusName3 = "No Estimations";break;
			         case 1:measureStatusName3 = "Some Estimations";break;
			         case 2:measureStatusName3 = "All Estimations";break;
			         default:measureStatusName3 = "Error State";
		         }
				 if(compType==0){  //节点是组合组件
						childNode3 = sp.getPeerComponentByFatherId(peerComp.getId());			
						code +="The other components "+peerComp.getPeerCompName()+"The measurement results are as following：<br><table> <tr> <td width='30%'The name of the other components</td><td width='30%'>"+peerComp.getPeerCompName()+"</td></tr><tr><td width='30%'>State Estimation</td><td width='30%'>"+measureStatusName3+"</td></tr><tr><td width='30%'>Number of Function Points</td><td>"+number3+"</td></tr><tr><td width='30%'The other components contain</td><td width='30%'>";
						for(Object o:childNode3){
							FsmPeerComponent fpcNode = (FsmPeerComponent)o;
							String peerCompName = fpcNode.getPeerCompName();
							code += peerCompName+"<br>";
						}
						
						code += "</td></tr><tr><td width='30%'>Events of the other components  </td><td width='30%'>";
						for(Object o:childNode5){
							FsmEvent feNode = (FsmEvent)o;
							String eventName = feNode.getEventName();
							code += eventName+"<br>";
						}
						code += "</td></tr><tr><td width='30%'>The interest objects of the other component </td><td width='30%'>";
						for(Object o:childNode4){
							FsmInterestObject fioNode = (FsmInterestObject)o;
							String ioName = fioNode.getInterestObjName();
							code += ioName+"<br>";
						}
						code += "</td></tr></table>";
					} 
				
				 else{
					 childNode3 = mp.getFunctionProcessByPeerCompId(peerComp.getId());
						code += "The other components"+peerComp.getPeerCompName()+"The measurement results are as following：<br><table> <tr> <td width='30%'>The name of the other components</td><td>"+peerComp.getPeerCompName()+"</td></tr><tr><td width='30%'>Estimation state</td><td>"+measureStatusName3+"</td></tr><tr><td width='30%'>Number of Function Points</td><td  width='30%'>"+number3+"</td></tr><tr><td width='30%'>Includes sub-functional processes</td><td width='30%'>";
						for(Object o:childNode3){
							FsmFunctionProcess ffpNode = (FsmFunctionProcess)o;
							String funcProsName = ffpNode.getFuncProsName();
							code += funcProsName+"<br>";
						}
						
						code += "</td></tr><tr><td width='30%'>Events of the other components  </td><td width='30%'>";
						for(Object o:childNode5){
							FsmEvent feNode = (FsmEvent)o;
							String eventName = feNode.getEventName();
							code += eventName+"<br>";
						}
						code += "</td></tr><tr><td width=30%'>The interest objects of the other component </td><td width='30%'>";
						for(Object o:childNode4){
							FsmInterestObject fioNode = (FsmInterestObject)o;
							String ioName = fioNode.getInterestObjName();
							code += ioName+"<br>";
						}
						code += "</td></tr></table>";		 
				     }
				   if(childNode3.size()!=0){ //若子节点非空，将子节点全部入队
						for(Object obj1:childNode3){
							queue.offer(obj1);
						}
					}
				   if(childNode4.size()!=0){ //若兴趣对象非空，将兴趣对象全部入队
						for(Object obj1:childNode4){
							queue.offer(obj1);
						}
					}
			}
			
			if(node instanceof hibernate.FSM.FsmFunctionProcess ){
				FsmFunctionProcess funcPros = (FsmFunctionProcess)node;			
				MeasurePhase mp1 = new MeasurePhase();   
			    List dataMoveList = mp1.getDataMovementByFuncProsId(funcPros.getId());
				//对出队节点建table	
				Integer number4 = cfpn.CountFPNumber1(funcPros);
				Integer measureStatus4 = funcPros.getMeasureStatus();
				 String measureStatusName4 = null;
				 switch (measureStatus4)  
		         {
			         case 0:measureStatusName4 = "No Estimations";break;
			         case 1:measureStatusName4 = "Some Estimations";break;
			         case 2:measureStatusName4 = "All Estimations";break;
			         default:measureStatusName4 = "Error State";
		         }  	
				code += "The function flow"+funcPros.getFuncProsName()+"The measurement results are as following：<br><table> <tr> <td width='30%'>Functional Process Name</td><td width='30%'>"+funcPros.getFuncProsName()+"</td></tr><tr><td width='30%'>Estimation State</td><td width='30%'>"+measureStatusName4+"</td></tr><tr><td width='30%'>Number of Function Points</td><td>"+number4+"</td></tr><tr><td width='30%'>This function processes contain data set </td><td width='30%'>";
				for(Object o:dataMoveList){
					FsmDataMovement fdm = (FsmDataMovement)o;
				    Integer dataGroupId = fdm.getDataGroupId();
				    String dataGroupName = ((FsmDataGroup)mp.getDataGroupById(dataGroupId)).getDataGroupName();
					code += dataGroupName+"<br>";
				}				
				code += "</td></tr><tr><td width='30%'>Data Movements of the function process </td><td width='30%'>";
				for(Object o:dataMoveList){
					FsmDataMovement fdm = (FsmDataMovement)o;				    
				    String dataMoveName = fdm.getDataMoveName();
					code += dataMoveName+"<br>";
				}
				code += "</td></tr></table>";
			}
			if(node instanceof hibernate.FSM.FsmInterestObject ){
				FsmInterestObject io = (FsmInterestObject)node;			
				List dataGroupList = mp.getDataGroupByInterestObjId(io.getId());
				//对出队节点建table													
				code += "This interest in Object"+io.getInterestObjName()+"The data group contains the following:<br><table> <tr><td width='30%'>The Contents of The data group</td><td width='30%'>";
				for(Object o:dataGroupList){
					FsmDataGroup fdgNode = (FsmDataGroup)o;
					String dgName = fdgNode.getDataGroupName();
					code += dgName+"<br>";
				}				
				code += "</td></tr></table>";														
			}
		}		
	  }catch (Exception e) {
			e.printStackTrace();
			return " failure of Directory tree structure";
		}
	  return code;
	}
	
	public static void main(String[] str) throws HibernateException{
	 
		MeasureReport ba = new MeasureReport();
		String f = ba.exportMeasureReport(2);
		 System.out.println(f);
		
	}
}
	




