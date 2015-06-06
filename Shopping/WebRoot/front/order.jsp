<%@ page language="java" import="java.util.*,java.sql.*" pageEncoding="GB18030"%>
<%@ page import="user.*" %>
<%@ page import="order.*" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<jsp:useBean id="cart" class="cart.Cart" scope="session"></jsp:useBean>


<%
User u = (User)session.getAttribute("user");
if(u == null) {
	u = new User();
	u.setId(-1);
}
%>

<%
String addr = new String(request.getParameter("addr").getBytes("ISO8859-1"),"GBK");
SaleOrder so = new SaleOrder();
so.setAddr(addr);
so.setUser(u);
so.setOdate(new Timestamp(System.currentTimeMillis()));
so.setStatus(0);
so.setCart(cart);
so.save();

session.removeAttribute("cart");
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'order.jsp' starting page</title>
    
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
	谢谢光临本店~~~	
	<font color="green"><span id="num">3</span></font>秒之后自动跳转到主页
	</center>
	
	<script language="JavaScript1.2" type="text/javascript">
	
	function delayURL(url) {
		var leftTime = document.getElementById("num").innerHTML;
		//alert(leftTime);
		
		if(leftTime > 0) {
			leftTime --;
			document.getElementById("num").innerHTML = leftTime;
		}
		else {
			document.location.href = url;
		}
	    setTimeout("delayURL('" + url + "')", 1000);
	}
	
	
	
	</script>
	<script language="javascript">
	delayURL("index.jsp");
	</script>

  </body>
</html>
