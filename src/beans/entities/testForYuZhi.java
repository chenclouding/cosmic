package beans.entities;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Iterator;



import dbaccess.DatabaseService;
import operations.PP_YuzhiOperation;

public class testForYuZhi {

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		YuzhiBean yb=new YuzhiBean();
		yb.setProjectId("0000001");
		yb.setRuleName("sp");
		yb.setModValue(30.0);
//		yb.setWarValue(40);
		yb.setRule(1);
		Object ob=(Object)yb;
		YuzhiBean yb2=new YuzhiBean();
		Collection col=new ArrayList();
		
		System.out.println(yb.getProjectId());
		Connection cn = DatabaseService.getConnection();
		System.out.println("wrong occer");
		PP_YuzhiOperation py=new PP_YuzhiOperation();
		py.setConnection(cn);
		
//		yb2=(YuzhiBean)py.queryById(yb.getProjectId(),yb.getRuleName());
//		System.out.println(yb2.getRuleName());
		
		col=py.queryByProjectId("0000001");
		Iterator it=col.iterator();
		while(it.hasNext()){
			yb=(YuzhiBean)it.next();
			System.out.println(yb.getRuleName()+ yb.getWarValue());
		}
//		py.delById(yb.getProjectId(),yb.getRuleName());
//		py.update(ob);
		DatabaseService.closeConnection(cn);
		
	}

}
