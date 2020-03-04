<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
    <meta name="renderer" content="webkit">
    <title>招聘网后台管理中心</title>
    <link rel="stylesheet" href="/backStyle/css/pintuer.css">
    <link rel="stylesheet" href="/backStyle/css/admin.css">
    <script src="/backStyle/js/jquery.js"></script>
</head>
<body style="background-color:#f2f9fd;">
<div class="header bg-main">
  <div class="logo margin-big-left fadein-top">
    <h1><img src="/backStyle/images/y.jpg" class="radius-circle rotate-hover" height="50" alt="" />${sessionScope.company.companyName}</h1>
  </div>
  <div class="head-l"><a class="button button-little bg-green" href="${pageContext.request.contextPath }/backUser/toBackIndex" target="_self"><span class="icon-home"> 后台首页</span></a>&nbsp;&nbsp;
  <a class="button button-little bg-red" href="${pageContext.request.contextPath }/backUser/doLogout"><span class="icon-power-off"> 退出登录</span></a> </div>
</div>
<div class="leftnav">
  <div class="leftnav-title"><strong><span class="icon-list"></span>菜单列表</strong></div>
  <h2><span class="icon-user"></span>基本设置</h2>
  <ul style="display:block">
    <li><a href="${pageContext.request.contextPath}/backUser/toModifyPwd" target="right"><span class="icon-caret-right"></span>修改密码</a></li>
  </ul>
  <c:if test="${sessionScope.company.status == 1}">
      <h2><span class="icon-pencil-square-o"></span>应聘者管理</h2>
      <ul>
        <li><a href="${pageContext.request.contextPath}/backUser/userList" target="right"><span class="icon-caret-right"></span>应聘者列表</a></li>
      </ul>
  </c:if>
  <h2><span class="icon-pencil-square-o"></span>公司信息</h2>
  <ul>
    <li><a href="${pageContext.request.contextPath}/backCompany/companyList" target="right"><span class="icon-caret-right"></span>公司管理</a></li>
  </ul>  
  <h2><span class="icon-pencil-square-o"></span>简历管理</h2>
  <ul>
    <li><a href="${pageContext.request.contextPath}/resume/resumeList" target="right"><span class="icon-caret-right"></span>简历列表</a></li>
  </ul>
    <ul>
        <li><a href="${pageContext.request.contextPath}/resume/resumeList" target="right"><span class="icon-caret-right"></span>已被录用</a></li>
    </ul>
  <c:if test="${sessionScope.company.status == 1}">
      <h2><span class="icon-pencil-square-o"></span>类别管理</h2>
      <ul>
        <li><a href="${pageContext.request.contextPath}/backCategory/categoryList" target="right"><span class="icon-caret-right"></span>类型列表</a></li>
      </ul>
  </c:if>
  <h2><span class="icon-pencil-square-o"></span>职位管理</h2>
  <ul>
    <li><a href="${pageContext.request.contextPath}/backPosition/positionList" target="right"><span class="icon-caret-right"></span>职位列表</a></li>
    <c:if test="${sessionScope.company.status == 0}">
        <li><a href="${pageContext.request.contextPath}/backPosition/toAddPosition" target="right"><span class="icon-caret-right"></span>发布职位信息</a></li>
    </c:if>
  </ul>

    <c:if test="${sessionScope.company.status == 0}">
    <h2><span class="icon-pencil-square-o"></span>评论信息</h2>
    <ul>
        <li><a href="${pageContext.request.contextPath}/evaluate/showEvaluate" target="right"><span class="icon-caret-right"></span>评论列表</a></li>
    </ul>
    </c:if>

    <c:if test="${sessionScope.company.status == 0}">
        <h2><span class="icon-pencil-square-o"></span>人才库</h2>
        <ul>
            <li><a href="${pageContext.request.contextPath}/favorite/showTalentPool" target="right"><span class="icon-caret-right"></span>我的收藏</a></li>
        </ul>
    </c:if>
    <input type="hidden" name="name" value="${sessionScope.company.companyName}"/>
</div>
<script type="text/javascript">
$(function(){
  $(".leftnav h2").click(function(){
	  $(this).next().slideToggle(200);	
	  $(this).toggleClass("on"); 
  })
  $(".leftnav ul li a").click(function(){
	    $("#a_leader_txt").text($(this).text());
  		$(".leftnav ul li a").removeClass("on");
		$(this).addClass("on");
  })
});
</script>
<ul class="bread">
  <li><a href="${pageContext.request.contextPath}/backUser/toBackIndex" target="right" class="icon-home"> 首页</a></li>
  <li><a href="##" id="a_leader_txt">网站信息</a></li>
</ul>
<div class="admin">
  <iframe scrolling="auto" rameborder="0" src="${pageContext.request.contextPath}/backUser/welcome" name="right" width="100%" height="100%"></iframe>
</div>
</body>
</html>