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
	width: 850px;
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
#search .value{
width:120px;
height:30px;
float:left;
margin-left:10px;
}
#search select{
width:120px;
height:30px;
float:left;
margin-left:10px;

}
#search button{
width:80px;
float:left;
margin-left:15px;
}

#search label{
float:left;
margin-top:5px;
margin-left:10px;
}
#tijiao{
margin-left:30px;
}
.btn-group{
margin-top:130px;
clear:both;
}
.photo{
width:40px;
height:40px;
}
#bigPhoto{
width:100px;
height:100px;
display:none;
position:absolute;
}
#bigPhoto img{
width:100px;
height:100px;
}
</style>
<script type="text/javascript" src="js/jquery.js"></script>
<script>
	$(document)
			.ready(
					function() {
						var ye = ${p.ye};
						var maxYe = ${p.maxYe};
						var selectId = 0;
						function ClickYeMa(selectYe){
						var name=$("#name").val();
							var sex=$("#sex").val();
							var age=$("#age").val();
							var bj=$("#bj").val();
								window.location.href = "stu?type=search&ye="+selectYe+"&name="+name+"&sex="+sex+"&age="+age+"&bj="+bj;
						}
						$("#shou").click(function() {
							
							ClickYeMa(1);
							
						})
						$("#wei").click(function() {
							ClickYeMa(maxYe);
							
						})
						$("#pre").click(function() {
							if (ye > 1) {
							ClickYeMa(ye-1);
							} else {
								showMes("已经是第一页了");

							}
						})
						$("#next").click(function() {
							if (ye < maxYe) {
							ClickYeMa(ye+1);
							} else {
								showMes("已经是最后一页了");
							}
						})
						
						$("[name=numPage]").click(function() {
						ClickYeMa($(this).html());
						})
						$("#add").click(function() {
							window.location.href = "stu?type=showAdd";
						});
						function showMes(mes) {
							$("#mes").html(mes)
							setTimeout(function() {
								$("#mes").html("")
							}, 1000)
						}
						;
						$("#modify")
								.click(
										function() {
											if (selectId == 0) {
												showMes("请选中一条数据");
											} else {
												window.location.href = "stu?type=showModify&selectId="
														+ selectId;
														
											}
										})
									
										$("#delete")
								.click(
										function() {
											if (selectId == 0) {
												showMes("请选中一条数据");
											} else {
											var type=confirm("确认要删除这一条数据吗");
												if(type){
												window.location.href = "stu?type=delete&selectId="
														+ selectId;
												}
											}
										})
						$("tbody tr").click(function() {
							selectId = $(this).data("id");
							$("tbody tr").css("background", "none");
							$(this).css("background", "#337ab7");
						})
						$(".photo").hover(function(event){
						var str=$(this).attr("src");
						$("#bigPhoto").show();
						$("#bigPhoto").css({
						left:event.pageX,
						top:event.pageY
						})
						$("#bigPhoto img").attr("src",str)
						},function(){
						
						$("#bigPhoto").hide();
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
	<form action="stu" method="post">
	<input type="hidden" name="type" value="search"/>
	<label>姓名</label>
	<input id="name" type="text" name="name"class="form-control value"value="${condition.name }">
	<label>性别</label>
	<select id="sex"name="sex" class="form-control value">
	<option>请选择性别</option>
	<option value="男"<c:if test="${condition.sex eq '男'}">selected</c:if>>男</option>
	<option value="女"<c:if test="${condition.sex eq '女'}">selected</c:if>>女</option>
	</select>
	<label>年龄</label>
	<input id="age"	type="text" name="age"class="form-control value" <c:if test="${condition.age!=-1}">value="${condition.age }"</c:if>>
	<input id="tijiao"	type="submit" class="btn btn-info" value="查找"></input>
	<label>班級</label>-
	<select id="bj"name="bj" class="form-control value" >
	<option value="0">请选择班級</option>
	<c:forEach items="${bjs}" var="bj">
	<option value="${bj.id}"<c:if test="${condition.bj.id==bj.id }">selected</c:if>>${bj.name}</option>			
	</c:forEach>
	</select>
	</form>
	</div>
		<table class="table table-bordered">
			<thead>
				<tr>
					<th>姓名</th>
					<th>性别</th>
					<th>年龄</th>
					<th>班级</th>
					<th>照片</th>
				</tr>
			</thead>
			<tbody>

				<c:forEach var="stu" items="${stus}">

					<tr data-id="${stu.id }">
						<td>${stu.name}</td>
						<td>${stu.sex}</td>
						<td>${stu.age}</td>
						<td>${stu.bj.name}</td>
						<c:if test="${empty stu.photo}">
						<c:set target="${stu}" property="photo" value="moren.jpg"/>
						</c:if>
						<td><img src="photos/${stu.photo}" class="photo"/></td>
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
		<div class="btn-group">
			<button id="add" type="button" class="btn btn-success">新增</button>
			<button id="modify" type="button" class="btn btn-warning">修改</button>
			<button id="delete"type="button" class="btn btn-danger">删除</button>
		</div>
		<div id="bigPhoto"><img src=""/></div>
	</div>
</body>
</html>
