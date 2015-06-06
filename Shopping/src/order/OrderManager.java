package order;

import java.util.*;

import cart.CartItem;

public class OrderManager {
	
	private static OrderMysqlDAO dao = null;
	
	private static OrderManager om = null;
	
	private OrderManager() {}
	
	static {
		if(om == null) {
			om = new OrderManager();
			om.setDao(new OrderMysqlDAO());
		}
	}
	
	public void addOrder(SaleOrder order) {
		dao.addOrder(order);
	}
	
	public static OrderManager getInstance() {
		return om;
	}
	
	public OrderMysqlDAO getDao() {
		return dao;
	}

	public void setDao(OrderMysqlDAO dao) {
		this.dao = dao;
	}
	
	public int getSaleOrder(List<SaleOrder> orders,int pageNum,int pageSize) {
		
		return dao.getSaleOrder(orders,pageNum,pageSize);
	}
	
	public List<CartItem> getCartItem(int orderId) {
		return dao.getCartItem(orderId);
	}
	
	public void updateStatus(int orderId,int status) {
		dao.updateStatus(orderId,status);
	}
}
