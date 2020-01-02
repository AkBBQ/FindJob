// JavaScript Document

//点击跳转页面
function pageGroup(pageNum,pageCount){
	switch(pageNum){
		case 1:
			page_icon(1,5,0);
		break;
		case 2:
			page_icon(1,5,1);
		break;
		case pageCount-1:
			page_icon(pageCount-4,pageCount,3);
		break;
		case pageCount:
			page_icon(pageCount-4,pageCount,4);
		break;
		default:
			page_icon(pageNum-2,pageNum+2,2);
		break;
	}
}

//根据当前选中页生成页面点击按钮
function page_icon(page,count,eq){
	var ul_html = "";
	for(var i=page; i<=count; i++){
		ul_html += "<li>"+i+"</li>";
	}
	$("#pageGro ul").html(ul_html);
	$("#pageGro ul li").eq(eq).addClass("on");
}

//上一页
function pageUp(pageNum,pageCount){
	switch(pageNum){
		case 1:
		break;
		case 2:
			page_icon(1,5,0);
		break;
		case pageCount-1:
			page_icon(pageCount-4,pageCount,2);
		break;
		case pageCount:
			page_icon(pageCount-4,pageCount,3);
		break;
		default:
			page_icon(pageNum-2,pageNum+2,1);
		break;
	}
}

//下一页
function pageDown(pageNum,pageCount){
	switch(pageNum){
		case 1:
			page_icon(1,5,1);
		break;
		case 2:
			page_icon(1,5,2);
		break;
		case pageCount-1:
			page_icon(pageCount-4,pageCount,4);
		break;
		case pageCount:
		break;
		default:
			page_icon(pageNum-2,pageNum+2,3);
		break;
	}
}

//点击下一页
function pageDown_click(pageCount,pageNum,index){
	if(pageCount > 5){
		pageDown(pageNum,pageCount);
	}else{
		var index = $("#pageGro ul li.on").index();//获取当前页
		if(index+1 < pageCount){
			$("#pageGro li").removeClass("on");//清除所有选中
			$("#pageGro ul li").eq(index+1).addClass("on");//选中上一页
		}
	}
	isPage(pageNum+1);
}

//点击上一页
function pageUp_click(pageCount,pageNum,index){
	if(pageCount > 5){
		pageUp(pageNum,pageCount);
	}else{
		var index = $("#pageGro ul li.on").index();//获取当前页
		if(index > 0){
			$("#pageGro li").removeClass("on");//清除所有选中
			$("#pageGro ul li").eq(index-1).addClass("on");//选中上一页
		}
	}+
	
	isPage(pageNum-1);
}

//点击数字按钮
function num_click(pageCount,pageNum,selector){
	if(pageCount > 5){
		pageGroup(pageNum,pageCount);
	}else{
		selector.addClass("on");
		selector.siblings("li").removeClass("on");
	}
	isPage(pageNum);
}

//页面加载时生成按钮
function icon_load(pageCount){
	//生成分页按钮
	if(pageCount>5){
		page_icon(1,5,0);
	}else{
		page_icon(1,pageCount,0);
	}
	isPage(1);
}

//是否有上一页或者下一页
function isPage(pageNum){
	if(pageNum >= pageCount){
		$('#pageGro .pageDown').hide();
	}else{
		$('#pageGro .pageDown').show();
	}
	if(pageNum <= 1){
		$('#pageGro .pageUp').hide();
	}else{
		$('#pageGro .pageUp').show();
	}
}
