package jdbc;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

//import graph.*;
public class JdbcTools {

	/**
	 * @param args
	 * @throws SQLException 
	 */	
	public static List<String> getVertex() throws SQLException{
		List<String> list=new ArrayList<String>();
		Connection conn=null;
		Statement stmt=null;
		ResultSet rs=null;
		String sql=null;
		
		conn=JdbcUtils.getConnection();
		stmt=conn.createStatement();
		rs=stmt.executeQuery("select * from vertex");
		while(rs.next()){
			list.add(rs.getString(2));
		}
		
		JdbcUtils.free(rs, stmt, conn);
		return list;
	}
	public static void test() throws SQLException{
		Connection conn=null;
		Statement stmt=null;
		ResultSet rs=null;
		String sql=null;
		
		conn=JdbcUtils.getConnection();
		stmt=conn.createStatement();
		stmt.executeUpdate("delete from bayes");
		for(int i=0;i<10;i++){
			sql="insert into bayes(id,start,dest)values("+i+","+i+","+(i+1)+");";
			stmt.executeUpdate(sql);
		}
		
		JdbcUtils.free(rs, stmt, conn);
		System.out.println("ok");
	}
	public static boolean check(String sql) throws SQLException{
		Connection conn=null;
		Statement stmt=null;
		ResultSet rs=null;
		boolean flag=false;
		conn=JdbcUtils.getConnection();
		stmt=conn.createStatement();
		rs=stmt.executeQuery(sql);
		flag=rs.next();
		JdbcUtils.free(rs, stmt, conn);
		return flag;
	}
	public static void execute(String sql) throws SQLException{
		Connection conn=null;
		Statement stmt=null;
		ResultSet rs=null;
		conn=JdbcUtils.getConnection();
		stmt=conn.createStatement();
		stmt.execute(sql);
		JdbcUtils.free(rs, stmt, conn);
	}
	public static String execSql(String sql) throws SQLException{
		Connection conn = null;
		Statement stmt = null;
		conn = JdbcUtils.getConnection();
		stmt = conn.createStatement();
		ResultSet rs = stmt.executeQuery(sql);
		System.out.println(rs.getString(2));
		return rs.getString(2);
	}
/*	public static void main(String args[]) throws SQLException{
		String sql = "select * from FSM_Reg where userName='ss'";
		String s = execSql(sql);
		System.out.println(s);		
	}*/
	
	public static void create_table(String sql) throws SQLException{
		Connection conn=null;
		Statement stmt=null;
		ResultSet rs=null;
		
		conn=JdbcUtils.getConnection();
		stmt=conn.createStatement();
		stmt.execute(sql);
		JdbcUtils.free(rs, stmt, conn);
		
	}
	public static void read(String sql) throws SQLException{
		Connection conn=null;
		Statement stmt=null;
		ResultSet rs=null;
		
		conn=JdbcUtils.getConnection();
		stmt=conn.createStatement();
		rs=stmt.executeQuery(sql);
		System.out.println("********************");
		while(rs.next()){
			System.out.println(rs.getObject(1)+"\t"+rs.getObject(2));
		}
		System.out.println("********************");
		JdbcUtils.free(rs, stmt, conn);
	}
	public static boolean insert(String sql) {
		Connection conn=null;
		Statement stmt=null;
		int count=0;
		

		try {
			conn=JdbcUtils.getConnection();
			stmt=conn.createStatement();
			count=stmt.executeUpdate(sql);
			
			
		} catch (SQLException e) {
			
			
		}finally{
			try {
				JdbcUtils.free(null, stmt, conn);
			} catch (SQLException e) {
				
			}
		}
		if(count>0)
			return true;
		else return false;
		
	}
	public static void update() throws SQLException{
		Connection conn=null;
		Statement stmt=null;
		String sql="update table_test set id=id+1";
		

		conn=JdbcUtils.getConnection();
		stmt=conn.createStatement();
		int count=stmt.executeUpdate(sql);
		
		JdbcUtils.free(null, stmt, conn);
	}
	public static void delete() throws SQLException{
		Connection conn=null;
		Statement stmt=null;
		String sql="delete from table_test where id=5";
		

		conn=JdbcUtils.getConnection();
		stmt=conn.createStatement();
		int count=stmt.executeUpdate(sql);
		
		JdbcUtils.free(null, stmt, conn);
	}
	

}
