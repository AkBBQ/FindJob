<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
    <meta name="renderer" content="webkit">
    <title>登录</title>  
    <link rel="stylesheet" href="/backStyle/css/pintuer.css">
    <link rel="stylesheet" href="/backStyle/css/admin.css">
    <script src="/backStyle/js/jquery.js"></script>
    <script src="/backStyle/js/pintuer.js"></script>
<script src="/backStyle/js/jquery-1.12.4.js"></script>
<script type="text/javascript">
   function  login(){
	    var name=document.getElementsByName("companyNum")[0].value;
	    var password=document.getElementsByName("companyPwd")[0].value;
		$.ajax({
		"url" : "${pageContext.request.contextPath}/backUser/doBackLogin",
		"type" : "POST",
		"data" : {
		       "companyNum" :name,
		       "companyPwd":password},
		"dataType" : "JSON",
		"success" : function(data){
		if(data.result === "true"){
		    
		    location.href="${pageContext.request.contextPath}/backUser/toBackIndex";
		  }
		if(data.result === "false"){
		   $("#tip").html("用户名或密码输入错误，重新输入");
		   
		  }
		
	    }
	});
		
	}

</script>

</head>
<body>
<div class="bg"></div>
<div class="container">
    <div class="line bouncein">
        <div class="xs6 xm4 xs3-move xm4-move">
            <div style="height:150px;"></div>
            <div class="media media-y margin-big-bottom">           
            </div>         
            <form  method="post" >
            <div class="panel loginbox">
                <div class="text-center margin-big padding-big-top"><h1>后台管理中心</h1></div>
                <div class="panel-body" style="padding:30px; padding-bottom:10px; padding-top:10px;">
                    <div class="form-group">
                        <div class="field field-icon-right">
                            <input type="text" class="input input-big" name="companyNum"   placeholder="登录账号" data-validate="required:请填写账号" />
                            <span class="icon icon-user margin-small"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="field field-icon-right">
                            <input type="password" class="input input-big" name="companyPwd" placeholder="登录密码" data-validate="required:请填写密码" />
                            <span class="icon icon-key margin-small"></span>
                        </div>
                    </div>
                   <div id="tip" style="color:red;margin: 0 auto;" ></div>
                </div>
                <div style="padding:30px;"><input type="button" onclick="javascript:login()" class="button button-block bg-main text-big input-big" value="登录"></div>
                <ul class="form-links">
                    <li class="text-center"><a href="${pageContext.request.contextPath}/backCompany/toRegister">没有账号?</a>
                    </li>
                </ul>
            </div>
            </form>
        </div>
    </div>
</div>

</body>
</html>