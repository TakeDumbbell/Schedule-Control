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
	String checkedbox=(String)request.getAttribute("checkedbox");
	if(checkedbox==null){
		checkedbox="";
	}
	int k=0;
%>
<!DOCTYPE html>
<html>
<head>
	<base href = "<%=basePath%>">
	<meta http-equiv="Content-Type" content="text/html;charset=utf-8" />
	<title>商品列表</title>
	
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
									 
									<li style="float:right"><a><input type="checkbox" name="allcommodity" onclick="SelectAll() "/>全选</a></li>
									 <!-- 
									<li style="float:right"><a><input type="checkbox" id="all"/>全选</a></li>
									 -->
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
							<form action="commodity/query"  method="post" onsubmit="return myCheckedbox()">
								<div>
									<input type="text" name="title" class="search_input" placeholder="商品名称">
									<input type="text" name="type" class="search_input" placeholder="款式">
									<input type="text" name="typeId" class="search_input" placeholder="款号">
									<input type="hidden" name="checkedbox" value="<%=checkedbox%>"/>
									<input type="submit" value="查询" class="button button4"/>
								</div>
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
	<br><br>
	<!-- Product Details -->
	<div class="product_details" id="dvCBs">
	<form action="htmlpage/checkboxname" method="post" onsubmit="return toVaild()" autocomplete="off">
	<%
		if(commodityList!=null){
			for(Commodity commodity:commodityList){
				String[] paths=commodity.getImgPath().split(";");
				if(paths!=null&&paths.length==4){							
	%>
		<div class="container">
			<div class="row details_row">
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
				<!-- Product Content -->
				<div class="col-lg-6">
					<div class="details_content">
						<input type="checkbox" name="category" id="category" value="<%=commodity.getId()%>"/>
						<div class="details_name"><%=commodity.getTitle()%></div>
						<div class="details_discount">￥<%=commodity.getPrice()%></div>
						<div class="details_price">￥<%=commodity.getNowPrice()%></div>
						<!-- In Stock -->
						<div class="in_stock_container">
							<div class="availability">商品品牌:</div>
							<span><%=commodity.getBrand() %></span>
						</div>
						<div class="details_text">
							<p>尺码<%=commodity.getSize()%></p>
							<p>款式 <%=commodity.getType()%></p>
							<p>款号 <%=commodity.getTypeId()%></p>
							<p>
							</p>
						</div>
						<!-- Share -->
						<div class="details_share">
							<span>operation:</span>
							<ul>
								<li>
									<input type="button" value="删除" class="button button4" onclick="javascript:del('<%=commodity.getId() %>')"/> 		
								</li>
								<li><a href="commodity/queryById?id=<%=commodity.getId() %>" class="edit">
										<input type="button" value="修改" class="button button4" /> 		
									</a>
								</li>
							</ul>
						</div>
					</div>
				</div>	
			 </div>
		</div>
	<%
				}
			}
		}
	%>
		<div id="dg" style="z-index: 9999; position: fixed ! important; right: 0px; bottom: 0px;">
			<input type="submit" value="新建网页" class="button button5" id="hid">
			<input type="hidden" value="" name="checkedbox" />
		</div>
	</form>
	<script>
		var checkbox="<%=request.getAttribute("checkedbox")%>";
		if(checkbox!="null"){
			var val=checkbox.split(";");
		    var boxes = document.getElementsByName("category");
		    for(i=0;i<boxes.length;i++){
		        for(j=0;j<val.length;j++){
		            if(boxes[i].value == val[j]){
		                boxes[i].checked = true;
		                break;
		            }
		        }
		    }
		}
		
	</script>
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
<script src="resources/js/commodityList.js" type="text/javascript"></script>
<script src="resources/js/myScript.js" type="text/javascript"></script>
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