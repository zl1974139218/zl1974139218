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

<title>My JSP 'left.jsp' starting page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<style type="text/css">
a {
text-decoration:none;
color:#FFFFFF;
}
#menu {
	margin: 10px 0 0 10px;
}

#menu .yi {
	width: 180px;
	height: 38px;
	background-color: #337ab7;
	color: #FFFFFF;
	line-height: 35px;
	text-align: center;
	font-weight: bold;
	margin-top: 5px;
	border-radius: 3px;
}

#menu .yi:hover {
	background-color: #286090;
	cursor: pointer;
}

#menu .er {
	margin: 0;
	padding: 0;
}

#menu .er li {
	list-style: none;
	width: 180px;
	height: 31px;
	font-size: 15px;
	background-color: #337ab7;
	color: #FFFFFF;
	line-height: 30px;
	text-align: center;
	font-weight: bold;
	margin-top: 2px;
	border-radius: 3px;
}
#menu span{
font-size:18px;
}
</style>
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$(".yi").click(function() {
			if ("none" == $(this).next().css("display")) {
				$(this).next().slideDown(500);
				$(this).find("span").html("[-]");
			}else{
			$(this).next().slideUp(500);
			$(this).find("span").html("[+]");
			}
		})

	})
</script>
</head>

<body>
	<div id="menu">
		<div class="yi"><span>[-]</span> 学生管理</div>
		<ul class="er">
			<li><a href="stu?type=search" target="main">查看</a></li>
			<li><a href="stu?type=showAdd" target="main">新增</a></li>
		</ul>
		<div class="yi"><span>[-]</span> 班级管理</div>
		<ul class="er">
			<li><a href="bj?type=search" target="main">查看</a></li>
			<li><a href="bj?type=showAdd" target="main">新增</a></li>
			<li><a href="bj?type=manageSub" target="main">管理课程</a></li>
		</ul>

		<div class="yi"><span>[-]</span> 科目管理</div>
		<ul class="er">
			<li><a href="sub?type=search" target="main">查看</a></li>
			<li><a href="sub?type=showAdd" target="main">新增</a></li>
		</ul>

		<div class="yi"><span>[-]</span> 成绩管理</div>
		<ul class="er">
			<li><a href="sc?type=search" target="main">查看</a></li>
			<li><a href="sc?type=manage" target="main">新增</a></li>
		</ul>

	</div>
</body>
</html>
