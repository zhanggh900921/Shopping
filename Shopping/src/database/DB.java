package database;

import java.sql.*;


public class DB {
	
	static  {
		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
	}
	
	public static Connection getConn() {
		Connection conn = null;
		try {
			String url = "jdbc:mysql://localhost:3306/newshopping?user=root&password=900921";
			conn = DriverManager.getConnection(url);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return conn;
		
	}
	
	public static void closeConn(Connection conn) {
		try {
			if(conn!=null) {
				conn.close();
				conn = null;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public static Statement getStat(Connection conn) {
		Statement stat = null;
		try {
			stat = conn.createStatement();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return stat;
	}
	
	public static void closeStat(Statement stat) {
		try {
			if(stat!=null) {
				stat.close();
				stat = null;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public static PreparedStatement getPstat(Connection conn,String sql) {
		PreparedStatement pstat = null;
		try {
			pstat = conn.prepareStatement(sql);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return pstat;
	}
	
	public static ResultSet getRs(Statement stat,String sql) {
		ResultSet rs = null;
		try {
			rs = stat.executeQuery(sql);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return rs;
	}
	
	public static ResultSet getRs(Connection conn,String sql) {
		ResultSet rs = null;
		try {
			rs = conn.createStatement().executeQuery(sql);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return rs;
	}
	
	public static void closeRs(ResultSet rs) {
		try {
			if(rs!=null) {
				rs.close();
				rs = null;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}


	

}
