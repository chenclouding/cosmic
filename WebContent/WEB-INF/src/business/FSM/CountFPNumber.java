package business.FSM;

import hibernate.FSM.FsmFunctionProcess;
import hibernate.FSM.FsmLayer;
import hibernate.FSM.FsmPeerComponent;
import hibernate.FSM.FsmProduct;

import java.util.List;

import net.sf.hibernate.HibernateException;
import entityOperation.FSM.*;

public class CountFPNumber {
	
	//�����������ͨ���ݹ麯�����㹦�ܵ����
	Integer sum = 0;	
	public Integer CountFPNumber1(Object obj) throws HibernateException{		
		MeasurePhase mp = new MeasurePhase();
		MappingPhase mp1 = new MappingPhase();
		StrategyPhase sp = new StrategyPhase();
		if(obj instanceof hibernate.FSM.FsmFunctionProcess){//���㹦�����̵Ĺ��ܵ����
			FsmFunctionProcess ffp = (FsmFunctionProcess)obj;
			Integer funcProsId=ffp.getId();			
			List dataMoveList = mp.getDataMovementByFuncProsId(funcProsId);
			sum = dataMoveList.size();
			return sum;			
		}
		else if(obj instanceof hibernate.FSM.FsmPeerComponent){//����Ե�����Ĺ��ܵ����
			FsmPeerComponent ffp = (FsmPeerComponent)obj;
			Integer compType = ffp.getCompType();
			if(compType==0){//�Ե��������Ϊ��������ȡ������������������м��㹦�ܵ����
				Integer fatherId = ffp.getId();
				List subComponentList = sp.getPeerComponentByFatherId(fatherId);
				sum = 0;
				for(Object o:subComponentList){
					sum +=CountFPNumber1(o);
				}
				return sum;			
			}else{//�Ե��������Ϊԭ�������ȡ�����Ĺ������̼������м��㹦�ܵ����
				Integer peerCompId = ffp.getId();
				List funcProsList= mp1.getFunctionProcessByPeerCompId(peerCompId);
				sum=0;
				for(Object o:funcProsList){
					sum +=CountFPNumber1(o);
				}
				return sum;
				
			}
			
		}
		
		else if(obj instanceof hibernate.FSM.FsmLayer){//�����εĹ��ܵ����
			FsmLayer fl = (FsmLayer)obj;
			Integer layerId = fl.getId();
			List peerCompList= sp.getPeerComponentByLayerIdAndFatherId(layerId,0);
			sum=0;
			for(Object o:peerCompList){
				sum +=CountFPNumber1(o);
			}
			return sum;
			
		}
		
		else if(obj instanceof hibernate.FSM.FsmProduct){//�����Ʒ�Ĺ��ܵ����
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
