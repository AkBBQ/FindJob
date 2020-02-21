<%@ page language="java" import="java.util.*" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="keywords" content="Bootstrap, Landing page, Template, Registration, Landing">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <meta name="author" content="Grayrids">
    <title>职位详情</title>
    <link rel="stylesheet" href="/style/assets/css/bootstrap.min.css">
    <link rel="stylesheet" href="/style/assets/css/line-icons.css">
    <link rel="stylesheet" href="/style/assets/css/owl.carousel.min.css">
    <link rel="stylesheet" href="/style/assets/css/owl.theme.default.css">
    <link rel="stylesheet" href="/style/assets/css/slicknav.min.css">
    <link rel="stylesheet" href="/style/assets/css/animate.css">
    <link rel="stylesheet" href="/style/assets/css/main.css">
    <link rel="stylesheet" href="/style/assets/css/responsive.css">
    <link rel="stylesheet" href="/assets/css/style.css">
    <link rel="stylesheet" href="/assets/css/newStyle.css">
</head>

<body>
<script type="text/javascript">
    function  applyJob(positionId){
        if(confirm("您确定要投递该职位吗?")){
            $.ajax({
                "url" : "${pageContext.request.contextPath}/backDeliver/addDeliver",
                "type" : "POST",
                "data" : {
                    "positionId" : positionId},
                "dataType" : "JSON",
                "success" : function(data){
                    if(data.result === "true"){
                        alert("投递成功！");
                        location.href="${pageContext.request.contextPath}/job/positionDetail?positionId="+positionId+"&status=0";
                    } else if(data.result === "false" ){
                        alert("投递失败!");
                        location.href="${pageContext.request.contextPath}/job/positionDetail?positionId="+positionId;
                    } else {
                        if(confirm("未登录，请登录之后投递，投递失败，是否到登录页面？")){
                            location.href="${pageContext.request.contextPath}/user/tologin";
                        }
                    }

                },
                "error": function (msg) {
                    if (confirm("未登录，请登录之后投递，投递失败，是否到登录页面？")) {
                        location.href="${pageContext.request.contextPath}/user/tologin";
                    }
                }
            });

        }
    }


    function  favourite(positionId){
        if(confirm("您确定要收藏该职位吗?")){
            $.ajax({
                "url" : "${pageContext.request.contextPath}/favorite/addMyFavorite",
                "type" : "POST",
                "data" : {
                    "positionId" : positionId},
                "dataType" : "JSON",
                "success" : function(data){
                    if(data.result === "true"){
                        alert("收藏成功！");
                        location.href="${pageContext.request.contextPath}/job/positionDetail?positionId="+positionId+"&status=0";
                    } else if(data.result === "false" ){
                        alert("收藏失败!");
                        location.href="${pageContext.request.contextPath}/job/positionDetail?positionId="+positionId;
                    } else {
                        if(confirm("未登录，请登录之后收藏，收藏失败，是否到登录页面？")){
                            location.href="${pageContext.request.contextPath}/user/tologin";
                        }
                    }

                },
                "error": function (msg) {
                    if (confirm("未登录，请登录之后收藏，收藏失败，是否到登录页面？")) {
                        location.href="${pageContext.request.contextPath}/user/tologin";
                    }
                }
            });

        }
    }
</script>
<div id="header">
    <div class="inner home-inner">
        <div class="logo" style="padding-top: 10px"> <a href="" ka="header-home-logo" title="BOSS直聘"><p style="font-size: 20px;color: #00c2b3">猿猿招聘网</p></a>

        </div>
        <div class="nav">
            <ul>
                <li><a ka="header-home" href="${pageContext.request.contextPath}/user/index">首页</a>
                </li>
                <li class="cur"><a ka="header-job" href="${pageContext.request.contextPath}/job/jobList">职位</a>
                </li>
                <li class=""><a ka="header_brand" href="${pageContext.request.contextPath}/company/companyList">公司</a>
                </li>
                <li class=""><a ka="header-article" href="https://news.zhipin.com/">资讯</a>
                </li>
            </ul>
        </div>
        <div class="user-nav">
            <!--未登录-->
            <c:if test="${empty sessionScope.user}">
                <div class="btns">
                    <a href="${pageContext.request.contextPath}/user/tologin" ka="header-geek" class="link-sign-resume" title="上传简历，解析内容，完善注册">我要找工作<span class="new" style="display: inline;">hot</span></a>

                    <a href="${pageContext.request.contextPath}/backUser/toBackLogin" class="link-scan" ka="header-boss" title="我要招聘">我要招聘</a> <a href="${pageContext.request.contextPath}/user/toRegister" ka="header-register" class="btn btn-outline">注册</a>
                    <a href="${pageContext.request.contextPath}/user/tologin" ka="header-login" class="btn btn-outline">登录</a>

                </div>
            </c:if>
            <c:if test="${!empty sessionScope.user}">
                <ul>
                    <li class=""><a ka="header-resume" href="${pageContext.request.contextPath}/user/personal">简历</a>
                    </li>
                    <li class="nav-figure">
                        <a href="${pageContext.request.contextPath}/user/personal" ka="header-username" style="display: inline; "> <span class="label-text">${user.userName}</span>
                            <img src="${user.userPhoto}" alt="">
                            <a href="${pageContext.request.contextPath}/user/logOut" ka="header-logout" style="display: inline; ">退出登录</a>
                        </a>
                        <div class="dropdown"> <a href="https://www.zhipin.com/web/geek/recommend" ka="header-personal">个人中心<span>推荐职位、编辑在线简历</span></a>
                            <a href="https://www.zhipin.com/web/geek/account?type=mobile" ka="account_manage">账号设置<span>修改密码、打招呼语和常用语</span></a>
                            <a href="javascript:;" class="link-logout" ka="header-logout">退出登录</a>
                        </div>
                    </li>
                </ul>
            </c:if>
        </div>
    </div>
</div>

<div class="page-header">
    <div class="container">
        <div class="row">
            <div class="col-lg-8 col-md-6 col-xs-12">
                <div class="breadcrumb-wrapper">
                    <div class="img-wrapper">
                        <img src="/style/assets/img/about/${positionDTO.categoryPhoto}" alt="">
                    </div>
                    <div class="content">

                        <h3 class="product-title">${positionDTO.positionName}</h3>

                        <p class="brand">职位要求：${positionDTO.positionRequest}</p>
                        <div class="tags">
                            <span><i class="lni-map-marker"></i> ${positionDTO.positionAddr}</span>

                            <span><i class="lni-calendar"></i> 发布时间：${positionDTO.releaseDate}</span>

                        </div>
                    </div>
                </div>
            </div>
            <div class="col-lg-4 col-md-6 col-xs-12">
                <div class="month-price">
                    <span class="year">薪资</span>

                    <div class="price">${positionDTO.positionPrice}</div>
                </div>
            </div>
        </div>
    </div>
</div>
<input type="hidden" name="position" value="${positionId}" id="positionId"/>
<section class="job-detail section">
    <div class="container">
        <div class="row justify-content-between">
            <div class="col-lg-8 col-md-12 col-xs-12">
                <div class="content-area">

                    <h4>职位描述</h4>

                    ${positionDTO.positionDesc}

                    <h5>职位优势</h5>

                    <ul>
                        <li>- Objective-C</li>
                        <li>- iOS SDK</li>
                        <li>- XCode</li>
                        <li>- Cocoa</li>
                        <li>- ClojureScript</li>
                    </ul>

                    <h5>公司介绍</h5>
                    ${positionDTO.companyInfo}

                    <h5>工商信息</h5>
                    <div class="name">${positionDTO.companyName}</div>

                    <div class="level-list">
                        <li><span>法人代表：</span>刘浩</li>
                        <li><span>注册资金：</span>3000万元人民币</li>
                        <li class="res-time"><span>成立时间：</span>2015.08</li>
                        <li class="company-type"><span>企业类型：</span>其他有限责任公司</li>
                        <li class="manage-state"><span>经营状态：</span>存续</li>
                    </div>

                    <c:if test="${status == 1}">
                    <a href="#" class="btn btn-common" onclick="applyJob(${positionDTO.positionId})">投递简历</a>
                </c:if>
                    <c:if test="${status == 0}">
                            <div href="#" class="btn" style="cursor: not-allowed; background-color: #c5d9e8; border-color: #c5d9e8;">${state}</div>
                    </c:if>


                    <c:if test="${favouriteStatus == 0}">
                    <a href="#" class="btn btn-common" onclick="favourite(${positionDTO.positionId})">收藏</a>
                    </c:if>
                    <c:if test="${favouriteStatus == 1}">
                        <div href="#" class="btn" style="cursor: not-allowed; background-color: #c5d9e8; border-color: #c5d9e8;">${favouriteDesc}</div>
                    </c:if>

                </div>
            </div>
            <div class="col-lg-4 col-md-12 col-xs-12">
                <div class="sideber">
                    <div class="widghet">

                        <h3>公司信息</h3>

                        <div class="sider-company">
                            <div class="company-info">
                                <a ka="job-detail-company-logo_custompage" href="#">
                                    <img src="${positionDTO.companyPhoto}">
                                </a> <a ka="job-detail-company_custompage" href="#">${positionDTO.companyName}</a>

                            </div>
                            <p><i class="icon-stage"></i>${positionDTO.finance}</p>
                            <p><i class="icon-scale"></i>${positionDTO.companyType}</p>
                            <p><i class="icon-industry"></i><a ka="job-detail-brandindustry" href="#">信息安全</a>
                            </p>
                            <p><i class="icon-net"></i>http://www.dbappsecurity.com.cn</p>
                            <p class="gray">更新于：${positionDTO.releaseDate}</p>
                        </div>

                        <%--<div class="maps">--%>
                            <%--<div id="map" class="map-full">--%>
                                <%--<iframe src="http://ditu.google.cn/maps/embed?pb=!1m18!1m12!1m3!1d405691.57240383344!2d-122.3212843181106!3d37.40247298383319!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x808fb68ad0cfc739:0x7eb356b66bd4b50e!2sSilicon+Valley,+CA,+USA!5e0!3m2!1sen!2sbd!4v1538319316724"--%>
                                        <%--allowfullscreen=""></iframe>--%>
                            <%--</div>--%>
                        <%--</div>--%>
                    </div>
                    <div class="widghet">

                        <h3>Share This Job</h3>

                        <div class="share-job">
                            <ul class="mt-4 footer-social">
                                <li><a class="facebook" href="#"><i class="lni-facebook-filled"></i></a>
                                </li>
                                <li><a class="twitter" href="#"><i class="lni-twitter-filled"></i></a>
                                </li>
                                <li><a class="linkedin" href="#"><i class="lni-linkedin-fill"></i></a>
                                </li>
                                <li><a class="google-plus" href="#"><i class="lni-google-plus"></i></a>
                                </li>
                            </ul>
                            <div class="meta-tag">
                                <span class="meta-part"><a href="#"><i class="lni-star"></i> Write a Review</a></span>

                                <span class="meta-part"><a href="#"><i class="lni-warning"></i> Reports</a></span>

                                <span class="meta-part"><a href="#"><i class="lni-share"></i> Share</a></span>

                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<section id="featured" class="section bg-gray pb-45">
    <div class="container">

        <h4 class="small-title text-left">猜你感兴趣的工作</h4>

        <div class="row">
            <div class="col-lg-4 col-md-6 col-xs-12">
                <div class="job-featured">
                    <div class="icon">
                        <img src="/style/assets/img/features/img1.png" alt="">
                    </div>
                    <div class="content">

                        <h3><a href="job-page.html">Software Engineer</a></h3>

                        <p class="brand">MizTech</p>
                        <div class="tags">
                            <span><i class="lni-map-marker"></i> New York</span>

                            <span><i class="lni-user"></i>John Smith</span>

                        </div>
                        <span class="full-time">Full Time</span>

                    </div>
                </div>
            </div>
            <div class="col-lg-4 col-md-6 col-xs-12">
                <div class="job-featured">
                    <div class="icon">
                        <img src="/style/assets/img/features/img2.png" alt="">
                    </div>
                    <div class="content">

                        <h3><a href="job-page.html">Graphic Designer</a></h3>

                        <p class="brand">Hunter Inc.</p>
                        <div class="tags">
                            <span><i class="lni-map-marker"></i> New York</span>

                            <span><i class="lni-user"></i>John Smith</span>

                        </div>
                        <span class="part-time">Part Time</span>

                    </div>
                </div>
            </div>
            <div class="col-lg-4 col-md-6 col-xs-12">
                <div class="job-featured">
                    <div class="icon">
                        <img src="/style/assets/img/features/img3.png" alt="">
                    </div>
                    <div class="content">

                        <h3><a href="job-page.html">Managing Director</a></h3>

                        <p class="brand">MagNews</p>
                        <div class="tags">
                            <span><i class="lni-map-marker"></i> New York</span>

                            <span><i class="lni-user"></i>John Smith</span>

                        </div>
                        <span class="full-time">Full Time</span>

                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<footer>
    <section class="footer-Content">
        <div class="container">
            <div class="row">
                <div class="col-lg-3 col-md-3 col-xs-12">
                    <div class="widget">
                        <div class="footer-logo">
                            <img src="/style/assets/img/logo-footer.png" alt="">
                        </div>
                        <div class="textwidget">
                            <p>Sed consequat sapien faus quam bibendum convallis quis in nulla. Pellentesque volutpat odio eget diam cursus semper.</p>
                        </div>
                    </div>
                </div>
                <div class="col-lg-6 col-md-4 col-xs-12">
                    <div class="widget">

                        <h3 class="block-title">Quick Links</h3>

                        <ul class="menu">
                            <li><a href="#">About Us</a>
                            </li>
                            <li><a href="#">Support</a>
                            </li>
                            <li><a href="#">License</a>
                            </li>
                            <li><a href="#">Contact</a>
                            </li>
                        </ul>
                        <ul class="menu">
                            <li><a href="#">Terms & Conditions</a>
                            </li>
                            <li><a href="#">Privacy</a>
                            </li>
                            <li><a href="#">Refferal Terms</a>
                            </li>
                            <li><a href="#">Product License</a>
                            </li>
                        </ul>
                    </div>
                </div>
                <div class="col-lg-3 col-md-4 col-xs-12">
                    <div class="widget">

                        <h3 class="block-title">Subscribe Now</h3>

                        <p>Sed consequat sapien faus quam bibendum convallis.</p>
                        <form method="post" id="subscribe-form" name="subscribe-form" class="validate">
                            <div class="form-group is-empty">
                                <input type="email" value="" name="Email" class="form-control" id="EMAIL" placeholder="Enter Email..." required="">
                                <button type="submit" name="subscribe" id="subscribes" class="btn btn-common sub-btn"><i class="lni-envelope"></i>
                                </button>
                                <div class="clearfix"></div>
                            </div>
                        </form>
                        <ul class="mt-3 footer-social">
                            <li><a class="facebook" href="#"><i class="lni-facebook-filled"></i></a>
                            </li>
                            <li><a class="twitter" href="#"><i class="lni-twitter-filled"></i></a>
                            </li>
                            <li><a class="linkedin" href="#"><i class="lni-linkedin-fill"></i></a>
                            </li>
                            <li><a class="google-plus" href="#"><i class="lni-google-plus"></i></a>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <div id="copyright">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="site-info text-center">
                        <p>Designed and Developed by <a href="http://www.17sucai.com" rel="nofollow">UIdeck</a>
                        </p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</footer>
<a href="#" class="back-to-top">
    <i class="lni-arrow-up"></i>

</a>
<div id="preloader">
    <div class="loader" id="loader-1"></div>
</div>
<script src="/style/assets/js/jquery-min.js"></script>
<script src="/style/assets/js/popper.min.js"></script>
<script src="/style/assets/js/bootstrap.min.js"></script>
<script src="/style/assets/js/color-switcher.js"></script>
<script src="/style/assets/js/owl.carousel.min.js"></script>
<script src="/style/assets/js/jquery.slicknav.js"></script>
<script src="/style/assets/js/jquery.counterup.min.js"></script>
<script src="/style/assets/js/waypoints.min.js"></script>
<script src="/style/assets/js/form-validator.min.js"></script>
<script src="/style/assets/js/contact-form-script.js"></script>
<script src="/style/assets/js/main.js"></script>
</body>

<style type="text/css">
    .sideber {
        padding: 15px;
        box-shadow: 0px 0px 14px rgba(191, 191, 191, 0.24);
    }
    .sider-company .title {
        line-height: 25px;
        margin-bottom: 25px;
        font-size: 15px;
        font-weight: 500;
        color: #414a60;
    }
    .sider-company .company-info {
        overflow: hidden;
        line-height: 60px;
        margin-bottom: 27px;
    }
    a {
        text-decoration: none;
        color: #414a60;
    }
    .sider-company p {
        line-height: 20px;
        margin-bottom: 26px;
    }
    .sider-company p .icon-stage {
        width: 15px;
        background: url(https://static.zhipin.com/zhipin-geek/v84/web/geek/images/job/icon-stage.png) center center no-repeat;
        background-size: contain;
    }
    .sider-company p .icon-scale {
        background: url(https://static.zhipin.com/zhipin-geek/v84/web/geek/images/job/icon-scale.png) center center no-repeat;
        background-size: contain;
    }
    .sider-company p .icon-industry {
        background: url(https://static.zhipin.com/zhipin-geek/v84/web/geek/images/job/icon-industry.png) center center no-repeat;
        background-size: contain;
    }
    .sider-company p i {
        display: inline-block;
        vertical-align: -4px;
        width: 17px;
        height: 17px;
        margin-right: 25px;
    }
    .sider-company p .icon-net {
        background: url(https://static.zhipin.com/zhipin-geek/v84/web/geek/images/job/icon-net.png) center center no-repeat;
        background-size: contain;
    }
    .sider-company p.gray {
        color: #d0d4da;
    }
    .sider-company p {
        line-height: 20px;
        margin-bottom: 26px;
    }
    .sider-company img {
        width: 60px;
        height: 60px;
        float: left;
        margin-right: 18px;
        border-radius: 10px;
    }
    .level-list {
        margin-top: 5px;
        height: 66px;
        margin-bottom: 30px;
    }
    .level-list li {
        display: inline-block;
        width: 246px;
        margin-top: 5px;
    }
    .level-list .res-time {
        width: 155px;
        float: right;
    }
    .level-list .company-type {
        width: 350px;
        overflow: hidden;
        white-space: nowrap;
        text-overflow: ellipsis;
    }
    .level-list .manage-state {
        width: 230px;
        overflow: hidden;
        white-space: nowrap;
        text-overflow: ellipsis;
    }
    .level-list span {
        display: inline-block;
        margin-right: 7px;
        color: #8d92a1;
    }

</style>

</html>