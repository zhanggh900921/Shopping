<%@ page language="java" import="java.util.*" pageEncoding="GB18030"%>
<%@ page import="product.*" %>


<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<%
String strId = request.getParameter("id");
String image = request.getParameter("image");
Product p = null;
if(strId != null || !strId.equals("")) {
	int id = Integer.parseInt(strId);
	p = ProductManager.getInstance().loadById(id);
}
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'UserList.jsp' starting page</title>
    
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
    <table border=1>
    	<tr>
    	<img src="front/images/<%=image %>.jpg" alt="<%=p.getName() %>>" />
    	</tr>
    	<tr>
    		<td>产品ID</td>
    		<td>产品名称</td>
    		<td>产品描述</td>
    		<td>售价</td>
    		<td>会员价</td>
    		<td>操作</td>
    	</tr>
    	<tr>
    		<td><%=p.getId() %></td>
    		<td><%=p.getName() %></td>
    		<td><%=p.getDescr()%></td>
    		<td><%=p.getNormalPrice() %></td>
    		<td><%=p.getMemberPrice()%></td>
    		<td><a href="front/buy.jsp?id=<%=p.getId()%>">我要订购</a></td>
    	</tr>
    </table>
    </center>
    <div align="center">
        	<a href="front/index.jsp">首页</a>
    </div>
   
  </body>
</html>