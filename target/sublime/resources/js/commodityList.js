document.write("<script language=javascript src='resources/scripts/jquery/jquery-1.7.1.js'></script>");
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
		//window.parent.$.fancybox.close();
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
			window.parent.$.fancybox.close();
			//window.location.href = 'commodity/queryAll';
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
	$("a.edit").fancybox({
		'href' :'commodity/updateForm',
		'width' : 733,
		'height' : 530,
		'type' : 'iframe',
		'hideOnOverlayClick' : false,
		'showCloseButton' : false,
		'onClosed' : function() { 
//			window.parent.$.fancybox.close();
		    window.location.href = 'commodity/queryAll';
		}
	});
}
function SelectAll() {
	var checkboxs=document.getElementsByName("category");
	for (var i=0;i<checkboxs.length;i++) {
		var e=checkboxs[i];
		e.checked=!e.checked;
	}
}