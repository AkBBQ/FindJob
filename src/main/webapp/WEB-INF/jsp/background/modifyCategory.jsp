<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="fm" %>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
<meta name="renderer" content="webkit">
<title></title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/backStyle/css/pintuer.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/backStyle/css/admin.css">
<script src="${pageContext.request.contextPath}/backStyle/js/jquery.js"></script>
<script src="${pageContext.request.contextPath}/backStyle/js/pintuer.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/backStyle/js/page_common.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/backStyle/calendar/calendar.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/backStyle/calendar/WdatePicker.js"></script>
</head>
<body>
<div class="panel admin-panel">
  <div class="panel-head" id="add"><strong><span class="icon-pencil-square-o"></span>修改分类</strong></div>
  <div class="body-content">
    <fm:form method="post" class="form-x" action="${pageContext.request.contextPath}/backCategory/doModifyCategory"
     enctype="multipart/form-data" modelAttribute="category">
      <div class="form-group">
        <div class="label">
          
        </div>
        <div class="field">
          <div class="tips"></div>
        </div>
      </div>
      <div class="form-group">
        <div class="label">
       <input type="hidden" name="id" value="" />
          <label>分类图片：</label>
        </div>
        <div class="field">
        <img alt="图片" src="/style/assets/img/about/${category.categoryPhoto}">
          <input type="file" id="url1" name="categoryPhoto1" class="input tips" style="width:25%; float:left;"
           data-toggle="hover" data-place="right" data-image="${category.categoryPhoto}"  value="${category.categoryPhoto}"/>
          <div class="tipss"></div>
        </div>
      </div>

       <div class="form-group">
        <div class="label">
          <label>分类名称：</label>
        </div>
       <div class="field">
           <fm:input class="input w50" path="categoryName" placeholder="请输入分类名称" data-validate="required:请输入分类名称" value="${category.categoryName}"/>
           <div class="tips"></div>
        </div>
      </div>

      <div class="form-group">
        <div class="label">
          <label></label>
        </div>
        <div class="field">
          <button class="button bg-main icon-check-square-o" type="submit"> 提交</button>
           <a href="${pageContext.request.contextPath}/backCategory/categoryList" class="button bg-main icon-step-backward">返回</a>
        </div>
      </div>
    </fm:form>
  </div>
</div>

</body></html>