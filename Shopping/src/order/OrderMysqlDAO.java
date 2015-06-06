package order;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import user.User;
import product.*;

import cart.*;
import database.DB;

public class OrderMysqlDAO {
	
	public void addOrder(SaleOrder order) {//每个order中有一个cart包含具体的商品，往数据库中插入salesorder的同时插入order中包含的salesitem
		Connection conn = null;
		PreparedStatement pStmt = null;
		String sql = "insert into salesorder values(null,?,?,?,?)";
		ResultSet rs = null;
		Statement stat=null;
		
		try {
			conn = DB.getConn();
			
			conn.setAutoCommit(false);
			
			pStmt = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
			pStmt.setInt(1,order.getUser().getId());
			pStmt.setString(2,order.getAddr());
			pStmt.setTimestamp(3,order.getOdate());
			pStmt.setDouble(4, order.getStatus());
			pStmt.executeUpdate();
			
			rs = pStmt.getGeneratedKeys();
			rs.next();
			int key = rs.getInt(1);
			
			String sqlItem = "insert into salesitem values(null,?,?,?,?)";
			pStmt = DB.getPstat(conn, sqlItem);
			
			Cart cart = order.getCart();
			List<CartItem> list = cart.getCartItems();
			for(int i=0;i<list.size();i++) {
				CartItem ci = list.get(i);
				pStmt.setInt(1,ci.getProductId());
				pStmt.setDouble(2, ci.getProductPrice());
				pStmt.setInt(3, ci.getCount());
				pStmt.setInt(4,key);
				pStmt.addBatch();
			}
			pStmt.executeBatch();
			
			conn.commit();
			conn.setAutoCommit(true);
			
		} catch (SQLException e) {
			e.printStackTrace();
			try {
				conn.setAutoCommit(true);
				conn.rollback();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
		} finally {
			DB.closeRs(rs);
			DB.closeStat(pStmt);
			DB.closeConn(conn);
		}
		
	}

	public int getSaleOrder(List<SaleOrder> orders, int pageNum, int pageSize) {
		
		Connection conn = null;
		Statement stat = null;
		Statement statCount = null;
		ResultSet rs = null;
		ResultSet rsCount = null;
		int totalPages=0,totalRecords=0;
		String sql = "select salesorder.id,salesorder.userid,salesorder.addr,salesorder.odate,salesorder.status"+","+
					 "user.id uid,user.username,user.password,user.phone,user.addr uaddr,user.rdate "+	
					 "from salesorder join user on (salesorder.userid=user.id) limit " 
					 + pageSize*(pageNum-1)+","+pageSize;
		//System.out.println(sql);
		
		try {
			conn = DB.getConn();
			stat = DB.getStat(conn);
			statCount = DB.getStat(conn);
			rs = stat.executeQuery(sql);
			rsCount = statCount.executeQuery("select count(*) from salesorder");
			rsCount.next();
			totalRecords = rsCount.getInt(1);
			while(rs.next()) {
				User u = new User();
				u.setId(rs.getInt("uid"));
				u.setUsername(rs.getString("username"));
				u.setPassword(rs.getString("password"));
				u.setAddr(rs.getString("uaddr"));
				u.setPhone(rs.getString("phone"));
				u.setRdate(rs.getTimestamp("rdate"));
				SaleOrder so = new SaleOrder();
				so.setUser(u);
				so.setAddr(rs.getString("addr"));
				so.setId(rs.getInt("id"));
				so.setOdate(rs.getTimestamp("odate"));
				so.setStatus(rs.getInt("status"));
				orders.add(so);
			}
			totalPages=totalRecords % pageSize == 0 ? totalRecords/pageSize : totalRecords/pageSize + 1;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return totalPages;
	}

	public List<CartItem> getCartItem(int orderId) {
		List<CartItem> items = new ArrayList();
		Connection conn = null;
		ResultSet rs = null;
		
		try {
			conn = DB.getConn();
			String sql = "select * from salesitem where orderid="+orderId;
			rs = DB.getRs(conn, sql);
			while(rs.next()) {
				CartItem ci = new CartItem();
				ci.setCount(rs.getInt("pcount"));
				ci.setProductId(rs.getInt("productid"));
				ci.setProductName(ProductManager.getInstance().loadById(rs.getInt("productid")).getName());  //此处应该用sql直接提取出productid
				ci.setProductPrice(rs.getInt("unitprice"));
				items.add(ci);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DB.closeRs(rs);
			DB.closeConn(conn);
		}
		return items;
	}

	public void updateStatus(int orderId, int status) {
		Connection conn = null;
		Statement stat = null;
		String sql = "update salesorder set status="+status+" where id=" + orderId;
		
		try {
			
			conn = DB.getConn();
			stat = DB.getStat(conn);
			stat.executeUpdate(sql);
		} catch (SQLException e) {
			e.printStackTrace();
			
		} finally {
			DB.closeStat(stat);
			DB.closeConn(conn);
		}
	}
}
