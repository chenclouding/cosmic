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



public class LayerMeasureReport {
	
	//The primary role of this class is to establish levels of measurement reports
	
	public LayerMeasureReport(){}
	
	FsmPeerComponent fpc = new FsmPeerComponent();
	CountFPNumber cfpn = new CountFPNumber();
	
	
	public String exportMeasureReport(Integer layerId){		
		String code = null ;		
	try{
		
		LinkedList<Object> queue = new LinkedList<Object>(); //Definition of empty queue
		StrategyPhase sp = new StrategyPhase();
		MappingPhase mp = new MappingPhase();
		FsmLayer root = null;		
		root = (FsmLayer) sp.getLayerById(layerId);
		//Remove the root level		
		//Construction of by-level table
		List childNode = new ArrayList();		
		//Building the root table
		Integer number1 = cfpn.CountFPNumber1(root);
		Integer measureStatus1 = root.getMeasureStatus();
		 String measureStatusName1 = null;
		 switch (measureStatus1)  
         {
	         case 0:measureStatusName1 = "No Estimations";break;
	         case 1:measureStatusName1 = "Some Estimations";break;
	         case 2:measureStatusName1 = "All Estimations";break;
	         default:measureStatusName1 = "Status Error";
         }  
		//Level out level includes components
		childNode = sp.getPeerComponentByLayerIdAndFatherId(layerId, 0);	
		code = "The Level"+root.getLayerName()+"The measurement result:<br><table border=2> <tr><td width='50%'>State estimate</td><td width='50%' height=50>"+measureStatusName1+"</td></tr><tr><td width='20%'>Number of Function Points</td><td>"+number1+"</td></tr><tr><td width='20%'>The levels of other component</td><td width='20%'>";
		for(Object o:childNode){
	    FsmPeerComponent flNode = (FsmPeerComponent)o;
	    String peerCompName1 = flNode.getPeerCompName();
	    code += peerCompName1+"<br>";
		}		
		code +="</td></tr></table>";										
		if(childNode.size()!=0){ //If the level of other components contained in the non-empty, all will be into the team and other components
			for(Object obj:childNode){
				queue.offer(obj);
			}
		}
		while(!queue.isEmpty()){
			
			Object node = queue.remove(); //The team, visit
			List childNode1 = new ArrayList();
			List childNode3 = new ArrayList();
			List childNode4 = new ArrayList();
			List childNode5 = new ArrayList();
			
			if(node instanceof hibernate.FSM.FsmPeerComponent ){
				FsmPeerComponent peerComp = (FsmPeerComponent)node;			
				Integer compType =peerComp.getCompType();	
				//对出队节点建table
				//获取对等组件包含的事件和兴趣对象
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
			         default:measureStatusName3 = "Error Status";
		         }
				 if(compType==0){  //节点是组合组件，列出该组件包含的子组件
						childNode3 = sp.getPeerComponentByFatherId(peerComp.getId());			
						code +="The other component"+peerComp.getPeerCompName()+"The measurement results are as follows：<br><table> <tr> <td width='20%'>The name of the other components</td><td width='20%'>"+peerComp.getPeerCompName()+"</td></tr><tr><td width='20%'>State estimate</td><td width='20%'>"+measureStatusName3+"</td></tr><tr><td width='20%'>Number of Function Point</td><td>"+number3+"</td></tr><tr><td width='20%'>Contents of other components</td><td width='20%'>";
						for(Object o:childNode3){
							FsmPeerComponent fpcNode = (FsmPeerComponent)o;
							String peerCompName = fpcNode.getPeerCompName();
							code += peerCompName+"<br>";
						}
						
						code += "</td></tr><tr><td width='20%'>The other components of the event</td><td width='20%'>";
						for(Object o:childNode5){
							FsmEvent feNode = (FsmEvent)o;
							String eventName = feNode.getEventName();
							code += eventName+"<br>";
						}
						code += "</td></tr><tr><td width='20%'>The interest objects of the other component </td><td width='20%'>";
						for(Object o:childNode4){
							FsmInterestObject fioNode = (FsmInterestObject)o;
							String ioName = fioNode.getInterestObjName();
							code += ioName+"<br>";
						}
						code += "</td></tr></table>";
					} 
				
				 else{//节点是原子组件，则列出原子组件包含的功能流程
					 childNode3 = mp.getFunctionProcessByPeerCompId(peerComp.getId());
						code += "The other components"+peerComp.getPeerCompName()+"The measurement results：<br><table> <tr> <td width='20%'>The name of the other components</td><td>"+peerComp.getPeerCompName()+"</td></tr><tr><td width='20%'>State Estimation</td><td>"+measureStatusName3+"</td></tr><tr><td width='20%'>Number of Function Points</td><td>"+number3+"</td></tr><tr><td width='20%'>Includes sub-functional processes</td><td width='20%'>";
						for(Object o:childNode3){
							FsmFunctionProcess ffpNode = (FsmFunctionProcess)o;
							String funcProsName = ffpNode.getFuncProsName();
							code += funcProsName+"<br>";
						}
						
						code += "</td></tr><tr><td width='20%'>The other components of the event</td><td width='20%'>";
						for(Object o:childNode5){
							FsmEvent feNode = (FsmEvent)o;
							String eventName = feNode.getEventName();
							code += eventName+"<br>";
						}
						code += "</td></tr><tr><td width='20%'>The interest object of the other component </td><td width='20%'>";
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
			//如果出对节点为功能流程，则列出该功能流程的估算状态、功能点个数、包含的数据组和数据移动等
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
			         case 0:measureStatusName4 = "No Estimation";break;
			         case 1:measureStatusName4 = "Some Estimations";break;
			         case 2:measureStatusName4 = "All Estimations";break;
			         default:measureStatusName4 = "Stae Error";
		         }  	
				code += "The Function Flow"+funcPros.getFuncProsName()+"The measurement results：<br><table> <tr> <td width='20%'>Functional Process Name</td><td width='20%'>"+funcPros.getFuncProsName()+"</td></tr><tr><td width='20%'>State estimate</td><td width='20%'>"+measureStatusName4+"</td></tr><tr><td width='20%'>Number of Function Points</td><td>"+number4+"</td></tr><tr><td width='20%'>This function processes the data set contains</td><td width='20%'>";
				for(Object o:dataMoveList){
					FsmDataMovement fdm = (FsmDataMovement)o;
				    Integer dataGroupId = fdm.getDataGroupId();
				    String dataGroupName = ((FsmDataGroup)mp.getDataGroupById(dataGroupId)).getDataGroupName();
					code += dataGroupName+"<br>";
				}				
				code += "</td></tr><tr><td width='20%'>This function contains the data movement process</td><td width='20%'>";
				for(Object o:dataMoveList){
					FsmDataMovement fdm = (FsmDataMovement)o;				    
				    String dataMoveName = fdm.getDataMoveName();
					code += dataMoveName+"<br>";
				}
				code += "</td></tr></table>";
			}
			
			//如果出队节点为兴趣对象，则列出该兴趣对象包含的数据组
			if(node instanceof hibernate.FSM.FsmInterestObject ){
				FsmInterestObject io = (FsmInterestObject)node;			
				List dataGroupList = mp.getDataGroupByInterestObjId(io.getId());
				//对出队节点建table													
				code += "This is an object Interest"+io.getInterestObjName()+"The data group contains the following<table> <tr><td width='20%'>The data set contains</td><td width='20%'>";
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
			return "Directory tree structure failure";
		}
	  return code;
	}
	
	//该函数只是用于测试
	public static void main(String[] str) throws HibernateException{
	 
		LayerMeasureReport ba = new LayerMeasureReport();
		String f = ba.exportMeasureReport(2);
		 System.out.println(f);
		
	}
}
	




