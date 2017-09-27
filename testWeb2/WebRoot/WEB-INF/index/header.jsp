<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>My JSP 'header.jsp' starting page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<style type="text/css">
#biaoti{
width:100%;
height:120px;
line-height:120px;
text-align:center;
font-size:30px;
font-weight:bold;
color:#FFFFFF;

}
#count{
color:#FFFFFF;
font-weight:bold;
text-align:right;

}
</style>
</head>

<body style="background:#337ab7">
	<div id="biaoti">好时光专属教务管理系统</div>
	<div id="count">
	当前在线人数:<span></span>
	
	</div>
</body>
</html>
