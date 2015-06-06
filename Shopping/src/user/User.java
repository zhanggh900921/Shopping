package user;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import database.DB;

public class User {
	private int id;
	private String username;
	private String password;
	private String phone;
	private String addr;
	private Timestamp rdate;
	
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getAddr() {
		return addr;
	}
	public void setAddr(String addr) {
		this.addr = addr;
	}
	public Timestamp getRdate() {
		return rdate;
	}
	public void setRdate(Timestamp rdate) {
		this.rdate = rdate;
	}
	
	public void save() {
		Connection conn=null;
		PreparedStatement pStat=null;
		String sql = "insert into user values(null,?,?,?,?,?)";
		try {
				conn = DB.getConn();
				pStat = DB.getPstat(conn,sql);
				
				pStat.setString(1, username);
				pStat.setString(2, password);
				pStat.setString(3, phone);
				pStat.setString(4, addr);
				pStat.setTimestamp(5, rdate);
				pStat.executeUpdate();
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				DB.closeStat(pStat);
				DB.closeConn(conn);
			}


	}

	
}
