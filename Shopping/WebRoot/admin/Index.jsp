<%@ page language="java" import="java.util.*" pageEncoding="gbk"%>
<%@ include file="_sessioncheck.jsp" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html>
<script language="javascript">
	state = 0 ;
	menuState = 0;
	mainState = 0;
</script>

<head>
<title>E_Shopping����ƽ̨</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<frameset rows="29,*" border="0" cols="*">
  <frame name="top" scrolling="NO" noresize src="top.html">
  <frameset cols="20%,*"  border="0"  rows="*" scrolling="NO" name="mleft">
    <frame src="menu.html" frameborder=NO border="0" scrolling="NO" >
    <frameset rows="20,100%,*" name="content"   cols="*">
      <frame src="title.html"  noresize scrolling="NO" name="mtitle">
      <frame src=""   name="main" marginwidth="0" marginheight="0" scrolling="YES">
      <frame src=""   name="detail">
    </frameset>
  </frameset>
</frameset>
<noframes>
</noframes>
</html>
