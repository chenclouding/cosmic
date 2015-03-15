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
 * 会话bean，封装了对等组件的数据库操作
 */
public class PeerComponentOperation extends BaseEntityOperation {
	/**
	 *  插入对等组件
	 */		
	public boolean insertPeerComponent(Object dataObject) throws HibernateException{
		return insert(dataObject);
	}
	/**
	 *  按实体名字删除对等组件
	 */	
	public boolean delPeerComponent(Object dataObject) throws HibernateException{
		return del(dataObject);
	}
	/**
	 *  按ID号删除对等组件
	 */	
	public boolean delPeerComponentById(Integer id) throws HibernateException{
		Object obj = queryById("FsmPeerComponent",id);
		return del(obj);
	}
	/**
	 *  更新对等组件
	 */	
	public boolean updatePeerComponent(Object dataObject) throws HibernateException {
		return update(dataObject);
	}

	/**
	 *  查询所有的对等组件
	 */
	public List queryAllPeerComponent() throws HibernateException {	
        return queryAll("FsmPeerComponent");
	}

	/**
	 *  按id（主键）将对等组件取出来
	 */
	public Object queryPeerComponentById(Integer id) {    	
        return queryById("FsmPeerComponent",id);

    }

	/**
	 *  按layerId（外键）将对等组件取出来
	 */
	public List queryByLayerId(Integer layerId) { 
		 return queryByFkey("FsmPeerComponent","layerId",layerId);	
	}

	/**
	 *  按fatherId（外键）将对等组件取出来
	 */
	public List queryByFatherId(Integer fatherId) { 
		 return queryByFkey("FsmPeerComponent","fatherId",fatherId);	
	}
	
	/**
	 *  按fatherId和LayerId（外键）将对等组件取出来
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
	 *  main()函数用于测试
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
