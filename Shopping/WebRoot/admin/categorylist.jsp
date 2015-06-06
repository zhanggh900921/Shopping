<%@ page language="java" import="java.util.*" pageEncoding="gbk"%>
<%@ page import="category.*" %>
<%@ include file="_sessioncheck.jsp" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<%
request.setCharacterEncoding("gbk");
List<Category> categories = Category.getCategories();
 %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'categorylist.jsp' starting page</title>
    
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
    <table border = 1 align = "center">
    	<tr>
			<th  colspan = 7 align = "center">类别列表</th>
		</tr>
		<tr>
			<td width="50">ID</td>
			<td width="50">Pid</td>
			<td>Name</td>
			<td width="100">Descr</td>
			<td width="50">isleaf</td>
			<td width="50">Grade</td>
			<td width="150" align="center">处理</td>
		</tr>
		
			<%for(Iterator<Category> it = categories.iterator();it.hasNext();) { 
				Category c = it.next();
				String preStr = "";
				for(int i=1;i<c.getGrade();i++) {
					preStr +="----";
				}
			%>
		<tr>
				<td ><%=c.getId() %></td>
				<td ><%=c.getPid() %></td>
				<td ><%=preStr + c.getName() %></td>
				<td ><%=c.getDescr()%></td>
				<td ><%=c.isLeaf() == true?0:1 %></td>
				<td ><%=c.getGrade()%></td>
				<td>
					<a href="admin/categorychange.jsp?id=<%=c.getId()%>" >修改</a> &nbsp
					<a href="admin/categorydelete.jsp?id=<%=c.getId()%>&pid=<%=c.getPid()%>" target="detail">删除</a> &nbsp 
					<a href="admin/categoryaddchild.jsp?pid=<%=c.getId()%>" >添加子列表</a>
				</td>
		</tr>
			<%} %>
		
		
    </table>
  </body>
</html>
