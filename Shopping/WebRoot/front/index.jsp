<%@ page language="java" import="java.util.*" pageEncoding="gbk"%>
<%@ page import="user.*" %>
<%@ page import="product.*" %>
<%@ page import="category.*" %>
<%@ page import="cart.*" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%
	User u = (User)session.getAttribute("user");
	List<Product> products = ProductManager.getInstance().getProducts();
	List<Category> categorys = Category.getCategories();
 %>
 <%
Cart cart = (Cart)session.getAttribute("cart");
List<CartItem> list=null;
if(cart!=null) {
list = cart.getCartItems();
}

%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>ư���ӻ���</title>
<link rel="stylesheet" type="text/css" href="style/basic.css" />
<script type="text/javascript" src="js/top.js"></script>
<script type="text/javascript" src="js/yu.js"></script>
<script type="text/javascript" src="js/tb.js"></script>
<script type="text/javascript" src="js/text.js"></script>
<script type="text/javascript" src="js/channle.js"></script>
</head>
<body>

<div id="header">
	<embed src="images/logo.swf" wmode="transparent"></embed>
	<dl>
		<dd class="nav1"><a href="###">�ҵ��ӻ���</a></dd>
		<dd class="nav2"><a href="cart.jsp">���ﳵ</a></dd>
		<dd class="nav3"><a href="###">����̨</a></dd>
		<dd class="nav4"><a href="###">�鶩��</a></dd>
		<dd class="nav5"><a href="###">��������</a></dd>
	</dl>
	<%if(u==null) {%>
	<p>[<a href="register.jsp">���ע��</a>] [<a href="login.jsp">��½</a>] [<a href="###">������·</a>]��<strong>����֣�س�ŵ��ȫ����Ʒ,�����ͼۣ�</strong></p>
	<%} 
	else {%>
	<p>[<a href="selfservice.jsp"><%=u.getUsername() %></a>] [<a href="selfservice.jsp">�û���������</a>] [<a href="###">������·</a>]��<strong>����֣�س�ŵ��ȫ����Ʒ,�����ͼۣ�</strong></p>
	<%} %>
	<ul>
		<li><a href="###">��ҳ</a></li>
		<li><a href="###">��ˮ����</a></li>
		<li><a href="###">����ʳƷ</a></li>
		<li><a href="###">����ɻ�</a></li>
		<li><a href="###">�������</a></li>
		<li><a href="###">��ֵ�㿨</a></li>
		<li><a href="###">�������</a></li>
		<li><a href="###">����</a></li>
	</ul>
</div>

<div id="strip">
	<div id="underway">ȫ����Ʒ��10Ԫ���ͣ�</div>
	<div id="search">
		<select name="kind">
			<option>������Ʒ������</option>
			<option>����Ʒ��������</option>
		</select>
		<input name="name" type="text" class="text" />
		<input type="submit" value="" class="submit" />
		<a href="###">[�߼���ѯ]</a>
	</div>
	<div id="hot">
		<ul>
			<li><strong>����������</strong></li>
			<li><a href="#">�ֻ���ֵ</a></li>
			<li><a href="#">�㿨�ۻ���</a></li>
			<li><a href="#">Nike AF1</a></li>
			<li><a href="#">ʥ����װ</a></li>
			<li><a href="#">Mp3</a></li>
			<li><a href="#">Levi's����ţ�п�</a></li>
			<li><a href="#">Zippo</a></li>
			<li><a href="#">ĸӤ����</a></li>
			<li><a href="#">��Ʒ�ļ���</a></li>
			<li><a href="#">����</a></li>
			<li><a href="#">��ʿ�п�</a></li>
		</ul>	
	</div>
</div>
<div id="strip1">Ϊ�˼���IE6.0</div>
<div id="strip2">Ϊ�˼���IE6.0</div>

<div id="adver">
	<img src="images/adv.gif" alt="��ʱ�ؼ�1����" />
</div>

<div id="sidebar">
	<h1 id="logintitle">��Ա��½</h1>
	<div id="login">
		<form name="myform" action="login.jsp" method="get">
			<input type="hidden" name="action" value="log">
			<label for="username">��Ա����</label>
			<input type="text" name="username" id="username" class="text" />
			<label for="password">�ܡ��룺</label>
			<input type="password" name="password" id="password" class="text" />
			<input type="submit" value="" class="submit" />
			<input type="button" value="" class="submit reg" onclick="window.location.href('register.jsp')"/>
		</form>
		<p><a href="###">��������?����������</a></p>
	</div>
	<h1 id="carttitle">���ﳵ</h1>
	<div id="cart">
		<%if(cart!=null) { %>
		<p>���Ĺ��ﳵ������<strong><%=list.size() %></strong>����Ʒ</p>
		<p>�ܼƽ�<strong><%=cart.getTotalPrice() %></strong>Ԫ</p>
		<%} else { %>
		<p>���Ĺ��ﳵ������<strong>0</strong>����Ʒ</p>
		<p>�ܼƽ�<strong>0</strong>Ԫ</p>
		<%} %>
		<p><a href="###">���ﳵ&gt;&gt;</a>��<a href="###">���ɶ���&gt;&gt;</a></p>
		<p><a href="###" class="ba"></a></p>
	</div>
	<h1 class="pro"><em><a href="###">MORE</a></em>�û�����</h1>
	<div id="good">
		<dl>
			<dt><img src="images/high1.jpg" alt="���������˶��糱170Ԫ" /></dt>
			<dd><a href="###">���������˶��糱<strong>170</strong>Ԫ</a></dd>
		</dl>
		<dl>
			<dt><img src="images/high2.jpg" alt="ʱ��Ʒ�ƶ�ͯ��װ80Ԫ" /></dt>
			<dd><a href="###">ʱ��Ʒ�ƶ�ͯ��װ<strong>80</strong>Ԫ</a></dd>
		</dl>
		<dl>
			<dt><img src="images/high3.jpg" alt="M.D.Y����ţ�п�128Ԫ" /></dt>
			<dd><a href="###">M.D.Y����ţ�п�<strong>128</strong>Ԫ</a></dd>
		</dl>
		<dl>
			<dt><img src="images/high4.jpg" alt="���������˶��糱170Ԫ" /></dt>
			<dd><a href="###">����ţ��ԭҺ<strong>280</strong>Ԫ</a></dd>
		</dl>
	</div>
	<h1 class="pro"><em><a href="###">MORE</a></em>�����Ƽ�</h1>
	<div id="hot">
		<dl>
			<dt><img src="images/good1.jpg" alt="�ɰ������೬�ؼ�8.0Ԫ" /></dt>
			<dd><a href="###">�ɰ������೬�ؼ�<strong>8.0</strong>Ԫ</a></dd>
		</dl>
		<dl>
			<dt><img src="images/good2.jpg" alt="���������ܲ�Ь139Ԫ" /></dt>
			<dd><a href="###">���������ܲ�Ь<strong>139</strong>Ԫ</a></dd>
		</dl>
		<dl>
			<dt><img src="images/good3.jpg" alt="�ؼ����½�ָ��ܰ��29Ԫ " /></dt>
			<dd><a href="###">�ؼ����½�ָ��ܰ��<strong>29</strong>Ԫ</a></dd>
		</dl>
	</div>
	<h1 class="pro"><em><a href="###">MORE</a></em>��������</h1>
	<div id="top">
		<ul>
			<li><a href="###">̨�� ���ʿ���(4G)</a></li>
			<li><a href="###">ָ�Ƽ�����B007�ƶ�Ӳ</a></li>
			<li><a href="###">��ŷ�� U5(4G) Mp3</a></li>
			<li><a href="###">���� DP310s�ƶ�Ӳ��</a></li>
			<li><a href="###">���� NW-S710 Mp3</a></li>
			<li><a href="###">���� M5+(1G) Mp3</a></li>
			<li><a href="###">����T200�������</a></li>
			<li class="end"><a href="###">���� NW-S710 Mp3</a></li>
		</ul>
	</div>
	<h1 class="pro"><em><a href="###">MORE</a></em>�̼�չʾ</h1>
	<div id="business">
		<img src="images/company1.gif" alt="��ţ" /> 
		<img src="images/company2.gif" alt="ŵ����" />
		<img src="images/company3.gif" alt="������" />
		<img src="images/company4.jpg" alt="ŷ�Ϸ�" />
		<img src="images/company5.gif" alt="����" />
		<img src="images/company6.gif" alt="����" />
	</div>
</div>

<div id="main">
	<div id="bill">
		<ul class="Slides">
			<li><a href="###"><img src="adver/adver1.jpg"></a></li>
			<li><a href="###"><img src="adver/adver2.jpg"></a></li>
			<li><a href="###"><img src="adver/adver3.jpg"></a></li>
		</ul>
	</div>
	
	<div id="affiche">
		<h1><a href="###">MORE&gt;&gt;</a>�۹�������</h1>
		<div>
			<ul id="sizeup">
				<li><a href="###">�ű������� ����װ����Զ18��</a></li>
				<li><a href="###">4�����̤����һ�װ��10��</a></li>
				<li><a href="###">������˿��Ь��������</a></li>
				<li><a href="###">������������һ�����ɼ�10��! </a></li>
			</ul>
			<img src="images/guide_adv.gif" alt="�������԰�����" />
			<ul id="bull">
				<li>��<a href="###">����ע���Ա���й�������ͼ</a></li>
				<li>��<a href="###">���ͨ����̳�����Լ�����Ʒ</a></li>
				<li>��<a href="###">ʲô�ǳ�ֵ��Ա����ô����λ</a></li>
				<li>��<a href="###">ư���ӻ�����ڿ�չ��ҹ����</a></li>
			</ul>
			<p><a href="###" class="button button1" /></a><a href="###" class="button button2" /></a><a href="###" class="button button3" /></a><a href="###" class="button button4" /></a>
			</p>
		</div>
	</div>
	
	<div id="help">
		<a href="###" class="button button1"></a>
		<a href="###" class="button button2"></a>
		<a href="###" class="button button3"></a>
		<a href="###" class="button button4"></a>
	</div>
	
	<div id="guide">
		<h1>������</h1>
		<div>
			<dl>
				<dt><a href="###"><img src="images/g1.jpg" alt="����T2�����200.00Ԫ" /></a></dt>
				<dd><a href="###">����T2���<strong>��200.00Ԫ</strong></a></dd>
			</dl>
			<dl>
				<dt><a href="###"><img src="images/g2.jpg" alt="��Ʒ��ͯװ��32.8Ԫ" /></a></dt>
				<dd><a href="###">��Ʒ��ͯװ<strong>��32.8Ԫ</strong></a></dd>
			</dl>
			<dl>
				<dt><a href="###"><img src="images/g3.jpg" alt="��������������178Ԫ" /></a></dt>
				<dd><a href="###">������������<strong>��178Ԫ</strong></a></dd>
			</dl>
			<dl>
				<dt><a href="###"><img src="images/g4.jpg" alt="ŵ����YNֻ����978Ԫ" /></a></dt>
				<dd><a href="###">ŵ����YNֻ��<strong>��978Ԫ</strong></a></dd>
			</dl>
			<ul>
				<li><a href="###">����̾����¶�Ŵ���Ů�˱�����˽</a></li>
				<li><a href="###"><span>������������!��ͷë������һɨ��</span></a></li>
				<li><a href="###">����������������� Ů�˱�ױ���!</a></li>
				<li class="end"><a href="###"><span>������������10�ɺ���ȼ����ո�</span></a></li>
			</ul>
			<img src="images/g5.jpg" alt="Ӥ�����" class="right" />
		</div>
	</div>
	
	<div id="special">
		<h1>����ר��</h1>
		<div>
			<a href="###"><img src="images/s1.jpg" alt="��ʳ��Ȼ��ζ��" /></a>
			<a href="###"><img src="images/s2.jpg" alt="����Ҳ�Ը�" /></a>
			<a href="###"><img src="images/s3.jpg" alt="�᲻�������˵ĺ���" /></a>
			<a href="###"><img src="images/s4.jpg" alt="����MP3" /></a>
		</div>
	</div>
	
	<div id="newpro">
		<h1>[�����Ƽ���Ʒ]</h1>
		<div>
			<span id="marquee">
				<dl>
					<dt><img src="images/hot2.jpg" alt="������ȫ��" /></dt>
					<dd>������ȫ��</dd>
					<dd class="color">��ۼۣ�40.00Ԫ</dd>
				</dl>
				<dl>
					<dt><img src="images/hot3.jpg" alt="������ȫ��" /></dt>
					<dd>������ȫ��</dd>
					<dd class="color">��ۼۣ�35.00Ԫ</dd>
				</dl>
				<dl>
					<dt><img src="images/hot4.jpg" alt="�ٱ�Сӣȫ��" /></dt>
					<dd>�ٱ�Сӣȫ��</dd>
					<dd class="color">��ۼۣ�42.00Ԫ</dd>
				</dl>
				<dl>
					<dt><img src="images/hot5.jpg" alt="Ȯҹ��ȫ��" /></dt>
					<dd>Ȯҹ��ȫ��</dd>
					<dd class="color">��ۼۣ�24.00Ԫ</dd>
				</dl>
				<dl>
					<dt><img src="images/hot6.jpg" alt="��������ȫ��" /></dt>
					<dd>��������ȫ��</dd>
					<dd class="color">��ۼۣ�29.00Ԫ</dd>
				</dl>
				<dl>
					<dt><img src="images/hot7.jpg" alt="����̽����ȫ��" /></dt>
					<dd>����̽����ȫ��</dd>
					<dd class="color">��ۼۣ�60.00Ԫ</dd>
				</dl>
				<dl>
					<dt><img src="images/hot8.jpg" alt="��Ӱ����ȫ��" /></dt>
					<dd>��Ӱ����ȫ��</dd>
					<dd class="color">��ۼۣ�39.00Ԫ</dd>
				</dl>
				<dl>
					<dt><img src="images/hot9.jpg" alt="ʥ��ʿ��ʸȫ��" /></dt>
					<dd>ʥ��ʿ��ʸȫ��</dd>
					<dd class="color">��ۼۣ�52.00Ԫ</dd>
				</dl>
				<dl>
					<dt><img src="images/hot.jpg" alt="����ȫ��" /></dt>
					<dd>����ȫ��</dd>
					<dd class="color">��ۼۣ�20.00Ԫ</dd>
				</dl>
				<dl>
					<dt><img src="images/hot10.jpg" alt="�ƶ���ֵ��100" /></dt>
					<dd>�ƶ���ֵ��100</dd>
					<dd class="color">��ۼۣ�99.00Ԫ</dd>
				</dl>
				<dl>
					<dt><img src="images/hot11.jpg" alt="�������һ��ͨ" /></dt>
					<dd>�������һ��ͨ</dd>
					<dd class="color">��ۼۣ�38.00Ԫ</dd>
				</dl>	
				<dl>
					<dt><img src="images/hot12.jpg" alt="ʢ���̿�һ��ͨ" /></dt>
					<dd>ʢ���̿�һ��ͨ</dd>
					<dd class="color">��ۼۣ�44.00Ԫ</dd>
				</dl>	
			</span>
		</div>
	</div>
	
	<div id="channel">
		<h1>
			<ul>
				<li id="channel1" onmouseover="channelkey(1)">Ů��Ƶ��</li>
				<li id="channel2" onmouseover="channelkey(2)">����Ƶ��</li>
				<li id="channel3" onmouseover="channelkey(3)">��������</li>
				<li id="channel4" onmouseover="channelkey(4)">����Ҿ�</li>
				<li id="channel5" onmouseover="channelkey(5)">��������</li>
				<li id="channel6" onmouseover="channelkey(6)">�˶�����</li>
			</ul>
		</h1>
		
		
		<%int i=0,j=0,m=1;
		for(i=0;i<categorys.size();i++) {
			Category c = categorys.get(i);	%>			
			<div id="menucontent<%=i+1 %>" class="menu" style="display:block;">
				<%for(j=0,m=1;j<products.size();j++) {
					Product p = products.get(j);
					if(c.getName().equals("Ů��Ƶ��") && c.getId()==p.getCategoryId() && i==0) {%>
						<dl><a href="productdetail.jsp?id=<%=p.getId()%>&image=w<%=m %>">
							<dt><img src="images/w<%=m++ %>.jpg" alt="<%=p.getName() %>" /></dt>
							<dd><%=p.getDescr() %></dd>
							<dd><font color="blue">�ۼ�<%=p.getNormalPrice() %></font></dd>
							<dd><font color="red">��Ա��<%=p.getMemberPrice() %></font></dd>
							</a>
						</dl>
					<%} %>	
					<%if(c.getName().equals("����Ƶ��") && c.getId()==p.getCategoryId() && i==1) {%>
						<dl><a href="productdetail.jsp?id=<%=p.getId()%>&image=k<%=m %>">
							<dt><img src="images/k<%=m++ %>.jpg" alt="<%=p.getName() %>" /></dt>
							<dd><%=p.getDescr() %></dd>
							<dd><font color="blue">�ۼ�<%=p.getNormalPrice() %></font></dd>
							<dd><font color="red">��Ա��<%=p.getMemberPrice() %></font></dd>
							</a>
						</dl>
					<%} %>	
					<%if(c.getName().equals("��������") && c.getId()==p.getCategoryId() && i==2) {%>
						<dl><a href="productdetail.jsp?id=<%=p.getId()%>&image=y<%=m %>">
							<dt><img src="images/y<%=m++ %>.jpg" alt="<%=p.getName() %>" /></dt>
							<dd><%=p.getDescr() %></dd>
							<dd><font color="blue">�ۼ�<%=p.getNormalPrice() %></font></dd>
							<dd><font color="red">��Ա��<%=p.getMemberPrice() %></font></dd>
							</a>
						</dl>
					<%} %>		
					<%if(c.getName().equals("����Ҿ�") && c.getId()==p.getCategoryId() && i==3) {%>
						<dl><a href="productdetail.jsp?id=<%=p.getId()%>&image=j<%=m %>">
							<dt><img src="images/j<%=m++ %>.jpg" alt="<%=p.getName() %>" /></dt>
							<dd><%=p.getDescr() %></dd>
							<dd><font color="blue">�ۼ�<%=p.getNormalPrice() %></font></dd>
							<dd><font color="red">��Ա��<%=p.getMemberPrice() %></font></dd>
							</a>
						</dl>
					<%} %>	
					<%if(c.getName().equals("��������") && c.getId()==p.getCategoryId() && i==4) {%>
						<dl><a href="productdetail.jsp?id=<%=p.getId()%>&image=d<%=m %>">
							<dt><img src="images/d<%=m++ %>.jpg" alt="<%=p.getName() %>" /></dt>
							<dd><%=p.getDescr() %></dd>
							<dd><font color="blue">�ۼ�<%=p.getNormalPrice() %></font></dd>
							<dd><font color="red">��Ա��<%=p.getMemberPrice() %></font></dd>
							</a>
						</dl>
					<%} %>	
					<%if(c.getName().equals("�˶�����") && c.getId()==p.getCategoryId() && i==5) {%>
						<dl><a href="productdetail.jsp?id=<%=p.getId()%>&image=x<%=m %>">
							<dt><img src="images/x<%=m++ %>.jpg" alt="<%=p.getName() %>" /></dt>
							<dd><%=p.getDescr() %></dd>
							<dd><font color="blue">�ۼ�<%=p.getNormalPrice() %></font></dd>
							<dd><font color="red">��Ա��<%=p.getMemberPrice() %></font></dd>
							</a>
						</dl>
					<%} %>								
				<%}%>
			</div>
		<%}%>
	
	</div>
	
	<div id="sortnav">
		<ul>
			<li><a class="b">��Ʒ����</a></li>
			<li><a href="###" class="a">Ʒ��ר��</a></li>
			<li><a href="###" class="c">��������</a></li>
		</ul>
		<a href="###" class="d">�鿴��ϸ����</a>
	</div>
	
	<div id="sort">
		<div class="sortx">
			<ul class="sorttitle">
				<li><a href="###">�����Ʒ��</a></li>
				<li>--</li>
				<li><a href="###">�ֻ���</a></li>
				<li><a href="###">�绰��</a></li>
				<li><a href="###">��Ϸ�㿨</a></li>
			</ul>
			<ul>
				<li><a href="###">�ƶ�</a> |</li>
				<li><a href="###">50</a> |</li>
				<li><a href="###">��ͨ</a> |</li>
				<li><a href="###">30</a> |</li>
				<li><a href="###">����绰</a> |</li>
				<li><a href="###">������</a> |</li>
				<li><a href="###">������</a></li>
			</ul>
			<ul class="sorttitle">
				<li><a href="###">�ֻ������</a></li>
				<li>--</li>
				<li><a href="###">Mp3</a></li>
				<li><a href="###">Mp4</a></li>
				<li><a href="###">U��</a></li>
				<li><a href="###">�������</a></li>
			</ul>	
			<ul>
				<li><a href="###">T��</a> |</li>
				<li><a href="###">������</a> |</li>
				<li><a href="###">����</a> |</li>
				<li><a href="###">�̿�</a> | </li>
				<li><a href="###">ѩ����</a> |</li>
				<li><a href="###">����ȹ</a> |</li>
				<li><a href="###">�ڿ�</a></li>
			</ul>	
		</div>
		<div class="sortx sortxx">
			<ul class="sorttitle">
				<li><a href="###">�����Ʒ��</a></li>
				<li>--</li>
				<li><a href="###">�ֻ���</a></li>
				<li><a href="###">�绰��</a></li>
				<li><a href="###">��Ϸ�㿨</a></li>
			</ul>
			<ul>
				<li><a href="###">�ƶ�</a> |</li>
				<li><a href="###">50</a> |</li>
				<li><a href="###">��ͨ</a> |</li>
				<li><a href="###">30</a> |</li>
				<li><a href="###">����绰</a> |</li>
				<li><a href="###">������</a> |</li>
				<li><a href="###">������</a></li>
			</ul>
			<ul class="sorttitle">
				<li><a href="###">�ֻ������</a></li>
				<li>--</li>
				<li><a href="###">Mp3</a></li>
				<li><a href="###">Mp4</a></li>
				<li><a href="###">U��</a></li>
				<li><a href="###">�������</a></li>
			</ul>	
			<ul>
				<li><a href="###">T��</a> |</li>
				<li><a href="###">������</a> |</li>
				<li><a href="###">����</a> |</li>
				<li><a href="###">�̿�</a> | </li>
				<li><a href="###">ѩ����</a> |</li>
				<li><a href="###">����ȹ</a> |</li>
				<li><a href="###">�ڿ�</a></li>
			</ul>	
		</div>
		<div class="sortx sorty">
			<ul class="sorttitle">
				<li><a href="###">�����Ʒ��</a></li>
				<li>--</li>
				<li><a href="###">�ֻ���</a></li>
				<li><a href="###">�绰��</a></li>
				<li><a href="###">��Ϸ�㿨</a></li>
			</ul>
			<ul>
				<li><a href="###">�ƶ�</a> |</li>
				<li><a href="###">50</a> |</li>
				<li><a href="###">��ͨ</a> |</li>
				<li><a href="###">30</a> |</li>
				<li><a href="###">����绰</a> |</li>
				<li><a href="###">������</a> |</li>
				<li><a href="###">������</a></li>
			</ul>
			<ul class="sorttitle">
				<li><a href="###">�ֻ������</a></li>
				<li>--</li>
				<li><a href="###">Mp3</a></li>
				<li><a href="###">Mp4</a></li>
				<li><a href="###">U��</a></li>
				<li><a href="###">�������</a></li>
			</ul>	
			<ul>
				<li><a href="###">T��</a> |</li>
				<li><a href="###">������</a> |</li>
				<li><a href="###">����</a> |</li>
				<li><a href="###">�̿�</a> | </li>
				<li><a href="###">ѩ����</a> |</li>
				<li><a href="###">����ȹ</a> |</li>
				<li><a href="###">�ڿ�</a></li>
			</ul>	
		</div>
		<div class="sortx sortyy">
			<ul class="sorttitle">
				<li><a href="###">�����Ʒ��</a></li>
				<li>--</li>
				<li><a href="###">�ֻ���</a></li>
				<li><a href="###">�绰��</a></li>
				<li><a href="###">��Ϸ�㿨</a></li>
			</ul>
			<ul>
				<li><a href="###">�ƶ�</a> |</li>
				<li><a href="###">50</a> |</li>
				<li><a href="###">��ͨ</a> |</li>
				<li><a href="###">30</a> |</li>
				<li><a href="###">����绰</a> |</li>
				<li><a href="###">������</a> |</li>
				<li><a href="###">������</a></li>
			</ul>
			<ul class="sorttitle">
				<li><a href="###">�ֻ������</a></li>
				<li>--</li>
				<li><a href="###">Mp3</a></li>
				<li><a href="###">Mp4</a></li>
				<li><a href="###">U��</a></li>
				<li><a href="###">�������</a></li>
			</ul>	
			<ul>
				<li><a href="###">T��</a> |</li>
				<li><a href="###">������</a> |</li>
				<li><a href="###">����</a> |</li>
				<li><a href="###">�̿�</a> | </li>
				<li><a href="###">ѩ����</a> |</li>
				<li><a href="###">����ȹ</a> |</li>
				<li><a href="###">�ڿ�</a></li>
			</ul>	
		</div>
		<div class="sortx">
			<ul class="sorttitle">
				<li><a href="###">�����Ʒ��</a></li>
				<li>--</li>
				<li><a href="###">�ֻ���</a></li>
				<li><a href="###">�绰��</a></li>
				<li><a href="###">��Ϸ�㿨</a></li>
			</ul>
			<ul>
				<li><a href="###">�ƶ�</a> |</li>
				<li><a href="###">50</a> |</li>
				<li><a href="###">��ͨ</a> |</li>
				<li><a href="###">30</a> |</li>
				<li><a href="###">����绰</a> |</li>
				<li><a href="###">������</a> |</li>
				<li><a href="###">������</a></li>
			</ul>
			<ul class="sorttitle">
				<li><a href="###">�ֻ������</a></li>
				<li>--</li>
				<li><a href="###">Mp3</a></li>
				<li><a href="###">Mp4</a></li>
				<li><a href="###">U��</a></li>
				<li><a href="###">�������</a></li>
			</ul>	
			<ul>
				<li><a href="###">T��</a> |</li>
				<li><a href="###">������</a> |</li>
				<li><a href="###">����</a> |</li>
				<li><a href="###">�̿�</a> | </li>
				<li><a href="###">ѩ����</a> |</li>
				<li><a href="###">����ȹ</a> |</li>
				<li><a href="###">�ڿ�</a></li>
			</ul>	
		</div>
		<div class="sortx sortxx">
			<ul class="sorttitle">
				<li><a href="###">�����Ʒ��</a></li>
				<li>--</li>
				<li><a href="###">�ֻ���</a></li>
				<li><a href="###">�绰��</a></li>
				<li><a href="###">��Ϸ�㿨</a></li>
			</ul>
			<ul>
				<li><a href="###">�ƶ�</a> |</li>
				<li><a href="###">50</a> |</li>
				<li><a href="###">��ͨ</a> |</li>
				<li><a href="###">30</a> |</li>
				<li><a href="###">����绰</a> |</li>
				<li><a href="###">������</a> |</li>
				<li><a href="###">������</a></li>
			</ul>
			<ul class="sorttitle">
				<li><a href="###">�ֻ������</a></li>
				<li>--</li>
				<li><a href="###">Mp3</a></li>
				<li><a href="###">Mp4</a></li>
				<li><a href="###">U��</a></li>
				<li><a href="###">�������</a></li>
			</ul>	
			<ul>
				<li><a href="###">T��</a> |</li>
				<li><a href="###">������</a> |</li>
				<li><a href="###">����</a> |</li>
				<li><a href="###">�̿�</a> | </li>
				<li><a href="###">ѩ����</a> |</li>
				<li><a href="###">����ȹ</a> |</li>
				<li><a href="###">�ڿ�</a></li>
			</ul>	
		</div>
		<div class="sortx sorty">
			<ul class="sorttitle">
				<li><a href="###">�����Ʒ��</a></li>
				<li>--</li>
				<li><a href="###">�ֻ���</a></li>
				<li><a href="###">�绰��</a></li>
				<li><a href="###">��Ϸ�㿨</a></li>
			</ul>
			<ul>
				<li><a href="###">�ƶ�</a> |</li>
				<li><a href="###">50</a> |</li>
				<li><a href="###">��ͨ</a> |</li>
				<li><a href="###">30</a> |</li>
				<li><a href="###">����绰</a> |</li>
				<li><a href="###">������</a> |</li>
				<li><a href="###">������</a></li>
			</ul>
			<ul class="sorttitle">
				<li><a href="###">�ֻ������</a></li>
				<li>--</li>
				<li><a href="###">Mp3</a></li>
				<li><a href="###">Mp4</a></li>
				<li><a href="###">U��</a></li>
				<li><a href="###">�������</a></li>
			</ul>	
			<ul>
				<li><a href="###">T��</a> |</li>
				<li><a href="###">������</a> |</li>
				<li><a href="###">����</a> |</li>
				<li><a href="###">�̿�</a> | </li>
				<li><a href="###">ѩ����</a> |</li>
				<li><a href="###">����ȹ</a> |</li>
				<li><a href="###">�ڿ�</a></li>
			</ul>	
		</div>
		<div class="sortx sortyy">
			<ul class="sorttitle">
				<li><a href="###">�����Ʒ��</a></li>
				<li>--</li>
				<li><a href="###">�ֻ���</a></li>
				<li><a href="###">�绰��</a></li>
				<li><a href="###">��Ϸ�㿨</a></li>
			</ul>
			<ul>
				<li><a href="###">�ƶ�</a> |</li>
				<li><a href="###">50</a> |</li>
				<li><a href="###">��ͨ</a> |</li>
				<li><a href="###">30</a> |</li>
				<li><a href="###">����绰</a> |</li>
				<li><a href="###">������</a> |</li>
				<li><a href="###">������</a></li>
			</ul>
			<ul class="sorttitle">
				<li><a href="###">�ֻ������</a></li>
				<li>--</li>
				<li><a href="###">Mp3</a></li>
				<li><a href="###">Mp4</a></li>
				<li><a href="###">U��</a></li>
				<li><a href="###">�������</a></li>
			</ul>	
			<ul>
				<li><a href="###">T��</a> |</li>
				<li><a href="###">������</a> |</li>
				<li><a href="###">����</a> |</li>
				<li><a href="###">�̿�</a> | </li>
				<li><a href="###">ѩ����</a> |</li>
				<li><a href="###">����ȹ</a> |</li>
				<li><a href="###">�ڿ�</a></li>
			</ul>	
		</div>
	</div>
</div>

<div id="footer">
	<div id="footer1">
		<dl>
			<dt>������·��</dt>
			<dd><a href="#">���ע��</a></dd>
			<dd><a href="#">������Ʒ</a></dd>
			<dd><a href="#">��֧ͨ����</a></dd>
			<dd><a href="#">�����</a></dd>
		</dl>	
		<dl>
			<dt>������ң�</dt>
			<dd><a href="#">�ҵĶ���</a></dd>
			<dd><a href="#">�ҵĻ���</a></dd>
			<dd><a href="#">֧������ֵ</a></dd>
		</dl>
		<dl>
			<dt>�̳Ƿ���</dt>
			<dd><a href="#">7���������˿�</a></dd>
			<dd><a href="#">����ʹ�ù���</a></dd>
			<dd><a href="#">��פ�̳�</a></dd>
			<dd><a href="#">�̳�������</a></dd>
		</dl>		
	</div>
	<div id="footer2">
		<form>
		<p><select><option>��Ʒ������</option><option>Ʒ��������</option></select><input name="name" type="text" class="text" /><input type="submit" value="����" class="submit" /></p>
		<p class="tel">�ͷ��绰��0515-88202609����һ������ 9:00-18:00�� </p>
		<p class="kkk">��ҵ�̼���פư���ӻ��꣬���<a href="###">����</a> </p>
		</form>
	</div>
	<ul>
		<li><a href="###">��������</a></li>
		<li><a href="###">��������</a></li>
		<li><a href="###">��վ��ͼ</a></li>
		<li><a href="###">��ƸӢ��</a></li>
		<li><a href="###">��ϵ����</a></li>
		<li><a href="###">��Ȩ˵��</a></li>
	</ul>
	<p class="copy">ư���ӻ��� ��Ȩ����(C) 2007 - 2008 ��ICP��08003088�� �绰:0515-99999999</p>
	<p class="qq">QQ�ͷ�:77777777,66666666 QQ����Ⱥ:4444444</p>
</div>

</body>
</html>
