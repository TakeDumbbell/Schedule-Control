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
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />
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

<div>
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
						<div class="details_discount">￥<%=commodity.getPrice()%></div>
						<div class="details_price">￥<%=commodity.getNowPrice()%></div>
						<!-- In Stock -->
						<div class="in_stock_container">
							<div class="availability">商品品牌:</div>
							<span><%=commodity.getBrand() %></span>
							<p>尺码<%=commodity.getSize()%></p>
							<p>款式 <%=commodity.getType()%></p>
							<p>款号 <%=commodity.getTypeId()%></p>
						</div>
						<table>
							<tr>
								<td>
									<a	href="/uploadfile/images/<%=paths[0]%>" target="_Blank">
										<img src="/uploadfile/images/<%=paths[0]%>" width='170' height='170' class="img-responsive">
									</a>
								</td>
								<td>
									<a	href="/uploadfile/images/<%=paths[1]%>" target="_Blank">
										<img src="/uploadfile/images/<%=paths[1]%>" width='170' height='170' class="img-responsive">
									</a>
								</td>
							</tr>
							<tr>
								<td>
									<a	href="/uploadfile/images/<%=paths[2]%>" target="_Blank">
										<img src="/uploadfile/images/<%=paths[2]%>" width='170' height='170' class="img-responsive">
									</a>
								</td>
								<td>
									<a	href="/uploadfile/images/<%=paths[3]%>" target="_Blank">
										<img src="/uploadfile/images/<%=paths[3]%>" width='170' height='170' class="img-responsive">
									</a>
								</td>
							</tr>
						</table>
					</div>
				</div>	
				<!-- Product Image -->		
				<!--  
				<div class="col-lg-6">
					<div class="details_image">
						<div class="details_image_thumbnails d-flex flex-row align-items-start justify-content-between">
							<div>
							<a	href="/uploadfile/images/<%=paths[0]%>" target="_Blank">
								<img src="/uploadfile/images/<%=paths[0]%>" width='150' height='150'" class="img-responsive">
							</a>
							<a	href="/uploadfile/images/<%=paths[1]%>" target="_Blank">
								<img src="/uploadfile/images/<%=paths[1]%>" width='150' height='150'" class="img-responsive">
							</a>
							</div>
							<div>
							<a	href="/uploadfile/images/<%=paths[2]%>" target="_Blank">
								<img src="/uploadfile/images/<%=paths[2]%>" width='150' height='150'" class="img-responsive">
							</a>
							<a	href="/uploadfile/images/<%=paths[3]%>" target="_Blank">
								<img src="/uploadfile/images/<%=paths[3]%>" width='150' height='150'" class="img-responsive">
							</a>
							</div>
						</div>
					</div>
				</div>
				-->
			 </div>
		</div>
	<%
				}
			}
		}
	%>	
	</div>
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