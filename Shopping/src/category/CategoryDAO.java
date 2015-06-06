package category;

import java.sql.*;
import java.util.List;

import database.*;

public class CategoryDAO {
	
	public static void addTop(Category c) {
		Connection conn = null;
		PreparedStatement pStmt = null;
		String sql = "insert into category values(null,?,?,?,?,?)";
		
		try {
			conn = DB.getConn();
			pStmt = DB.getPstat(conn, sql);
			//pStmt.setInt(1, c.getId());
			pStmt.setInt(1, c.getPid());
			pStmt.setString(2, c.getName());
			pStmt.setString(3, c.getDescr());
			pStmt.setInt(4, c.isLeaf()? 0 : 1);
			pStmt.setInt(5, c.getGrade());
			pStmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DB.closeStat(pStmt);
			DB.closeConn(conn);
		}
	}

	public static void getCategories(List<Category> categories, int id) {
		Connection conn = null;
		try {
			conn = DB.getConn();
			getCategories(conn,categories,id);
		} finally {
			DB.closeConn(conn);
		}
		
	}

	private static void getCategories(Connection conn,List<Category> categories, int id) {
		ResultSet rs = null;
		String sql = "select * from category where pid = " + id;
		
		try {
			rs = DB.getRs(conn, sql);
			while(rs.next()) {
				Category c = new Category();
				c.setId(rs.getInt(1));
				c.setPid(rs.getInt(2));
				c.setName(rs.getString(3));
				c.setDescr(rs.getString(4));
				c.setLeaf(rs.getInt(5) == 0 ? true:false);
				c.setGrade(rs.getInt(6));
				categories.add(c);
				if(!c.isLeaf()) {
					getCategories(conn,categories,c.getId());
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DB.closeRs(rs);
		}
		
	}

	public static Category loadById(int id) {
		Connection conn = null;
    	ResultSet rs = null;
    	Category c = new Category();
    	String sql = "select * from category where id =" + id;
    	//System.out.println(sql);
    	try {
    		conn = DB.getConn();
    		rs = DB.getRs(conn, sql);
    		while(rs.next()) {
				c.setId(rs.getInt("id"));
				c.setPid(rs.getInt("pid"));
				c.setName(rs.getString("name"));
				c.setDescr(rs.getString("descr"));
				c.setLeaf(rs.getInt("isleaf") == 0 ? true:false);
				c.setGrade(rs.getInt("grade"));
    		}
    	} catch (SQLException e) {
    		e.printStackTrace();
    	} finally {
    		DB.closeRs(rs);
    		DB.closeConn(conn);
    	}
    	return c;
	}

	public static void addChild(Category c) {
		Connection conn = null;
		PreparedStatement pStmt = null;
		Statement stat = null;
		String sql = "insert into category values(null,?,?,?,?,?)";
		
		try {
			conn = DB.getConn();
			pStmt = DB.getPstat(conn, sql);
			conn.setAutoCommit(false);

			pStmt.setInt(1, c.getPid());
			pStmt.setString(2, c.getName());
			pStmt.setString(3, c.getDescr());
			pStmt.setInt(4, c.isLeaf()? 0 : 1);
			pStmt.setInt(5, c.getGrade());
			pStmt.executeUpdate();
			
			stat = conn.createStatement();
			stat.executeUpdate("update category set isleaf = 1 where id="+c.getPid());
			
			conn.commit();
			conn.setAutoCommit(true);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DB.closeStat(stat);
			DB.closeStat(pStmt);
			DB.closeConn(conn);
		}
	}

	public static void deleteCategory(int id, int pid) {
		Connection conn =null;
		Statement stat = null;
		Statement statCategory = null;
		ResultSet rs = null;
		
		try {
			conn = DB.getConn();
			stat = DB.getStat(conn);
			statCategory = DB.getStat(conn);
			conn.setAutoCommit(false);
			rs = DB.getRs(stat, "select * from category where pid="+id);
			while(rs.next()) {
				deleteCategory(rs.getInt("id"),id );
			}
			stat.executeUpdate("delete from category where id="+id);
			statCategory.executeUpdate("delete from product where product.categoryid="+id);
			conn.commit();
			conn.setAutoCommit(true);
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DB.closeRs(rs);
			DB.closeStat(stat);
			DB.closeStat(statCategory);
			DB.closeConn(conn);
		}
	}

	public static void update(int pid) {
		Connection conn =null;
		Statement stat = null;
		Statement statUpdata = null;
		ResultSet rs = null;
		
		try {
			conn = DB.getConn();
			stat = DB.getStat(conn);
			conn.setAutoCommit(false);
			rs = DB.getRs(stat, "select count(*) from category where pid="+pid);
			rs.next();
			int count = rs.getInt(1);
			DB.closeRs(rs);
			DB.closeStat(stat);
			
			if(count<=0) {
				statUpdata = conn.createStatement();
				statUpdata.executeUpdate("update category set isleaf=0 where id="+pid);
				
			}
			conn.commit();
			conn.setAutoCommit(true);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			
			DB.closeStat(statUpdata);
			DB.closeConn(conn);
		}
	}

	public static void changeCategory(int id, String name, String descr) {
		Connection conn = null;
		PreparedStatement pstat = null;
		String sql = "update category set name=?,descr=? where id="+id;
		//System.out.println(name+"===="+id+descr);
		
		try {
			conn = DB.getConn();
			pstat = DB.getPstat(conn, sql);
			pstat.setString(1, name);
			pstat.setString(2, descr);
			pstat.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DB.closeStat(pstat);
			DB.closeConn(conn);
		}
	}
}
