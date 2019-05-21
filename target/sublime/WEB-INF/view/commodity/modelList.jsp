<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page  import="domain.Commodity" import="java.util.*"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() 
						+ ":" + request.getServerPort() + path + "/";
%>
<%
	List<Commodity> commodityList=new ArrayList<Commodity>();
	commodityList=(List<Commodity>)request.getAttribute("commodityList");
	int k=0;
%>
<!DOCTYPE html>
<html>
<head>
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" />
	<meta name="renderer" content="webkit"/>
	<meta name="force-rendering" content="webkit"/>
	<!-- 解决部分兼容性问题，如果安装了GCF，则使用GCF来渲染页面，如果未安装GCF，则使用最高版本的IE内核进行渲染。 -->
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		
	<base href = "<%=basePath%>">
	<meta http-equiv="Content-Type" content="text/html;charset=utf-8" />
	
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="description" content="Sublime project">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" type="text/css" href="resources/styles/bootstrap4/bootstrap.min.css">
	<link href="resources/plugins/font-awesome-4.7.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">
	<link rel="stylesheet" type="text/css" href="resources/plugins/OwlCarousel2-2.2.1/owl.carousel.css">
	<link rel="stylesheet" type="text/css" href="resources/plugins/OwlCarousel2-2.2.1/owl.theme.default.css">
	<link rel="stylesheet" type="text/css" href="resources/plugins/OwlCarousel2-2.2.1/animate.css">
	<link rel="stylesheet" type="text/css" href="resources/styles/product.css">
	<link rel="stylesheet" type="text/css" href="resources/styles/product_responsive.css">
	<title>商品列表</title>
</head>
<body>

<div class="super_container">
	<!-- Menu -->
	<div class="menu menu_mm trans_300">
		<div class="menu_container menu_mm">
			<div class="page_menu_content">
							
				<div class="page_menu_search menu_mm">
					<form action="#">
						<input type="search" required="required" class="page_menu_search_input menu_mm" placeholder="Search for products...">
					</form>
				</div>
				<ul class="page_menu_nav menu_mm">
					<li class="page_menu_item has-children menu_mm">
						<a href="index.html">Home<i class="fa fa-angle-down"></i></a>
						<ul class="page_menu_selection menu_mm">
							<li class="page_menu_item menu_mm"><a href="commodity/queryAll">商品<i class="fa fa-angle-down"></i></a></li>
							<li class="page_menu_item menu_mm"><a href="htmlpage/queryAll">网页<i class="fa fa-angle-down"></i></a></li>
							<li class="page_menu_item menu_mm">Cart<i class="fa fa-angle-down"></i></li>
							<li class="page_menu_item menu_mm"><a href="contact">联系我们<i class="fa fa-angle-down"></i></a></li>
						</ul>
					</li>
				</ul>
			</div>
		</div>

		<div class="menu_close"><i class="fa fa-times" aria-hidden="true"></i></div>

		<div class="menu_social">
			<ul>
				<li><a href="#"><i class="fa fa-pinterest" aria-hidden="true"></i></a></li>
				<li><a href="#"><i class="fa fa-instagram" aria-hidden="true"></i></a></li>
				<li><a href="#"><i class="fa fa-facebook" aria-hidden="true"></i></a></li>
				<li><a href="#"><i class="fa fa-twitter" aria-hidden="true"></i></a></li>
			</ul>
		</div>
	</div>
	<!-- Home -->

	<div class="home">
		<div class="home_container">
			<div class="home_background" style="background-image:url(resources/images/categories.jpg)"></div>
			<div class="home_content_container">
				<div class="container">
					<div class="row">
						<div class="col">
							<div class="home_content">
								<div class="home_title">Smart Phones<span>.</span></div>
								<div class="home_text"><p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam a ultricies metus. Sed nec molestie eros. Sed viverra velit venenatis fermentum luctus.</p></div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- Product Details -->
	<div class="product_details">
	<%
		if(commodityList!=null){
			for(Commodity commodity:commodityList){
				String[] paths=commodity.getImgPath().split(";");
				if(paths!=null&&paths.length==4){							
	%>
		<div class="container">
			<div class="row details_row">
				
				<!-- Product Content -->
				<div class="col-lg-6">
					<div class="details_content">
						<div class="details_name"><%=commodity.getTitle()%></div>
						<div class="details_discount">$<%=commodity.getPrice()%></div>
						<div class="details_price">$<%=commodity.getNowPrice()%></div>

						<!-- In Stock -->
						<div class="in_stock_container">
							<div class="availability">商品品牌:</div>
							<span><%=commodity.getBrand() %></span>
						</div>
						<div class="details_text">
							<p>尺码<%=commodity.getSize()%></p>
							<p>款式 <%=commodity.getType()%></p>
							<p>款号 <%=commodity.getTypeId()%></p>
						</div>

						<!-- Share -->
						<div class="details_share">
							<span>Share:</span>
							<ul>
								<li><i class="fa fa-pinterest" aria-hidden="true"></i></li>
								<li><i class="fa fa-instagram" aria-hidden="true"></i></li>
								<li><i class="fa fa-facebook" aria-hidden="true"></i></li>
								<li><i class="fa fa-twitter" aria-hidden="true"></i></li>
							</ul>
						</div>
					</div>
				</div>	
				
				<!-- Product Image -->		
				<div class="col-lg-6">
					<div class="details_image">
						<a	href="/uploadfile/images/<%=paths[0]%>" target="_Blank">
							<img src="/uploadfile/images/<%=paths[0]%>" width='200' height='200'">
						</a>
						<a	href="/uploadfile/images/<%=paths[1]%>" target="_Blank">
							<img src="/uploadfile/images/<%=paths[1]%>" width='200' height='200'">
						</a>
						<a	href="/uploadfile/images/<%=paths[2]%>" target="_Blank">
							<img src="/uploadfile/images/<%=paths[2]%>" width='200' height='200'">
						</a>
						<a	href="/uploadfile/images/<%=paths[3]%>" target="_Blank">
							<img src="/uploadfile/images/<%=paths[3]%>" width='200' height='200'">
						</a>
					</div>
				</div>
				
			 </div>
		</div>
	<%
				}
			}
		}
	%>	
	</div>
	<!-- Footer -->
	
	<div class="footer_overlay"></div>
	<footer class="footer">
		<div class="footer_background" style="background-image:url(resources/images/footer.jpg)"></div>
		<div class="container">
			<div class="row">
				<div class="col">
					<div class="footer_content d-flex flex-lg-row flex-column align-items-center justify-content-lg-start justify-content-center">
						<div class="copyright ml-auto mr-auto"><!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved | This template is made with <i class="fa fa-heart-o" aria-hidden="true"></i> by <a href="https://colorlib.com" target="_blank">Colorlib</a>
<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. --></div>
						<div class="footer_social ml-lg-auto">
							<ul>
								<li><i class="fa fa-pinterest" aria-hidden="true"></i></li>
								<li><i class="fa fa-instagram" aria-hidden="true"></i></li>
								<li><i class="fa fa-facebook" aria-hidden="true"></i></li>
								<li><i class="fa fa-twitter" aria-hidden="true"></i></li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
	</footer>
</div>

<script src="http://apps.bdimg.com/libs/html5shiv/3.7/html5shiv.min.js"></script>
<script src="http://apps.bdimg.com/libs/respond.js/1.4.2/respond.min.js"></script>
<script src="resources/js/jquery-3.2.1.min.js"></script>
<script src="resources/styles/bootstrap4/popper.js"></script>
<script src="resources/styles/bootstrap4/bootstrap.min.js"></script>
<script src="resources/plugins/greensock/TweenMax.min.js"></script>
<script src="resources/plugins/greensock/TimelineMax.min.js"></script>
<script src="resources/plugins/scrollmagic/ScrollMagic.min.js"></script>
<script src="resources/plugins/greensock/animation.gsap.min.js"></script>
<script src="resources/plugins/greensock/ScrollToPlugin.min.js"></script>
<script src="resources/plugins/OwlCarousel2-2.2.1/owl.carousel.js"></script>
<script src="resources/plugins/Isotope/isotope.pkgd.min.js"></script>
<script src="resources/plugins/easing/easing.js"></script>
<script src="resources/plugins/parallax-js-master/parallax.min.js"></script>
<script src="resources/js/product.js"></script>
</body>
</html>