<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fm" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fma" uri="http://www.springframework.org/tags/form" %>
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
<script src="${pageContext.request.contextPath}/backStyle/js/Menu.js"></script>
    <script type="text/javascript">
        function updateState(deliverId, state){
            if(confirm("您确定选择吗?")){
                $.ajax({
                    "url" : "${pageContext.request.contextPath}/backDeliver/updateDeliver",
                    "type" : "POST",
                    "data" : {
                        "deliverId" : deliverId,
                        "state": state
                    },
                    "dataType" : "JSON",
                    "success" : function(data){
                        if(data.result === true){
                            alert("操作成功！");
                            location.href="${pageContext.request.contextPath}/resume/resumeList";
                        } else {
                            alert("操作成功！");
                            location.href="${pageContext.request.contextPath}/resume/resumeList";
                        }

                    }
                });

            }
        }
    </script>
<jsp:useBean id="resumeDetail" class="com.example.demo.entity.Resume" scope="request"/>
</head>
<body>
<div class="panel admin-panel">
  <div class="panel-head" id="add"><strong><span class="icon-pencil-square-o"></span>查看简历详情</strong></div>
  <div class="body-content">
   <p style="margin-left:40px;">${requestScope.massage}</p>
    <fm:form method="post" class="form-x" modelAttribute="resumeDetail" action="${pageContext.request.contextPath}/resume/updateResume">
     <div class="form-group" style="display: none;">
        <div class="label">
          <label>编号:</label>
        </div>
        <div class="field">
          <fm:input path="resumeId" type="text" reasonly="reasonly"/>
          <div class="tips"></div>
        </div>
      </div>
        <div class="form-group">
            <div class="label" >
                <label>简历照片：</label>
            </div>
            <img src="${resume.resumePhoto}" alt="简历列表" style="width: 150px;">
            <div class="tips"></div>
        </div>
      <div class="form-group">
          <div class="label" >
            <label>名字：</label>
          </div>
         	${resume.resumeName}
              <div class="tips"></div>
          </div>
        <div class="form-group">
            <div class="label" >
                <label>现住地地址：</label>
            </div>
                ${resume.address}
            <div class="tips"></div>
        </div>
        <div class="form-group">
            <div class="label" >
                <label>电话：</label>
            </div>
                ${resume.resumeTel}
            <div class="tips"></div>
        </div>
        <div class="form-group">
            <div class="label" >
                <label>个人优势：</label>
            </div>
            <div>${resume.personalPoint}</div>
            <div class="tips"></div>
        </div>
        <div class="form-group">
            <div class="label" >
                <label>渴望职位：</label>
            </div>
            <div>${resume.desirePosition}</div>
            <div class="tips"></div>
        </div>
        <div class="form-group" style="display: flex;">
            <div class="label" >
                <label>工作经验：</label>
            </div>
            <div> ${resume.workExperience}</div>
            <div class="tips"></div>
        </div>
        <div class="form-group" style="display: flex;">
            <div class="label" >
                <label>项目经验：</label>
            </div>
            <div> ${resume.projectExp}</div>
            <div class="tips"></div>
        </div>
        <div class="form-group" style="display: flex;">
            <div class="label" >
                <label>教育经历：</label>
            </div>
            <div>${resume.eduExperience}</div>
            <div class="tips"></div>
        </div>
      <%--<div class="form-group">--%>
          <%--<div class="label">--%>
            <%--<label>下单日期：</label>--%>
          <%--</div>--%>
          <%--<div class="field">--%>
            <%--<fm:input path="odate"  reasonly="reasonly"/>--%>
          <%--<div class="tips" ></div>--%>
            <%--<div class="tips"></div>--%>
          <%--</div>--%>
        <%--</div>--%>
												
          <div class="tips"></div>
            <div class="tips"></div>
          </div>
        </div>
      
      <div class="form-group">${msg}
        <div class="label">
          <label></label>
        </div>
        <div class="field">
            <c:if test="${company.status == 0}">
                <c:if test="${resume.state == 0}">
                  <div class="button bg-main icon-check-square-o" name="save" onClick="updateState(${resume.deliverId}, 1)">同意</div>
                  <div class="button bg-main icon-check-square-o" name="refuse" onClick="updateState(${resume.deliverId}, 2)">拒绝</div>
                </c:if>
            </c:if>
           <a href="${pageContext.request.contextPath}/resume/resumeList" class="button bg-main icon-step-backward">返回</a>
        </div>
      </div>
    </fm:form>
  </div>
</div>

</body></html>