package business.FSM;
import hibernate.FSM.FsmProduct;
import hibernate.FSM.FsmLayer;
import hibernate.FSM.FsmPeerComponent;
import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;
import net.sf.hibernate.HibernateException;



public class ViewProductReportTreeService {
	
	//本类的主要作用是建立产品的树结构
	
	public ViewProductReportTreeService(){}
	
	public String buildReportTree(Integer productId){
		String code = null ;
	try{
		
		LinkedList<Object> queue = new LinkedList<Object>(); //定义空队列
		StrategyPhase sp = new StrategyPhase();
		ProductMeasureBusiness pmb = new ProductMeasureBusiness();
		MappingPhase mp = new MappingPhase();
		CountFPNumber cfpn = new CountFPNumber();
		ConvertIntAndString cias = new ConvertIntAndString();
		FsmProduct root = null;		
		root = (FsmProduct) pmb.getProductById(productId);
		//取出产品		
		FsmLayer lNode = null;
		//按层次构建tree
		List childNode = new ArrayList();
		
		//把根节点加入tree	
			Integer arg1 = cias.packageProduct(root.getId());
			Integer arg2 = -1;
			String arg3 = root.getProductName();
			String arg4 = "productMeasureReport.jsp?productId="+cias.unPackage(arg1)+"";
			String arg5 = "FsmProduct";
			code = "d.add("+arg1+","+arg2+",'"+arg3+"','"+arg4+"','"+arg5+"');";
			childNode = sp.getLayerByProductId(productId);					
		if(childNode.size()!=0){ //若子节点非空，将子节点全部入队
			for(Object obj:childNode){
				queue.offer(obj);
			}
		}
		while(!queue.isEmpty()){
			
			    Object node = queue.remove(); //出队，访问								
				lNode = (FsmLayer)node;
				Integer number = cfpn.CountFPNumber1(lNode);
				Integer measureStatus = lNode.getMeasureStatus();
				 String measureStatusName = null;
				 switch (measureStatus)  
		         {
			         case 0:measureStatusName = "No Estimations";break;
			         case 1:measureStatusName = "Some Estimations";break;
			         case 2:measureStatusName = "All Estimations";break;
			         default:measureStatusName = "Error State";
		         }  
				Integer arg11 = cias.packageLayer(lNode.getId());
				Integer arg21 = cias.packageProduct(lNode.getProductId()) ;
				String arg31 = lNode.getLayerName();
				String arg41 = "layerMeasureReport.jsp?layerId="+cias.unPackage(arg11)+"&productId="+lNode.getProductId();
				String arg51 = "Failure of Directory tree structure："+number+";Estimation Status："+measureStatusName;
				code += "d.add("+arg11+","+arg21+",'"+arg31+"','"+arg41+"','"+arg51+"');";						
				
		}						
	  }catch (Exception e) {
			e.printStackTrace();
			return "Failure of Directory tree structure";
		}
	  return code;
	}
	
	public static void main(String[] str) throws HibernateException{
	 
		ViewProductReportTreeService ba = new ViewProductReportTreeService();
		String f = ba.buildReportTree(2);
		 System.out.println(f);
		
	}
}
	




