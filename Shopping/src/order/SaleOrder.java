package order;
import user.*;

import java.sql.Timestamp;

import cart.Cart;


public class SaleOrder {
	int id;
	User user;
	String addr;
	Timestamp odate;
	int status;
	
	Cart cart;
	
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public String getAddr() {
		return addr;
	}

	public void setAddr(String addr) {
		this.addr = addr;
	}

	public Timestamp getOdate() {
		return odate;
	}

	public void setOdate(Timestamp odate) {
		this.odate = odate;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public Cart getCart() {
		return cart;
	}

	public void setCart(Cart c) {
		this.cart = c;
	}

	public void save() {
		OrderManager.getInstance().addOrder(this);
	}
}
