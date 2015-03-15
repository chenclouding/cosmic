package business.FSM;

import hibernate.FSM.FsmFunctionProcess;
import hibernate.FSM.FsmLayer;
import hibernate.FSM.FsmPeerComponent;
import hibernate.FSM.FsmProduct;

import java.util.List;

import net.sf.hibernate.HibernateException;
import entityOperation.FSM.*;

public class ConvertIntAndString {
	//为了防止出现树结构中根节点id和子节点id相同，采用下列方法进行处理。
	//对产品的id后面都加“3”进行打包
	public Integer packageProduct(Integer id){
		
		String productId = id.toString()+"3";
		Integer pId =  Integer.valueOf(productId);
		return pId;
	}
	//对层次的id后面都加“2”进行打包
	public Integer packageLayer(Integer id){
		
		String layerId = id.toString()+"2";
		Integer lId =  Integer.valueOf(layerId);
		return lId;
	}
	//对对等组件的id后面都加“1”进行打包
  public Integer packagePeerComponent(Integer id){
		
		String peerCompId = id.toString()+"1";
		Integer pcId =  Integer.valueOf(peerCompId);
		return pcId;
	}

   //对功能流程的id后面都加“0”进行打包
  public Integer packageFuncPros(Integer id){
		
		String funcProsId = id.toString()+"0";
		Integer ppId =  Integer.valueOf(funcProsId);
		return ppId;
	}
  //解包函数，去掉末尾加的数字，还原真实的id
  public Integer unPackage(Integer id ){
	  
	  String id1 = id.toString();
	  String subId = id1.substring(0, id1.length()-1);
	  Integer id2 = Integer.valueOf(subId);
	  return id2;
  }
	
	
	
}
