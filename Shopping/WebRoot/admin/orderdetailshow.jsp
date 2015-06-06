<%@ page language="java" import="java.util.*" pageEncoding="gbk"%>
<%@ page import="cart.*" %>
<%@ page import="order.*" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>


 
 <%
 	int orderId =Integer.parseInt(request.getParameter("orderid"));
 	
 	List<CartItem> items = null;

	items = OrderManager.getInstance().getCartItem(orderId);
		
 	
 	
 	
 %>



<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'productlist.jsp' starting page</title>
    
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
    <table border=1 align="center">
    	<tr>
    		<td  valign="middle" align="center" colspan="9">订单详情</td>
    	</tr>
    	<tr>
    		<td>产品ID</td>
    		<td>产品名称</td>
    		<td>单价</td>
    		<td>数量</td>
    		
 
    	</tr>
    	<%for(Iterator<CartItem> it=items.iterator();it.hasNext();) {
    		CartItem si = it.next();
    	%>
    	<tr>
    		<td><%=si.getProductId() %></td>
    		<td><%=si.getProductName() %></td>
    		<td><%=si.getProductPrice()%></td>
    		<td><%=si.getCount() %></td>
    		    		
    		
    	</tr>
    	<%}%>
    </table>
  </body>
</html>