<%@ page language="java" import="java.util.*,java.sql.*" pageEncoding="GBK"%>
<%@ page import="product.*" %>
<%@ page import="category.*" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%
//request.setCharacterEncoding("GBK");
response.setCharacterEncoding("gbk");
//int totalPages = 0;
String action = request.getParameter("action");
if(action != null && action.equals("complexsearch")) {
	
	List<Category> categorys = null;
	int pageNo = 1;
	String strpageNo = request.getParameter("pageNo");
	if(strpageNo != null && !strpageNo.trim().equals("")) {
		pageNo = Integer.parseInt(strpageNo);
		if(pageNo < 1) pageNo = 1;
	}
	   
	int categoryId = Integer.parseInt(request.getParameter("categoryId"));
	if(categoryId == 0) {
		categorys = Category.getCategories();
	}
	else {
		categorys = Category.getCategories(categoryId);
	}
	
	int[] categoryIds = new int[categorys.size()];
	for(int i=0;i<categorys.size();i++){
		Category c = categorys.get(i);
		categoryIds[i] = c.getId();		
	}
	
	String keyword = new String(request.getParameter("keyword").getBytes("8859_1"),"gbk");
//	System.out.println("keyword = "+keyword);
	double lowNormalPrice = Double.parseDouble(request.getParameter("lowNormalPrice"));
	double highNormalPrice = Double.parseDouble(request.getParameter("highNormalPrice"));
	double lowMemberPrice = Double.parseDouble(request.getParameter("lowMemberPrice"));
	double highMemberPrice = Double.parseDouble(request.getParameter("highMemberPrice"));
	Timestamp startPdate;
	String strStartPdate = request.getParameter("startPdate");
//System.out.println("here");
	if(strStartPdate == null || strStartPdate.trim().equals("")) {
		startPdate = null;
	} else {
		startPdate = Timestamp.valueOf(strStartPdate);
	}
	
	String strEndPdate = request.getParameter("endPdate");
	Timestamp endPdate;
	if(strEndPdate == null || strEndPdate.trim().equals("")) {
		endPdate = null;
	} else {
		endPdate = Timestamp.valueOf(strEndPdate);
	}
	List<Product> products = new ArrayList<Product>();
	
	int totalPages = ProductManager.getInstance().findProducts(products,keyword,lowNormalPrice,highNormalPrice,
											lowMemberPrice,highMemberPrice,startPdate,
											endPdate,categoryIds,pageNo,3);
											
	if (pageNo >= totalPages) pageNo = totalPages;
%>
<center>
	 <table border=1>
    	<tr>
    		<td>ID</td>
    		<td>Name</td>
    		<td>Descr</td>
    		<td>NormalPrice</td>
    		<td>MemeberPrice</td>
    		<td>Pdate</td>
    		<td>CategoryId</td>
    		<td>处理</td>
    	</tr>
    	<%for(Iterator<Product> it=products.iterator();it.hasNext();) {
    		Product p = it.next();
    	%>
    	<tr>
    		<td><%=p.getId() %></td>
    		<td><%=p.getName() %></td>
    		<td><%=p.getDescr()%></td>
    		<td><%=p.getNormalPrice() %></td>
    		<td><%=p.getMemberPrice()%></td>
    		<td><%=p.getPdate() %></td>
            <td><%=p.getCategoryId()%></td>
            <td><%=p.getCategory().getName()%></td>
    		<td>
    		<a href="productdelete.jsp?id=<%=p.getId()%>" target="detail">删除</a>
    		<a href="productmodify.jsp?id=<%=p.getId()%>" >修改</a>
    		</td>
    	</tr>
    	<%}%>
    </table>
    
   	当前所在页面:<%=pageNo %>/<%=totalPages %>
    <a href="searchresult.jsp?action=<%=action%>&categoryId=<%=categoryId%>&pageNo=<%=pageNo-1%>&keyword=<%=keyword%>&lowNormalPrice=<%=lowNormalPrice%>&highNormalPrice=<%=highNormalPrice%>&lowMemberPrice=<%=lowMemberPrice%>&highMemberPrice=<%=highMemberPrice%>&startPdate=<%=strStartPdate%>&endPdate=<%=strEndPdate%>">上一页</a>
    <a href="searchresult.jsp?action=<%=action%>&categoryId=<%=categoryId%>&pageNo=<%=pageNo+1%>&keyword=<%=keyword%>&lowNormalPrice=<%=lowNormalPrice%>&highNormalPrice=<%=highNormalPrice%>&lowMemberPrice=<%=lowMemberPrice%>&highMemberPrice=<%=highMemberPrice%>&startPdate=<%=strStartPdate%>&endPdate=<%=strEndPdate%>">下一页</a>
</center>
<%
}
%>