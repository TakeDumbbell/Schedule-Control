<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() 
						+ ":" + request.getServerPort() + path + "/";
%>
<%
	request.getAttribute("commodityList");
%>
<!DOCTYPE html>
<html>
<head>
	<base href = "<%=basePath%>">
	<meta http-equiv="Content-Type" content="text/html;charset=utf-8" />
	<title>商品列表</title>
	<link rel="stylesheet" type="text/css" href="resources/css/myStyle.css">
	<script src="resources/js/jquery.js" type="text/javascript"></script>
	<script src="resources/js/jquery.min.js" type="text/javascript"></script>
	<script type="text/javascript" src="resources/scripts/jquery/jquery-1.7.1.js"></script>
	<script type="text/javascript" src="resources/scripts/authority/commonAll.js"></script>
	<script type="text/javascript" src="resources/scripts/fancybox/jquery.fancybox-1.3.4.js"></script>
	<script type="text/javascript" src="resources/scripts/fancybox/jquery.fancybox-1.3.4.pack.js"></script>
	<script type="text/javascript" src="resources/scripts/artDialog/artDialog.js?skin=default"></script>
	
	<link rel="stylesheet" type="text/css" href="resources/style/authority/jquery.fancybox-1.3.4.css" media="screen"></link>
	<!--<link href="resources/style/authority/basic_layout.css" rel="stylesheet" type="text/css">
	  <link href="resources/style/authority/common_style.css" rel="stylesheet" type="text/css">
	-->
	<style>
		.max {
			width:100%;
			height:auto;
		}
		.max {
			width:200px;
			height:auto;
		}
	</style>
	<script>
		function resize(img){
			var path="#"+img+"";
			$(function(){
				$(path).click(function(){
					$(this).toggleClass('min');
					$(this).toggleClass('max');
				});
			});
		}
	</script>
	<script type="text/javascript">
		$(document).ready(function(){
			/* 新增   */
		    $("#addBtn").fancybox({
		    	'href'  : 'commodity/addForm',
		    	'width' : 733,
		        'height' : 530,
		        'type' : 'iframe',
		        'hideOnOverlayClick' : false,
		        'showCloseButton' : false,
		        'onClosed' : function() { 
		        	window.location.href = 'commodity/queryAll';
		        }
		    });
		    /*编辑   */
		    $("a.edit").fancybox({
		    	'width' : 733,
		        'height' : 530,
		        'type' : 'iframe',
		        'hideOnOverlayClick' : false,
		        'showCloseButton' : false,
		        'onClosed' : function() { 
		        	window.location.href = 'commodity/queryAll';
		        }
		    });
		});
	
		/** 删除 **/
		function del(fyID){
			if(fyID == "")
				return;
			if(confirm("您确定要删除吗？")){
				$.ajax({
					type:"POST",
					url:"commodity/delete?id="+fyID,
					dataType : "text",
					success:function(data){
						window.location.href = 'commodity/queryAll';
				//		if(data=="true"){
				//			window.parent.$.fancybox.close();
				//		}else{
				//			art.dialog({icon:'error', title:'友情提示', drag:false, resize:false, content:'删除失败', ok:true,});
				//			return false;
				//		}
					},
					error: function(){
						alert("删除失败！");
					}
				});
			}
		}
		function showAll(){
			window.location.href = 'commodity/queryAll';
			$.ajax({
				type:"POST",
				url:"commodity/queryAll",
				dataType : "text",
				success:function(){
					window.location.reload();
				}
			});
		}
		function update(id,brandImg,title){
			/*编辑   */
		    $("a.edit").fancybox({
		    	'href' :'commodity/updateForm',
		    	'width' : 733,
		        'height' : 530,
		        'type' : 'iframe',
		        'hideOnOverlayClick' : false,
		        'showCloseButton' : false,
		        'onClosed' : function() { 
		        	window.location.href = 'commodity/queryAll';
		        }
		    });
		}
		
	</script>
</head>
<body>
	<div class="ui_content">
		<div class="ui_text_indent">
			<div id="box_border">
				<div id="box_top">搜索</div>
				<form action="commodity/query" method="post">
					<div id="box_center">
						商品名称
						<input type="text" name="title" class="ui_input_txt01" style="height:25px; width:150px;" value=""/>
						款式
						<input type="text" name="type" class="ui_input_txt01" style="height:25px; width:150px;" value=""/>
						款号
						<input type="text" name="typeId" class="ui_input_txt01" style="height:25px; width:150px;" value=""/>						
					</div>
				<input type="submit" value="查询" class="ui_input_btn01"/> 
				</form>
				<form action="commodity/queryAll" method="post">
					<input type="submit" value="显示所有" class="ui_input_btn01" /> 
				</form>
				<div id="box_bottom">
					<input type="button" value="新增" class="ui_input_btn01" id="addBtn" /> 
				</div>
			</div>
		</div>
	</div>
	<br><br>
	<c:forEach items="${commodityList}" var="commodity">
		<div id="main">
			<div id="left">
				<img src="/uploadfile/brandImg/${commodity.brandImg}" width="50" height="50">&nbsp;
		<!--  		<img src="E:/java/java_project/brandImg/${commodity.brandImg}" width="50" height="50">&nbsp;
				-->
				<strong style="margin-top:0px;font-size:30px">${commodity.brand }</strong>
				<input type="button" value="删除" class="ui_input_btn01" onclick="javascript:del('${commodity.id}')"/> 
				<!--  
				<a href="commodity/updateForm?id=${commodity.id}&brandImg=${commodity.brandImg}&brand=${commodity.brand}&title=${commodity.title}&size=${commodity.size}&price=${commodity.price}&typeId=${commodity.typeId}&type=${commodity.type}&nowPrice=${commodity.nowPrice}" class="edit">
					<button>修改</button>
				</a>
				-->
				<a href="commodity/queryById?id=${commodity.id}" class="edit">
					<button>修改</button>
				</a>
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
					<div class="border"><img id="aaa" src="resources/images/border.gif" alt="分割线" onclick="resize('aaa')"></div>
					<br>
				</div>
				<br>
			</div>
		</div>
		<br>
	</c:forEach>
</body>
</html>