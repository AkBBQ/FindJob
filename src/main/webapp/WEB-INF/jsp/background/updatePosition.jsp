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
<title>aaaaa</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/backStyle/css/pintuer.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/backStyle/css/admin.css">
<script src="${pageContext.request.contextPath}/backStyle/js/jquery.js"></script>
<script src="${pageContext.request.contextPath}/backStyle/js/pintuer.js"></script>
<script src="${pageContext.request.contextPath}/backStyle/js/Menu.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/backStyle/js/page_common.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/backStyle/calendar/calendar.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/backStyle/calendar/WdatePicker.js"></script>
</head>
<body>
<div class="panel admin-panel">
  <div class="panel-head" id="add"><strong><span class="icon-pencil-square-o"></span>发布职位信息</strong></div>
  <div class="body-content">
    <fm:form method="post" class="form-x" action="${pageContext.request.contextPath}/backPosition/doUpdatePosition"
    modelAttribute="position">
      <div class="form-group">
        <div class="label">
          
        </div>
        <div class="field">
          
          <div class="tips"></div>
        </div>
      </div>
        
       <div class="form-group">
          <div class="label">
            <label>职位名称：</label>
          </div>
          <div class="field">
          <fm:input path="positionName" class="input w50" placeholder="请输入职位名称" data-validate="required:请输入职位名称" value="${position.positionName}"/>
          <div class="tips"></div>
        </div>
        </div>
      </if>
      <div class="form-group">
        <div class="label">
          <label>所属地区：</label>
        </div>
       <div class="field">
       <fm:input path="positionAddr" class="input w50" placeholder="请输入所属地区" data-validate="required:请输入所属地区" value="${position.positionAddr}"/>
          <div class="tips"></div>
        </div>
      </div>
      <div class="form-group">
        <div class="label">
          <label>职位要求：</label>
        </div>
       <div class="field">
          <fm:input class="input w50" path="positionRequest" placeholder="请输入职位要求" data-validate="required:请输入职位要求" value="${position.positionRequest}"/>
          <div class="tips"></div>
        </div>
      </div>

        <if condition="$iscid eq 1">
            <div class="form-group">
                <div class="label">
                    <label>职位类型：</label>
                </div>
                <div class="field">
                    <fm:select path="categoryId" class="input w50" style="width:80px" items="${categoryList}" value="${position.categoryId}"
                               itemLabel="categoryName" itemValue="categoryId">
                    </fm:select>
                    <div class="tipss"></div>
                </div>
            </div>

       <div class="form-group">
        <div class="label">
          <label>职位描述：</label>
        </div>
       <div class="field">
       	<fm:textarea path="positionDesc" class="input w50" value="${position.positionDesc}"/>
          <div class="tips"></div>
        </div>
      </div>
        <div class="form-group">
            <div class="label">
                <label>月薪：</label>
            </div>
            <div class="field">
                <fm:input path="positionPrice" class="input w50" placeholder="请输入月薪" data-validate="required:请输入月薪" value="${position.positionPrice}"/>
                <div class="tips"></div>
            </div>
        </div>
      <div class="form-group">
        <div class="label">
          <label></label>
        </div>
        <div class="field">
          <button class="button bg-main icon-check-square-o" type="submit"> 修改职位</button>
           <a href="${pageContext.request.contextPath}/backPosition/positionList" class="button bg-main icon-step-backward">返回</a>
        </div>
      </div>
    </fm:form>
  </div>
</div>

</body></html>