<%
String login = (String)session.getAttribute("admin");
if(login == null || !login.equals("true")) {
	response.sendRedirect("login.jsp");
}
%>