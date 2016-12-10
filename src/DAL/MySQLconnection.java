package DAL;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class MySQLconnection {
	Connection connection;
	public Connection getConnectiontoSQL(){
		try {
			Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		try {
			connection=DriverManager.getConnection("jdbc:sqlserver://localhost:1433;databaseName=COP","sa","123456");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return connection;
		
	}
	public ResultSet LayDuLieu(String sql, Connection connection){
		getConnectiontoSQL();
		ResultSet rs = null;
		try {
			Statement query = connection.createStatement();
			 rs  = query.executeQuery(sql);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		close();
		return rs;
	}
	public void close(){
		if(connection!=null)
			try {
				if(!connection.isClosed())
				{
					connection.close();
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	}
}
