/** 表单验证  **/
function validateForm(){
	if($("#brand").val()==""){
		art.dialog({icon:'error', title:'友情提示', drag:false, resize:false, content:'请填写商品品牌', ok:true,});
		return false;
	}
	if($("#title").val()==""){
		art.dialog({icon:'error', title:'友情提示', drag:false, resize:false, content:'请填写商品名称', ok:true,});
		return false;
	}
	if($("#size").val()==""){
		art.dialog({icon:'error', title:'友情提示', drag:false, resize:false, content:'请填写商品尺码推荐', ok:true,});
		return false;
	}
	if($("#type").val()==""){
		art.dialog({icon:'error', title:'友情提示', drag:false, resize:false, content:'请填写商品款式', ok:true,});
		return false;
	}
	if($("#typeId").val()==""){
		art.dialog({icon:'error', title:'友情提示', drag:false, resize:false, content:'请填写商品款号', ok:true,});
		return false;
	}
	if($("#price").val()==""){
		art.dialog({icon:'error', title:'友情提示', drag:false, resize:false, content:'请填写商品市场价', ok:true,});
		return false;
	}
	if($("#nowPrice").val()==""){
		art.dialog({icon:'error', title:'友情提示', drag:false, resize:false, content:'请填写商品现售价', ok:true,});
		return false;
	}
	return true;
};

