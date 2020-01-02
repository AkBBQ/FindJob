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
<title></title>
<link rel="stylesheet" href="/backStyle/css/pintuer.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/backStyle/css/admin.css">
<script src="${pageContext.request.contextPath}/backStyle/js/jquery.js"></script>
<script src="${pageContext.request.contextPath}/backStyle/js/pintuer.js"></script>
<script src="${pageContext.request.contextPath}/backStyle/js/Menu.js"></script>
</head>
<body>
<form method="post" action="${pageContext.request.contextPath}/backPosition/positionList" id="listform">
  <div class="panel admin-panel">
    <div class="panel-head"><strong class="icon-reorder"> 公司信息</strong><label style="font-weight: bold;"></label> </div>
    <div class="padding border-bottom">
      <ul class="search" style="padding-left:10px;">
        <li>
          <input type="text" placeholder="请输入搜索关键字" name="positionName" class="input" value="${positionName}" style="width:250px; line-height:17px;display:inline-block" />
          <button type="submit" class="button border-main icon-search"> 搜索职位信息</button>
          <input type="hidden" name="currentPage" value="${currentpage}">
        </li>
      </ul>
    </div>
    <table class="table table-hover text-center">
      <tr>
        <th width="10%">职位编号</th>
        <th width="10%">职位名称</th>
        <th width="10%">职位地址</th>
        <th width="15%">职位要求</th>
        <th width="10%">发布公司</th>
        <th width="10%">职位描述</th>
        <th width="15%">薪资介绍</th>
        <th width="10%">发布时间</th>
     <c:if test="${sessionScope.company.status == 0}">
        <th width="30%">操作</th>
      </c:if>
             
      </tr>
      <volist name="list" id="vo">
      <c:forEach items="${positionList}" var="position" varStatus="px">
        <tr>
               <td >${px.count}</td>
				<td >${position.positionName}</td>
				<td >${position.positionAddr}</td>
				<td >${position.positionRequest}</td>
                <td >${position.companyName}</td>
                <td ><textarea style="maxlength='10'" readonly="readonly">${position.positionDesc}</textarea></td>
				<td >${position.positionPrice}</td>
				<td >${position.releaseDate}</td>
            <c:if test="${sessionScope.company.status == 0}">
              <td><div class="button-group">
                  <a class="button border-main" href="${pageContext.request.contextPath}/backPosition/${position.positionId}/toUpdatePosition"><span class="icon-edit"></span> 修改</a>
                  <a class="button border-red" href="${pageContext.request.contextPath}/backPosition/doDeletePosition/?positionId=${position.positionId}&currentPage=${util.currentPage}" onclick="javascript:return del();"><span class="icon-trash-o"></span> 删除</a>
              </div></td>
            </c:if>
        </tr>
      </c:forEach>

      <tr>
      <td colspan="8">
        <div class="pagelist">
      	    <a href="${pageContext.request.contextPath}/backPosition/positionList?currentPage=1">首页</a>
       		<a href="${pageContext.request.contextPath}/backPosition/positionList?currentPage=${requestScope.util.currentPage-1}">上一页</a>
      	 	${requestScope.util.currentPage}/${requestScope.util.totalPage}
     	    <a href="${pageContext.request.contextPath}/backPosition/positionList?currentPage=${requestScope.util.currentPage+1}">下一页</a>
     	    <a href="${pageContext.request.contextPath}/backPosition/positionList?currentPage=${requestScope.util.totalPage}">尾页</a>
        </div>
        </td>
      </tr>
    </table>
  </div>
</form>
<script type="text/javascript">
	$(function(){
	 $(".puton").click(function(){
	 	var obj=$(this);
	 	var state=obj.attr("state");
	 	var bid=obj.attr("bid");
	 	var currentPage=obj.attr("currentPage");
	 	$.ajax({
					"url":"ModifyState",
					"data":{"state":state,"bid":bid},
					"type":"POST",
					"dataType":"JSON",
					"success" : function(data) {
						location.href="${pageContext.request.contextPath}/backCompany/companyList?currentPage="+currentPage;
				  }
				});			
	 
	 });
	 	
});

</script>
</body>
</html>