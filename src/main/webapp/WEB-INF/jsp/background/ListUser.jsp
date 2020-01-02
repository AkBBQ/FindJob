<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
</head>
<body>
<form method="post" action="${pageContext.request.contextPath}/backUser/userList" id="listform">
  <div class="panel admin-panel">
    <div class="panel-head"><strong class="icon-reorder"> 用户列表</strong>
	<label style="font-weight: bold;">${jg}</label>
     <label style="font-weight: bold;">   ${U3}</label> 
     <a href="" style="float:right; display:none;">添加字段</a></div>
    <div class="padding border-bottom">
    
      <ul class="search" style="padding-left:10px;">
        <li>
          <input type="text" placeholder="请输入搜索关键字" name="userName" class="input" value="${userName}" style="width:250px; line-height:17px;display:inline-block" />
          <button type="submit" class="button border-main icon-search"> 搜索应聘名字</button>
          <input type="hidden" name="currentPage" value="">
        </li>
      </ul>
    </div>
    <table class="table table-hover text-center">
      <tr>
        <th width="10%" style="text-align:left; padding-left:20px;">编号</th>
        <th width="10%">头像</th>
        <th width="10%">名字</th>
        <th width="10%">电话</th>
        <th width="10%">年龄</th>
        <th width="10%">教育程度</th>
        <th width="10%">性别</th>
        <th width="10%">生日</th>
        <th width="10%">开始工作日期</th>
      </tr>
      
      <volist name="list" id="vo">
      <c:forEach items="${userList}" var="user" varStatus="status">
        <tr>
          <td style="text-align:left; padding-left:20px;">${status.count}</td>
          <td width="10%"><img alt="图片" src="${user.userPhoto}" style="width: 150px;"></td>
          <td width="10%">${user.userName}</td>
          <td width="10%">${user.userTel}</td>
          <td width="10%">${user.userAge}</td>
          <td width="10%">${user.userEdu}</td>
          <td width="10%">${user.userSex}</td>
          <td width="10%">${user.userBirth}</td>
          <td width="10%">${user.userWorkDate}</td>
        </tr>
        </c:forEach>
      <tr>
       
      </tr>
      <tr>
       <td colspan="8">
        <div class="pagelist">
      	    <a href="${pageContext.request.contextPath}/backUser/userList?currentPage=1">首页</a>
       		<a href="${pageContext.request.contextPath}/backUser/userList?currentPage=${requestScope.util.currentPage-1}">上一页</a>
      	 	${requestScope.util.currentPage}/${requestScope.util.totalPage}
     	    <a href="${pageContext.request.contextPath}/backUser/userList?currentPage=${requestScope.util.currentPage+1}">下一页</a>
     	    <a href="${pageContext.request.contextPath}/backUser/userList?currentPage=${requestScope.util.totalPage}">尾页</a>
        </div>
        </td>
      </tr>
    </table>
  </div>
</form>

</body>
</html>