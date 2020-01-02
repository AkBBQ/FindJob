<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
<meta name="renderer" content="webkit">
<title></title>
<link rel="stylesheet" href="/backStyle/css/pintuer.css">
<link rel="stylesheet" href="/backStyle/css/admin.css">
<script src="${pageContext.request.contextPath}/backStyle/js/jquery.js"></script>
<script src="${pageContext.request.contextPath}/backStyle/js/pintuer.js"></script>
<script src="${pageContext.request.contextPath}/backStyle/js/jquery-1.12.4.js"></script>
<script type="text/javascript">
	$(function(){
		$("#oldupassword").blur(function(){
		
			checkPwd();
			
		});
	});
    //检查密码
     function checkPwd(){
                 var pwd=document.getElementById("oldupassword").value;
	             if(pwd===""){
		         $("#error").html("<span style='color:red'>*原密码不能为空</span>");
					return false;
		         }else{                 
                 $.ajax({
					"url"  : "/backUser/queryPwd",
					"data" : { "oldupassword" : pwd },
					"type" : "POST",
					"dataType" :"JSON",
					"success"  :  function(data){
					if (data.result === "true") {
				           
						$("#error").html("<span style='color:green'>*原密码正确</span>");
						return true;
					}if(data.result === "false"){
						$("#error").html("<span style='color:red'>*原密码错误</span>");
						return false;
					 }
				     }
				   });
                 return true;
				   }	
			}

		

</script>
<script type="text/javascript">
			//修改密码	
			  function updatePwd(){
                var upwd=document.getElementsByName("newupassword")[0].value;
                    if(checkPwd()){
         	      if(confirm("你确定要修改密码吗？")){                  
				$.ajax({
					"url"  : "/backUser/updatePwd",
					"type" : "POST",
					"data" : { "upassword" : upwd},
					"dataType" : "JSON",
					"success" : function(data) {
					
						if(data.result === "true"){
							alert("修改成功,请重新登录");	
							parent.location.href="${pageContext.request.contextPath}/backUser/doLogout";
						}
						if(data.result === "false"){
							alert("修改失败,请确认操作是否正确");
							location.href=location.href;
						}
					  },
					    "error" : function(){alert("获取数据出错!");}   
				});
			   }
			}else{
			        alert("修改密码失败,请确认操作是否正确！");
			        location.href=location.href;
			}
			
			}

</script>
</head>
<body>
<div class="panel admin-panel">
  <div class="panel-head"><strong><span class="icon-key"></span> 修改管理员密码</strong></div>
  <div class="body-content">
    <form method="post" class="form-x" action="">
      <div class="form-group">
        <div class="label">
          <label for="sitename">管理员帐号：</label>
        </div>
        <div class="field">
          <label style="line-height:33px;">
           ${sessionScope.company.companyNum}
          </label>
          <input type="hidden" name="mname" value="admin">
        </div>
      </div>      
      <div class="form-group">
        <div class="label">
          <label for="sitename">原始密码：</label>
        </div>
        <div class="field">
          <input type="password" class="input w50" id="oldupassword" name="oldupassword" size="50"  />
          <div id="error"></div>    
        </div>
      </div>      
      <div class="form-group">
        <div class="label">
          <label for="sitename">新密码：</label>
        </div>
        <div class="field">
          <input type="password" class="input w50" name="newupassword" id="newupassword" size="50" placeholder="请输入新密码" data-validate="required:请输入新密码,length#>=5:新密码不能小于5位,length#<=20:新密码不能大于20位" maxlength="21"/>
        </div>
      </div>
      <div class="form-group">
        <div class="label">
          <label for="sitename">确认新密码：</label>
        </div>
        <div class="field">
          <input type="password" class="input w50" name="renewpass" id="renewpass" size="50" placeholder="请再次输入新密码" data-validate="required:请再次输入新密码,repeat#newupassword:两次输入的密码不一致,length#<=20:密码不能大于20位" maxlength="21"/>
        </div>
      </div>
      
      <div class="form-group">
        <div class="label">
          <label></label>
        </div>
        <div class="field">
           <input  type="button" onclick="javascript:return updatePwd()" class="button bg-main icon-check-square-o" value="提交"/>
          <label style="font-weight: bold;">${message }</label>  
        </div>
      </div>      
    </form>
  </div>
</div>
</body>

</html>