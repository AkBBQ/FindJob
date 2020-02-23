<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<head>
 <meta charset="utf-8">
 <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
 <meta name="keywords" content="Bootstrap, Landing page, Template, Registration, Landing">
 <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
 <meta name="author" content="Grayrids">
 <title>个人简历</title>
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
<div id="header">
 <div class="inner home-inner">
  <div class="logo" style="padding-top: 10px"> <a href="" ka="header-home-logo" title="BOSS直聘"><p style="font-size: 20px;color: #00c2b3">猿猿招聘网</p></a>
  </div>
  <div class="nav">
   <ul>
    <li><a ka="header-home" href="${pageContext.request.contextPath}/user/index">首页</a>
    </li>
    <li><a ka="header-job" href="${pageContext.request.contextPath}/job/jobList">职位</a>
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

     <a href="https://signup.zhipin.com?intent=1" class="link-scan" ka="header-boss" title="我要招聘">我要招聘</a> <a href="${pageContext.request.contextPath}/user/toRegister" ka="header-register" class="btn btn-outline">注册</a>
     <a href="${pageContext.request.contextPath}/user/tologin" ka="header-login" class="btn btn-outline">登录</a>

    </div>
   </c:if>
   <c:if test="${!empty sessionScope.user}">
    <ul>
     <li class="cur"><a ka="header-resume" href="${pageContext.request.contextPath}/user/personal">简历</a>
     </li>
     <li class="nav-figure">
      <a href="${pageContext.request.contextPath}/user/personal" ka="header-username" style="display: inline;"> <span class="label-text">${user.userName}</span>
       <img src="${user.userPhoto}" alt="">
       <a href="${pageContext.request.contextPath}/user/logOut" ka="header-logout" style="display: inline;">退出登录</a>
      </a>
      <div class="dropdown"> <a href="https://www.zhipin.com/web/geek/recommend" ka="header-personal">个人中心<span>推荐职位、编辑在线简历</span></a>
       <a href="https://www.zhipin.com/web/geek/account?type=mobile" ka="account_manage">账号设置<span>修改密码、打招呼语和常用语</span></a>
       <a href="${pageContext.request.contextPath}/user/personal" class="link-logout" ka="header-logout">退出登录</a>
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
   <div class="col-lg-12">
    <div class="inner-header">

     <h3>个人简历</h3>

    </div>
   </div>
  </div>
 </div>
</div>
<div class="section">
 <div class="container">
  <div class="row">
   <div class="col-lg-4 col-md-4 col-xs-12">
    <div class="right-sideabr">
        <div class="sider-box userinfo-box"><a href="${pageContext.request.contextPath}/resume/toAddResume" class="edit-userinfo" ka="base_info_edit">编辑</a>
            <div class="headbox">
                <div class="sex"></div>
                <img src="${userDTO.userPhoto}" alt="" class="headimg">
            </div>
            <div class="username">${userDTO.userName}<i class="icon-vip icon-vip-upgrade"></i>
            </div>
            <div class="userinfo">${userDTO.userAge} <i class="vline"></i> 2年 <i class="vline"></i> ${userDTO.userEdu}</div>
            <!---->
            <div class="user-stat"><a href="#" class=""><b>475</b>沟通过 </a><a href="#" class=""><b>71</b>已投递 </a><a href="#" class=""><b>0</b>面试 </a><a href="${pageContext.request.contextPath}/favorite/showMyFavorite" class=""><b>0</b>感兴趣 </a>
            </div>
        </div>
        <div class="sider-box sider-vip">
            <div class="sider-title sider-vip-title"><em>牛人VIP</em>
                <!---->
            </div>
            <ul>
                <li><i class="vip-icon vip-icon-resume"></i>简历刷新Pro</li>
                <li><i class="vip-icon vip-icon-data"></i>竞争力分析</li>
                <li><i class="vip-icon vip-icon-vip"></i>尊贵身份标识</li>
                <li><i class="vip-icon vip-icon-diamonds"></i>VIP专属报告</li>
            </ul>
            <div class="btns">
                <button type="button" class="btn btn-primary">升级VIP</button>
            </div>
        </div>
    </div>
   </div>
   <div class="col-lg-8 col-md-8 col-xs-12">
    <div class="inner-box my-resume">
     <div class="author-resume">
      <div class="thumb">
       <img src="${userDTO.resumePhoto}" alt="">
      </div>
      <div class="author-info">

       <h3>${userDTO.resumeName}</h3>

       <p class="sub-title">${userDTO.desirePosition}</p>
       <p><span class="address"><i class="lni-map-marker"></i>${userDTO.address}</span>  <span><i class="ti-phone"></i>${userDTO.resumeTel}</span>
       </p>
       <div class="social-link">
        <a href="#" class="Twitter"><i class="lni-twitter-filled"></i></a>

        <a href="#" class="facebook"><i class="lni-facebook-filled"></i></a>

        <a href="#" class="google"><i class="lni-google-plus"></i></a>

        <a href="#" class="linkedin"><i class="lni-linkedin-fill"></i></a>

       </div>
      </div>
     </div>
     <div class="about-me item">

      <h3>个人优势</h3>

      <p>${userDTO.personalPoint}</p>
     </div>
     <div class="work-experence item">

      <h3>工作经验</h3>
      ${userDTO.workExperience}

      <%--<h4>UI/UX Designer</h4>--%>


      <%--<h5>Bannana INC.</h5>--%>

      <%--<span class="date">Fab 2017-Present(5year)</span>--%>

      <%--<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Libero vero, dolores, officia quibusdam architecto sapiente eos voluptas odit ab veniam porro quae possimus itaque, quas! Tempora sequi nobis, atque incidunt!</p>--%>
      <%--<p><a href="#">4 Projects</a>--%>
      <%--</p>--%>
      <%--<br>--%>

      <%--<h4>UI Designer</h4>--%>


      <%--<h5>Whale Creative</h5>--%>

      <%--<span class="date">Fab 2017-Present(2year)</span>--%>

      <%--<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Libero vero, dolores, officia quibusdam architecto sapiente eos voluptas odit ab veniam porro quae possimus itaque, quas! Tempora sequi nobis, atque incidunt!</p>--%>
      <%--<p><a href="#">4 Projects</a>--%>
      <%--</p>--%>
     </div>
     <div class="education item">

      <h3>教育情况</h3>

      ${userDTO.eduExperience}

      <%--<h4>Massachusetts Institute Of Technology</h4>--%>

      <%--<p>Bachelor of Computer Science</p>--%>
      <%--<span class="date">2010-2014</span>--%>

      <%--<br>--%>

      <%--<h4>Massachusetts Institute Of Technology</h4>--%>

      <%--<p>Bachelor of Computer Science</p>--%>
      <%--<span class="date">2010-2014</span>--%>

     </div>
    </div>
   </div>
  </div>
 </div>
</div>
<footer>
 <section class="footer-Content">
  <div class="container">
   <div class="row">
    <div class="col-lg-3 col-md-3 col-xs-12">
     <div class="widget">
      <div class="footer-logo">
       <img src="assets/img/logo-footer.png" alt="">
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
    .sider-box {
        background: #fff;
        padding: 20px 30px;
        margin-bottom: 16px;
        position: relative;
    }
    .userinfo-box .edit-userinfo {
        position: absolute;
        top: 20px;
        right: 30px;
        z-index: 1;
        line-height: 1;
    }
    .userinfo-box .headbox .headimg {
        background-color: #f6f6f8;
        width: 60px;
        height: 60px;
        border-radius: 200px;
    }
    .userinfo-box .username {
        box-sizing: border-box;
        padding: 0 10px;
        overflow: hidden;
        text-overflow: ellipsis;
        white-space: nowrap;
        line-height: 26px;
        font-weight: 500;
    }
    .userinfo-box .headbox .sex {
        display: inline-block;
        width: 14px;
        height: 14px;
        background: url(https://static.zhipin.com/zhipin-geek/v84/web/geek-vue/static/images/icons-sex.aceb70bb.png) no-repeat;
        background-size: 14px auto;
        position: absolute;
        margin-left: 46px;
        background-position: 0 -25px;
    }
    .userinfo-box .userinfo {
        font-size: 12px;
        line-height: 26px;
    }
    .userinfo-box .icon-vip-upgrade {
        background-position: 0 -40px;
        cursor: pointer;
    }
    .userinfo-box .user-stat {
        margin: 16px -15px -5px;
    }
    .userinfo-box .user-stat a {
        display: inline-block;
        vertical-align: top;
        width: 25%;
        font-size: 12px;
        line-height: 18px;
        color: #8d92a1;
        text-align: center;
    }
    .userinfo-box .user-stat a b {
        display: block;
        font-weight: 400;
        font-size: 15px;
        color: #414a60;
    }
    .userinfo-box {
        text-align: center;
    }
    .userinfo-box .icon-vip-upgrade {
        background-position: 0 -40px;
        cursor: pointer;
    }

    .userinfo-box .icon-vip {
        display: inline-block;
        width: 56px;
        height: 16px;
        background: url(https://static.zhipin.com/zhipin-geek/v84/web/geek-vue/static/images/icons-vip.89e6eb2b.png) no-repeat;
        background-image: image-set(url(https://static.zhipin.com/zhipin-geek/v84/web/geek-vue/static/images/icons-vip.89e6eb2b.png) 1x,url(https://static.zhipin.com/zhipin-geek/v84/web/geek-vue/static/images/icons-vip@2x.c4161a5e.png) 2x);
        vertical-align: middle;
        margin: -2px 0 0 8px;
    }
    .sider-vip {
        background: url(https://static.zhipin.com/zhipin-geek/v84/web/geek-vue/static/images/geek-vip-background.a93dc051.png) no-repeat 176px 8px #fff;
        background-image: image-set(url(https://static.zhipin.com/zhipin-geek/v84/web/geek-vue/static/images/geek-vip-background.a93dc051.png) 1x,url(https://static.zhipin.com/zhipin-geek/v84/web/geek-vue/static/images/geek-vip-background@2x.c93eeeba.png) 2x);
    }
    .sider-box .sider-title {
        height: 20px;
        font-size: 14px;
        font-weight: 500;
        color: #414a60;
        line-height: 20px;
        align-items: center;
        display: flex;
    }
    .sider-vip ul {
        margin-top: 16px;
    }
    .sider-vip li {
        margin: 12px 0 0;
        white-space: nowrap;
        font-size: 13px;
        color: #61687c;
        line-height: 30px;
    }
    li, ol, ul {
        list-style: none;
    }
    .sider-vip li .vip-icon-resume {
        background-position: 0 0;
    }

    .sider-vip li .vip-icon {
        display: inline-block;
        width: 30px;
        height: 30px;
        vertical-align: middle;
        background: url(https://static.zhipin.com/zhipin-geek/v84/web/geek-vue/static/images/geek-vip-icons.c4156031.png) no-repeat;
        background-image: image-set(url(https://static.zhipin.com/zhipin-geek/v84/web/geek-vue/static/images/geek-vip-icons.c4156031.png) 1x,url(https://static.zhipin.com/zhipin-geek/v84/web/geek-vue/static/images/geek-vip-icons@2x.9a1aa6b8.png) 2x);
        margin-right: 20px;
    }
    .btn-primary {
        background-color: #5dd5c8;
        border-color: #5dd5c8;
        color: #fff;
    }
    .sider-box .btns .btn {
        width: 100%;
        margin-top: 16px;
    }
    .btn {
        margin: 0;
        padding: 9px 15px;
        line-height: 1;
        font-size: 14px;
        border: 1px solid #e3e7ed;
        vertical-align: middle;
        cursor: pointer;
        text-align: center;
        border-radius: 0;
        -webkit-appearance: none;
        -webkit-box-sizing: border-box;
        box-sizing: border-box;
        transition: background-color .1s linear,box-shadow .1s linear;
        outline: none;
        user-select: none;
    }

    .sider-box .sider-title em {
        font-style: normal;
        flex: 1;
    }
    .user-nav li.cur a, .user-nav li.cur a:hover {
        color: #00d7c6!important;
    }
</style>

</html>