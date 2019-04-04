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
	<meta http-equiv="Content-Type" content="multipart/form-data; charset=utf-8" />
	<meta charset="UTF-8">
	<base href = "<%=basePath%>">
	<title>添加商品</title>
	<script type="text/javascript" src="resources/scripts/jquery/jquery-1.7.1.js"></script>
	<script type="text/javascript" src="resources/scripts/authority/commonAll.js"></script>
	<script type="text/javascript" src="resources/scripts/fancybox/jquery.fancybox-1.3.4.js"></script>
	<script type="text/javascript" src="resources/scripts/fancybox/jquery.fancybox-1.3.4.pack.js"></script>
	<script type="text/javascript" src="resources/scripts/artDialog/artDialog.js?skin=default"></script>
	<script type="text/javascript" src="resources/js/myScript.js"></script>
	<link rel="stylesheet" type="text/css" href="resources/style/authority/jquery.fancybox-1.3.4.css" media="screen"></link>
	<link rel="stylesheet" type="text/css" href="resources/css/myStyle.css">
	<script type="text/javascript">
		$(document).ready(function() {
			//提交
			$("#submitbutton").click(function() {
				if(validateForm()){
					window.parent.$.fancybox.close();
			//		checkSubmit();
				}
			});
			//取消
			$("#cancelbutton").click(function() {
				/**  关闭弹出iframe  **/
				window.parent.$.fancybox.close();
			});
			var result = 'null';
			if(result =='success'){
				/**  关闭弹出iframe  **/
				window.parent.$.fancybox.close();
			}
		});
	</script>
</head>
<body>
	<form action="commodity/update" method="post" enctype="multipart/form-data">
		<input type="text" name="id" id="id" value="${commodity.id}" style="display:none" />
		<input type="text" name="brandImg" value="${commodity.brandImg}" style="display:none" />
		<input type="text" name="imgPath" value="${commodity.imgPath}" style="display:none" />
		<div>
			<label><strong>商标</strong>
			<input type="file" name="brandImgPath" id="brandImgPath"/><br>
			</label>
		</div>
		<div>
			<label><strong>商品品牌</strong>
			<input type="text" name="brand" id="brand" required="required" value="${commodity.brand}"/>
			</label>
		</div>
		<div>
			<label><strong>商品名称</strong>
			<input type="text" name="title" id="title" required="required" value="${commodity.title}"/>
			</label>
		</div>
		<div>
			<label><strong>尺码推荐</strong>
			<input type="text" name="size" id="size" required="required" value="${commodity.size}"></input>
			</label>
		</div>
		<div>
			<label><strong>款式</strong>
			<input type="text" name="type" id="type" required="required" value="${commodity.type}"></input>
			</label>
		</div>
		<div>
			<label><strong>款号</strong>
			<input type="text" name="typeId" id="typeId" required="required" value="${commodity.typeId}"></input>
			</label>
		</div>
		<div>
			<label><strong>市场价</strong>
			<input type="text" name="price" id="price" required="required" value="${commodity.price}"></input>
			</label>
		</div>
		<div>
			<label><strong>现售价</strong>
			<input type="text" name="nowPrice" id="nowPrice" required="required" value="${commodity.nowPrice}"></input>
			</label>
		</div>
		<div>
			<label><strong>上传服装图片</strong><br>
			<input type="file" name="imgFile" id="imgFile"/><br>
			<input type="file" name="imgFile" id="imgFile"/><br>
			<input type="file" name="imgFile" id="imgFile"/><br>
			<input type="file" name="imgFile" id="imgFile"/><br>
			</label>
		</div>
		<div>
			<input id="cancelbutton" type="button" value="取消" class="send" />&nbsp;
			<input id="submitbutton" type="submit" value="发送" class="send"/>
		</div>
	</form>
</body>
</html>