<%@ page language="java" import="java.util.*" pageEncoding="GB18030"%>
<%@ page import="product.*,cart.*,user.*" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<%
Cart cart = (Cart)session.getAttribute("cart");
List<CartItem> list=null;
if(cart!=null) {
list = cart.getCartItems();
}
else {
	out.println("���ﳵ��û���κ���Ʒ���뷵��<a href='index.jsp'>��ҳ</a>");
	return;
}

%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>cart</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
  <center>
  <font size="5" color="red">���ﳵ</font>
  <form action="front/cartupdate.jsp" method="post">
  <table border=1>
	  <tr>
	  	<td>��ƷId:</td>
	  	<td>��Ʒ����:</td>
	  	<td>��Ʒ�۸�:</td>
	  	<td>��Ʒ����:</td>
	  </tr>
	  <% for(Iterator<CartItem> it = list.iterator();it.hasNext() ;) {
	  		CartItem ci = it.next();
	  		
	  %>
	  <tr>
	  	<td><%=ci.getProductId() %></td>
	  	<td><%=ci.getProductName() %></td>
	  	<td><%=ci.getProductPrice()%></td>
	  	<td><input type="text" name="<%="p"+ci.getProductId()%>" value="<%=ci.getCount()%>" size="4"/></td>
	  </tr>
	  <%} %>
  </table>
  	��:<%=cart.getTotalPrice()%>Ԫ
  <input type="submit" value="ȷ���޸�"/>
  <input type="button" value="ȷ��֧��" onclick="document.location.href='confirm.jsp'"/>
  </form>
  </center>
   <div align="center">
        	<a href="front/index.jsp">��ҳ</a>
    </div>
  </body>
</html>