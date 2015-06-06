<%@ page language="java" import="java.util.*" pageEncoding="gbk"%>
<%@ page import="category.*" %>
<%@ include file="_sessioncheck.jsp" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<%
request.setCharacterEncoding("gbk");
String action = request.getParameter("action");
String name=null;
String descr=null;
int id=0;

if(action==null) {
	id = Integer.parseInt(request.getParameter("id"));
	Category c = Category.loadById(id);
	name = c.getName();
	descr =c.getDescr();
	
}



if(action != null && action.equals("add")) {
	id = Integer.parseInt(request.getParameter("id"));
	name=request.getParameter("name");
	descr=request.getParameter("descr");
	
	Category.changeCategory(id, name, descr);
	out.println(name+"类别修改成功");
	return;
	}
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'categoryadd.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<!-- <script type="text/javascript" src="admin/script/base.js"></script>    
	<script type="text/javascript" src="admin/script/checked.js"></script>  -->

  </head>
  
  <body>
	    <center>
	 	<font color="green"> 修改类别信息</font>
	  <form action="admin/categorychange.jsp?id=<%=id %>" target="detail" method="post" name="myform">
	  <input type="hidden" name="action" value="add" />
	  	<table border=1>
	  		<tr>
	  			<td>
	  				类别名称：
	  			</td>
	  			<td>
	  				<input name = "name" type="text" size="20" value=<%= name %> />
	  			</td>
	  		</tr>
	  		<tr>
	  			<td>
	  				类别描述：
	  			</td>
	  			<td>
	  				<textarea rows="3" cols="20" name="descr" ><%= descr %></textarea>
	  			</td>
	  		</tr>
	  		<tr>
	  			<td>
	  				<input type="submit" value="修改"/>
	  			</td>
	  		</tr>
	  	</table>
	  </form>
	  
	  </center>
  </body>
</html>
