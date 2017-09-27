<%@page import="util.Pagination"%>
<%@ page language="java" import="java.util.*,entity.*"
	pageEncoding="utf-8"%>
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

<title>My JSP 'list.jsp' starting page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">

<link rel="stylesheet" type="text/css"
	href="bootstrap/css/bootstrap.min.css">
<style type="text/css">
#main {
	width: 800px;
	margin: 10px auto;
}

.fenye {
	margin: 0;
	padding: 0;
	float: left;
}

#mes {
	width: 130px;
	height: 30px;
	float: left;
	line-height: 30px;
	margin-left: 250px;
	color: red;
}

.fenye li {
	list-style: none;
	float: left;
	padding: 6px 12px;
	line-height: 140%;
	font-size: 14px;
	color: #337ab7;
	margin-left: -1px;
	text-aline: center;
	border: 1px solid #ccc;
}

.fenye li:first-child {
	border-top-left-radius: 4px;
	border-bottom-left-radius: 4px;
}

.fenye li:last-child {
	border-top-right-radius: 4px;
	border-bottom-right-radius: 4px;
}

.fenye li:hover {
	background: #eee;
	cursor: pointer;
}

.fenye .active {
	color: #fff;
	background-color: #337ab7;
	border-color: #337ab7;
}

.fenye .active:hover {
	color: #fff;
	background-color: #337ab7;
	border-color: #337ab7;
}

#search .value {
	width: 120px;
	height: 30px;
	float: left;
	margin-left: 10px;
}

#search select {
	width: 120px;
	height: 30px;
	float: left;
	margin-left: 10px;
}

#search button {
	width: 80px;
	float: left;
	margin-left: 15px;
}

#search label {
	float: left;
	margin-top: 5px;
	margin-left: 10px;
}

#tijiao {
	margin-left: 30px;
}
</style>
<script type="text/javascript" src="js/jquery.js"></script>
<script>
	$(document).ready(
			function() {
				var ye = ${p.ye};
				var maxYe = ${p.maxYe};
				var selectId = 0;
				function ClickYeMa(selectYe) {
					var stuName = $("#stuName").val();
					var bj = $("#bj").val();
					var sub = $("#sub").val();
					window.location.href = "sc?type=search&ye=" + selectYe
							+ "&stuName=" + stuName + "&bj=" + bj + "&sub="
							+ sub;
				}
				$("#shou").click(function() {

					ClickYeMa(1);

				})
				$("#wei").click(function() {
					ClickYeMa(maxYe);

				})
				$("#pre").click(function() {
					if (ye > 1) {
						ClickYeMa(ye - 1);
					} else {
						showMes("已经是第一页了");

					}
				})
				$("#next").click(function() {
					if (ye < maxYe) {
						ClickYeMa(ye + 1);
					} else {
						showMes("已经是最后一页了");
					}
				})

				$("[name=numPage]").click(function() {
					ClickYeMa($(this).html());
				})

				function showMes(mes) {
					$("#mes").html(mes)
					setTimeout(function() {
						$("#mes").html("")
					}, 1000)
				}
				;

				$("tbody tr").click(function() {
					selectId = $(this).data("id");
					$("tbody tr").css("background", "none");
					$(this).css("background", "#337ab7");
				})
				$("#bj").change(
						function() {
							$.ajax({
								url : "sub?type=searchSubByBj",
								data : {
									BjId : $(this).val()
								},
								type : "post",
								dataType : "json",
								success : function(data) {
									var ops = "";
									$.each(data, function(index, element) {
										ops += "<option value="+element.id+">"
												+ element.name + "</option>";
									})
									$("#sub").html(ops);
								}

							})
						})
			})
</script>

</head>

<body>
	<%
		List<Student> list = (List<Student>) request.getAttribute("stus");
	%>
	<div id="main">
		<div id="search">
			<form action="sc" method="post">
				<input type="hidden" name="type" value="search" /> <label>姓名</label>
				<input id="stuName" type="text" name="stuName"
					class="form-control value" value="${condition.stu.name }">
				<label>班級</label>- <select id="bj" name="bj"
					class="form-control value">
					<option value="0">请选择班級</option>
					<c:forEach items="${bjs}" var="bj">
						<option value="${bj.id}"
							<c:if test="${condition.stu.bj.id==bj.id }">selected</c:if>>${bj.name}</option>
					</c:forEach>
				</select> <label>科目</label>- <select id="sub" name="sub"
					class="form-control value">
					<option value="0">请选择科目</option>
					<c:forEach items="${subs}" var="sub">
						<option value="${sub.id}"
							<c:if test="${condition.sub.id==sub.id }">selected</c:if>>${sub.name}</option>
					</c:forEach>
				</select> <input id="tijiao" type="submit" class="btn btn-info" value="查找"></input>
			</form>
		</div>
		<table class="table table-bordered">
			<thead>
				<tr>
					<th>姓名</th>
					<th>班级</th>
					<th>科目</th>
					<th>评级</th>
					<th>分数</th>
				</tr>
			</thead>
			<tbody>

				<c:forEach var="sc" items="${scs}">

					<tr data-id="${sc.id }">
						<td>${sc.stu.name}</td>
						<td>${sc.stu.bj.name}</td>
						<td>${sc.sub.name}</td>
						<td>${sc.grade}</td>
						<td><c:if test="${sc.score!=null}">${sc.score}</c:if> <c:if
								test="${sc.score==null}">未录入</c:if></td>
					</tr>
				</c:forEach>


			</tbody>
		</table>
		<div id="mes"></div>
		<ul class="fenye">
			<li id="shou">首页</li>
			<li id="pre">上一页</li>

			<c:forEach begin="${p.begin }" end="${p.end }" varStatus="status">
				<li name="numPage"
					<c:if test="${p.ye==status.index}">class="active"</c:if>>${status.index
					}</li>

			</c:forEach>
			<li id="next">下一页</li>
			<li id="wei">尾页</li>
		</ul>

	</div>
</body>
</html>
