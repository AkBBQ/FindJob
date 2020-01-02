<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
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
<div class="panel admin-panel">
  <div class="panel-head"><strong class="icon-reorder"> 内容列表</strong></div>
  <div class="padding border-bottom">
    <button type="button" class="button border-yellow" onclick="window.location.href='#add'"><span class="icon-plus-square-o"></span> 添加分类</button>
  </div>
  <table class="table table-hover text-center">
    <tr>
      <th width="5%">分类编号</th>
      <th width="15%">分类名称</th>
      <th width="15%">分类图片</th>
      <th width="10%">操作</th>
    </tr>
    <c:forEach items="${categoryList}" var="category" varStatus="status">
    <tr>
      <td>${status.index+1}</td>
      <td>${category.categoryName}</td>
      <td><img alt="图片" src="/style/assets/img/about/${category.categoryPhoto}"></td>
      <td><div class="button-group"> <a class="button border-main" href="${pageContext.request.contextPath}/backCategory/${category.categoryId}/toModifyCategory"><span class="icon-edit"></span> 修改</a> </div></td>
    </tr>
    </c:forEach>
  </table>
</div>
<script type="text/javascript">
function del() {
var msg = "您真的确定要删除吗？\n\n请确认！";
if (confirm(msg)==true){
return true;
}else{
return false;
}
}
</script>
<div class="panel admin-panel margin-top">
  <div class="panel-head" id="add"><strong><span class="icon-pencil-square-o"></span>添加内容</strong>&nbsp&nbsp&nbsp${requestScope.update }</div>
  <div class="body-content">
    <form method="post" class="form-x" action="AddMenuTypeServlet">
      <div class="form-group">
        <div class="label">
          <label>分类名称：</label>
        </div>
        <div class="field">
          <input type="text" class="input w50" name="tType" value=""  placeholder="请输入分类名称" data-validate="required:请输入分类名称"/>
          <div class="tips"></div>
        </div>
      </div>
      <div class="form-group">
        <div class="label">
          <label></label>
        </div>
        <div class="field">
          <button class="button bg-main icon-check-square-o" type="submit"> 提交</button>
        </div>
      </div>
    </form>
  </div>
</div>
</body>
</html>