<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
<meta name="renderer" content="webkit">
<title></title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/statics/css/pintuer.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/statics/css/admin.css">
<script src="${pageContext.request.contextPath}/statics/js/jquery.js"></script>
<script src="${pageContext.request.contextPath}/statics/js/pintuer.js"></script>

</head>
<body>
<div class="panel admin-panel">
  <div class="panel-head" id="add"><strong><span class="icon-pencil-square-o"></span>信息修改</strong></div>
  <div class="body-content">
  ${msg}
    <form method="post" class="form-x" action="${pageContext.request.contextPath}/user/${user.uid}/doModifyUser.php">  
    <input type="hidden" name="uid" value="${user.uid}">
    
      <div class="form-group">
        <div class="label">
          <label>账号：</label>
        </div>
        <div class="field">
         <input type="text" name="uname" class="input w50" value="${user.uname}" readonly="readonly">
         
          
          <div class="tips"></div>
        </div>
      </div>
      <div class="form-group">
        <div class="label">
          <label>地址：</label>
        </div>
        <div class="field">
            <input type="text" id="c1"class="input w50" value="${user.address}" name="address" placeholder="请输入地址" data-validate="required:请输入地址" maxlength="11"/>
          <div class="tips"id="tip1"></div>
        </div>
      </div>
      
      <div class="clear"></div>
      
      <div class="form-group">
        <div class="label">
          <label></label>
        </div>
        <div class="field">
          <button class="button bg-main icon-check-square-o" type="submit"> 提交</button>
           <a href="${pageContext.request.contextPath}/user/welcome.php" class="button bg-main icon-step-backward">返回</a>
          <label style="font-weight: bold;"></label>
        </div>
      </div>
    </form>
  </div>
</div>

</body></html>