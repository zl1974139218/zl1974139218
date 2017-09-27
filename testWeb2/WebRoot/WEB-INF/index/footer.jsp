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

<title>My JSP 'footer.jsp' starting page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<style type="text/css">
#jiewei {
list-style:none;
	width: 100%;
	height: 150px;
	font-size: 17px;
	line-height:150px;
	text-align: center;
	color: #FFFFFF;
}
</style>
</head>

<body style="background:#337ab7">
	<div>
		<ul id="jiewei">
			<li>好时光专属管理系统——by 中国好时光股份有限集团</li>			
		</ul>
	</div>

</body>
</html>
