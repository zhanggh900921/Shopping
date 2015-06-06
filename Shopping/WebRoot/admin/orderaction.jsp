<%@page import="order.OrderManager"%>
<%@page import="order.OrderMysqlDAO"%>
<%@ page language="java" import="java.util.*" pageEncoding="gbk"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<%	
	
	int orderId =Integer.parseInt(request.getParameter("orderid"));
	String strStatus = request.getParameter("status");
	
	int status =Integer.parseInt(strStatus);
	OrderManager.getInstance().updateStatus(orderId, status);
	
 %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'orderaction.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<!-- <script type="text/javascript" src="admin/script/base.js"></script>    
	<script type="text/javascript" src="admin/script/checked.js"></script>   -->
  </head>
  
  <body>
    <form name="myform" action="admin/orderaction.jsp?orderid=<%=orderId %>" method="post" onsubmit="window.parent.main.document.location.reload()">
    	<table align="center" border="1">
    		<tr><td>处理订单</td></tr>
    		<tr><td>
    			<select name="status">
    				<option value=0 <%=status==0?"selected":""%>>未处理</option>
    				<option value=1 <%=status==1?"selected":""%>>已处理</option>
    				<option value=2 <%=status==2?"selected":""%>>废单</option>
    			</select>
    		</td></tr>
    		<tr><td><input type="submit" value="确定"></td></tr>
    	</table>
    </form>
  </body>
</html>
