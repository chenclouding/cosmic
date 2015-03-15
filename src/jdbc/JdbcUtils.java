package jdbc;
import java.sql.*;
public final class JdbcUtils {
	private static final String url_mysql="jdbc:mysql://localhost:3306/test";
	private static final String username_mysql="root";
	private static final String password_mysql="wodwl";
	

	private static final String url_sqlserver="jdbc:microsoft:sqlserver://localhost:1433; DatabaseName=test";
	private static final String username_sqlserver="jimmy";
	private static final String password_sqlserver="jimmy";
	
	
	private JdbcUtils(){
		
	}
	
	static{
		
			try {
				//Class.forName("com.mysql.jdbc.Driver");
				Class.forName("com.microsoft.jdbc.sqlserver.SQLServerDriver");
			} catch (ClassNotFoundException e) {
			
			}
		
	}
	
	public static Connection getConnection() throws SQLException{
		return DriverManager.getConnection(url_sqlserver,username_sqlserver,password_sqlserver);
	}
	
	public static void free(ResultSet rs,Statement stmt,Connection conn) throws SQLException{
		if(rs!=null)
			rs.close();
		if(stmt!=null)
			stmt.close();
		if(conn!=null)
			conn.close();
	}

}
