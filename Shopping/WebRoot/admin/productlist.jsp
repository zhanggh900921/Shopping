<%@ page language="java" import="java.util.*" pageEncoding="gbk"%>
<%@ page import="product.*" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<%!
	private static final int PAGESIZE = 4;
 %>
 
 <%
 	int pageNo=1;
 	int totalPage=1;
 	
 	List products=null;
 	products = new ArrayList();
	totalPage = ProductManager.getInstance().getProduct(products, pageNo, PAGESIZE);
	
 	String strPN= request.getParameter("pageNo");
 	
 	if(strPN!=null){
 		pageNo = Integer.parseInt(strPN);
 		if(pageNo<1) {
 			pageNo=1;
 		}
 		
 		products = new ArrayList();
		totalPage = ProductManager.getInstance().getProduct(products, pageNo, PAGESIZE);
		
		if(pageNo>totalPage) {
			pageNo=totalPage;
		}
		
 	}
 	else {
 		products = new ArrayList();
		totalPage = ProductManager.getInstance().getProduct(products, pageNo, PAGESIZE);
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
    		<td  valign="middle" align="center" colspan="9">产品列表</td>
    	</tr>
    	<tr>
    		<td>ID</td>
    		<td>产品名称</td>
    		<td>产品描述</td>
    		<td>售价</td>
    		<td>会员价</td>
    		<td>进货日期</td>
    		<td>类别ID</td>
    		<td>类别名称</td>
    		<td>处理</td>
    	</tr>
    	<%for(Iterator<Product> it=products.iterator();it.hasNext();) {
    		Product p = it.next();
    	%>
    	<tr>
    		<td><%=p.getId() %></td>
    		<td><%=p.getName() %></td>
    		<td><%=p.getDescr()%></td>
    		<td><%=p.getNormalPrice() %></td>
    		<td><%=p.getMemberPrice()%></td>
    		<td><%=p.getPdate() %></td>
            <td><%=p.getCategoryId()%></td>
            <td><%=p.getCategory().getName()%></td>
    		<td>
    		<a href="admin/productdelete.jsp?id=<%=p.getId()%>" target="detail">删除</a> &nbsp
    		<a href="admin/productmodify.jsp?id=<%=p.getId()%>" >更改</a>
    		</td>
    		
    	</tr>
    	<%}%>
    </table>
    <div>
    	<center>
		    <a href="admin/productlist.jsp?pageNo=<%=pageNo-1 %>">上一页</a> &nbsp
		    <a href="admin/productlist.jsp?pageNo=<%=pageNo+1 %>">下一页</a> &nbsp
		    <%=pageNo %>/<%=totalPage %>页
    	</center>
    </div>
  </body>
</html>
