package cart;
//һ�����ӣ������Ѿ����ڵ�cartitem��count+1�����ڲ����ڵ�add��������
import java.util.ArrayList;
import java.util.List;

public class Cart {
	List<CartItem> cartItems = new ArrayList<CartItem>();

	public List<CartItem> getCartItems() {
		return cartItems;
	}

	public void setCartItems(List<CartItem> cartItems) {
		this.cartItems = cartItems;
	}
	
	public void addCartItem(CartItem ci) {
		for(int i=0;i<cartItems.size();i++) {
			CartItem cartItem = cartItems.get(i);
			if(cartItem.getProductId() == ci.getProductId()) {
				cartItem.setCount(cartItem.getCount() + 1);
				return;
			}
		}
		cartItems.add(ci);
	}
	
	public double getTotalPrice() {
		double totalPrice = 0.0;
		for(int i=0;i<cartItems.size();i++) {
			CartItem cartItem = cartItems.get(i);
			totalPrice += cartItem.totalPrice();
		}
		return totalPrice;
	}
}
