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

<title>My JSP 'zhuce.jsp' starting page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">

<link rel="stylesheet" type="text/css"
	href="bootstrap/css/bootstrap.min.css">


<style type="text/css">
body {
	background-image: url('photos/zhuce.jpg');
	background-repeat:no-repeat;
	background-size:100% 100%;
	
}

#main {
	width: 400px;
	height: 400px;
	margin: 130px auto;
	box-shadow: 2px 2px 50px #666;
}

#qmima {
	width: 180px;
	margin-left: 75px;
}

#form {
	margin-left: 60px;
	margin-top: 20px;
}

#zhanghao {
	width: 180px;
	margin-left: 75px;
	
}

#mima {
	width: 180px;
	margin-left: 75px;
}

#form label {
	float: left;
	margin-top: 10px;
	color:#FFFFFF;
}

#zhu {
	width: 400px;
	height: 400px;
	border: 1px solid #FFFFFF;
}

#denglu {
	margin-top: 20px;
	margin-left: 120px;
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
</style>
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript">
	$().ready(function() {
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
				<input type="hidden" name="type" value="sava" /> <label>账号：</label><input
					required="required" id="zhanghao" type="text" name="name"
					value="${name}" class="form-control value" /></br> <label>密码：</label><input
					required="required" id="mima" type="password" name="password"
					class="form-control value" /></br> <label>确认密码：</label><input
					required="required" id="qmima" type="password" name="qpassword"
					class="form-control value" /></br> <label>输入验证码:</label><input
					required="required" id="zhanghao" type="text" name="random"
					class="form-control value" placeholder="请输入验证码" /></br>
				<div class="col-xs-4">
					<img id="image" src="user?type=randomImage" />
				</div>
				<div id="mes">${mes};</div>
				</br> </br> <input id="denglu" type="submit" value="保存"
					class="btn btn-danger value" />
			</form>
			
		</div>
	</div>
</body>
</html>