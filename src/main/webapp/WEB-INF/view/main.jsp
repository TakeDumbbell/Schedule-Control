<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() 
						+ ":" + request.getServerPort() + path + "/";
%>
<!DOCTYPE html>
<html>
<head>
<base href = "<%=basePath %>">
<meta charset = "UTF-8">
<title>Insert title here</title>
</head>
<body>
	<a href="commodity/addForm">增加商品</a>
	<a href="commodity/queryAll">显示所有商品</a></br>
</body>
</html>