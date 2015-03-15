package business.FSM;
import hibernate.FSM.FsmFunctionProcess;
import hibernate.FSM.FsmPeerComponent;
import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;
import net.sf.hibernate.HibernateException;



public class ViewReportTreeService {
	
	//�������Ҫ�����ǽ����Ե���������ṹ
	
	public ViewReportTreeService(){}
	
	FsmPeerComponent fpc = new FsmPeerComponent();
	CountFPNumber cfpn = new CountFPNumber();
	ConvertIntAndString cias = new ConvertIntAndString();
	
	public String buildReportTree(Integer peerCompId,String back,Integer productId){		
		String code = null ;
		ViewReportTreeService ba = new ViewReportTreeService();
	try{
		
		LinkedList<Object> queue = new LinkedList<Object>(); //����ն���
		StrategyPhase sp = new StrategyPhase();
		MappingPhase mp = new MappingPhase();
		FsmPeerComponent root = null;		
		root = (FsmPeerComponent) sp.getPeerComponentById(peerCompId);
		//ȡ�����Ե����
		FsmFunctionProcess fpNode = new FsmFunctionProcess();		
		//����ι���tree
		List childNode = new ArrayList();
		List childNode1 = new ArrayList();
		//�Ѹ��ڵ����tree		
		Integer number1 = cfpn.CountFPNumber1(root);
		Integer measureStatus1 = root.getMeasureStatus();
		 String measureStatusName1 = null;
		 switch (measureStatus1)  
         {
	         case 0:measureStatusName1 = "No Estimations";break;
	         case 1:measureStatusName1 = "Some Estimations";break;
	         case 2:measureStatusName1 = "ALL Estimations";break;
	         default:measureStatusName1 = "Error State";
         }  
		if(root.getCompType()==0){  //�ڵ���������
			Integer arg1 = cias.packagePeerComponent(root.getId());
			Integer arg2 = -1;
			String arg3 = root.getPeerCompName();
			String arg4 = "peerCompMeasureReport.jsp?peerCompId="+cias.unPackage(arg1)+"&layerId="+root.getLayerId()+"&fatherId="+root.getFatherId()+"&back="+back+"&productId="+productId+"";
			String arg5 ="the number of function points��"+number1+";State Estimation��"+measureStatusName1;
			code = "d.add("+arg1+","+arg2+",'"+arg3+"','"+arg4+"','"+arg5+"');";
			childNode = sp.getPeerComponentByFatherId(cias.unPackage(arg1));			
		}
		else{//�ڵ���ԭ�����			
			Integer arg1 = cias.packagePeerComponent(root.getId());
			Integer arg2 = -1;
			String arg3 = root.getPeerCompName();
			String arg4 =  "peerCompMeasureReport.jsp?peerCompId="+cias.unPackage(arg1)+"&layerId="+root.getLayerId()+"&fatherId="+root.getFatherId()+"&back="+back+"&productId="+productId+"";
			String arg5 ="Number of function Points��"+number1+"; Estimation State��"+measureStatusName1;
			code = "d.add("+arg1+","+arg2+",'"+arg3+"','"+arg4+"','"+arg5+"');";
			childNode = mp.getFunctionProcessByPeerCompId(cias.unPackage(arg1));		
		}
		if(childNode.size()!=0){ //���ӽڵ�ǿգ����ӽڵ�ȫ�����
			for(Object obj:childNode){
				queue.offer(obj);
			}
		}
		while(!queue.isEmpty()){
			
			Object node = queue.remove(); //���ӣ�����						
			if(node instanceof hibernate.FSM.FsmFunctionProcess ){				
				fpNode = (FsmFunctionProcess)node;				
				Integer arg1 = cias.packageFuncPros(fpNode.getId());//�仯��������id����Ե����id����
				Integer arg2 = cias.packagePeerComponent(fpNode.getPeerCompId()) ;//�仯�Ե����id
				String arg3 = fpNode.getFuncProsName();
				String arg4 = "/gcgl/FSM/cosmicStandard/mapping/funcProsMeasureReport.jsp?funcProsId="+cias.unPackage(arg1)+"&layerId="+root.getLayerId()+"&fatherId="+root.getFatherId()+"&back="+back+"&productId="+productId+"";
				String arg5 = "FunctionProcess";
				code += "d.add("+arg1+","+arg2+",'"+arg3+"','"+arg4+"','"+arg5+"');";
			}
			else{
				FsmPeerComponent fcNode = (FsmPeerComponent)node;
				Integer compType =fcNode.getCompType();
				Integer number = cfpn.CountFPNumber1(fcNode);
				Integer measureStatus = fcNode.getMeasureStatus();
				 String measureStatusName = null;
				 switch (measureStatus)  
		         {
			         case 0:measureStatusName = "No Estimations";break;
			         case 1:measureStatusName = "Some Estimations";break;
			         case 2:measureStatusName = "All Estimations";break;
			         default:measureStatusName = "Error State";
		         }  
				//code += compType;
				if(compType==0){  //�ڵ���������
					Integer arg1 =cias.packagePeerComponent(fcNode.getId());
					Integer arg2 =cias.packagePeerComponent(fcNode.getFatherId());
					String arg3 = fcNode.getPeerCompName();
					String arg4 = "peerCompMeasureReport.jsp?peerCompId="+cias.unPackage(arg1)+"&layerId="+root.getLayerId()+"&fatherId="+root.getFatherId()+"&back="+back+"&productId="+productId+"";
					String arg5 = "the number of function points��"+number+";State Estimation��"+measureStatusName;
					code += "d.add("+arg1+","+arg2+",'"+arg3+"','"+arg4+"','"+arg5+"');";				
					childNode1 = sp.getPeerComponentByFatherId(cias.unPackage(arg1));
					
				}
				else{//�ڵ���ԭ�����
					Integer arg1 = cias.packagePeerComponent(fcNode.getId());
					Integer arg2 = cias.packagePeerComponent(fcNode.getFatherId());
					String arg3 =  fcNode.getPeerCompName();
					String arg4 = "peerCompMeasureReport.jsp?peerCompId="+cias.unPackage(arg1)+"&layerId="+root.getLayerId()+"&fatherId="+root.getFatherId()+"&back="+back+"&productId="+productId+"";
					String arg5 = "the number of function points��"+number+";Stae Estimations��"+measureStatusName;
					code += "d.add("+arg1+","+arg2+",'"+arg3+"','"+arg4+"','"+arg5+"');";
					childNode1 = mp.getFunctionProcessByPeerCompId(cias.unPackage(arg1));							
				}
				if(childNode1.size()!=0){ //���ӽڵ�ǿգ����ӽڵ�ȫ�����
					for(Object obj1:childNode1){
						queue.offer(obj1);
					}
				}
			}
		}
		
		
	  }catch (Exception e) {
			e.printStackTrace();
			return "Failure of Directory tree structure";
		}
	  return code;
	}
	
	
}
	




