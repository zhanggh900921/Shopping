<%@ page language="java" import="java.util.*" pageEncoding="gbk"%>
<%@ page import="user.*" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<%
	String action = request.getParameter("action");
	if(action!=null && action.equals("log")) {
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		User u = null;
		try {
			 u = UserManager.userExist(username,password) ;
		} catch (UserNotFoundException e) {
			out.print("用户名不存在!!!");
			return ;
		} catch (PasswordErrException e) {
			out.print("密码错误!");
			return;
		}
		session.setAttribute("user",u);
		response.sendRedirect("index.jsp");
		}
 %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>login.jsp</title>
    
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
  <form name="myform" action="front/login.jsp" method="post">
  <input type="hidden" name="action" value="log">
    <table align="center">
    	<tr height="20"><td></td><td></td></tr>
    	<tr><td></td><td>用户登录</td></tr>
    	<tr height="20"><td></td><td></td></tr>
    	<tr><td>用户名</td><td><input type="text" name="username" ></td></tr>
    	<tr height="20"><td></td><td></td></tr>
    	<tr><td>密码</td><td><input type="password" name="password" ></td></tr>
    	<tr height="20"><td></td><td></td></tr>
    	<tr><td><input type="submit" value="进入"></td><td><input type="reset" value="重置"></td></tr>
    </table>
   </form>
  </body>
</html>