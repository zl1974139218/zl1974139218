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

<title>My JSP 'login.jsp' starting page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">

<link rel="stylesheet" type="text/css"
	href="bootstrap/css/bootstrap.min.css">

<style type="text/css">
body {
	background-image: url('photos/zhuye.jpg');
}

#main {
	width: 400px;
	height: 300px;
	margin: 200px auto;
	box-shadow: 2px 2px 50px #666;
}

#form {
	margin-left: 60px;
	margin-top: 20px;
}

#zhanghao {
	width: 180px;
	margin-top:20px;
	margin-left:75px;
}

#mima {
	width: 180px;
	margin-left:75px;
}

#form label {
	float: left;
	margin-top: 10px;
	
}

#zhu {
	width: 400px;
	height: 300px;
	border: 1px solid #666;
}

#denglu {
	margin-top: 20px;
	margin-left: 60px;
}

#zhuce {
	margin-left: 20px;
	margin-top: 20px;
}
#image {
	width: 60px;
	height: 30px;
	margin-left: 180px;
}
#mes{
width:120px;
height:30px;

margin-left:75px;
}
#form #yan{
margin-top:30px;
}
#abc{
width:120px;
height:30px;

margin-left:75px;
}
</style>
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript">
	$().ready(function() {
	//bom编程
	if(self!=top){
	top.location=self.location;
	}
		$("#zhuce").click(function() {
			window.location.href = "user?type=zhuce";

		})
	$("#image").click(function() {
			$(this).attr("src", "user?type=randomImage&name=" + Math.random());
		})
		function showMes(mes) {
			$("#mes").html(mes)
			setTimeout(function() {
				$("#mes").html("")
			}, 1000)
		}
		;
	})
</script>
</head>

<body>

	<div id="main">
		<div id="zhu">
			<form id="form" action="user" method="post">
				<input type="hidden" name="type" value="doLogin" /> <label>账号：</label><input
					required="required" id="zhanghao" type="text" name="name"
					value="${name}" class="form-control value" /></br> <label>密码：</label><input
					required="required" id="mima" type="password" name="password"
					class="form-control value" /><label id="yan">输入验证码:</label><input required="required"
					id="zhanghao" type="text" name="random" class="form-control value"
					placeholder="请输入验证码" /></br>
				<div class="col-xs-4">
					<img id="image" src="user?type=randomImage" />
				</div>
				<div id="abc">${abc};</div>
				<div id="mes">${mes};</div>
				<input id="denglu" type="submit" value="登录"
					class="btn btn-danger value" /> <input id="zhuce" type="button"
					value="注册" class="btn btn-success value" />
			</form>
		</div>
	</div>
</body>
</html>
