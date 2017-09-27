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
* {
	padding: 0;
	margin: 0;
}

#main {
	width: 750px;
	margin: 10px auto;
}

#sub {
	overflow: hidden;
	height: 145px;
	border: 1px solid #666;
	padding: 1px;
	clear:both;
}

#sub li {
	list-style: none;
	float: left;
	width: 100px;
	height: 40px;
	background: #337ab7;
	margin-left: 20px;
	line-height: 40px;
	text-align: center;
	color: #FFFFFF;
	font-size: 16px;
	font-weight: bold;
	margin-top: 5px;
	cursor: pointer;
}

.btnGroup {
	clear: both;
	float:left;
	margin-bottom: 10px;
}

#noSub {
	overflow: hidden;
	height: 145px;
	border: 1px solid #666;
	padding: 1px;
	
	clear:both;
}

#noSub li {
	list-style: none;
	float: left;
	width: 100px;
	height: 40px;
	background: #337ab7;
	margin-left: 20px;
	line-height: 40px;
	text-align: center;
	color: #FFFFFF;
	font-size: 16px;
	font-weight: bold;
	margin-top: 5px;
	cursor: pointer;
}

#main .selected {
	background:red;
}

#mes {
	width: 130px;
	height: 30px;
	float: left;
	line-height: 30px;
	margin-left: 150px;
	color: red;
}
#bj{
width:120px;
height:30px;
margin-bottom:5px;
font-size:20px;
font-weight:bold;
}
</style>
<script type="text/javascript" src="js/jquery.js"></script>
<script>
	$(document).ready(function() {
	//jquery动态生成的元素，事件不能用的解决方法
		$(document).on("click","li",function() {
			 $(this).toggleClass("selected");
			
		});
		$("#add").click(function() {
			var subIds = new Array();
			$("#noSub li").each(function(index, element) {
				if ($(this).attr("class") == "selected") {
					subIds.push($(this).data("subid"));
				}
			});
			if (subIds.length > 0) {
			$.ajax({
			url:"bj",
			data:"type=addSub&bjId="+$("#bj").val()+"&subIds="+subIds,
			type:"get",
			dataType:"text",
			success:function(data){
			//location.href="bj?type=manageSub&selectId="+$("#bj").data("bjid");
			var strs=data.split("-|-");
			var subs=JSON.parse(strs[0]);
			var noSubs=JSON.parse(strs[1]);
			
			var subsStr="";
			for(var i=0;i<subs.length;i++){
			subsStr+="<li data-subid="+subs[i].id+">"+subs[i].name+"</li>";
			
			}
			$("#sub").html(subsStr);
			var noSubsStr="";
			for(var i=0;i<noSubs.length;i++){
			noSubsStr+="<li data-subid="+noSubs[i].id+">"+noSubs[i].name+"</li>";
			
			}
			$("#noSub").html(noSubsStr);
			}
			});	
			
			} else {
				showMes("请选中一条数据");
			}
			
		});
		
		
		
		$("#delete").click(function() {
			var subIds = new Array();
			$("#sub li").each(function(index, element) {
				if ($(this).attr("class") == "selected") {
					subIds.push($(this).data("subid"));
				}
			});
			if (subIds.length > 0) {
			$.ajax({
			url:"bj",
			data:"type=deleteSub&bjId="+$("#bj").val()+"&subIds="+subIds,
			type:"get",
			dataType:"text",
			success:function(data){
			//location.href="bj?type=manageSub&selectId="+$("#bj").data("bjid");
			var strs=data.split("-|-");
			var subs=JSON.parse(strs[0]);
			var noSubs=JSON.parse(strs[1]);
			
			var subsStr="";
			for(var i=0;i<subs.length;i++){
			subsStr+="<li data-subid="+subs[i].id+">"+subs[i].name+"</li>";
			
			}
			$("#sub").html(subsStr);
			var noSubsStr="";
			for(var i=0;i<noSubs.length;i++){
			noSubsStr+="<li data-subid="+noSubs[i].id+">"+noSubs[i].name+"</li>";
			
			}
			$("#noSub").html(noSubsStr);
			}
			});	
			
			} else {
				showMes("请选中一条数据");
			}
			
		});
		
		
		
		$("#bj").change(function() {
			
			$.ajax({
			url:"bj",
			data:"type=searchSub&bjId="+$("#bj").val(),
			type:"get",
			dataType:"text",
			success:function(data){
			//location.href="bj?type=manageSub&selectId="+$("#bj").data("bjid");
			var strs=data.split("-|-");
			var subs=JSON.parse(strs[0]);
			var noSubs=JSON.parse(strs[1]);
			
			var subsStr="";
			for(var i=0;i<subs.length;i++){
			subsStr+="<li data-subid="+subs[i].id+">"+subs[i].name+"</li>";
			
			}
			$("#sub").html(subsStr);
			var noSubsStr="";
			for(var i=0;i<noSubs.length;i++){
			noSubsStr+="<li data-subid="+noSubs[i].id+">"+noSubs[i].name+"</li>";
			
			}
			$("#noSub").html(noSubsStr);
			}
			});	
			
			
			
		});
		
		
		function showMes(mes) {
			$("#mes").html(mes);
			setTimeout(function() {
				$("#mes").html("");
			}, 1000);
		}
	});
</script>

</head>

<body>
	<%
		List<Subject> list = (List<Subject>) request.getAttribute("subs");
	%>
	<div id="main">
	<select id="bj"><c:forEach items="${bjs}" var="banji">
	<option <c:if test="${banji.id==bj.id}">selected</c:if> data-bjid="${banji.id}" value="${banji.id}">${banji.name}</option></c:forEach>
	
	</select>>
	<!-- <select id="bj" ><c:forEach items="${bjs}" var="banji">
	<option <c:if test="${banji.id==bj.id }">selected</c:if>data-bjid="${banji.id}" value="${banji.id}">${banji.name }</option>
	</c:forEach>
	</select> -->
		<ul id="sub">
			<c:forEach items="${bj.subs }" var="sub">
				<li data-subid="${sub.id}">${sub.name }</li>
			</c:forEach>
		</ul>
		<div class="btnGroup">
			<button id="add" type="button" class="btn btn-success">↑</button>
			<button id="delete" type="button" class="btn btn-danger">↓</button>
		</div>
		<div id="mes"></div>
		<ul id="noSub">
			<c:forEach items="${noSubs }" var="sub">
				<li data-subid="${sub.id}">${sub.name }</li>
			</c:forEach>
		</ul>


	</div>
</body>
</html>
