<%@ page import="user.*" %>
<%@ page language="java" import="java.util.*" pageEncoding="gbk"%>
<%
	User u = (User)session.getAttribute("user");
	if(u == null) {
		out.println("�û�������");
		response.sendRedirect("login.jsp");
		return;
	}
%>