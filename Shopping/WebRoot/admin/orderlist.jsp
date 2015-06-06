<%@ page language="java" import="java.util.*" pageEncoding="gbk"%>
<%@ page import="cart.*" %>
<%@ page import="order.*" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<%!
	private static final int PAGESIZE = 4;
 %>
 
 <%
	int totalPage=0, pageNo=1;
 	
 	List<SaleOrder> orders = null;
	

 	String strPN= request.getParameter("pageNo");
 	
 	if(strPN!=null){
 		pageNo = Integer.parseInt(strPN);
 		if(pageNo<1) {
 			pageNo=1;
 		}
 		
 		orders=new ArrayList<SaleOrder>();

		totalPage = OrderManager.getInstance().getSaleOrder(orders, pageNo, PAGESIZE);
		
		if(pageNo>totalPage) {
			pageNo=totalPage;
		}
		
 	}
 	else {
 		orders=new ArrayList<SaleOrder>();

	totalPage = OrderManager.getInstance().getSaleOrder(orders, pageNo, PAGESIZE);
 	}
 	
 	
 	
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
    		<td  valign="middle" align="center" colspan="9">订单列表</td>
    	</tr>
    	<tr>
    		<td>订单ID</td>
    		<td>订购用户</td>
    		<td>送货地址</td>
    		<td>订购时间</td>
    		<td>订单状态</td>
    		<td>订单详情</td>
    		<td>订单处理</td>
 
    	</tr>
    	<%for(Iterator<SaleOrder> it=orders.iterator();it.hasNext();) {
    		SaleOrder so = it.next();
    	%>
    	<tr>
    		<td><%=so.getId() %></td>
    		<td><%=so.getUser().getUsername() %></td>
    		<td><%=so.getAddr()%></td>
    		<td><%=so.getOdate() %></td>
    		<td><%=so.getStatus()%></td>
    		<td><a href="admin/orderdetailshow.jsp?orderid=<%=so.getId()%>" target="detail">查看详情</a></td>
			<td><a href="admin/orderaction.jsp?status=<%=so.getStatus()%>&orderid=<%=so.getId()%>" target="detail">处理订单</a></td>
    		
    		
    	</tr>
    	<%}%>
    </table>
    <div>
    	<center>
		    <a href="admin/orderlist.jsp?pageNo=<%=pageNo-1 %>">上一页</a> &nbsp
		    <a href="admin/orderlist.jsp?pageNo=<%=pageNo+1 %>">下一页</a> &nbsp
		    <%=pageNo %>/<%=totalPage %>页
    	</center>
    </div>
  </body>
</html>
