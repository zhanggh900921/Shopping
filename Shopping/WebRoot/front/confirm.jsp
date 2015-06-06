<%@ page language="java" import="java.util.*" pageEncoding="GB18030"%>
<%@ page import="product.*,cart.*,user.*" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<%
User u = (User)session.getAttribute("user");
if(u == null) {
%>
<center>
<%
	out.println("您没有登录，商品将按原价出售，您也可以免费注册<br/> <a href='register.jsp'>免费注册</a>");
	out.println("<a href='login.jsp'>请您登录</a>");
	session.setAttribute("confirm","true");
}
%>
</center>

<%
Cart cart = (Cart)session.getAttribute("cart");
List<CartItem> list = cart.getCartItems();
Product p = null;
CartItem ci = null;
%>
<center>
  <table border=1>
	  <tr>
	  	<td>产品Id:</td>
	  	<td>产品名称:</td>
	  	<td>产品价格(<%=u == null ? "市场价":"会员价" %>):</td>
	  	<td>产品数量:</td>
	  </tr>
	  <% for(Iterator<CartItem> it = list.iterator();it.hasNext() ;) {
	  		ci = it.next();
	  		p = ProductManager.getInstance().loadById(ci.getProductId()) ;
	  		if(u != null) {
	  			ci.setProductPrice(p.getMemberPrice());
	  		}
	  		
	  %>
	  
	  <tr>
	  	<td><%=ci.getProductId() %></td>
	  	<td><%=ci.getProductName() %></td>
	  	<td><%=u==null?p.getNormalPrice():p.getMemberPrice()%></td>
	  	<td><%=ci.getCount()%></td>
	  </tr>
	  <%} %>
	  
	  
  </table>
  	共:<%=u==null?cart.getTotalPrice():p.getMemberPrice()*ci.getCount()%>元
  	
  	<form action="order.jsp" method="post">
  	<%if( u != null) { %>
  	欢迎光临<%=u.getUsername() %><br/>
  	送货地址:
  	<textarea rows="" cols="" name="addr"><%=u.getAddr()%>
  	</textarea>
  	<%} else { %>
  	送货地址:
  	<textarea rows="" cols="" name="addr">
  	</textarea>
  	<%} %>
  	<input type="submit" value="下单" />
  	</form>
</center>