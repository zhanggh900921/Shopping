<%@ page language="java" import="java.util.*" pageEncoding="gbk"%>
<%@ include file="_sessioncheck.jsp"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'selfservice.jsp' starting page</title>
    
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
  		 <tr><td>用户自助服务</td></tr>
  		 <tr><td><a href="front/usermodify.jsp">修改个人信息</a></td></tr>
  		 <tr><td><a href="front/passwordmodify.jsp">修改密码</a></td></tr>
  	</table>
   
  </body>
</html>
