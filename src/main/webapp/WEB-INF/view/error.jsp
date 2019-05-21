<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isErrorPage="true"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() 
						+ ":" + request.getServerPort() + path + "/";
%>
<!DOCTYPE html>
<html>
<head>
<base href = "<%=basePath%>">
	<meta charset="UTF-8">
	<title>Document</title>
	<link rel="stylesheet" href="resources/styles/public.css" />

	<style type="text/css">

		h1{
			font-size: 60px;
			color:blue;
		}
	</style>
</head>
<body>
	<h1>404</h1>
	<p>对不起，没有这个页面</p>
</body>
</html>