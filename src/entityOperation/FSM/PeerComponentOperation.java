package entityOperation.FSM;

import hibernate.FSM.FsmPeerComponent;

import java.util.Iterator;
import java.util.List;

import net.sf.hibernate.HibernateException;
import net.sf.hibernate.Query;
import net.sf.hibernate.Session;
import net.sf.hibernate.Transaction;
//import entityOperation.BaseEntityOperation;

/**
 * @author faye
 * �Ựbean����װ�˶Ե���������ݿ����
 */
public class PeerComponentOperation extends BaseEntityOperation {
	/**
	 *  ����Ե����
	 */		
	public boolean insertPeerComponent(Object dataObject) throws HibernateException{
		return insert(dataObject);
	}
	/**
	 *  ��ʵ������ɾ���Ե����
	 */	
	public boolean delPeerComponent(Object dataObject) throws HibernateException{
		return del(dataObject);
	}
	/**
	 *  ��ID��ɾ���Ե����
	 */	
	public boolean delPeerComponentById(Integer id) throws HibernateException{
		Object obj = queryById("FsmPeerComponent",id);
		return del(obj);
	}
	/**
	 *  ���¶Ե����
	 */	
	public boolean updatePeerComponent(Object dataObject) throws HibernateException {
		return update(dataObject);
	}

	/**
	 *  ��ѯ���еĶԵ����
	 */
	public List queryAllPeerComponent() throws HibernateException {	
        return queryAll("FsmPeerComponent");
	}

	/**
	 *  ��id�����������Ե����ȡ����
	 */
	public Object queryPeerComponentById(Integer id) {    	
        return queryById("FsmPeerComponent",id);

    }

	/**
	 *  ��layerId����������Ե����ȡ����
	 */
	public List queryByLayerId(Integer layerId) { 
		 return queryByFkey("FsmPeerComponent","layerId",layerId);	
	}

	/**
	 *  ��fatherId����������Ե����ȡ����
	 */
	public List queryByFatherId(Integer fatherId) { 
		 return queryByFkey("FsmPeerComponent","fatherId",fatherId);	
	}
	
	/**
	 *  ��fatherId��LayerId����������Ե����ȡ����
	 */
	public List queryByFatherIdAndLayerId(Integer fatherId,Integer layerId) { 
		 return queryByColumnNames("FsmPeerComponent","fatherId",fatherId,"layerId",layerId);	
	}
	public List queryByCompTypeAndLayerId(Integer compType,Integer layerId) { 
		 return queryByColumnNames("FsmPeerComponent","compType",compType,"layerId",layerId);	
	}
	
	public List queryByFatherIdAndMeasureStatus(Integer fatherId,Integer measureStatus) { 
		 return queryByColumnNames("FsmPeerComponent","fatherId",fatherId,"measureStatus",measureStatus);	
	}
	
	public List queryByLayerIdAndMeasureStatus(Integer layerId,Integer measureStatus) { 
		 return queryByColumnNames("FsmPeerComponent","layerId",layerId,"measureStatus",measureStatus);	
	}

	/**
	 *  main()�������ڲ���
	 */
    public static void main(String[] str) throws HibernateException{
    	PeerComponentOperation pco = new PeerComponentOperation();
    	FsmPeerComponent fpc = new FsmPeerComponent();
    	//FsmPeerComponent fpc2 = (FsmPeerComponent)pco.queryPeerComponentById(1);
    	//fpc = fpc2;
    	fpc.setPeerCompDesp("this is a tes");
    	fpc.setPeerCompName("compon");
    	pco.update(fpc);	
    	//boolean b= pco.delPeerComponentById(4);
    	
    }


}
