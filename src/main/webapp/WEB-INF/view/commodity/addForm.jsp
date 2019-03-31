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
<meta charset="UTF-8">
<title>添加商品</title>
</head>
<body>
	<form action="" method="get" id="">
		<div>
			<label><strong>商品名称</strong>
			<input type="text" name="title" id="title" required="required" />
			</label>
		</div>
		<div>
			<label><strong>商品类型</strong>
			<select name="type" size="1" id="type">
				<option value="1">针织衫</option>
				<option value="2">大衣</option>
				<option value="3">衬衫</option>
			</select>
			</label>
		</div>
		<div>
			<label><strong>商品简介</strong>
			<textarea name="introduce" id="introduce" cols="20" rows="3"></textarea>
			</label>
		</div>
		<div>
			<input type="reset" value="取消" class="send" />&nbsp;
			<input type="submit" value="发送" class="send" />
		</div>
		
	</form>
</body>
</html>