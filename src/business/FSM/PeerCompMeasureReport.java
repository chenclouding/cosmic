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



public class PeerCompMeasureReport {
	
	//The main function of this class is based on the report and other components of the metric
	
	public PeerCompMeasureReport(){}
	
	FsmPeerComponent fpc = new FsmPeerComponent();
	CountFPNumber cfpn = new CountFPNumber();
	
	
	public String exportMeasureReport(Integer peerCompId){		
		String code = null ;		
	try{
		
		LinkedList<Object> queue = new LinkedList<Object>(); //����ն���
		StrategyPhase sp = new StrategyPhase();
		MappingPhase mp = new MappingPhase();
		FsmPeerComponent root = null;		
		root = (FsmPeerComponent) sp.getPeerComponentById(peerCompId);//��ȡ�����
		Integer compType1 =root.getCompType();//��ȡ�������			
		//����ι���table
		List childNode = new ArrayList();		
		//�Ѹ��ڵ㽨table	
		Integer number1 = cfpn.CountFPNumber1(root);
		Integer measureStatus1 = root.getMeasureStatus();
		 String measureStatusName1 = null;
		 switch (measureStatus1)  
         {
	         case 0:measureStatusName1 = "No Estimations";break;
	         case 1:measureStatusName1 = "Some Estimations";break;
	         case 2:measureStatusName1 = "All Estimations";break;
	         default:measureStatusName1 = "Error State";
         }  
		if(compType1==0){//������Ϊ�����������оٸ���������������������״̬�����ܵ������
		childNode = sp.getPeerComponentByFatherId(peerCompId);	
		code = "The peer group"+root.getPeerCompName()+"The measurement results are as following:<br><table border=2> <tr><td width='50%'>Estimation State</td><td width='50%' height=50>"+measureStatusName1+"</td></tr><tr><td width='20%'>Estimation state</td><td>"+number1+"</td></tr><tr><td width='20%'>The other components within the peer components</td><td width='20%'>";
		for(Object o:childNode){
	    FsmPeerComponent flNode = (FsmPeerComponent)o;
	    String peerCompName1 = flNode.getPeerCompName();
	    code += peerCompName1+"<br>";
		}		
		code +="</td></tr></table>";										
		
		}else{//���Ϊԭ����������оٸ���������Ĺ������̡�����״̬�����ܵ������
			childNode = mp.getFunctionProcessByPeerCompId(peerCompId);	
			code = "The other components"+root.getPeerCompName()+"The measurement results are as follows:<br><table border=2> <tr><td width='50%'>Estimation state</td><td width='50%' height=50>"+measureStatusName1+"</td></tr><tr><td width='20%'>Number of Function Points</td><td>"+number1+"</td></tr><tr><td width='20%'>Function processes of the other components </td><td width='20%'>";
			for(Object o:childNode){
		    FsmFunctionProcess flNode = (FsmFunctionProcess)o;
		    String funcProsName1 = flNode.getFuncProsName();
		    code += funcProsName1+"<br>";
			}		
			code +="</td></tr></table>";										
			
		}
		if(childNode.size()!=0){ //����������߹������̷ǿգ�����������߹�������ȫ�����
			for(Object obj:childNode){
				queue.offer(obj);
			}
		  }
		while(!queue.isEmpty()){
			
			Object node = queue.remove(); //���ӣ�����
			List childNode1 = new ArrayList();
			List childNode3 = new ArrayList();
			List childNode4 = new ArrayList();
			List childNode5 = new ArrayList();
			
			if(node instanceof hibernate.FSM.FsmPeerComponent ){//���ӽڵ�Ϊ�Ե����
				FsmPeerComponent peerComp = (FsmPeerComponent)node;			
				Integer compType =peerComp.getCompType();	
				//�Գ��ӽڵ㽨table������ȡ�Ե������������Ȥ������¼�
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
				 if(compType==0){  //�ڵ������������о������
						childNode3 = sp.getPeerComponentByFatherId(peerComp.getId());			
						code +="The other components"+peerComp.getPeerCompName()+"The measurement results are as follows��<br><table> <tr> <td width='20%'>The name of the other components</td><td width='20%'>"+peerComp.getPeerCompName()+"</td></tr><tr><td width='20%'>Estimation Estate</td><td width='20%'>"+measureStatusName3+"</td></tr><tr><td width='20%'>Number of Function Points</td><td>"+number3+"</td></tr><tr><td width='20%'>other components contained in sub-components</td><td width='20%'>";
						for(Object o:childNode3){
							FsmPeerComponent fpcNode = (FsmPeerComponent)o;
							String peerCompName = fpcNode.getPeerCompName();
							code += peerCompName+"<br>";
						}
						
						code += "</td></tr><tr><td width='20%'>Event of the components</td><td width='20%'>";
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
				
				 else{   //�ڵ���ԭ��������о���������Ĺ�������
					 childNode3 = mp.getFunctionProcessByPeerCompId(peerComp.getId());
						code += "The other components"+peerComp.getPeerCompName()+"The measurement results are as following��<br><table> <tr> <td width='20%'>The name of the other components</td><td>"+peerComp.getPeerCompName()+"</td></tr><tr><td width='20%'>State Error</td><td>"+measureStatusName3+"</td></tr><tr><td width='20%'>Number of Function Points</td><td>"+number3+"</td></tr><tr><td width='20%'>Includes sub-functional processes</td><td width='20%'>";
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
				   if(childNode3.size()!=0){ //���ӽڵ�ǿգ����ӽڵ�ȫ�����
						for(Object obj1:childNode3){
							queue.offer(obj1);
						}
					}
				   if(childNode4.size()!=0){ //����Ȥ����ǿգ�����Ȥ����ȫ�����
						for(Object obj1:childNode4){
							queue.offer(obj1);
						}
					}
			}
			
			if(node instanceof hibernate.FSM.FsmFunctionProcess ){ //���ӽڵ��ǹ������̣��оٹ������̵Ĺ���״̬�����ܵ�����������������ƶ����������
				FsmFunctionProcess funcPros = (FsmFunctionProcess)node;			
				MeasurePhase mp1 = new MeasurePhase();   
			    List dataMoveList = mp1.getDataMovementByFuncProsId(funcPros.getId());
				//�Գ��ӽڵ㽨table	
				Integer number4 = cfpn.CountFPNumber1(funcPros);
				Integer measureStatus4 = funcPros.getMeasureStatus();
				 String measureStatusName4 = null;
				 switch (measureStatus4)  
		         {
			         case 0:measureStatusName4 = "No Estimation";break;
			         case 1:measureStatusName4 = "Some Estimations";break;
			         case 2:measureStatusName4 = "All Estimations";break;
			         default:measureStatusName4 = "Error Status";
		         }  	
				code += "The function flow  "+funcPros.getFuncProsName()+" the measurement result��<br><table> <tr> <td width='20%'>Functional Process Name</td><td width='20%'>"+funcPros.getFuncProsName()+"</td></tr><tr><td width='20%'>State estimate</td><td width='20%'>"+measureStatusName4+"</td></tr><tr><td width='20%'>Number of Function Points</td><td>"+number4+"</td></tr><tr><td width='20%'>This function processes of the data group contains</td><td width='20%'>";
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
			if(node instanceof hibernate.FSM.FsmInterestObject ){ //���ӽڵ�����Ȥ�������оٸ���Ȥ���������������
				FsmInterestObject io = (FsmInterestObject)node;			
				List dataGroupList = mp.getDataGroupByInterestObjId(io.getId());
				//�Գ��ӽڵ㽨table													
				code += "This interest in Object"+io.getInterestObjName()+"The data group contain<table> <tr><td width='20%'>The data group</td><td width='20%'>";
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
	
	//������ֻ�����ڲ���
	public static void main(String[] str) throws HibernateException{
	 
		PeerCompMeasureReport ba = new PeerCompMeasureReport();
		String f = ba.exportMeasureReport(4);
		 System.out.println(f);
		
	}
}
	




