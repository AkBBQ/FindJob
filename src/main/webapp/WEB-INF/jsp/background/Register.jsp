<%@ page language="java" import="java.util.*" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fm" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="keywords" content="Bootstrap, Landing page, Template, Registration, Landing">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <meta name="author" content="Grayrids">
    <title>公司注册</title>
    <link rel="stylesheet" href="/style/assets/css/bootstrap.min.css">
    <link rel="stylesheet" href="/style/assets/css/line-icons.css">
    <link rel="stylesheet" href="/style/assets/css/owl.carousel.min.css">
    <link rel="stylesheet" href="/style/assets/css/owl.theme.default.css">
    <link rel="stylesheet" href="/style/assets/css/slicknav.min.css">
    <link rel="stylesheet" href="/style/assets/css/animate.css">
    <link rel="stylesheet" href="/style/assets/css/main.css">
    <link rel="stylesheet" href="/style/assets/css/responsive.css">
</head>

<body>
<header id="home" class="hero-area">
    <nav class="navbar navbar-expand-lg fixed-top scrolling-navbar">
        <div class="container">
            <div class="theme-header clearfix">
                <div class="navbar-header">
                    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#main-navbar" aria-controls="main-navbar" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"></span>

                        <span class="lni-menu"></span>

                        <span class="lni-menu"></span>

                        <span class="lni-menu"></span>

                    </button>
                    <a href="${pageContext.request.contextPath}/user/index" class="navbar-brand">
                        <img src="/style/assets/img/logo.png" alt="">
                    </a>
                </div>
                <div class="collapse navbar-collapse" id="main-navbar">
                    <ul class="navbar-nav mr-auto w-100 justify-content-end">
                        <li class="button-group">
                            <a href="${pageContext.request.contextPath}/backUser/toBackLogin" class="button btn btn-common">发布职位</a>

                        </li>
                    </ul>
                </div>
            </div>
        </div>
        <div class="mobile-menu" data-logo="assets/img/logo-mobile.png"></div>
    </nav>
</header>
<div class="page-header">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <div class="inner-header">

                    <h3>欢迎光临猿猿招聘网</h3>

                </div>
            </div>
        </div>
    </div>
</div>
<section id="content" class="section-padding">
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-lg-5 col-md-6 col-xs-12">
                <div class="page-login-form box">

                    <h3>
                        公司注册
                    </h3>

                    <form class="login-form" action="${pageContext.request.contextPath}/backCompany/doRegister" method="post">
                        <div class="form-group">
                            <div class="input-icon">
                                <i class="lni-user"></i>
                                <input type="text" id="sender-1" class="form-control" name="companyName" placeholder="公司名称">
                            </div>
                        </div>


                        <div class="form-group">
                            <div class="input-icon">
                                <i class="lni-user"></i>
                                <input type="text" id="sender-3" class="form-control" name="companyNum" placeholder="公司账号">
                            </div>
                            <span style="color: red;">${message}</span>
                        </div>

                        <div class="form-group">
                            <div class="input-icon">
                                <i class="lni-lock"></i>

                                <input type="password" class="form-control" placeholder="密码" name="companyPwd">
                            </div>
                        </div>
                        <div class="form-group form-check">
                            <input type="checkbox" class="form-check-input" id="exampleCheck1">
                            <label class="form-check-label" for="exampleCheck1">记住密码</label>
                        </div>
                        <button class="btn btn-common log-btn">注册</button>
                    </form>
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

</html>