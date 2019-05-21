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
		/** 新增   **/
	    $("#addBtn").fancybox({
	    	'href'  : 'house_edit.jsp',
	    	'width' : 733,
	        'height' : 530,
	        'type' : 'iframe',
	        'hideOnOverlayClick' : false,
	        'showCloseButton' : false,
	        'onClosed' : function() { 
	        	window.location.href = 'house_List.jsp';
	        }
	    });
	    /**编辑   **/
	    $("a.edit").fancybox({
	    	'width' : 733,
	        'height' : 530,
	        'type' : 'iframe',
	        'hideOnOverlayClick' : false,
	        'showCloseButton' : false,
	        'onClosed' : function() { 
	        	window.location.href = 'house_List.jsp';
	        }
	    });
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
											<!--  
											<li><a href="categories.html">Category</a></li>
											<li><a href="categories.html">Category</a></li>
											<li><a href="categories.html">Category</a></li>
											-->
										</ul>
									</li>
									<li><a href="htmlpage/queryAll">网页</a></li>
									<li><a href="contact">联系我们</a></li>
								</ul>
							</nav>
							<div class="header_extra ml-auto">
								<div class="shopping_cart">
										<svg version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
												 viewBox="0 0 489 489" style="enable-background:new 0 0 489 489;" xml:space="preserve">
											<g>
												<path d="M440.1,422.7l-28-315.3c-0.6-7-6.5-12.3-13.4-12.3h-57.6C340.3,42.5,297.3,0,244.5,0s-95.8,42.5-96.6,95.1H90.3
													c-7,0-12.8,5.3-13.4,12.3l-28,315.3c0,0.4-0.1,0.8-0.1,1.2c0,35.9,32.9,65.1,73.4,65.1h244.6c40.5,0,73.4-29.2,73.4-65.1
													C440.2,423.5,440.2,423.1,440.1,422.7z M244.5,27c37.9,0,68.8,30.4,69.6,68.1H174.9C175.7,57.4,206.6,27,244.5,27z M366.8,462
													H122.2c-25.4,0-46-16.8-46.4-37.5l26.8-302.3h45.2v41c0,7.5,6,13.5,13.5,13.5s13.5-6,13.5-13.5v-41h139.3v41
													c0,7.5,6,13.5,13.5,13.5s13.5-6,13.5-13.5v-41h45.2l26.9,302.3C412.8,445.2,392.1,462,366.8,462z"/>
											</g>
										</svg>
										<div>Cart <span>(0)</span></div>
								</div>
								<div class="search">
									<div class="search_icon">
										<svg version="1.1" id="Capa_1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
										viewBox="0 0 475.084 475.084" style="enable-background:new 0 0 475.084 475.084;"
										 xml:space="preserve">
										<g>
											<path d="M464.524,412.846l-97.929-97.925c23.6-34.068,35.406-72.047,35.406-113.917c0-27.218-5.284-53.249-15.852-78.087
												c-10.561-24.842-24.838-46.254-42.825-64.241c-17.987-17.987-39.396-32.264-64.233-42.826
												C254.246,5.285,228.217,0.003,200.999,0.003c-27.216,0-53.247,5.282-78.085,15.847C98.072,26.412,76.66,40.689,58.673,58.676
												c-17.989,17.987-32.264,39.403-42.827,64.241C5.282,147.758,0,173.786,0,201.004c0,27.216,5.282,53.238,15.846,78.083
												c10.562,24.838,24.838,46.247,42.827,64.234c17.987,17.993,39.403,32.264,64.241,42.832c24.841,10.563,50.869,15.844,78.085,15.844
												c41.879,0,79.852-11.807,113.922-35.405l97.929,97.641c6.852,7.231,15.406,10.849,25.693,10.849
												c9.897,0,18.467-3.617,25.694-10.849c7.23-7.23,10.848-15.796,10.848-25.693C475.088,428.458,471.567,419.889,464.524,412.846z
												 M291.363,291.358c-25.029,25.033-55.148,37.549-90.364,37.549c-35.21,0-65.329-12.519-90.36-37.549
												c-25.031-25.029-37.546-55.144-37.546-90.36c0-35.21,12.518-65.334,37.546-90.36c25.026-25.032,55.15-37.546,90.36-37.546
												c35.212,0,65.331,12.519,90.364,37.546c25.033,25.026,37.548,55.15,37.548,90.36C328.911,236.214,316.392,266.329,291.363,291.358z
												"/>
										</g>
									</svg>
									</div>
								</div>
								<div class="hamburger"><i class="fa fa-bars" aria-hidden="true"></i></div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		
		<!-- Search Panel -->
		<div class="search_panel trans_300">
			<div class="container">
				<div class="row">
					<div class="col">
						<div class="search_panel_content d-flex flex-row align-items-center justify-content-end">
							<form action="#">
								<input type="text" class="search_input" placeholder="Search" required="required">
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>

		<!-- Social -->
		<div class="header_social">
			<ul>
				<li><a href="#"><i class="fa fa-pinterest" aria-hidden="true"></i></a></li>
				<li><a href="#"><i class="fa fa-instagram" aria-hidden="true"></i></a></li>
				<li><a href="#"><i class="fa fa-facebook" aria-hidden="true"></i></a></li>
				<li><a href="#"><i class="fa fa-twitter" aria-hidden="true"></i></a></li>
			</ul>
		</div>
	</header>
	<div class="home">
		<div class="home_slider_container">
			<form id="submitForm" name="submitForm" action="" method="post">
			<input type="hidden" name="allIDCheck" value="" id="allIDCheck"/>
			<input type="hidden" name="fangyuanEntity.fyXqName" value="" id="fyXqName"/>
			<div id="container">
				<div class="ui_content">
					<div class="ui_tb">
						<table class="table" cellspacing="0" cellpadding="0" width="100%" align="center" border="0">
								<tr>
									<th>网页id</th>
									<th>发布者</th>
									<th>内容</th>
									<th>发布时间</th>
									<th>操作</th>
								</tr>
								<c:forEach items="${htmlpageList}" var="htmlpage">
									<tr>
										<td><a href="commodity/share?p=${htmlpage.htmlName }&h=${htmlpage.hostName }">${htmlpage.htmlName }</a></td>
										<td>${htmlpage.hostName }</td>
										<td>${htmlpage.content }</td>
										<td>${htmlpage.createTime }</td>
										<td>
											<a href="" class="edit">编辑</a> 
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