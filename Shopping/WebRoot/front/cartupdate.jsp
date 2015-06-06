<%@ page language="java" import="java.util.*" pageEncoding="GB18030"%>
<%@ page import="product.*,cart.*" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<jsp:useBean id="cart" class="cart.Cart" scope="session"></jsp:useBean>

<%
List<CartItem> list = cart.getCartItems();
for(int i=0;i<list.size();i++) {
	CartItem ci = list.get(i);
	String strCount = request.getParameter("p" + ci.getProductId());
	if(strCount != null && !strCount.trim().equals("")) {
		int count = Integer.parseInt(strCount);
		ci.setCount(count);
	}
}
%>

<center>
修改成功~~~
</center>
<font color="green"><span id="num">3</span></font>秒之后自动跳转到购物车页面

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
delayURL("cart.jsp");
</script>

