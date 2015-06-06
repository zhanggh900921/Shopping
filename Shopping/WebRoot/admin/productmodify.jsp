<%@ page language="java" import="java.util.*" pageEncoding="gbk"%>
<%@ page import="category.*" %>
<%@ page import="product.*" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<%
request.setCharacterEncoding("gbk");

Product p = null;
int id =0;

String action = request.getParameter("action");
if(action != null && action.equals("add")) {
	String name = request.getParameter("name");
	String descr = request.getParameter("descr");
	
	String strNPrice = request.getParameter("normalPrice");
	double normalPrice = 0;
	if(strNPrice == null || strNPrice.equals("")) {
		out.println("���������Ʒ�۸�");
		return;
	}else {
		normalPrice = Double.parseDouble(strNPrice);
	}
	
	String strMPrice = request.getParameter("memberPrice");
	double memberPrice = 0;
	if(strMPrice == null || strMPrice.equals("")) {
		out.println("���������Ʒ��Ա�۸� ");
		return;
	}else {
		memberPrice = Double.parseDouble(strMPrice);
	}
	
	int categoryId = Integer.parseInt(request.getParameter("category"));
	id = Integer.parseInt(request.getParameter("id"));
	
	p = new Product();
	p.setId(id);
	p.setName(name);
	p.setDescr(descr);
	p.setNormalPrice(normalPrice);
	p.setMemberPrice(memberPrice);
	p.setPdate(new java.sql.Timestamp(System.currentTimeMillis()));
	p.setCategoryId(categoryId);
	ProductManager.getInstance().updateProduct(p);
	out.println(name+"�޸ĳɹ�");
	return;
}
else {
	id = Integer.parseInt(request.getParameter("id"));
	p = ProductManager.getInstance().loadById(id);
}
 %>
 
<%
	List<Category> categories = Category.getCategories();
%> 


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'productadd.jsp' starting page</title>
    
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
 	<font color="green"> �޸Ĳ�Ʒ��Ϣ</font>
  <form name="myform" action="admin/productmodify.jsp?id=<%=id %>" method="post" target="detail">
  <input type="hidden" name="action" value="add"/>
  	<table border=1>
  		<tr>
  			<td>
  				��Ʒ���ƣ�
  			</td>
  			<td>
  				<input name = "name" type="text" size="20" value=<%=p.getName() %> />
  			</td>
  		</tr>
  		<tr>
  			<td>
  				��Ʒ������
  			</td>
  			<td>
  				<textarea rows="3" cols="20" name="descr" ><%=p.getDescr() %></textarea>
  			</td>
  		</tr>
  		<tr>
  			<td>
  				�ۼۣ�
  			</td>
  			<td>
  				<textarea rows="3" cols="20" name="normalPrice"><%=p.getNormalPrice() %></textarea>
  			</td>
  		</tr>
  		<tr>
  			<td>
  				��Ա�ۣ�
  			</td>
  			<td>
  				<textarea rows="3" cols="20" name="memberPrice"><%=p.getMemberPrice() %></textarea>
  			</td>
  		</tr>
  		<tr>
  			<td>
  				��Ʒ���ͣ�
  			</td>
  			<td>
 				<select name="category">
 					<%for(Iterator<Category> it=categories.iterator();it.hasNext();) {
	 					Category c = it.next();
						if(c.isLeaf()) { %>
 						<option value=<%=c.getId()%> <%=(c.getId() == p.getCategoryId()) ? "selected" : ""%>><%=c.getName()%></option>
 					<%}} %>
 					
 				</select>		
  			</td>
  		</tr>
  		<tr>
  			<td>
  				<input type="submit" value="�޸�"/>
  			</td>
  		</tr>
  	</table>
  </form>
  </center>
  </body>
</html>
