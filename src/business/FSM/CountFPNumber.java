package business.FSM;

import hibernate.FSM.FsmFunctionProcess;
import hibernate.FSM.FsmLayer;
import hibernate.FSM.FsmPeerComponent;
import hibernate.FSM.FsmProduct;

import java.util.List;

import net.sf.hibernate.HibernateException;
import entityOperation.FSM.*;

public class CountFPNumber {
	
	//本类的作用是通过递归函数计算功能点个数
	Integer sum = 0;	
	public Integer CountFPNumber1(Object obj) throws HibernateException{		
		MeasurePhase mp = new MeasurePhase();
		MappingPhase mp1 = new MappingPhase();
		StrategyPhase sp = new StrategyPhase();
		if(obj instanceof hibernate.FSM.FsmFunctionProcess){//计算功能流程的功能点个数
			FsmFunctionProcess ffp = (FsmFunctionProcess)obj;
			Integer funcProsId=ffp.getId();			
			List dataMoveList = mp.getDataMovementByFuncProsId(funcProsId);
			sum = dataMoveList.size();
			return sum;			
		}
		else if(obj instanceof hibernate.FSM.FsmPeerComponent){//计算对等组件的功能点个数
			FsmPeerComponent ffp = (FsmPeerComponent)obj;
			Integer compType = ffp.getCompType();
			if(compType==0){//对等组件类型为组合组件则取出它的子组件继续进行计算功能点个数
				Integer fatherId = ffp.getId();
				List subComponentList = sp.getPeerComponentByFatherId(fatherId);
				sum = 0;
				for(Object o:subComponentList){
					sum +=CountFPNumber1(o);
				}
				return sum;			
			}else{//对等组件类型为原子组件则取出它的功能流程继续进行计算功能点个数
				Integer peerCompId = ffp.getId();
				List funcProsList= mp1.getFunctionProcessByPeerCompId(peerCompId);
				sum=0;
				for(Object o:funcProsList){
					sum +=CountFPNumber1(o);
				}
				return sum;
				
			}
			
		}
		
		else if(obj instanceof hibernate.FSM.FsmLayer){//计算层次的功能点个数
			FsmLayer fl = (FsmLayer)obj;
			Integer layerId = fl.getId();
			List peerCompList= sp.getPeerComponentByLayerIdAndFatherId(layerId,0);
			sum=0;
			for(Object o:peerCompList){
				sum +=CountFPNumber1(o);
			}
			return sum;
			
		}
		
		else if(obj instanceof hibernate.FSM.FsmProduct){//计算产品的功能点个数
			FsmProduct fp =(FsmProduct)obj;
			Integer productId = fp.getId();
			List layerList= sp.getLayerByProductId(productId);
			sum=0;
			for(Object o:layerList){
				sum +=CountFPNumber1(o);
			}
			return sum;
			
		}
		return sum;
	}
	
}
