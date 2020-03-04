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
  <div class="panel-head" id="add"><strong><span class="icon-pencil-square-o"></span>修改公司信息</strong></div>
  <div class="body-content">
    <fm:form method="post" class="form-x" action="${pageContext.request.contextPath}/backCompany/doModifyCompany"
     enctype="multipart/form-data" modelAttribute="company">
      <div class="form-group">
        <div class="label">
          
        </div>
        <div class="field">
          <div class="tips"></div>
        </div>
      </div>
      <div class="form-group">
        <div class="label">
       <input type="hidden" name="companyId" value="${company.companyId}" />
          <label>公司图片：</label>
        </div>
        <div class="field">
        <img alt="图片" width="50px" height="50px" src="${company.companyPhoto}">
          <input type="file" id="url1" name="companyPhoto1" class="input tips" style="width:25%; float:left;"
           data-toggle="hover" data-place="right" data-image="${company.companyPhoto}"  value="${company.companyPhoto}"/>
          <div iclass="tipss"></div>
        </div>
      </div>     
      
      <if condition="$iscid eq 1">
        <div class="form-group">
        <div class="label">
            <label>公司名称：</label>
          </div>
          <div class="field">
              <fm:input path="companyName" class="input w50" placeholder="请输入公司名称" data-validate="required:请输入公司名称" value="${company.companyName}"/>
              <div class="tipss"></div>
        </div>
        </div>
        
       <div class="form-group">
          <div class="label">
            <label>公司人数：</label>
          </div>
          <div class="field">
          <fm:input path="companyPerson" class="input w50" placeholder="请输入公司人数" data-validate="required:请输入公司人数" value="${company.companyPerson}"/>
          <div class="tips"></div>
        </div>
        </div>
      </if>
      <div class="form-group">
        <div class="label">
          <label>公司简介：</label>
        </div>
       <div class="field">
           <fm:textarea path="companyShort" class="TextareaStyle" value="${company.companyShort}"/>
          <div class="tips"></div>
        </div>
      </div>
      <div class="form-group">
        <div class="label">
          <label>公司地址：</label>
        </div>
       <div class="field">
          <fm:input class="input w50" path="companyAddr" placeholder="请输入公司地址" data-validate="required:请输入公司地址" value="${company.companyAddr}"/>
          <div class="tips"></div>
        </div>
      </div>

        <div class="form-group">
            <div class="label">
                <label>公司介绍：</label>
            </div>
            <div class="field">
                <fm:textarea path="companyIntro" class="TextareaStyle" value="${company.companyIntro}"/>
                <div class="tips"></div>
            </div>
        </div>
     
      <div class="clear"></div>
      <div class="form-group">
        <div class="label">
          <label>公司成立时间：</label>
        </div>
       <div class="field">
       	  <fm:input Class="Wdate" id="birthday" path="startTime" readonly="readonly" onclick="WdatePicker();" value="${company.startTime}"/>
          <div class="tips"></div>
        </div>
      </div>
       <div class="form-group">
        <div class="label">
          <label>注册资金：</label>
        </div>
       <div class="field">
           <fm:input class="input w50" path="registerPrice" placeholder="请输入公司地址" data-validate="required:请输入公司注册资金" value="${company.registerPrice}"/>
           <div class="tips"></div>
        </div>
      </div>
        <div class="form-group">
        <div class="label">
          <label>公司概况：</label>
        </div>
       <div class="field">
           <fm:textarea path="companyInfo" class="TextareaStyle" value="${company.companyInfo}"/>
          <div class="tips" id="tip3"></div>
        </div>
      </div>
        <div class="form-group">
        <div class="label">
          <label>融资情况：</label>
        </div>
       <div class="field">	
       	 <fm:input path="finance" id="dp" class="InputStyle" value="${company.finance}"/>
          <div class="tips" id="tip4"></div>
        </div>
      </div>
        <div class="form-group">
        <div class="label">
          <label>公司类型：</label>
        </div>
       <div class="field">	
       <fm:input path="companyType" id="st" class="InputStyle" value="${company.companyType}"/>
          <div class="tips" id="tip5"></div>
        </div>    
      </div>

        <div class="form-group">
            <div class="label">
                <label>招聘者姓名：</label>
            </div>
            <div class="field">
                <fm:input path="releaseName" id="dp2" class="InputStyle" value="${company.releaseName}"/>
                <div class="tips" id="tip5"></div>
            </div>
        </div>


        <div class="form-group">
            <div class="label">
                <label>招聘者职位：</label>
            </div>
            <div class="field">
                <fm:input path="releasePosition" id="dp3" class="InputStyle" value="${company.releasePosition}"/>
                <div class="tips" id="tip6"></div>
            </div>
        </div>



        <div class="form-group">
        <div class="label">
          <label></label>
        </div>
        <div class="field">
          <button class="button bg-main icon-check-square-o" type="submit"> 提交</button>
           <a href="${pageContext.request.contextPath}/backCompany/companyList" class="button bg-main icon-step-backward">返回</a>
        </div>
      </div>
    </fm:form>
  </div>
</div>

</body></html>