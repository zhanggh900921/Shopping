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
<title>瓢城杂货店</title>
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
		<dd class="nav1"><a href="###">我的杂货店</a></dd>
		<dd class="nav2"><a href="cart.jsp">购物车</a></dd>
		<dd class="nav3"><a href="###">收银台</a></dd>
		<dd class="nav4"><a href="###">查订单</a></dd>
		<dd class="nav5"><a href="###">帮助中心</a></dd>
	</dl>
	<%if(u==null) {%>
	<p>[<a href="register.jsp">免费注册</a>] [<a href="login.jsp">登陆</a>] [<a href="###">新手上路</a>]　<strong>本店郑重承诺：全场商品,件件低价！</strong></p>
	<%} 
	else {%>
	<p>[<a href="selfservice.jsp"><%=u.getUsername() %></a>] [<a href="selfservice.jsp">用户自助服务</a>] [<a href="###">新手上路</a>]　<strong>本店郑重承诺：全场商品,件件低价！</strong></p>
	<%} %>
	<ul>
		<li><a href="###">首页</a></li>
		<li><a href="###">酒水饮料</a></li>
		<li><a href="###">休闲食品</a></li>
		<li><a href="###">蛋糕干货</a></li>
		<li><a href="###">日用清洁</a></li>
		<li><a href="###">充值点卡</a></li>
		<li><a href="###">生活服务</a></li>
		<li><a href="###">反馈</a></li>
	</ul>
</div>

<div id="strip">
	<div id="underway">全部商品，10元起送！</div>
	<div id="search">
		<select name="kind">
			<option>按照商品名搜索</option>
			<option>按照品牌名搜索</option>
		</select>
		<input name="name" type="text" class="text" />
		<input type="submit" value="" class="submit" />
		<a href="###">[高级查询]</a>
	</div>
	<div id="hot">
		<ul>
			<li><strong>热门搜索：</strong></li>
			<li><a href="#">手机充值</a></li>
			<li><a href="#">点卡售货机</a></li>
			<li><a href="#">Nike AF1</a></li>
			<li><a href="#">圣诞套装</a></li>
			<li><a href="#">Mp3</a></li>
			<li><a href="#">Levi's复古牛仔裤</a></li>
			<li><a href="#">Zippo</a></li>
			<li><a href="#">母婴特卖</a></li>
			<li><a href="#">床品四件套</a></li>
			<li><a href="#">内衣</a></li>
			<li><a href="#">男士夹克</a></li>
		</ul>	
	</div>
</div>
<div id="strip1">为了兼容IE6.0</div>
<div id="strip2">为了兼容IE6.0</div>

<div id="adver">
	<img src="images/adv.gif" alt="限时特价1折起" />
</div>

<div id="sidebar">
	<h1 id="logintitle">会员登陆</h1>
	<div id="login">
		<form name="myform" action="login.jsp" method="get">
			<input type="hidden" name="action" value="log">
			<label for="username">会员名：</label>
			<input type="text" name="username" id="username" class="text" />
			<label for="password">密　码：</label>
			<input type="password" name="password" id="password" class="text" />
			<input type="submit" value="" class="submit" />
			<input type="button" value="" class="submit reg" onclick="window.location.href('register.jsp')"/>
		</form>
		<p><a href="###">忘记密码?点这里重设</a></p>
	</div>
	<h1 id="carttitle">购物车</h1>
	<div id="cart">
		<%if(cart!=null) { %>
		<p>您的购物车内现有<strong><%=list.size() %></strong>个商品</p>
		<p>总计金额：<strong><%=cart.getTotalPrice() %></strong>元</p>
		<%} else { %>
		<p>您的购物车内现有<strong>0</strong>个商品</p>
		<p>总计金额：<strong>0</strong>元</p>
		<%} %>
		<p><a href="###">购物车&gt;&gt;</a>　<a href="###">生成订单&gt;&gt;</a></p>
		<p><a href="###" class="ba"></a></p>
	</div>
	<h1 class="pro"><em><a href="###">MORE</a></em>好货哄抢</h1>
	<div id="good">
		<dl>
			<dt><img src="images/high1.jpg" alt="舒适绒衫运动风潮170元" /></dt>
			<dd><a href="###">舒适绒衫运动风潮<strong>170</strong>元</a></dd>
		</dl>
		<dl>
			<dt><img src="images/high2.jpg" alt="时尚品牌儿童套装80元" /></dt>
			<dd><a href="###">时尚品牌儿童套装<strong>80</strong>元</a></dd>
		</dl>
		<dl>
			<dt><img src="images/high3.jpg" alt="M.D.Y个性牛仔裤128元" /></dt>
			<dd><a href="###">M.D.Y个性牛仔裤<strong>128</strong>元</a></dd>
		</dl>
		<dl>
			<dt><img src="images/high4.jpg" alt="舒适绒衫运动风潮170元" /></dt>
			<dd><a href="###">护肤牛尔原液<strong>280</strong>元</a></dd>
		</dl>
	</div>
	<h1 class="pro"><em><a href="###">MORE</a></em>热卖推荐</h1>
	<div id="hot">
		<dl>
			<dt><img src="images/good1.jpg" alt="可爱表情袜超特价8.0元" /></dt>
			<dd><a href="###">可爱表情袜超特价<strong>8.0</strong>元</a></dd>
		</dl>
		<dl>
			<dt><img src="images/good2.jpg" alt="李宁情侣跑步鞋139元" /></dt>
			<dd><a href="###">李宁情侣跑步鞋<strong>139</strong>元</a></dd>
		</dl>
		<dl>
			<dt><img src="images/good3.jpg" alt="特价情侣戒指温馨价29元 " /></dt>
			<dd><a href="###">特价情侣戒指温馨价<strong>29</strong>元</a></dd>
		</dl>
	</div>
	<h1 class="pro"><em><a href="###">MORE</a></em>购买排行</h1>
	<div id="top">
		<ul>
			<li><a href="###">台电 晶彩酷闪(4G)</a></li>
			<li><a href="###">指纹加密型B007移动硬</a></li>
			<li><a href="###">爱欧迪 U5(4G) Mp3</a></li>
			<li><a href="###">明基 DP310s移动硬盘</a></li>
			<li><a href="###">索尼 NW-S710 Mp3</a></li>
			<li><a href="###">歌美 M5+(1G) Mp3</a></li>
			<li><a href="###">索尼T200数码相机</a></li>
			<li class="end"><a href="###">索尼 NW-S710 Mp3</a></li>
		</ul>
	</div>
	<h1 class="pro"><em><a href="###">MORE</a></em>商家展示</h1>
	<div id="business">
		<img src="images/company1.gif" alt="蒙牛" /> 
		<img src="images/company2.gif" alt="诺基亚" />
		<img src="images/company3.gif" alt="飞利浦" />
		<img src="images/company4.jpg" alt="欧迪芬" />
		<img src="images/company5.gif" alt="李宁" />
		<img src="images/company6.gif" alt="惠氏" />
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
		<h1><a href="###">MORE&gt;&gt;</a>［公告栏］</h1>
		<div>
			<ul id="sizeup">
				<li><a href="###">芭比甜美搭 显瘦装嫩永远18岁</a></li>
				<li><a href="###">4月外出踏青最泛桃花装扮10款</a></li>
				<li><a href="###">燕草如碧丝，鞋包换新姿</a></li>
				<li><a href="###">春季番茄瘦身一周轻松减10斤! </a></li>
			</ul>
			<img src="images/guide_adv.gif" alt="我淘我淘百万富翁" />
			<ul id="bull">
				<li>·<a href="###">怎样注册会员进行购物流程图</a></li>
				<li>·<a href="###">如何通过论坛发布自己的物品</a></li>
				<li>·<a href="###">什么是充值会员，怎么样成位</a></li>
				<li>·<a href="###">瓢城杂货店近期开展包夜点心</a></li>
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
		<h1>购物向导</h1>
		<div>
			<dl>
				<dt><a href="###"><img src="images/g1.jpg" alt="索尼T2相机￥200.00元" /></a></dt>
				<dd><a href="###">索尼T2相机<strong>￥200.00元</strong></a></dd>
			</dl>
			<dl>
				<dt><a href="###"><img src="images/g2.jpg" alt="精品儿童装￥32.8元" /></a></dt>
				<dd><a href="###">精品儿童装<strong>￥32.8元</strong></a></dd>
			</dl>
			<dl>
				<dt><a href="###"><img src="images/g3.jpg" alt="情人手镯热卖￥178元" /></a></dt>
				<dd><a href="###">情人手镯热卖<strong>￥178元</strong></a></dd>
			</dl>
			<dl>
				<dt><a href="###"><img src="images/g4.jpg" alt="诺基亚YN只卖￥978元" /></a></dt>
				<dd><a href="###">诺基亚YN只卖<strong>￥978元</strong></a></dd>
			</dl>
			<ul>
				<li><a href="###">『惊叹』揭露古代后宫女人变美隐私</a></li>
				<li><a href="###"><span>『人气』热捧!黑头毛孔油腻一扫光</span></a></li>
				<li><a href="###">『蜂抢』国货我最大 女人变白变瘦!</a></li>
				<li class="end"><a href="###"><span>『轰抢』月瘦10斤！珊拉娜减肥收腹</span></a></li>
			</ul>
			<img src="images/g5.jpg" alt="婴儿玩具" class="right" />
		</div>
	</div>
	
	<div id="special">
		<h1>热门专题</h1>
		<div>
			<a href="###"><img src="images/s1.jpg" alt="美食自然好味道" /></a>
			<a href="###"><img src="images/s2.jpg" alt="妈妈也性感" /></a>
			<a href="###"><img src="images/s3.jpg" alt="舍不得送礼人的好礼" /></a>
			<a href="###"><img src="images/s4.jpg" alt="车载MP3" /></a>
		</div>
	</div>
	
	<div id="newpro">
		<h1>[今日推荐商品]</h1>
		<div>
			<span id="marquee">
				<dl>
					<dt><img src="images/hot2.jpg" alt="七龙珠全集" /></dt>
					<dd>七龙珠全集</dd>
					<dd class="color">择扣价：40.00元</dd>
				</dl>
				<dl>
					<dt><img src="images/hot3.jpg" alt="海贼王全集" /></dt>
					<dd>海贼王全集</dd>
					<dd class="color">择扣价：35.00元</dd>
				</dl>
				<dl>
					<dt><img src="images/hot4.jpg" alt="百变小樱全集" /></dt>
					<dd>百变小樱全集</dd>
					<dd class="color">择扣价：42.00元</dd>
				</dl>
				<dl>
					<dt><img src="images/hot5.jpg" alt="犬夜叉全集" /></dt>
					<dd>犬夜叉全集</dd>
					<dd class="color">择扣价：24.00元</dd>
				</dl>
				<dl>
					<dt><img src="images/hot6.jpg" alt="网球王子全集" /></dt>
					<dd>网球王子全集</dd>
					<dd class="color">择扣价：29.00元</dd>
				</dl>
				<dl>
					<dt><img src="images/hot7.jpg" alt="名侦探柯南全集" /></dt>
					<dd>名侦探柯南全集</dd>
					<dd class="color">择扣价：60.00元</dd>
				</dl>
				<dl>
					<dt><img src="images/hot8.jpg" alt="火影忍者全集" /></dt>
					<dd>火影忍者全集</dd>
					<dd class="color">择扣价：39.00元</dd>
				</dl>
				<dl>
					<dt><img src="images/hot9.jpg" alt="圣斗士星矢全集" /></dt>
					<dd>圣斗士星矢全集</dd>
					<dd class="color">择扣价：52.00元</dd>
				</dl>
				<dl>
					<dt><img src="images/hot.jpg" alt="死神全集" /></dt>
					<dd>死神全集</dd>
					<dd class="color">择扣价：20.00元</dd>
				</dl>
				<dl>
					<dt><img src="images/hot10.jpg" alt="移动充值卡100" /></dt>
					<dd>移动充值卡100</dd>
					<dd class="color">择扣价：99.00元</dd>
				</dl>
				<dl>
					<dt><img src="images/hot11.jpg" alt="世界天成一卡通" /></dt>
					<dd>世界天成一卡通</dd>
					<dd class="color">择扣价：38.00元</dd>
				</dl>	
				<dl>
					<dt><img src="images/hot12.jpg" alt="盛大绿卡一卡通" /></dt>
					<dd>盛大绿卡一卡通</dd>
					<dd class="color">择扣价：44.00元</dd>
				</dl>	
			</span>
		</div>
	</div>
	
	<div id="channel">
		<h1>
			<ul>
				<li id="channel1" onmouseover="channelkey(1)">女性频道</li>
				<li id="channel2" onmouseover="channelkey(2)">数码频道</li>
				<li id="channel3" onmouseover="channelkey(3)">正版音像</li>
				<li id="channel4" onmouseover="channelkey(4)">生活家居</li>
				<li id="channel5" onmouseover="channelkey(5)">动漫网游</li>
				<li id="channel6" onmouseover="channelkey(6)">运动型男</li>
			</ul>
		</h1>
		
		
		<%int i=0,j=0,m=1;
		for(i=0;i<categorys.size();i++) {
			Category c = categorys.get(i);	%>			
			<div id="menucontent<%=i+1 %>" class="menu" style="display:block;">
				<%for(j=0,m=1;j<products.size();j++) {
					Product p = products.get(j);
					if(c.getName().equals("女性频道") && c.getId()==p.getCategoryId() && i==0) {%>
						<dl><a href="productdetail.jsp?id=<%=p.getId()%>&image=w<%=m %>">
							<dt><img src="images/w<%=m++ %>.jpg" alt="<%=p.getName() %>" /></dt>
							<dd><%=p.getDescr() %></dd>
							<dd><font color="blue">售价<%=p.getNormalPrice() %></font></dd>
							<dd><font color="red">会员价<%=p.getMemberPrice() %></font></dd>
							</a>
						</dl>
					<%} %>	
					<%if(c.getName().equals("数码频道") && c.getId()==p.getCategoryId() && i==1) {%>
						<dl><a href="productdetail.jsp?id=<%=p.getId()%>&image=k<%=m %>">
							<dt><img src="images/k<%=m++ %>.jpg" alt="<%=p.getName() %>" /></dt>
							<dd><%=p.getDescr() %></dd>
							<dd><font color="blue">售价<%=p.getNormalPrice() %></font></dd>
							<dd><font color="red">会员价<%=p.getMemberPrice() %></font></dd>
							</a>
						</dl>
					<%} %>	
					<%if(c.getName().equals("正版音像") && c.getId()==p.getCategoryId() && i==2) {%>
						<dl><a href="productdetail.jsp?id=<%=p.getId()%>&image=y<%=m %>">
							<dt><img src="images/y<%=m++ %>.jpg" alt="<%=p.getName() %>" /></dt>
							<dd><%=p.getDescr() %></dd>
							<dd><font color="blue">售价<%=p.getNormalPrice() %></font></dd>
							<dd><font color="red">会员价<%=p.getMemberPrice() %></font></dd>
							</a>
						</dl>
					<%} %>		
					<%if(c.getName().equals("生活家居") && c.getId()==p.getCategoryId() && i==3) {%>
						<dl><a href="productdetail.jsp?id=<%=p.getId()%>&image=j<%=m %>">
							<dt><img src="images/j<%=m++ %>.jpg" alt="<%=p.getName() %>" /></dt>
							<dd><%=p.getDescr() %></dd>
							<dd><font color="blue">售价<%=p.getNormalPrice() %></font></dd>
							<dd><font color="red">会员价<%=p.getMemberPrice() %></font></dd>
							</a>
						</dl>
					<%} %>	
					<%if(c.getName().equals("动漫网游") && c.getId()==p.getCategoryId() && i==4) {%>
						<dl><a href="productdetail.jsp?id=<%=p.getId()%>&image=d<%=m %>">
							<dt><img src="images/d<%=m++ %>.jpg" alt="<%=p.getName() %>" /></dt>
							<dd><%=p.getDescr() %></dd>
							<dd><font color="blue">售价<%=p.getNormalPrice() %></font></dd>
							<dd><font color="red">会员价<%=p.getMemberPrice() %></font></dd>
							</a>
						</dl>
					<%} %>	
					<%if(c.getName().equals("运动型男") && c.getId()==p.getCategoryId() && i==5) {%>
						<dl><a href="productdetail.jsp?id=<%=p.getId()%>&image=x<%=m %>">
							<dt><img src="images/x<%=m++ %>.jpg" alt="<%=p.getName() %>" /></dt>
							<dd><%=p.getDescr() %></dd>
							<dd><font color="blue">售价<%=p.getNormalPrice() %></font></dd>
							<dd><font color="red">会员价<%=p.getMemberPrice() %></font></dd>
							</a>
						</dl>
					<%} %>								
				<%}%>
			</div>
		<%}%>
	
	</div>
	
	<div id="sortnav">
		<ul>
			<li><a class="b">商品分类</a></li>
			<li><a href="###" class="a">品牌专区</a></li>
			<li><a href="###" class="c">二手特卖</a></li>
		</ul>
		<a href="###" class="d">查看详细分类</a>
	</div>
	
	<div id="sort">
		<div class="sortx">
			<ul class="sorttitle">
				<li><a href="###">卡类产品店</a></li>
				<li>--</li>
				<li><a href="###">手机卡</a></li>
				<li><a href="###">电话卡</a></li>
				<li><a href="###">游戏点卡</a></li>
			</ul>
			<ul>
				<li><a href="###">移动</a> |</li>
				<li><a href="###">50</a> |</li>
				<li><a href="###">联通</a> |</li>
				<li><a href="###">30</a> |</li>
				<li><a href="###">网络电话</a> |</li>
				<li><a href="###">泡泡堂</a> |</li>
				<li><a href="###">卡丁车</a></li>
			</ul>
			<ul class="sorttitle">
				<li><a href="###">手机数码店</a></li>
				<li>--</li>
				<li><a href="###">Mp3</a></li>
				<li><a href="###">Mp4</a></li>
				<li><a href="###">U盘</a></li>
				<li><a href="###">数码相机</a></li>
			</ul>	
			<ul>
				<li><a href="###">T恤</a> |</li>
				<li><a href="###">吊带衫</a> |</li>
				<li><a href="###">衬衣</a> |</li>
				<li><a href="###">短裤</a> | </li>
				<li><a href="###">雪纺衫</a> |</li>
				<li><a href="###">连衣裙</a> |</li>
				<li><a href="###">内裤</a></li>
			</ul>	
		</div>
		<div class="sortx sortxx">
			<ul class="sorttitle">
				<li><a href="###">卡类产品店</a></li>
				<li>--</li>
				<li><a href="###">手机卡</a></li>
				<li><a href="###">电话卡</a></li>
				<li><a href="###">游戏点卡</a></li>
			</ul>
			<ul>
				<li><a href="###">移动</a> |</li>
				<li><a href="###">50</a> |</li>
				<li><a href="###">联通</a> |</li>
				<li><a href="###">30</a> |</li>
				<li><a href="###">网络电话</a> |</li>
				<li><a href="###">泡泡堂</a> |</li>
				<li><a href="###">卡丁车</a></li>
			</ul>
			<ul class="sorttitle">
				<li><a href="###">手机数码店</a></li>
				<li>--</li>
				<li><a href="###">Mp3</a></li>
				<li><a href="###">Mp4</a></li>
				<li><a href="###">U盘</a></li>
				<li><a href="###">数码相机</a></li>
			</ul>	
			<ul>
				<li><a href="###">T恤</a> |</li>
				<li><a href="###">吊带衫</a> |</li>
				<li><a href="###">衬衣</a> |</li>
				<li><a href="###">短裤</a> | </li>
				<li><a href="###">雪纺衫</a> |</li>
				<li><a href="###">连衣裙</a> |</li>
				<li><a href="###">内裤</a></li>
			</ul>	
		</div>
		<div class="sortx sorty">
			<ul class="sorttitle">
				<li><a href="###">卡类产品店</a></li>
				<li>--</li>
				<li><a href="###">手机卡</a></li>
				<li><a href="###">电话卡</a></li>
				<li><a href="###">游戏点卡</a></li>
			</ul>
			<ul>
				<li><a href="###">移动</a> |</li>
				<li><a href="###">50</a> |</li>
				<li><a href="###">联通</a> |</li>
				<li><a href="###">30</a> |</li>
				<li><a href="###">网络电话</a> |</li>
				<li><a href="###">泡泡堂</a> |</li>
				<li><a href="###">卡丁车</a></li>
			</ul>
			<ul class="sorttitle">
				<li><a href="###">手机数码店</a></li>
				<li>--</li>
				<li><a href="###">Mp3</a></li>
				<li><a href="###">Mp4</a></li>
				<li><a href="###">U盘</a></li>
				<li><a href="###">数码相机</a></li>
			</ul>	
			<ul>
				<li><a href="###">T恤</a> |</li>
				<li><a href="###">吊带衫</a> |</li>
				<li><a href="###">衬衣</a> |</li>
				<li><a href="###">短裤</a> | </li>
				<li><a href="###">雪纺衫</a> |</li>
				<li><a href="###">连衣裙</a> |</li>
				<li><a href="###">内裤</a></li>
			</ul>	
		</div>
		<div class="sortx sortyy">
			<ul class="sorttitle">
				<li><a href="###">卡类产品店</a></li>
				<li>--</li>
				<li><a href="###">手机卡</a></li>
				<li><a href="###">电话卡</a></li>
				<li><a href="###">游戏点卡</a></li>
			</ul>
			<ul>
				<li><a href="###">移动</a> |</li>
				<li><a href="###">50</a> |</li>
				<li><a href="###">联通</a> |</li>
				<li><a href="###">30</a> |</li>
				<li><a href="###">网络电话</a> |</li>
				<li><a href="###">泡泡堂</a> |</li>
				<li><a href="###">卡丁车</a></li>
			</ul>
			<ul class="sorttitle">
				<li><a href="###">手机数码店</a></li>
				<li>--</li>
				<li><a href="###">Mp3</a></li>
				<li><a href="###">Mp4</a></li>
				<li><a href="###">U盘</a></li>
				<li><a href="###">数码相机</a></li>
			</ul>	
			<ul>
				<li><a href="###">T恤</a> |</li>
				<li><a href="###">吊带衫</a> |</li>
				<li><a href="###">衬衣</a> |</li>
				<li><a href="###">短裤</a> | </li>
				<li><a href="###">雪纺衫</a> |</li>
				<li><a href="###">连衣裙</a> |</li>
				<li><a href="###">内裤</a></li>
			</ul>	
		</div>
		<div class="sortx">
			<ul class="sorttitle">
				<li><a href="###">卡类产品店</a></li>
				<li>--</li>
				<li><a href="###">手机卡</a></li>
				<li><a href="###">电话卡</a></li>
				<li><a href="###">游戏点卡</a></li>
			</ul>
			<ul>
				<li><a href="###">移动</a> |</li>
				<li><a href="###">50</a> |</li>
				<li><a href="###">联通</a> |</li>
				<li><a href="###">30</a> |</li>
				<li><a href="###">网络电话</a> |</li>
				<li><a href="###">泡泡堂</a> |</li>
				<li><a href="###">卡丁车</a></li>
			</ul>
			<ul class="sorttitle">
				<li><a href="###">手机数码店</a></li>
				<li>--</li>
				<li><a href="###">Mp3</a></li>
				<li><a href="###">Mp4</a></li>
				<li><a href="###">U盘</a></li>
				<li><a href="###">数码相机</a></li>
			</ul>	
			<ul>
				<li><a href="###">T恤</a> |</li>
				<li><a href="###">吊带衫</a> |</li>
				<li><a href="###">衬衣</a> |</li>
				<li><a href="###">短裤</a> | </li>
				<li><a href="###">雪纺衫</a> |</li>
				<li><a href="###">连衣裙</a> |</li>
				<li><a href="###">内裤</a></li>
			</ul>	
		</div>
		<div class="sortx sortxx">
			<ul class="sorttitle">
				<li><a href="###">卡类产品店</a></li>
				<li>--</li>
				<li><a href="###">手机卡</a></li>
				<li><a href="###">电话卡</a></li>
				<li><a href="###">游戏点卡</a></li>
			</ul>
			<ul>
				<li><a href="###">移动</a> |</li>
				<li><a href="###">50</a> |</li>
				<li><a href="###">联通</a> |</li>
				<li><a href="###">30</a> |</li>
				<li><a href="###">网络电话</a> |</li>
				<li><a href="###">泡泡堂</a> |</li>
				<li><a href="###">卡丁车</a></li>
			</ul>
			<ul class="sorttitle">
				<li><a href="###">手机数码店</a></li>
				<li>--</li>
				<li><a href="###">Mp3</a></li>
				<li><a href="###">Mp4</a></li>
				<li><a href="###">U盘</a></li>
				<li><a href="###">数码相机</a></li>
			</ul>	
			<ul>
				<li><a href="###">T恤</a> |</li>
				<li><a href="###">吊带衫</a> |</li>
				<li><a href="###">衬衣</a> |</li>
				<li><a href="###">短裤</a> | </li>
				<li><a href="###">雪纺衫</a> |</li>
				<li><a href="###">连衣裙</a> |</li>
				<li><a href="###">内裤</a></li>
			</ul>	
		</div>
		<div class="sortx sorty">
			<ul class="sorttitle">
				<li><a href="###">卡类产品店</a></li>
				<li>--</li>
				<li><a href="###">手机卡</a></li>
				<li><a href="###">电话卡</a></li>
				<li><a href="###">游戏点卡</a></li>
			</ul>
			<ul>
				<li><a href="###">移动</a> |</li>
				<li><a href="###">50</a> |</li>
				<li><a href="###">联通</a> |</li>
				<li><a href="###">30</a> |</li>
				<li><a href="###">网络电话</a> |</li>
				<li><a href="###">泡泡堂</a> |</li>
				<li><a href="###">卡丁车</a></li>
			</ul>
			<ul class="sorttitle">
				<li><a href="###">手机数码店</a></li>
				<li>--</li>
				<li><a href="###">Mp3</a></li>
				<li><a href="###">Mp4</a></li>
				<li><a href="###">U盘</a></li>
				<li><a href="###">数码相机</a></li>
			</ul>	
			<ul>
				<li><a href="###">T恤</a> |</li>
				<li><a href="###">吊带衫</a> |</li>
				<li><a href="###">衬衣</a> |</li>
				<li><a href="###">短裤</a> | </li>
				<li><a href="###">雪纺衫</a> |</li>
				<li><a href="###">连衣裙</a> |</li>
				<li><a href="###">内裤</a></li>
			</ul>	
		</div>
		<div class="sortx sortyy">
			<ul class="sorttitle">
				<li><a href="###">卡类产品店</a></li>
				<li>--</li>
				<li><a href="###">手机卡</a></li>
				<li><a href="###">电话卡</a></li>
				<li><a href="###">游戏点卡</a></li>
			</ul>
			<ul>
				<li><a href="###">移动</a> |</li>
				<li><a href="###">50</a> |</li>
				<li><a href="###">联通</a> |</li>
				<li><a href="###">30</a> |</li>
				<li><a href="###">网络电话</a> |</li>
				<li><a href="###">泡泡堂</a> |</li>
				<li><a href="###">卡丁车</a></li>
			</ul>
			<ul class="sorttitle">
				<li><a href="###">手机数码店</a></li>
				<li>--</li>
				<li><a href="###">Mp3</a></li>
				<li><a href="###">Mp4</a></li>
				<li><a href="###">U盘</a></li>
				<li><a href="###">数码相机</a></li>
			</ul>	
			<ul>
				<li><a href="###">T恤</a> |</li>
				<li><a href="###">吊带衫</a> |</li>
				<li><a href="###">衬衣</a> |</li>
				<li><a href="###">短裤</a> | </li>
				<li><a href="###">雪纺衫</a> |</li>
				<li><a href="###">连衣裙</a> |</li>
				<li><a href="###">内裤</a></li>
			</ul>	
		</div>
	</div>
</div>

<div id="footer">
	<div id="footer1">
		<dl>
			<dt>新手上路：</dt>
			<dd><a href="#">免费注册</a></dd>
			<dd><a href="#">搜索商品</a></dd>
			<dd><a href="#">开通支付宝</a></dd>
			<dd><a href="#">如何买</a></dd>
		</dl>	
		<dl>
			<dt>我是买家：</dt>
			<dd><a href="#">我的订单</a></dd>
			<dd><a href="#">我的积分</a></dd>
			<dd><a href="#">支付宝充值</a></dd>
		</dl>
		<dl>
			<dt>商城服务：</dt>
			<dd><a href="#">7天无理由退款</a></dd>
			<dd><a href="#">积分使用规制</a></dd>
			<dd><a href="#">入驻商城</a></dd>
			<dd><a href="#">商城讨论区</a></dd>
		</dl>		
	</div>
	<div id="footer2">
		<form>
		<p><select><option>商品名搜索</option><option>品牌名搜索</option></select><input name="name" type="text" class="text" /><input type="submit" value="搜索" class="submit" /></p>
		<p class="tel">客服电话：0515-88202609（周一到周五 9:00-18:00） </p>
		<p class="kkk">企业商家入驻瓢城杂货店，请点<a href="###">这里</a> </p>
		</form>
	</div>
	<ul>
		<li><a href="###">关于我们</a></li>
		<li><a href="###">帮助中心</a></li>
		<li><a href="###">网站地图</a></li>
		<li><a href="###">诚聘英才</a></li>
		<li><a href="###">联系我们</a></li>
		<li><a href="###">版权说明</a></li>
	</ul>
	<p class="copy">瓢城杂货店 版权所有(C) 2007 - 2008 苏ICP备08003088号 电话:0515-99999999</p>
	<p class="qq">QQ客服:77777777,66666666 QQ交流群:4444444</p>
</div>

</body>
</html>
