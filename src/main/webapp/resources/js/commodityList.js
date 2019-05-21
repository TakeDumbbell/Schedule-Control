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

var clicknum=0;
function SelectAll() {
	var checkboxs=document.getElementsByName("category");
	var allbox=document.getElementsByName("allcommodity");
	var all=allbox[0];
	for (var i=0;i<checkboxs.length;i++) {
		var e=checkboxs[i];
		e.checked=all.checked;
	}
}

function toVaild(){
	var checkboxs=document.getElementsByName("category");
	var selected=document.getElementsByName("checkedbox")[0].value;
	var count=0;
	for (var i=0;i<checkboxs.length;i++) {
		var e=checkboxs[i];
		if(e.checked==true){
			count++;
		} else{
			if(selected.indexOf(";"+e.value+";")>0){
				selected=selected.replace(e.value+";","");
			} else if(selected.indexOf(e.value+";")==0){
				selected=selected.replace(e.value+";","");
			} else if(selected.indexOf(";"+e.value)+e.value.length+1==selected.length){
				selected=selected.replace(";"+e.value,"");
			}
		}
	}
	if(count<=0){
		alert('请选择至少一件商品！');
		return false;
	}
//	alert(selected);
	document.getElementsByName("checkedbox")[1].value=document.getElementsByName("checkedbox")[0].value=selected;
	return true;
}


function myCheckedbox(){
	var obj=document.getElementsByName('category');
	var selected=document.getElementsByName("checkedbox")[0].value;
	chect_val="";
	var j=0;
	for (var i=0;i<obj.length;i++) {
		var e=obj[i];
		if(e.checked==true){
			if(selected.indexOf(";"+e.value+";")>0||selected.indexOf(e.value+";")==0||selected.indexOf(";"+e.value)+e.value.length+1==selected.length){
				continue;
			}
			if(selected.length==0){
				selected=selected+e.value;
			} else{
				selected=selected+";"+e.value;
			}
			/*
			if(j!=0){
				chect_val=chect_val+";";
			}
			j++;
			chect_val=chect_val+e.value;*/
		} else{
			if(selected.indexOf(";"+e.value+";")>0){
				selected=selected.replace(e.value+";","");
			} else if(selected.indexOf(e.value+";")==0){
				selected=selected.replace(e.value+";","");
			} else if(selected.indexOf(";"+e.value)+e.value.length+1==selected.length){
				selected=selected.replace(";"+e.value,"");
			}
		}
	}
	document.getElementsByName("checkedbox")[0].value = selected;
	alert(document.getElementsByName("checkedbox")[0].value);
	/*
	if(document.getElementsByName("checkedbox")[0].value=="")
		document.getElementsByName("checkedbox")[0].value = chect_val;
	else if(j!=0){
		chect_val=";"+chect_val;
		document.getElementsByName("checkedbox")[0].value =selected+ chect_val;
	} else{
		document.getElementsByName("checkedbox")[0].value=selected;
	}
	alert(document.getElementsByName("checkedbox")[0].value);
	*/
	return true;
}