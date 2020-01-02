//验证菜名
function checkNum() {
 	 var $Telnum = $("#c1");
 	    var $div = $("#tip1");
 	    $div.html("");
 	    var telTest=/^1\d{10}$/;
 	    if ($Telnum.val() == "") {
 	        $div.html("<span style='color:red'>* 手机号码不能为空</span>");
 	        return false;
 	    }else if(!telTest.test($Telnum.val())){
 	    	
 	    	 $div.html("<span style='color:red'>* 手机号码格式不正确(请输入以13,14,15,17,18开头的11位正确的手机号码)</span>");
  	        return false;
 	    }
 	   
 	    return true;    
 }

$(function () {
    //绑定失去焦点事件
	 $("#c1").blur(checkNum);
	
    //提交表单,调用验证函数
    $(".form-x").submit(function () {
	    
        var flag = true;
        if (!checkNum()) flag = false;
        return true;
    });
});
