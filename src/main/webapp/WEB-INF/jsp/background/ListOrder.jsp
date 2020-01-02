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
		var d=JSON.parse(data);
		if(d.result == "true"){		    
		    alert("订单发货成功！");
		    location.href="${pageContext.request.contextPath}/bookorder/orderList.php";
		  }
		if(d.result == "false" ){
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
<form method="post" action="${pageContext.request.contextPath}/bookorder/orderList.php" id="listform">
  <div class="panel admin-panel">
    <div class="panel-head"><strong class="icon-reorder">订单列表</strong><label style="font-weight: bold;">   ${U3}</label> </div>
    <div class="padding border-bottom">    
          <input type="text" placeholder="请输入搜索关键字" name="oname" class="input" value="${oname}" style="width:250px; line-height:17px;display:inline-block" />
          <button type="submit" class="button border-main icon-search"> 搜索下单用户名</button>
          <input type="hidden" name="currentpage" value="">
        
         
    
    </div>
    ${requestScope.massage}
    <table class="table table-hover text-center">
    
      <tr>
      
        <th width="5%" style="text-align:left; padding-left:20px;">编号</th>
        <th width="10%">订单号</th>
        <th width="10%">下单日期</th>
        <th width="10%">提交人</th>
        <th width="20%">发货地址</th>
        <th width="10%">联系方式</th>
        <th width="20%">发货状态</th>
        <th width="40%">总金额</th>        
        <th	width="500%">操作</th>
      </tr>
      <volist name="list" id="vo">
       <c:forEach items="${requestScope.util.list}" var="bookorder" varStatus="st">
        <tr>
         
          <td style="text-align:left; padding-left:20px;">${st.count}</td>
          <td>${bookorder.oid}</td>
          <td>${bookorder.odate}</td>
          <td>${bookorder.oname}</td>
          <td>${bookorder.oaddress}</td>
          <td width="10%">${bookorder.otelephone}</td>
          <c:if test="${bookorder.ostate==0}">
             <td ><input id="ostate" type="hidden" value="${bookorder.ostate}"/>未发货</td>
          </c:if>
          <c:if test="${bookorder.ostate==1}">
             <td style="color:red"><input id="ostate" type="hidden" value="${bookorder.ostate}"/>已发货</td>
          </c:if>          
          <td>${bookorder.oprice}</td>
          <c:if test="${bookorder.ostate==0}">
          <td>         
          <div class="button-group">     
           <a class="button border-red" href="${pageContext.request.contextPath}/ordercontent/ordercontentList.php?oid=${bookorder.oid}&ostate=${bookorder.ostate}"><span class="icon-trash-o"></span>查看详情</a>
          <a class="button border-main" href="${pageContext.request.contextPath}/bookorder/queryBookOrder.php?oid=${bookorder.oid}"><span class="icon-edit">更新</span></a>
          </div>
          </td>
          </c:if>
           <c:if test="${bookorder.ostate==1}">
          <td>         
          <div class="button-group">     
           <a class="button border-red" href="${pageContext.request.contextPath}/ordercontent/ordercontentList.php?oid=${bookorder.oid}&ostate=${bookorder.ostate}"><span class="icon-trash-o"></span>查看详情</a>
          </div>
          </td>
          </c:if>
        </tr>
          </c:forEach>
      <tr>
      </tr>
      <tr>
       <td colspan="8">
        <div class="pagelist">
            
        <c:if test="${requestScope.util.currentPage>1}">
       
      	    <a href="${pageContext.request.contextPath}/bookorder/orderList.php?currentPage=1">首页</a> 
       		<a href="${pageContext.request.contextPath}/bookorder/orderList.php?currentPage=${requestScope.util.currentPage-1}">上一页</a>
      	 </c:if>
      	
      	 	${requestScope.util.currentPage}/${requestScope.util.totalPage}
      	<c:if test="${requestScope.util.currentPage<requestScope.util.totalPage}">
     	    <a href="${pageContext.request.contextPath}/bookorder/orderList.php?currentPage=${requestScope.util.currentPage+1}">下一页</a>
     	    <a href="${pageContext.request.contextPath}/bookorder/orderList.php?currentPage=${requestScope.util.totalPage}">尾页</a>    
        </c:if>
        </div>
        </td>
      </tr>
    </table>
  </div>
</form>
</body>
</html>