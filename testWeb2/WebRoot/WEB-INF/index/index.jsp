<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'index.jsp' starting page</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<style type="text/css">
	#main{
	heignt:420px;
	margin:10px 0 0 150px;
	}
	</style>
  </head>
  
  <body>
  <div style="width:1400px; margin:0 auto;">
   <iframe src="index?type=header" width="100%" height="150px"frameborder="0" scrolling="no" ></iframe>
   <iframe src="index?type=left" width="220px" height="480px"frameborder="0" scrolling="no" ></iframe>
   <iframe id="main" name="main" src="stu"  width="880px"  height="480px" frameborder="0" ></iframe>
   <iframe src="index?type=footer" width="100%" height="120px"frameborder="0" scrolling="no" ></iframe>
  
  </div>
  </body>
</html>
