<%@ page language="java" import="java.util.*" pageEncoding="gbk"%>
<%@ page import="category.*" %>
<%@ include file="_sessioncheck.jsp" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%
	request.setCharacterEncoding("gbk");
	int pid = Integer.parseInt(request.getParameter("pid"));
	String action = request.getParameter("action");
	if(action!=null && action.equals("add")) {
		String name = request.getParameter("name");
		String descr = request.getParameter("descr");
		Category parent = Category.loadById(pid);
		Category.addChild(pid, name, descr, parent.getGrade());
		out.println(name+"类别添加成功");
		return;
	}
	
 %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'categoryaddchild.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<script type="text/javascript" src="admin/script/base.js"></script>    <!--库文件要在最前面被引用-->
	<script type="text/javascript" src="admin/script/checked.js"></script>
  </head>
   <center>
	 	<font color="green"> 添加子节点</font>
	  <form action="admin/categoryaddchild.jsp" target="detail" method="post" name="myform">
	  <input type="hidden" name="action" value="add"/>
	  <input type="hidden" name="pid" value="<%=pid%>"/>
	  	<table border=1>
	  		<tr>
	  			<td>
	  				类别名称：
	  			</td>
	  			<td>
	  				<input name = "name" type="text" size="20"/>
	  			</td>
	  		</tr>
	  		<tr>
	  			<td>
	  				类别描述：
	  			</td>
	  			<td>
	  				<textarea rows="3" cols="20" name="descr"></textarea>
	  			</td>
	  		</tr>
	  		<tr>
	  			<td>
	  				<input type="submit" value="添加"/>
	  			</td>
	  		</tr>
	  	</table>
	  </form>
	  
	  </center>
  </body>
</html>
