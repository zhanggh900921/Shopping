package user;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import database.DB;

public class UserManager {
	
	public static List<User> getUser() {
		List<User> l = new ArrayList();
		Connection conn = null;
		ResultSet rs = null;
		
		try {
			conn = DB.getConn();
			String sql = "select * from user";
			rs = DB.getRs(conn, sql);
			while(rs.next()) {
				User u = new User();
				u.setId(rs.getInt("id"));
				u.setUsername(rs.getString("username"));
				u.setPassword(rs.getString("password"));
				u.setPhone(rs.getString("phone"));
				u.setAddr(rs.getString("addr"));
				u.setRdate(rs.getTimestamp("rdate"));
				l.add(u);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DB.closeRs(rs);
			DB.closeConn(conn);
		}
		return l;
	}
	
	public static void deleteUser(int id) {
		Connection conn = null;
		Statement stat = null;
		try {
			conn = DB.getConn();
			stat = DB.getStat(conn);
			stat.executeUpdate("delete from user where id="+id);
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DB.closeStat(stat);
			DB.closeConn(conn);
		}
	}
	
	public static User userExist(String username,String password) throws UserNotFoundException, PasswordErrException  {
		Connection conn = null;
		ResultSet rs = null;
		String sql = "select * from user where username= '" + username + "'";
		User u = null;
		
		try {
			conn = DB.getConn();
			rs = DB.getRs(conn, sql);
			if(!rs.next()) {
				throw new UserNotFoundException();
			}else if(!rs.getString("password").equals(password)) {
				throw new PasswordErrException();
			}else {
				u = new User();
				u.setId(rs.getInt("id"));
				u.setUsername(rs.getString("username"));
				u.setPassword(rs.getString("password"));
				u.setPhone(rs.getString("phone"));
				u.setAddr(rs.getString("addr"));
				u.setRdate(rs.getTimestamp("rdate"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DB.closeRs(rs);
			DB.closeConn(conn);
		}
		return u;
	}
	
	public static void userUpdate(User u) {
		Connection conn = null;
		PreparedStatement pstat = null;
		String sql = "update user set username=?,phone=?,addr=? where id="+u.getId();
		
		try {
			conn = DB.getConn();
			pstat = DB.getPstat(conn, sql);
			pstat.setString(1, u.getUsername());
			pstat.setString(2, u.getPhone());
			pstat.setString(3, u.getAddr());
			pstat.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DB.closeStat(pstat);
			DB.closeConn(conn);
		}
	}
	
	public static void passwordUpdate(User u) {
		Connection conn = null;
		PreparedStatement pstat = null;
		String sql = "update user set password=? where id="+u.getId();
		
		try {
			conn = DB.getConn();
			pstat = DB.getPstat(conn, sql);
			pstat.setString(1, u.getPassword());
			pstat.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DB.closeStat(pstat);
			DB.closeConn(conn);
		}
	}
}
