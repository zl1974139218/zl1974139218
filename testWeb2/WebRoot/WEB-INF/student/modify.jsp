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

<title>My JSP 'modify.jsp' starting page</title>

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
	float: left;
	margin-left: 20px;
}

#form label {
	float: left;
	width: 50px;
}

#form .value {
	float: left;
	width: 200px;
}

#form div {
	clear: both;
	margin-top: 30px;
	overflow: hidden;
}

#form #btn {
	margin-left: 50px;
}

#form span {
	margin: 0 10px;
	font-size: 14px;
	font-weight: bold;
}

#image {
	width: 300px;
	height: 400px;
	float: left;
}
</style>
</head>

<body>
	<div>
		<c:if test="${empty stu.photo}">
			<c:set target="${stu}" property="photo" value="moren.jpg" />
		</c:if>
		<img id="image" src="photos/${stu.photo }" />
	</div>
	<div id="main">
		<form id="form" action="stu?type=modify" method="post"
			enctype="multipart/form-data">
			<!--  <input type="hidden" name="selectId" value="${stu.id}">-->
			<input type="hidden" name="id" value="${stu.id }" />
			<div>
				<label>姓名:</label><input type="text" name="name"
					class="form-control value" placeholder="请输入姓名" value="${stu.name }" />
			</div>
			<div>
				<label>性别:</label> <input type="radio" name="sex" value="男"
					<c:if test="${stu.sex eq'男' }">checked</c:if> /><span>男</span> <input
					type="radio" name="sex" value="女"
					<c:if test="${stu.sex eq'女' }">checked</c:if> /><span>女</span>
			</div>
			<div>
				<label>年龄:</label><input type="text" name="age"
					class="form-control value" value="${stu.age }" />
			</div>
			<div>
				<label>班級</label> <select id="bj" name="bj"
					class="form-control value">
					<option>请选择班級</option>
					<c:forEach items="${bjs}" var="bj">
						<option value="${bj.id}"
							<c:if test="${bj.id==stu.bj.id}">selected</c:if>>${bj.name}</option>

					</c:forEach>
				</select>
			</div>

			<div>
				<label>照片:</label><input type="file" name="photo"
					class="form-control value" >
			</div>
			<div>
				<input id="btn" type="submit" value="保存"
					class="btn btn-danger value" />
			</div>

		</form>

	</div>
</body>
</html>
