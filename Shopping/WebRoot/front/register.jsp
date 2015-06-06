<%@page import="java.sql.Timestamp"%>
<%@ page language="java" import="java.util.*" pageEncoding="gbk"%>

<%@ page import="user.User" %>
<%@ page import="database.DB" %>
<%@ page import="java.sql.*" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<%
request.setCharacterEncoding("gbk");
String action = request.getParameter("action");
if(action != null && action.equals("register")) {
	String username = request.getParameter("username");
	String password = request.getParameter("pwd");
	String phone = request.getParameter("phone");
	String addr = request.getParameter("addr");
	
	User u = new User();
	u.setUsername(username);
	u.setPassword(password);
	u.setPhone(phone);
	u.setAddr(addr);
	u.setRdate(new Timestamp(System.currentTimeMillis()));
	u.save(); 
	out.println("恭喜恭喜啊，你注册成功啦！");
	return;
	}

	%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>表单</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">

<link rel="stylesheet" type="text/css" href="front/style/index.css" />
<script type="text/javascript" src="front/script/base.js"></script>    <!--库文件要在最前面被引用-->
<script type="text/javascript" src="front/script/checked.js"></script>

</head>

<body>

	<form name="myform" action="front/register.jsp" method="post">
	<input type="hidden" name="action" value="register"/>
	<table width="750" align="center" border="2">
				<tr>
					<td colspan="2" align="center">用户注册</td>
				</tr>
				<tr>
					<td>用户名：</td>
					<td>
						<input type=text name="username"  size="30" maxlength="20" >
						<div id="error1"></div>
					</td>
				</tr>
				<tr>
					<td>密码：</td>
					<td>
						<input type=password name="pwd" size="15" maxlength="12">
						<div id="error2"></div>
					</td>
				</tr>
				<tr>
					<td>密码确认</td>
					<td>
						<input type=password name="pwd2" size="15" maxlength="12">
						<div id="error3"></div>
					</td>
				</tr>
				
				<tr>
					<td>电话</td>
					<td>
						<input type="text" name="phone" size="15" maxlength="12">
						<div id="error5"></div>
					</td>
				</tr>
				
				<tr>
					<td>地址</td>
					<td>
						<textarea rows="12" cols="80" name="addr" wrap="hard"></textarea>
						<div id="error4"></div>
					</td>
				</tr>
				
				<tr>
					<td></td>
					<td>
						<input type="submit" value="提交">
						<input type="reset" value="重置">
					</td>
				</tr>
				
			</table>
	</form>
</body>
</html>

