//检查发货地址
function checkaddress() {
 	    var $address=$("#c1");
 	    var $div = $("#tip1");
 	    $div.html("");
 	    var address=$address.val();
 	    if (address=="") {
 	        $div.html("<span style='color:red'>*发货不能为空</span>");
 	        return false;
 	    }
 	   
 	    return true;    
 }
//检查联系方式
function checkemail(){
	var $email = $("#c2");
	var $div = $("#tip2");
	$div.html("");
	var email=$email.val();
    var reg =/^\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$/;
    if(email==""){
    	 $div.html("<span style='color:red'>* 联系方式不能为空！</span>");
	        return false;
    }if(!reg.test(email)){
    	$div.html("<span style='color:red'>* 您输入的邮箱格式不对！</span>");
    	   return false;
    }
    
    return true; 
    }
//检查输入价格
function checkprice() {
	var $sprice=$("#sp");
	var $dprice=$("#dp");
	    var $divs=$("#tip3");
	    var $divd=$("#tip4");
	    $divs.html("");
	    $divd.html("");
	    var sp=$sprice.val();
	    var dp=$dprice.val();
	    var reg=/(^[1-9]\d*(\.\d{1,2})?$)|(^0(\.\d{1,2})?$)/;
	    if (sp=="") {
	        $divs.html("<span style='color:red'>*价格不能为空！</span>");
	        
	        return false;
	    }
	    if(!reg.test(sp)){
	 	    	$divs.html("<span style='color:red'>*您输入的数据有误，请重新输入！</span>");
	 	    	return false;
	 	}
	    
	    if (dp=="") {
	        $divd.html("<span style='color:red'>*价格不能为空！</span>");
	        
	        return false;
	    }
	    	
	    if(!reg.test(dp)){
		    	$divd.html("<span style='color:red'>*您输入的数据有误，请重新输入！</span>");
		    	return false;
		}
	    	    
	    return true;    
}
//检查折扣
function checkdiscount() {
	var $discount=$("#ds");
	var $div=$("#tip7");
	    var ds=$discount.val();
	    var reg=/^(0\.0[1-9]{1})|(0\.[1-9]{2})|(0\.[1-9]{1}0)|(1\.[0]{2})$/;
	    if (ds=="") {
	        $div.html("<span style='color:red'>*折扣不能为空！</span>");	        
	        return false;
	    }
	    if(!reg.test(ds)){
	 	    	$div.html("<span style='color:red'>*您输入的数据有误，请重新输入！</span>");
	 	    	return false;
	 	}	   	    	    
	    return true;    
}       
//检查整数
function checknum(){
	var $stock=$("#st");
	var $score=$("#sc");
	    var $divst=$("#tip5");
	    var $divsc=$("#tip6");
	    $divst.html("");
	    $divsc.html("");
	    var st=$stock.val();
	    var sc=$score.val();
	    var reg=/^(?:[0-2]?\d{1,3}|3000)$/;
	    if (st=="") {
	        $divst.html("<span style='color:red'>*库存不能为空！</span>");
	        
	        return false;
	    }
	    if(!reg.test(st)){
	 	    	$divst.html("<span style='color:red'>*您输入的数据有误，请重新输入！</span>");
	 	    	return false;
	 	}
	    
	    if (sc=="") {
	        $divsc.html("<span style='color:red'>*积分不能为空！</span>");
	        
	        return false;
	    }
	    	
	    if(!reg.test(sc)){
		    	$divsc.html("<span style='color:red'>*您输入的数据有误，请重新输入！</span>");
		    	return false;
		}
	    	    
	    return true;    
    }

$(function () {
    //缁戝畾澶卞幓鐒︾偣浜嬩欢
	 $("#c1").blur(checkaddress);
	 $("#c2").blur(checkemail);
	 $("#sp").blur(checkprice);
	 $("#dp").blur(checkprice);
	 $("#st").blur(checknum);
	 $("#sc").blur(checknum);
	 $("#ds").blur(checkdiscount);
    //鎻愪氦琛ㄥ崟,璋冪敤楠岃瘉鍑芥暟
    $(".form-x").submit(function () {
	    
        var flag = true;
        if (!checkaddress()) flag = false;
        if (!checkemail()) flag = false;
        if (!checkprice()) flag = false;
        if (!checknum()) flag = false;
        if (!checknum()) flag = false;
        if (!checkdiscount()) flag = false;
        return true;
    });
});
