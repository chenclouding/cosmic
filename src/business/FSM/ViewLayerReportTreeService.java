package business.FSM;
import hibernate.FSM.FsmFunctionProcess;
import hibernate.FSM.FsmLayer;
import hibernate.FSM.FsmPeerComponent;
import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;
import net.sf.hibernate.HibernateException;



public class ViewLayerReportTreeService {
	
	//本类的主要作用是建立层次的树结构
	
	public ViewLayerReportTreeService(){}
	
	public String buildReportTree(Integer layerId){
		String code = null ;
	try{
		
		LinkedList<Object> queue = new LinkedList<Object>(); //定义空队列
		StrategyPhase sp = new StrategyPhase();
		MappingPhase mp = new MappingPhase();
		CountFPNumber cfpn = new CountFPNumber();
		ConvertIntAndString cias = new ConvertIntAndString();
		FsmLayer root = null;		
		root = (FsmLayer) sp.getLayerById(layerId);
		//取出根层次
		
		FsmPeerComponent pcNode = null;
		//按层次构建tree
		List childNode = new ArrayList();
		List childNode1 = new ArrayList();
		//把根节点加入tree	
			Integer arg1 =cias.packageLayer(root.getId()) ;
			Integer arg2 = -1;
			String arg3 = root.getLayerName();
			String arg4 = "layerMeasureReport.jsp?layerId="+cias.unPackage(arg1)+"productId="+root.getProductId()+"";
			String arg5 = "FsmLayer";
			code = "d.add("+arg1+","+arg2+",'"+arg3+"','"+arg4+"','"+arg5+"');";
			childNode = sp.getPeerComponentByLayerIdAndFatherId(cias.unPackage(arg1),0);					
		if(childNode.size()!=0){ //若子节点非空，将子节点全部入队
			for(Object obj:childNode){
				queue.offer(obj);
			}
		}
		while(!queue.isEmpty()){
			
			    Object node = queue.remove(); //出队，访问								
				pcNode = (FsmPeerComponent)node;
				Integer number = cfpn.CountFPNumber1(pcNode);
				Integer measureStatus = pcNode.getMeasureStatus();
				String back="layer";//确定返回的页面
				 String measureStatusName = null;
				 switch (measureStatus)  
		         {
			         case 0:measureStatusName = "No Estimations";break;
			         case 1:measureStatusName = "Some Estimations";break;
			         case 2:measureStatusName = "All Estimations";break;
			         default:measureStatusName = "Error State";
		         }  
				Integer arg11 = cias.packagePeerComponent(pcNode.getId());
				Integer arg21 = cias.packageLayer(pcNode.getLayerId()) ;
				String arg31 = pcNode.getPeerCompName();
				String arg41 = "peerCompMeasureReport.jsp?peerCompId="+cias.unPackage(arg11)+"&layerId="+pcNode.getLayerId()+"&fatherId="+pcNode.getFatherId()+"&productId="+root.getProductId()+"&back="+back+"";
				String arg51 = "the number of function points："+number+";Estimation State："+measureStatusName;
				code += "d.add("+arg11+","+arg21+",'"+arg31+"','"+arg41+"','"+arg51+"');";						
				
		}						
	  }catch (Exception e) {
			e.printStackTrace();
			return "Failure of Directory tree structure";
		}
	  return code;
	}
	 
	//该函数用于测试
	public static void main(String[] str) throws HibernateException{
	 
		ViewLayerReportTreeService ba = new ViewLayerReportTreeService();
		String f = ba.buildReportTree(1);
		 System.out.println(f);
		
	}
}
	




