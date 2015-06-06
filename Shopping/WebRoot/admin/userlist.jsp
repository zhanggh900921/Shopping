<%@ page language="java" import="java.util.*" pageEncoding="gbk"%>
<%@ include file="_sessioncheck.jsp" %>
<%@ page import="user.*" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<% List<User> users = UserManager.getUser(); %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>用户列表</title>
    
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
    <table align="center" border="1">
    	<tr>
    		<td>ID</td>
    		<td>用户名</td>
    		<td>密码</td>
    		<td>电话</td>
    		<td>地址</td>
    		<td>注册日期</td>
    		<td>处理</td>
    	</tr>
    	<%for(Iterator<User> it=users.iterator();it.hasNext();) { 
    		User u = it.next();
    	%>
    		<tr>
    		<td><%=u.getId() %></td>
    		<td><%=u.getUsername() %></td>
    		<td><%=u.getPassword() %></td>
    		<td><%=u.getPhone() %></td>
    		<td><%=u.getAddr() %></td>
    		<td><%=u.getRdate() %></td>
    		<td><a href="admin/userdelete.jsp?id=<%=u.getId()%>" target="detail">删除</a></td>
    	</tr>
    	<%} %>
    </table>
  </body>
</html>
