package business.FSM;

import hibernate.FSM.FsmFunctionProcess;
import hibernate.FSM.FsmLayer;
import hibernate.FSM.FsmPeerComponent;
import hibernate.FSM.FsmProduct;

import java.util.List;

import net.sf.hibernate.HibernateException;
import entityOperation.FSM.*;

public class ConvertIntAndString {
	//Ϊ�˷�ֹ�������ṹ�и��ڵ�id���ӽڵ�id��ͬ���������з������д���
	//�Բ�Ʒ��id���涼�ӡ�3�����д��
	public Integer packageProduct(Integer id){
		
		String productId = id.toString()+"3";
		Integer pId =  Integer.valueOf(productId);
		return pId;
	}
	//�Բ�ε�id���涼�ӡ�2�����д��
	public Integer packageLayer(Integer id){
		
		String layerId = id.toString()+"2";
		Integer lId =  Integer.valueOf(layerId);
		return lId;
	}
	//�ԶԵ������id���涼�ӡ�1�����д��
  public Integer packagePeerComponent(Integer id){
		
		String peerCompId = id.toString()+"1";
		Integer pcId =  Integer.valueOf(peerCompId);
		return pcId;
	}

   //�Թ������̵�id���涼�ӡ�0�����д��
  public Integer packageFuncPros(Integer id){
		
		String funcProsId = id.toString()+"0";
		Integer ppId =  Integer.valueOf(funcProsId);
		return ppId;
	}
  //���������ȥ��ĩβ�ӵ����֣���ԭ��ʵ��id
  public Integer unPackage(Integer id ){
	  
	  String id1 = id.toString();
	  String subId = id1.substring(0, id1.length()-1);
	  Integer id2 = Integer.valueOf(subId);
	  return id2;
  }
	
	
	
}
