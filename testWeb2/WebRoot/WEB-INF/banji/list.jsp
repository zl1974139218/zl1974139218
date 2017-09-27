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
	<script type="text/javascript" src="js/jquery.js"></script>	
	<script src="bootstrap/js/bootstrap.min.js"></script>	
<style type="text/css">
#main {
	width: 700px;
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
	margin-left: 150px;
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
#main ul{
margin-bottom:20px;
}



</style>
<script>
	$(document)
			.ready(
					function() {
						var ye = ${p.ye};
						var maxYe = ${p.maxYe};
						var selectId = 0;
						$("#pre").click(function() {
							if (ye > 1) {
							var name=$("#name").val();
							
								window.location.href = "bj?type=search&ye=" + (ye - 1)+"&name="+name;
							} else {
								showMes("已经是第一页了");

							}
						})
						$("#next").click(function() {
							if (ye < maxYe) {
							var name=$("#name").val();
							
								window.location.href = "bj?type=search&ye=" + (ye + 1)+"&name="+name;
							} else {
								showMes("已经是最后一页了");
							}
						})
						$("[name=numPage]").click(function() {
						var name=$("#name").val();
							
							window.location.href = "bj?type=search&ye=" + $(this).html()+"&name="+name;
						})
						$("#add").click(function() {
							window.location.href = "bj?type=showAdd";
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
												window.location.href = "bj?type=showModify&selectId="
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
												window.location.href = "bj?type=delete&selectId="
														+ selectId;
												}
											}
										})
										$("#manageSub")
								.click(
										function() {
											if (selectId == 0) {
												showMes("请选中一条数据");
											} else {
												window.location.href = "bj?type=manageSub&selectId="
														+ selectId;
											}
										})
										$("#manageSub2")
								.click(
										function() {
										//var array=new Array();
										//$("tbody tr").each(function(index,element){
										//if($(this).attr("class")=="selected"){
										//array.push($(this).data("id"));
										//}
										//})
										if (selectId==0) {
												showMes("请选中一条数据");
											} else {
											$("#modelM").load("bj?type=manageSub2&selectId="+selectId);
											$("#myModal").modal("show");	
											}
										})
										
										
						$("tbody tr").click(function() {
							selectId = $(this).data("id");
							$("tbody tr").css("background", "none");
							$(this).css("background", "#337ab7");
						})
					})
</script>

</head>

<body>
	<%
		List<BanJi> list = (List<BanJi>) request.getAttribute("bjs");
	%>
	<div id="main">
	<div id="search">
	<form action="bj" method="post">
	<input type="hidden" name="type" value="search"/>
	<label>姓名</label>
	<input id="name" type="text" name="name"class="form-control value"value="${condition.name }">	
	
	<input id="tijiao"	type="submit" class="btn btn-info" value="查找"></input>
	
	</form>
	</div>
		<table class="table table-bordered">
			<thead>
				<tr>
					<th>名称</th>
					<th>人数</th>
					
				</tr>
			</thead>
			<tbody>

				<c:forEach var="bj" items="${bjs}">

					<tr data-id="${bj.id }">
						<td>${bj.name}</td>
						<td><a href="stu?type=search&bj=${bj.id }">${bj.stuNums}</a></td>
						
					</tr>
				</c:forEach>


			</tbody>
		</table>
		<div id="mes"></div>
		<ul class="fenye">
			<li id="pre">上一页</li>

			<c:forEach begin="${p.begin }" end="${p.end }" varStatus="status">
				<li name="numPage"
					<c:if test="${p.ye==status.index}">class="active"</c:if>>${status.index
					}</li>

			</c:forEach>
			<li id="next">下一页</li>
		</ul>
		<div class="btn-group">
			<button id="add" type="button" class="btn btn-success">新增</button>
			<button id="modify" type="button" class="btn btn-warning">修改</button>
			<button id="delete"type="button" class="btn btn-danger">删除</button>
			<button id="manageSub"type="button" class="btn btn-info">管理课程</button>
			<button id="manageSub2"class="btn btn-primary ">管理课程 弹出框</button>
		</div>										
	 </div>
	<!-- 模态框（Modal） -->
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
					&times;
				</button>
				<h4 class="modal-title" id="myModalLabel">
					管理课程
				</h4>
			</div>
			<div class="modal-body" id="modelM">
				
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">关闭
				</button>
				<button type="button" class="btn btn-primary">
					提交更改
				</button>
			</div>
		</div><!-- /.modal-content -->
	</div><!-- /.modal -->
</div> 
</body>
</html>
