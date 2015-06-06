<%@page import="java.sql.Timestamp"%>
<%@ page language="java" import="java.util.*" pageEncoding="gbk"%>
<%@ include file="_sessioncheck.jsp"%>

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
	String phone = request.getParameter("phone");
	String addr = request.getParameter("addr");
	
	u.setUsername(username);
	u.setPhone(phone);
	u.setAddr(addr);
	UserManager.userUpdate(u);
	
	out.println("恭喜恭喜啊，你的信息修改成功啦！<a href='selfservice.jsp'>返回</a>");
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

	<form name="myform" action="front/usermodify.jsp" method="post">
	<input type="hidden" name="action" value="register"/>
	<table width="750" align="center" border="2">
				<tr>
					<td colspan="2" align="center">用户信息修改</td>
				</tr>
				<tr>
					<td>用户名：</td>
					<td>
						<input type=text name="username"  size="30" maxlength="20" value=<%=u.getUsername() %>>
						<div id="error1"></div>
					</td>
				</tr>
				
				
				
				<tr>
					<td>电话</td>
					<td>
						<input type="text" name="phone" size="15" maxlength="12" value=<%=u.getPhone() %>>
						<div id="error5"></div>
					</td>
				</tr>
				
				<tr>
					<td>地址</td>
					<td>
						<textarea rows="12" cols="80" name="addr" wrap="hard"><%=u.getAddr() %></textarea>
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


