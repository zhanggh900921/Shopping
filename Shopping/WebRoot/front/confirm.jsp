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
	out.println("��û�е�¼����Ʒ����ԭ�۳��ۣ���Ҳ�������ע��<br/> <a href='register.jsp'>���ע��</a>");
	out.println("<a href='login.jsp'>������¼</a>");
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
	  	<td>��ƷId:</td>
	  	<td>��Ʒ����:</td>
	  	<td>��Ʒ�۸�(<%=u == null ? "�г���":"��Ա��" %>):</td>
	  	<td>��Ʒ����:</td>
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
  	��:<%=u==null?cart.getTotalPrice():p.getMemberPrice()*ci.getCount()%>Ԫ
  	
  	<form action="order.jsp" method="post">
  	<%if( u != null) { %>
  	��ӭ����<%=u.getUsername() %><br/>
  	�ͻ���ַ:
  	<textarea rows="" cols="" name="addr"><%=u.getAddr()%>
  	</textarea>
  	<%} else { %>
  	�ͻ���ַ:
  	<textarea rows="" cols="" name="addr">
  	</textarea>
  	<%} %>
  	<input type="submit" value="�µ�" />
  	</form>
</center>