<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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

<title>My JSP 'add.jsp' starting page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">

<link rel="stylesheet" type="text/css"
	href="bootstrap/css/bootstrap.min.css">

<style type="text/css">
#main {
	width: 400px;
	margin: 10px auto;
	
}

#main label {
	float: left;
	width: 50px;
}

#main .value {
	float: left;
	width: 200px;
}

#main div {
	clear: both;
	margin-top: 30px;
	overflow: hidden;
}

#main #btn {
	margin-left: 50px;
}

#main span {
	margin: 0 10px;
	font-size: 14px;
	font-weight: bold;
}
 
#photos img{
	width: 50px;
	height: 50px;
}
</style>
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript">
	$().ready(function() {
		$("#upload").click(function() {
		var length=$("#photos img").length;
		if(length<5){
		
			$.ajax({
				url : "stu?type=upload",
				type : "post",
				cache : false,
				data : new FormData($("#form")[0]),
				processData : false,
				contentType : false,
				dataType : "text",
				success : function(data) {
				str="<img src='photos/"+data+"'/>";
				$("#photos").append(str);
				}

			})}

		})
		$("#btn").click(function() {
		var name=$("[name=name]").val();
		var sex=$("[name=sex]").val();
		var age=$("[name=age]").val();
		var bj=$("[name=bj]").val();
		var photo=$("#photos img").attr("src");
		photo=photo.substring(photo.lastIndexOf("/")+1);
		url="stu?type=add2&name="+name+"&sex="+sex+"&age="+age+"&bj="+bj+"&photo="+photo;
		window.location.href=url;
		})
		$(document).on("click","#photos img",function(){
		$(this).remove();
		})
	})
</script>
</head>

<body>
	
	<div id="main">
		<!--<form id="form" action="stu?type=add" method="post" enctype="multipart/form-data">-->
		<!-- <input type="hidden" name="type" value="add" />-->
		<div>
			<label>姓名:</label><input type="text" name="name"
				class="form-control value" placeholder="请输入姓名" />
		</div>
		<div>
			<label>性别:</label> <input type="radio" name="sex" value="男" /><span>男</span>
			<input type="radio" name="sex" value="女" /><span>女</span>
		</div>
		<div>
			<label>年龄:</label><input type="text" name="age"
				class="form-control value" />
		</div>
		<div>
			<label>班級</label> <select id="bj" name="bj"
				class="form-control value">
				<option>请选择班級</option>
				<c:forEach items="${bjs}" var="bj">
					<option value="${bj.id}">${bj.name}</option>

				</c:forEach>
			</select>
		</div>
		<div id="photos">
		
		</div>
		<div>
			<form id="form" action="stu?type=add" method="post"
				enctype="multipart/form-data">
				<label>照片:</label><input type="file" name="photo"
					class="form-control value"> <input id="upload"
					type="button" value="上传" class="btn btn-primary"
					style="margin-left:20px";>
		</div>
		</form>
		<div>
			<input id="btn" type="botton" value="保存" class="btn btn-danger value" />
		</div>

		<!--  </form>-->

	</div>
</body>
</html>
