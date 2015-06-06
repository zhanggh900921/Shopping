<%@ page language="java" import="java.util.*" pageEncoding="gbk"%>
<%@ page import="category.*" %>
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
    
    <title>My JSP 'productsearch.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<script type="text/javascript" src="admin/script/base.js"></script>    <!--���ļ�Ҫ����ǰ�汻����-->
	<script type="text/javascript" src="admin/script/searchchecked.js"></script>

  </head>
  
  <body>
  
	 
	  	<form action="admin/simplesearchresult.jsp" method="get">
	  		<input type="hidden" name="action" value="simplesearch"/>
	  		<table border="1" align="center">
	  		<tr><td>������</td></tr>
	  			<tr><td>CategoryID:</td></tr>
		  		 <%for(Iterator<Category> it = categories.iterator();it.hasNext();) { 
		  		 		Category c = it.next();%>
		  		 		
		  		 <tr><td>	
		  		 	<%if(c.isLeaf()) {%>		  		 
		  			<input type="checkbox" name="categoryId" value="<%=c.getId()%>"/>
			  			<%} %>
			  			<%=c.getName() %>
			  	</td></tr>
			  			
			  	<%} %>
			  	<tr><td><input type="submit" value="����"/></td></tr>
	  		</table>	  		 
		  	
	  	</form>
	  
  
    <form name = "complex" action = "admin/searchresult.jsp" method = "get">
	<input type="hidden" name="action" value="complexsearch"/>
	<table align = "center" width="80%" border="1">
		<tr>
			<th  colspan = 2 align = "center">��������</th>
		</tr>
		<tr>
			<td>���:</td>
			<td>
				<select name="categoryId">
				<option value="0">ȫ������</option>
				<%for(Iterator<Category> it = categories.iterator();it.hasNext();) {
					Category c = it.next();
					String pStr = "";
					for(int i=1;i<c.getGrade();i++) {
						pStr += "--";
					}
				%>
				<option value="<%=c.getId()%>"><%=pStr + c.getName()%></option>
				<%
				} %>
				</select>
		  	</td>
		</tr>
		<tr>
			<td>�ؼ��ʣ�</td>
			<td>
			<input type="text" name="keyword" size="20"/>
	  		</td>
		</tr>
		<tr>
			<td>�ۼۣ�</td>
			<td>
				From :<input type="text" name="lowNormalPrice" size="20"/>
		  	</td>
		  	<td>
				To :<input type="text" name="highNormalPrice" size="20" />
		  	</td>
		</tr>
		<tr>
			<td>��Ա�ۣ�</td>
			<td>
				From :<input type="text" name="lowMemberPrice" size="20"/>
		  	</td>
		  	<td>
				To :<input type="text" name="highMemberPrice" size="20"/>
		  	</td>
		</tr>
		<tr>
			<td>�������ڣ�</td>
			<td>
				From :<input type="text" name="startPdate" size="20"/>
		  	</td>
		  	<td>
				To :<input type="text" name="endPdate" size="20" />
		  	</td>
		</tr>
		<tr>
		<td>
			<input type = "submit" value="����" size="10"/>
		</td>
		</tr>
	</table>
	</form>
  </body>
</html>
