package entityOperation.FSM;

import hibernate.FSM.FsmFunctionProcess;

import java.util.List;

import net.sf.hibernate.HibernateException;
//import entityOperation.BaseEntityOperation;

public class FunctionProcessOperation extends BaseEntityOperation {


		/**
		 *  插入功能流程
		 */		
		public boolean insertFunctionProcess(Object dataObject) throws HibernateException{
			return insert(dataObject);
		}
		/**
		 *  按实体名字删除功能流程
		 */	
		public boolean delFunctionProcess(Object dataObject) throws HibernateException{
			return del(dataObject);
		}
		/**
		 *  按ID号删除功能流程
		 */	
		public boolean delFunctionProcessById(Integer id) throws HibernateException{
			Object obj = queryById("FsmFunctionProcess",id);
			return del(obj);
		}
		/**
		 *  更新功能流程
		 */	
		public boolean updateFunctionProcess(Object dataObject) throws HibernateException {
			return update(dataObject);
		}

		/**
		 *  查询所有的功能流程
		 */
		public List queryAllFunctionProcess() throws HibernateException {	
	        return queryAll("FsmFunctionProcess");
		}

		/**
		 *  按id（主键）将功能流程取出来
		 */
		public Object queryFunctionProcessById(Integer id) {    	
	        return queryById("FsmFunctionProcess",id);

	    }

		/**
		 *  peerCompId（外键）将功能流程取出来
		 */	
		public List queryByPeerCompId(Integer peerCompId) {    	
			 return queryByFkey("FsmFunctionProcess","peerCompId",peerCompId); 
		 }
		
		/**
		 *  peerCompId（外键）measureStatus(列值)将兴趣对象取出来
		 */	
		public List queryByPeerCompIdAndMeasureStatus(Integer peerCompId,Integer measureStatus) {    	
			 return queryByColumnNames("FsmFunctionProcess","peerCompId",peerCompId,"measureStatus",measureStatus); 
		 }
		
		/**
		 *  peerCompId（外键）mappingUserStatus(列值)将兴趣对象取出来
		 */	
		public List queryByPeerCompIdAndMappingUserStatus(Integer peerCompId,Integer mappingUserStatus) {    	
			 return queryByColumnNames("FsmFunctionProcess","peerCompId",peerCompId,"mappingUserStatus",mappingUserStatus); 
		 }	
		
		/**
		 *  peerCompId（外键）mappingEventStatus(列值)将兴趣对象取出来
		 */	
		public List queryByPeerCompIdAndMappingEventStatus(Integer peerCompId,Integer mappingEventStatus) {    	
			 return queryByColumnNames("FsmFunctionProcess","peerCompId",peerCompId,"mappingEventStatus",mappingEventStatus); 
		 }	
		
		/**
		 *  peerCompId（外键）mappingIOStatus(列值)将兴趣对象取出来
		 */	
		public List queryByPeerCompIdAndMappingIOStatus(Integer peerCompId,Integer mappingIOStatus) {    	
			 return queryByColumnNames("FsmFunctionProcess","peerCompId",peerCompId,"mappingIostatus",mappingIOStatus); 
		 }	
		
	    public static void main(String args[]) throws HibernateException{
	    	FunctionProcessOperation fpo = new FunctionProcessOperation();
	    	FsmFunctionProcess ffp = new FsmFunctionProcess(); //定义实体Bean
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
