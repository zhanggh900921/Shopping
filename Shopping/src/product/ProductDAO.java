package product;

import java.sql.*;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.Date;

import category.CategoryDAO;

import database.*;

public class ProductDAO {

	public boolean addProduct(Product p) {
		Connection conn = null;
		PreparedStatement pStmt = null;
		String sql = "insert into product values(null,?,?,?,?,?,?)";
		
		try {
			conn = DB.getConn();
			pStmt = DB.getPstat(conn, sql);
			pStmt.setString(1, p.getName());
			pStmt.setString(2, p.getDescr());
			pStmt.setDouble(3, p.getNormalPrice());
			pStmt.setDouble(4, p.getMemberPrice());
			pStmt.setTimestamp(5, p.getPdate());
			pStmt.setInt(6, p.getCategoryId());
			pStmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		} finally {
			DB.closeStat(pStmt);
			DB.closeConn(conn);
		}
		
		return true;
	}
	
	
	public List<Product> getProducts() {
		List<Product> list = new ArrayList<Product>();
		Connection conn = null;
		ResultSet rs = null;
		String sql = "select * from product";
		
		try {
			conn = DB.getConn();
			rs = DB.getRs(conn, sql);
			while(rs.next()) {
				Product p = new Product();
				p.setId(rs.getInt("id"));
				p.setName(rs.getString("name"));
				p.setDescr(rs.getString("descr"));
				p.setNormalPrice(rs.getDouble("normalPrice"));
				p.setMemberPrice(rs.getDouble("memberPrice"));
				p.setPdate(rs.getTimestamp("pdate"));
				p.setCategoryId(rs.getInt("categoryId"));
				list.add(p);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DB.closeRs(rs);
			DB.closeConn(conn);
		}
		return list;
	}
	

	public int getProduct(List<Product> products, int pageNo, int pageSize) {
		Connection conn = null;
		Statement stat = null;
		Statement statCount = null;
		ResultSet rs = null;
		ResultSet rsCount = null;
		int totalPage=0;
		
		try {
			conn = DB.getConn();
			stat = DB.getStat(conn);
			statCount = DB.getStat(conn); 
			
			rsCount = DB.getRs(statCount, "select count(*) from product");
			rsCount.next();
			int totalProducts=rsCount.getInt(1);
			
			
			rs = DB.getRs(stat, "select * from product limit " + (pageNo-1)*pageSize + "," + pageSize);
			while(rs.next()) {
				Product p = new Product();
				p.setId(rs.getInt("id"));
				p.setName(rs.getString("name"));
				p.setDescr(rs.getString("descr"));
				p.setNormalPrice(rs.getDouble("normalPrice"));
				p.setMemberPrice(rs.getDouble("memberPrice"));
				p.setPdate(rs.getTimestamp("pdate"));
				p.setCategoryId(rs.getInt("categoryId"));
				p.setCategory(CategoryDAO.loadById(rs.getInt("categoryId")));
				products.add(p);
			}
			
			
			totalPage=totalProducts % pageSize == 0 ? totalProducts/pageSize : totalProducts/pageSize + 1;
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			DB.closeRs(rsCount);
			DB.closeRs(rs);
			DB.closeStat(stat);
			DB.closeStat(statCount);
			DB.closeConn(conn);
		}
		return totalPage;
		
	}

	public void deleteProductById(int id) {
		Connection conn =null;
		Statement stat = null;
		
		
		try {
			conn = DB.getConn();
			stat = DB.getStat(conn);
						
			stat.executeUpdate("delete from product where id="+id);						
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DB.closeStat(stat);
			DB.closeConn(conn);
		}
	}

	public Product loadById(int id) {
		Product product = new Product();
		Connection conn = null;
		ResultSet rs = null;
		String sql = "select * from product where id = " + id;
		
		try {
			conn = DB.getConn();
			rs = DB.getRs(conn, sql);
			if(rs.next()) {
				product.setId(rs.getInt("id"));
				product.setName(rs.getString("name"));
				product.setDescr(rs.getString("descr"));
				product.setNormalPrice(rs.getDouble("normalPrice"));
				product.setMemberPrice(rs.getDouble("memberPrice"));
				product.setPdate(rs.getTimestamp("pdate"));
				product.setCategoryId(rs.getInt("categoryId"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DB.closeRs(rs);
			DB.closeConn(conn);
		}
		return product;
	}

	public boolean updateProduct(Product p) {
		Connection conn = null;
		PreparedStatement pStmt = null;
		String sql = "update product set name=?,descr=?,normalPrice=?,memberPrice=?,categoryId=? where id=" + p.getId();
		
		try {
			
			conn = DB.getConn();
			pStmt = DB.getPstat(conn, sql);
			pStmt.setString(1, p.getName());
			pStmt.setString(2, p.getDescr());
			pStmt.setDouble(3, p.getNormalPrice());
			pStmt.setDouble(4, p.getMemberPrice());
			pStmt.setInt(5, p.getCategoryId());
			pStmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		} finally {
			DB.closeStat(pStmt);
			DB.closeConn(conn);
		}
		
		return true;
	}
	
	
	public int findProducts(List<Product> list, String keyword,
			double lowNormalPrice, double highNormalPrice,
			double lowMemberPrice, double highMemberPrice,Timestamp startPdate,
			Timestamp endPdate, int[] categoryIds, int pageNo, int pageSize) {
		
		Connection conn = null;
		ResultSet rs = null;
		String sql = "select * from product where 1=1";
		
		int totalPages = 0;
		String sqlCount = "";
		ResultSet rsCount = null;
		
		if(categoryIds != null && categoryIds.length != 0) {
			String strIds = "(";
			for(int i=0;i<categoryIds.length;i++) {
				if(i < categoryIds.length -1) {
					strIds += categoryIds[i] + ",";
				} else {
					strIds += categoryIds[i];
				}
			}
			strIds += ")";
			sql += " and categoryId in " + strIds;
		}
		
		if(keyword != null && !keyword.trim().equals("")) {
			sql += " and name like '%" + keyword + "%' or descr like '%" + keyword + "%'";
		}
		if(lowNormalPrice >= 0) {
			sql += " and normalprice >= " + lowNormalPrice;
		}
		if(highNormalPrice > 0) {
			sql += " and normalprice <= " + highNormalPrice;
		}
		if(lowMemberPrice >= 0) {
			sql += " and memberprice >= " + lowMemberPrice;
		}
		if(highMemberPrice >= 0) {
			sql += " and memberprice >= " + highMemberPrice;
		}
		if(startPdate != null ) {
			sql += " pdate >" + new SimpleDateFormat("yyyy-MM-dd").format(startPdate);
		}
		if(endPdate != null ) {
			sql += " pdate <" + new SimpleDateFormat("yyyy-MM-dd").format(endPdate);
		}
		sqlCount = sql.replaceFirst("select \\*", "select count(*)");
//System.out.println("sqlCount = " + sqlCount);
		
		sql += " limit " + (pageNo-1)*pageSize + "," + pageSize;
//System.out.println(sql);
		
		try {
			conn = DB.getConn();
			
			rsCount = DB.getRs(conn, sqlCount);
			rsCount.next();
			totalPages = (rsCount.getInt(1) + pageSize - 1) / pageSize;
			
			rs = DB.getRs(conn, sql);
			while(rs.next()) {
				Product p = new Product();
				p.setId(rs.getInt("id"));
				p.setName(rs.getString("name"));
				p.setDescr(rs.getString("descr"));
				p.setNormalPrice(rs.getDouble("normalPrice"));
				p.setMemberPrice(rs.getDouble("memberPrice"));
				p.setPdate(rs.getTimestamp("pdate"));
				p.setCategoryId(rs.getInt("categoryId"));
				p.setCategory(CategoryDAO.loadById(rs.getInt("categoryId")));
				list.add(p);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DB.closeRs(rs);
			DB.closeConn(conn);
		}
		return totalPages;
	}



}
