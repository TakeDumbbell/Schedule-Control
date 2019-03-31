<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<title>商品列表</title>
</head>
<body>
	<c:forEach items="${commodityList}" var="commodity">
		<div>
			<h2>${commodity.title }</h2><br>
			<p>${commodity.introduce }</p>
			<p>${commodity.type }</p>
			<img src="${commodity.imgPath}" alt="${commodity.imgPath }" width="200" height="250"><br>
		</div><br>
	</c:forEach>
	<a onclick="history.back()" style="color:blue;text-decoration:underline;">后退</a>
</body>
</html>