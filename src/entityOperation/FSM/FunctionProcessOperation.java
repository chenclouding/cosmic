package entityOperation.FSM;

import hibernate.FSM.FsmFunctionProcess;

import java.util.List;

import net.sf.hibernate.HibernateException;
//import entityOperation.BaseEntityOperation;

public class FunctionProcessOperation extends BaseEntityOperation {


		/**
		 *  ���빦������
		 */		
		public boolean insertFunctionProcess(Object dataObject) throws HibernateException{
			return insert(dataObject);
		}
		/**
		 *  ��ʵ������ɾ����������
		 */	
		public boolean delFunctionProcess(Object dataObject) throws HibernateException{
			return del(dataObject);
		}
		/**
		 *  ��ID��ɾ����������
		 */	
		public boolean delFunctionProcessById(Integer id) throws HibernateException{
			Object obj = queryById("FsmFunctionProcess",id);
			return del(obj);
		}
		/**
		 *  ���¹�������
		 */	
		public boolean updateFunctionProcess(Object dataObject) throws HibernateException {
			return update(dataObject);
		}

		/**
		 *  ��ѯ���еĹ�������
		 */
		public List queryAllFunctionProcess() throws HibernateException {	
	        return queryAll("FsmFunctionProcess");
		}

		/**
		 *  ��id������������������ȡ����
		 */
		public Object queryFunctionProcessById(Integer id) {    	
	        return queryById("FsmFunctionProcess",id);

	    }

		/**
		 *  peerCompId�����������������ȡ����
		 */	
		public List queryByPeerCompId(Integer peerCompId) {    	
			 return queryByFkey("FsmFunctionProcess","peerCompId",peerCompId); 
		 }
		
		/**
		 *  peerCompId�������measureStatus(��ֵ)����Ȥ����ȡ����
		 */	
		public List queryByPeerCompIdAndMeasureStatus(Integer peerCompId,Integer measureStatus) {    	
			 return queryByColumnNames("FsmFunctionProcess","peerCompId",peerCompId,"measureStatus",measureStatus); 
		 }
		
		/**
		 *  peerCompId�������mappingUserStatus(��ֵ)����Ȥ����ȡ����
		 */	
		public List queryByPeerCompIdAndMappingUserStatus(Integer peerCompId,Integer mappingUserStatus) {    	
			 return queryByColumnNames("FsmFunctionProcess","peerCompId",peerCompId,"mappingUserStatus",mappingUserStatus); 
		 }	
		
		/**
		 *  peerCompId�������mappingEventStatus(��ֵ)����Ȥ����ȡ����
		 */	
		public List queryByPeerCompIdAndMappingEventStatus(Integer peerCompId,Integer mappingEventStatus) {    	
			 return queryByColumnNames("FsmFunctionProcess","peerCompId",peerCompId,"mappingEventStatus",mappingEventStatus); 
		 }	
		
		/**
		 *  peerCompId�������mappingIOStatus(��ֵ)����Ȥ����ȡ����
		 */	
		public List queryByPeerCompIdAndMappingIOStatus(Integer peerCompId,Integer mappingIOStatus) {    	
			 return queryByColumnNames("FsmFunctionProcess","peerCompId",peerCompId,"mappingIostatus",mappingIOStatus); 
		 }	
		
	    public static void main(String args[]) throws HibernateException{
	    	FunctionProcessOperation fpo = new FunctionProcessOperation();
	    	FsmFunctionProcess ffp = new FsmFunctionProcess(); //����ʵ��Bean
			ffp.setPeerCompId(Integer.valueOf("1"));
			ffp.setFuncProsName("1");
			ffp.setFuncProsDesp("1");
			ffp.setMeasureStatus(1);
			//fpo.insertFunctionProcess(ffp);
			List results = fpo.queryByPeerCompIdAndMappingIOStatus(7, 5);
		
			for(Object obj:results){
				ffp = (FsmFunctionProcess)obj;
				System.out.println(ffp.getFuncProsName());
			}
			
	    }

}
