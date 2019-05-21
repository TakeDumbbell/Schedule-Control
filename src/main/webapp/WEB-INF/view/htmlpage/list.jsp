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
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="description" content="Sublime project">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" type="text/css" href="resources/styles/bootstrap4/bootstrap.min.css">
<link href="resources/plugins/font-awesome-4.7.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" type="text/css" href="resources/plugins/OwlCarousel2-2.2.1/owl.carousel.css">
<link rel="stylesheet" type="text/css" href="resources/plugins/OwlCarousel2-2.2.1/owl.theme.default.css">
<link rel="stylesheet" type="text/css" href="resources/plugins/OwlCarousel2-2.2.1/animate.css">
<link rel="stylesheet" type="text/css" href="resources/styles/main_styles.css">
<link rel="stylesheet" type="text/css" href="resources/styles/responsive.css">

<script type="text/javascript" src="resources/scripts/jquery/jquery-1.7.1.js"></script>
<link href="resources/style/authority/basic_layout.css" rel="stylesheet" type="text/css">
<link href="resources/style/authority/common_style.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="resources/scripts/authority/commonAll.js"></script>
<script type="text/javascript" src="resources/scripts/fancybox/jquery.fancybox-1.3.4.js"></script>
<script type="text/javascript" src="resources/scripts/fancybox/jquery.fancybox-1.3.4.pack.js"></script>
<link rel="stylesheet" type="text/css" href="resources/style/authority/jquery.fancybox-1.3.4.css" media="screen"></link>
<script type="text/javascript" src="resources/scripts/artDialog/artDialog.js?skin=default"></script>
<title>网页列表</title>
<script type="text/javascript">
	$(document).ready(function(){
	    /**编辑   **/
	    /*
	    $("a.edit").fancybox({
	    	'width' : 1000,
	        'height' : 700,
	        'type' : 'iframe',
	        'hideOnOverlayClick' : false,
	        'showCloseButton' : false,
	        'onClosed' : function() { 
	        	window.location.href = 'house_List.jsp';
	        }
	    });*/
	});
	$("body").ready(function(){
	//应用方法
		$("input.date").jSelectDate({
		css:"date",
		yearBeign: 1995,
		disabled : false
		});

	});
	$(this).jSelectDate;
	/** 用户角色   **/
	var userRole = '';

	/** 模糊查询  **/
	function search(){
		var HouseNo = $("#HouseNo").val();
		var HouseTypeNo = $("#HouseTypeNo").val();
		var IsSell = $("#IsSell").val();	
		$.ajax({
			type:"POST",
			url:encodeURI("Servlets/HouseServlet?HouseNo=" + HouseNo + "&HouseTypeNo=" + HouseTypeNo + "&IsSell=" + IsSell + "&action=4"),
			dataType : "text",
			success:function(data){
				if(data!="true"){
					art.dialog({icon:'error', title:'友情提示', drag:false, resize:false, content:'找不到相关数据', ok:true,});
					return false;
				}
				else{
					window.location.reload();
			//		alert("success");
				}
			},
			error: function(){
			//	alert("fail");
			}
		});
	}
	//删除操作
	function del(htmlname,hostname){
		if(confirm("您确定要删除吗？")){
			$.ajax({
				type:"POST",
				url:"htmlpage/delete?htmlName="+htmlname+"&hostName="+hostname,
				dataType : "text",
				success:function(data){
					window.location.href = 'htmlpage/queryAll';
				},
				error: function(){
					alert("fail");
				}
			});
		}
	}
	function showAll(){
		$.ajax({
			type:"POST",
			url:"Servlets/HouseServlet?&action=5",
			dataType : "text",
			success:function(){
				window.location.reload();
			}
		});
	}
</script>
<style>
	.alt td{ background:black !important;}
</style>
</head>
<body>
<div class="super_container">
	<!-- Header -->
	<header class="header">
		<div class="header_container">
			<div class="container">
				<div class="row">
					<div class="col">
						<div class="header_content d-flex flex-row align-items-center justify-content-start">
							<div class="logo"><a href="main">Sublime.</a></div>
							<nav class="main_nav">
								<ul>
									<li class="active">
										<a href="main">主页</a>
									</li>
									<li class="hassubs">
										<a href="commodity/queryAll">商品</a>
										<ul>
											<li><a href="commodity/addForm">Add</a></li>
											<li><a href="commodity/queryAll">Show</a></li>
										</ul>
									</li>
									<li><a href="htmlpage/queryAll">网页</a></li>
									<li><a href="contact">联系我们</a></li>
								</ul>
							</nav>
						</div>
					</div>
				</div>
			</div>
		</div>
	</header>
	<br><br><br><br><br><br>
	<div class="product_details">	
		<form id="submitForm" name="submitForm" action="" method="post">
			<input type="hidden" name="allIDCheck" value="" id="allIDCheck"/>
			<input type="hidden" name="fangyuanEntity.fyXqName" value="" id="fyXqName"/>
			<div id="container">
				<div class="ui_content">
					<div class="ui_tb">
						<table class="table" cellspacing="0" cellpadding="0" width="100%" align="center" border="0">
								<tr>
									<th>网页id</th>
									<!-- 
									<th>发布者</th>
									-->
									<th>网址</th>
									<th>内容</th>
									<th>发布时间</th>
									<th>操作</th>
								</tr>
								<c:forEach items="${htmlpageList}" var="htmlpage">
									<tr>
										<td><a href="commodity/share?p=${htmlpage.htmlName }&h=${htmlpage.hostName }">${htmlpage.htmlName }</a></td>
										<!-- 
										<td>${htmlpage.hostName }</td>
										 -->
										<td><a href="commodity/share?p=${htmlpage.htmlName }&h=${htmlpage.hostName }" target="_blank">
										http://yazorachin.cn:8000/sublime/commodity/share?p=${htmlpage.htmlName }&h=${htmlpage.hostName }
										</a></td>
										<td>${htmlpage.content }</td>
										<td>${htmlpage.createTime }</td>
										<td>  
											<a href="htmlpage/update?htmlName=${htmlpage.htmlName}&hostName=${htmlpage.hostName}" class="edit">编辑</a> 
											<a href="javascript:del('${htmlpage.htmlName}','${htmlpage.hostName}')">删除</a>
										</td>
									</tr>
								</c:forEach>
						</table>
					</div>
				</div>
			</div>
		</form>
	</div>
	

	<!-- Footer -->
	<div class="footer_overlay"></div>
	<footer class="footer">
		<div class="footer_background" style="background-image:url(resources/images/footer.jpg)"></div>
		<div class="container">
			<div class="row">
				<div class="col">
					<div class="footer_content d-flex flex-lg-row flex-column align-items-center justify-content-lg-start justify-content-center">
						<div class="footer_logo"><a href="#">Sublime.</a></div>
						<div class="copyright ml-auto mr-auto"><!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved | This template is made with <i class="fa fa-heart-o" aria-hidden="true"></i> by <a href="https://colorlib.com" target="_blank">Colorlib</a>
<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. --></div>
						<div class="footer_social ml-lg-auto">
							<ul>
								<li><a href="#"><i class="fa fa-pinterest" aria-hidden="true"></i></a></li>
								<li><a href="#"><i class="fa fa-instagram" aria-hidden="true"></i></a></li>
								<li><a href="#"><i class="fa fa-facebook" aria-hidden="true"></i></a></li>
								<li><a href="#"><i class="fa fa-twitter" aria-hidden="true"></i></a></li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
	</footer>
</div>
</body>
</html>