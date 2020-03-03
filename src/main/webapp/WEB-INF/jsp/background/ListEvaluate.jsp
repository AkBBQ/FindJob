<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix='fmt' uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib  prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
<meta name="renderer" content="webkit">
<title>评论列表</title>
<link rel="stylesheet" href="/backStyle/css/pintuer.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/backStyle/css/admin.css">
<script src="${pageContext.request.contextPath}/backStyle/js/jquery.js"></script>
<script src="${pageContext.request.contextPath}/backStyle/js/pintuer.js"></script>
<script src="${pageContext.request.contextPath}/backStyle/js/Menu.js"></script>
</head>
<body>
<form method="post" action="${pageContext.request.contextPath}/backCompany/companyList" id="listform">
  <div class="panel admin-panel">
    <div class="panel-head"><strong class="icon-reorder">收到的评论</strong><label style="font-weight: bold;"></label> </div>

    <table class="table table-hover text-center">
      <tr>
        <th width="10%">编号</th>
        <th width="10%">岗位名称</th>
        <th width="10%">应聘者名字</th>
        <th width="10%">评星</th>
        <th width="10%">内容</th>
        <th width="10%">评论时间</th>
        <th width="30%">操作</th>
      </tr>
      <volist name="list" id="vo">
      <c:forEach items="${evaluateDTOS}" var="data" varStatus="px">
        <tr>
               <td >${px.count}</td>
				<td >${data.positionName}</td>
				<td >${data.userName}</td>
				<td >${data.star}</td>
				<td >${data.content}</td>
				<td >${data.createTime}</td>
               <td><a class="button border-main" href=""><span class="icon-edit"></span>拉黑</a></td>
        </tr>
      </c:forEach>
    </table>
  </div>
</form>

</body>
</html>