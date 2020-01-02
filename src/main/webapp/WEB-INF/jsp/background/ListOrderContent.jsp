<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<script src="${pageContext.request.contextPath}/statics/js/jquery-1.12.4.js"></script>
<script type="text/javascript">
   function  updateostate(oid){
	if(confirm("您确定要发货吗?")){
		$.ajax({
		"url" : "${pageContext.request.contextPath}/bookorder/updateostate",
		"type" : "POST",
		"data" : {
		       "oid" : oid},
		"dataType" : "JSON",
		"success" : function(data){
		if(data.result == "true"){		    
		    alert("订单发货成功！");
		    location.href="${pageContext.request.contextPath}/bookorder/orderList.php";
		  }
		if(data.result == "false"){
		    alert("订单发货失败!");
		   location.href="${pageContext.request.contextPath}/bookorder/orderList.php";
		  }
		
	    }
	});
		
	}
}
</script>
</head>
<body>
<div class="panel admin-panel">
<div class="panel-head"><strong class="icon-reorder">${oid}:订单详情列表</strong><label style="font-weight: bold;">   ${U3}</label> </div>


		              <table class="table table-hover text-center">
    
      <tr>
      
        <th width="10%" style="text-align:left; padding-left:20px;">书名</th>
        <th width="20%">积分</th>
        <th width="15%">原价</th>
        <th width="15%">当当价</th>
        <th width="35%">数量</th>

      </tr>
      <volist name="list" id="vo">
       <c:forEach var="ordercontent" items="${requestScope.util.list}" varStatus="lists">
        <tr>
         
          <td style="text-align:left; padding-left:20px;">${ordercontent.bname}</td>
          <td>${ordercontent.bscore}</td>
          <td>${ordercontent.bsourcePrice}</td>
          <td>${ordercontent.bddPrice}</td>
          <td>${ordercontent.bddPrice}</td>
          
        </tr>
          </c:forEach>
      <tr>
      </tr>
      <tr>
       <td colspan="8">
         <c:if test="${ostate==0}">
            <div class="button-group">    
            <a class="button border-main" onclick="javascript: updateostate(${oid})"><span class="icon-edit">发货</span></a>
            <a class="button border-red" href="${pageContext.request.contextPath}/bookorder/orderList.php"><span class="icon-search"></span> 返回</a>
            </div>
           </c:if> 
            <c:if test="${ostate==1}">
            <div class="button-group">    
            <a class="button border-main" ><span class="icon-edit">已发货</span></a>
            <a class="button border-red" href="${pageContext.request.contextPath}/bookorder/orderList.php"><span class="icon-search"></span> 返回</a>
            </div>
           </c:if> 
           
        <div class="pagelist">
         <c:if test="${requestScope.util.currentPage>1}">
       
      	    <a href="${pageContext.request.contextPath}/ordercontent/ordercontentList.php?currentPage=1">首页</a> 
       		<a href="${pageContext.request.contextPath}/ordercontent/ordercontentList.php?currentPage=${requestScope.util.currentPage-1}">上一页</a>
      	</c:if> 
      	 	${requestScope.util.currentPage}/${requestScope.util.totalPage}
      	<c:if test="${requestScope.util.currentPage<requestScope.util.totalPage}"> 	
     	    <a href="${pageContext.request.contextPath}/ordercontent/ordercontentList.php?currentPage=${requestScope.util.currentPage+1}">下一页</a>
     	    <a href="${pageContext.request.contextPath}/ordercontent/ordercontentList.php?currentPage=${requestScope.util.totalPage}">尾页</a> 
        </c:if>
        </div>
        </td>
      </tr>
    </table>
</div>

</body></html>