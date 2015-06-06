<%@ page language="java" import="java.util.*,java.sql.*" pageEncoding="GBK"%>
<%@ page import="product.*" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%
//request.setCharacterEncoding("GBK");
response.setCharacterEncoding("gbk");
//int totalPages = 0;
String action = request.getParameter("action");
if(action != null && action.equals("simplesearch")) {

	int pageNo = 1;
	String strpageNo = request.getParameter("pageNo");
	if(strpageNo != null && !strpageNo.trim().equals("")) {
		pageNo = Integer.parseInt(strpageNo);
		if(pageNo < 1) pageNo = 1;
	}
	//���������ֵ
	String[] strCategoryIds = request.getParameterValues("categoryId");
	//System.out.println(" ֵ = " + strCategoryIds[0]);
	int[] categoryIds = new int[strCategoryIds.length];
	
	//���ݵĲ���
	String linkIds = "";
	
	if(strCategoryIds != null && strCategoryIds.length !=0) {
	
		for(int i=0;i<strCategoryIds.length;i++) {
			linkIds += "&categoryId=" + strCategoryIds[i];
		}
	
		for(int i=0;i<strCategoryIds.length;i++) {
			categoryIds[i] = Integer.parseInt(strCategoryIds[i]); 
		}
	}
	
	//System.out.println(linkIds);

	List<Product> products = new ArrayList<Product>();
	
	int totalPages = ProductManager.getInstance().findProducts(products,null,-1,-1,
											-1,-1,null,
											null,categoryIds,pageNo,4);
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
    		<td>����</td>
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
    		<td>
    		<a href="productdelete.jsp?id=<%=p.getId()%>" target="detail">ɾ��</a>
    		<a href="productmodify.jsp?id=<%=p.getId()%>" target="detail">����</a>
    		</td>
    	</tr>
    	<%}%>
    </table>
    
   	��ǰ����ҳ��:<%=pageNo %>/<%=totalPages %>
    <a href="simplesearchresult.jsp?action=<%=action%>&pageNo=<%=pageNo-1%><%=linkIds%>">��һҳ</a>
    <a href="simplesearchresult.jsp?action=<%=action%>&pageNo=<%=pageNo+1%><%=linkIds%>">��һҳ</a>
</center>
<%
}
%>