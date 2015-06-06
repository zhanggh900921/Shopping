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
    		<td  valign="middle" align="center" colspan="9">�����б�</td>
    	</tr>
    	<tr>
    		<td>����ID</td>
    		<td>�����û�</td>
    		<td>�ͻ���ַ</td>
    		<td>����ʱ��</td>
    		<td>����״̬</td>
    		<td>��������</td>
    		<td>��������</td>
 
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
    		<td><a href="admin/orderdetailshow.jsp?orderid=<%=so.getId()%>" target="detail">�鿴����</a></td>
			<td><a href="admin/orderaction.jsp?status=<%=so.getStatus()%>&orderid=<%=so.getId()%>" target="detail">������</a></td>
    		
    		
    	</tr>
    	<%}%>
    </table>
    <div>
    	<center>
		    <a href="admin/orderlist.jsp?pageNo=<%=pageNo-1 %>">��һҳ</a> &nbsp
		    <a href="admin/orderlist.jsp?pageNo=<%=pageNo+1 %>">��һҳ</a> &nbsp
		    <%=pageNo %>/<%=totalPage %>ҳ
    	</center>
    </div>
  </body>
</html>
