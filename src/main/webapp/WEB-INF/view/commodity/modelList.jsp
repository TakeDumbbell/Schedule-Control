<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() 
						+ ":" + request.getServerPort() + path + "/";
%>
<%
//	request.getAttribute("commodityList");
%>
<!DOCTYPE html>
<html>
<head>
	<base href = "<%=basePath%>">
	<meta http-equiv="Content-Type" content="text/html;charset=utf-8" />
	<title>商品列表</title>
	<link rel="stylesheet" type="text/css" href="resources/css/myStyle.css">
</head>
<body>
	<br><br>
	<c:forEach items="${commodityList}" var="commodity">
		<div id="main">
			<div id="left">
				<img src="/uploadfile/brandImg/${commodity.brandImg}" width="50" height="50">&nbsp;
				<strong style="margin-top:0px;font-size:30px">${commodity.brand }</strong>
			</div>
			<div id="right">
				<p>${commodity.title }</p>
				<p>尺码&nbsp;${commodity.size }</p>
				<p>款式 ${commodity.type }</p>
				<p>款号 ${commodity.typeId }</p>
				<div>
					售价&nbsp;<strong style="color:red;font-size:20px;">￥${commodity.nowPrice }</strong>
					<del>￥${commodity.price }</del>
				</div>
				<div>
					<script type="text/javascript">
						var imgPath="${commodity.imgPath}";
						var paths=imgPath.split(";");
						for(var i=0;i<paths.length;i++){
							var number=paths[i].split(".");
							var n2="a"+number[0]+"a";
							var imgsrc="<a href='/uploadfile/images/"+paths[i]+"' target='_blank'><img src='/uploadfile/images/" + paths[i] + "' width='200' height='200'></a>";
							document.write(imgsrc);
							if(i%2==1)
								document.write("<br>");
						}
					</script>
					<br>
					<div class="border"><img id="aaa" src="/uploadfile/images/border.gif" alt="分割线" onclick="resize('aaa')"></div>
					<br>
				</div>
			</div>
		</div>
		<br>
	</c:forEach>
	<br>
</body>
</html>