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
<form method="post" action="${pageContext.request.contextPath}/backCompany/companyList" id="listform">
  <div class="panel admin-panel">
    <div class="panel-head"><strong class="icon-reorder"> 简历信息</strong><label style="font-weight: bold;"></label> </div>
    <div class="padding border-bottom">
      <ul class="search" style="padding-left:10px;">
        <li>
          <input type="text" placeholder="请输入搜索关键字" name="resumeName" class="input" value="${resumeName}" style="width:250px; line-height:17px;display:inline-block" />
          <button type="submit" class="button border-main icon-search"> 搜索简历</button>
          <input type="hidden" name="currentPage" value="${currentpage}">
        </li>
      </ul>
    </div>
    <table class="table table-hover text-center">
      <tr>
        <th width="10%">编号</th>
        <th width="10%">照片</th>
        <th width="10%">名字</th>
        <th width="10%">地址</th>
        <th width="10%">电话</th>
        <c:if test="${company.status == 0}">
          <th width="15%">投递时间</th>
          <th width="15%">状态</th>
        </c:if>
        <th width="30%">操作</th>        
             
      </tr>
      <volist name="list" id="vo">
      <c:forEach items="${resumeList}" var="resume" varStatus="px">
        <tr>
               <td >${px.count}</td>
                <td ><img src="${resume.resumePhoto}" alt="照片" style="width: 150px;"></td>
				<td >${resume.resumeName}</td>
				<td >${resume.address}</td>
				<td >${resume.resumeTel}</td>
                <c:if test="${company.status == 0}">
                  <td >${resume.deliverTime}</td>
                  <c:if test="${resume.state == 0}">
                    <td >待处理</td>
                  </c:if>
                  <c:if test="${resume.state == 1}">
                    <td >已同意</td>
                  </c:if>
                  <c:if test="${resume.state == 2}">
                    <td >已拒绝</td>
                  </c:if>
                </c:if>
          <td><div class="button-group">
            <c:if test="${company.status == 0}">
              <a class="button border-main" href="${pageContext.request.contextPath}/resume/${resume.deliverId}/resumeDetail"><span class="icon-edit"></span>详情</a>
            </c:if>
            <c:if test="${company.status == 0}">
              <a class="button border-main" href="${pageContext.request.contextPath}/favorite/${resume.userId}/addTalentPool"><span class="icon-edit"></span>加入人才库</a>
            </c:if>
            </div></td>
        </tr>
      </c:forEach>

      <tr>
      <td colspan="8">
        <div class="pagelist">
      	    <a href="${pageContext.request.contextPath}/resume/resumeList?currentPage=1">首页</a>
       		<a href="${pageContext.request.contextPath}/resume/resumeList?currentPage=${requestScope.util.currentPage-1}">上一页</a>
      	 	${requestScope.util.currentPage}/${requestScope.util.totalPage}
     	    <a href="${pageContext.request.contextPath}/resume/resumeList?currentPage=${requestScope.util.currentPage+1}">下一页</a>
     	    <a href="${pageContext.request.contextPath}/resume/resumeList?currentPage=${requestScope.util.totalPage}">尾页</a>
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