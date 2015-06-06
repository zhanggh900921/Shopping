<%@ page language="java" import="java.util.*" pageEncoding="gbk"%>
<%@ page import="product.*,cart.*,user.*" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%
/*
Cart cart = (Cart)session.getAttribute("cart");
if(cart == null) {
	cart = new Cart();
	session.setAttribute("cart",cart);
}
*/
%>

<jsp:useBean id="cart" class="cart.Cart" scope="session"></jsp:useBean>
<!-- 将篮子保存到session中，session的典型应用 -->
<%
User u = (User)session.getAttribute("user");
String strId = request.getParameter("id");
int count = 1;
Product p = null;
CartItem ci = new CartItem();
if(strId != null || !strId.equals("")) {
	int id = Integer.parseInt(strId);
	p = ProductManager.getInstance().loadById(id);
	ci.setProductId(id);
	ci.setProductName(p.getName());
	ci.setCount(count);
	ci.setProductPrice(u == null? p.getNormalPrice() : p.getMemberPrice());
	cart.addCartItem(ci);
}
response.sendRedirect("cart.jsp");

%>