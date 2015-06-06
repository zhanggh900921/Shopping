<%@ page import="user.*" %>
<%@ page language="java" import="java.util.*" pageEncoding="gbk"%>
<%
	User u = (User)session.getAttribute("user");
	if(u == null) {
		out.println("用户不存在");
		response.sendRedirect("login.jsp");
		return;
	}
%>