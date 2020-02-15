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
    <title>编辑个人信息</title>
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
    <script src="nicEdit.js"></script>
</head>
<script type="text/javascript">
    //图片上传预览    IE是用了滤镜。
    function previewImage(file)
    {
        var MAXWIDTH  = 260;
        var MAXHEIGHT = 180;
        var div = document.getElementById('preview');
        if (file.files && file.files[0])
        {
            div.innerHTML ='<img id=imghead>';
            var img = document.getElementById('imghead');
            img.onload = function(){
                var rect = clacImgZoomParam(MAXWIDTH, MAXHEIGHT, img.offsetWidth, img.offsetHeight);
                img.width  =  rect.width;
                img.height =  rect.height;
//                 img.style.marginLeft = rect.left+'px';
                img.style.marginTop = rect.top+'px';
            }
            var reader = new FileReader();
            reader.onload = function(evt){img.src = evt.target.result;}
            reader.readAsDataURL(file.files[0]);
        }
        else //兼容IE
        {
            var sFilter='filter:progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod=scale,src="';
            file.select();
            var src = document.selection.createRange().text;
            div.innerHTML = '<img id=imghead>';
            var img = document.getElementById('imghead');
            img.filters.item('DXImageTransform.Microsoft.AlphaImageLoader').src = src;
            var rect = clacImgZoomParam(MAXWIDTH, MAXHEIGHT, img.offsetWidth, img.offsetHeight);
            status =('rect:'+rect.top+','+rect.left+','+rect.width+','+rect.height);
            div.innerHTML = "<div id=divhead style='width:"+rect.width+"px;height:"+rect.height+"px;margin-top:"+rect.top+"px;"+sFilter+src+"\"'></div>";
        }
    }
    function clacImgZoomParam( maxWidth, maxHeight, width, height ){
        var param = {top:0, left:0, width:width, height:height};
        if( width>maxWidth || height>maxHeight )
        {
            rateWidth = width / maxWidth;
            rateHeight = height / maxHeight;

            if( rateWidth > rateHeight )
            {
                param.width =  maxWidth;
                param.height = Math.round(height / rateWidth);
            }else
            {
                param.width = Math.round(width / rateHeight);
                param.height = maxHeight;
            }
        }
        param.left = Math.round((maxWidth - param.width) / 2);
        param.top = Math.round((maxHeight - param.height) / 2);
        return param;
    }

    function previewImage1(file)
    {
        var MAXWIDTH  = 260;
        var MAXHEIGHT = 180;
        var div = document.getElementById('preview1');
        if (file.files && file.files[0])
        {
            div.innerHTML ='<img id=imghead1>';
            var img = document.getElementById('imghead1');
            img.onload = function(){
                var rect = clacImgZoomParam(MAXWIDTH, MAXHEIGHT, img.offsetWidth, img.offsetHeight);
                img.width  =  rect.width;
                img.height =  rect.height;
//                 img.style.marginLeft = rect.left+'px';
                img.style.marginTop = rect.top+'px';
            }
            var reader = new FileReader();
            reader.onload = function(evt){img.src = evt.target.result;}
            reader.readAsDataURL(file.files[0]);
        }
        else //兼容IE
        {
            var sFilter='filter:progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod=scale,src="';
            file.select();
            var src = document.selection.createRange().text;
            div.innerHTML = '<img id=imghead1>';
            var img = document.getElementById('imghead');
            img.filters.item('DXImageTransform.Microsoft.AlphaImageLoader').src = src;
            var rect = clacImgZoomParam(MAXWIDTH, MAXHEIGHT, img.offsetWidth, img.offsetHeight);
            status =('rect:'+rect.top+','+rect.left+','+rect.width+','+rect.height);
            div.innerHTML = "<div id=divhead1 style='width:"+rect.width+"px;height:"+rect.height+"px;margin-top:"+rect.top+"px;"+sFilter+src+"\"'></div>";
        }
    }
    function clacImgZoomParam( maxWidth, maxHeight, width, height ){
        var param = {top:0, left:0, width:width, height:height};
        if( width>maxWidth || height>maxHeight )
        {
            rateWidth = width / maxWidth;
            rateHeight = height / maxHeight;

            if( rateWidth > rateHeight )
            {
                param.width =  maxWidth;
                param.height = Math.round(height / rateWidth);
            }else
            {
                param.width = Math.round(width / rateHeight);
                param.height = maxHeight;
            }
        }
        param.left = Math.round((maxWidth - param.width) / 2);
        param.top = Math.round((maxHeight - param.height) / 2);
        return param;
    }
    bkLib.onDomLoaded(function() {
        new nicEditor().panelInstance('area1');
        new nicEditor({fullPanel : true}).panelInstance('area2');
        new nicEditor({iconsPath : '../nicEditorIcons.gif'}).panelInstance('area3');
        new nicEditor({buttonList : ['fontSize','bold','italic','underline','strikeThrough','subscript','superscript','html','image']}).panelInstance('area4');
        new nicEditor({maxHeight : 100}).panelInstance('area5');
    });
</script>



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

                    <a href="${pageContext.request.contextPath}/backUser/toBackLogin" class="link-scan" ka="header-boss" title="我要招聘">我要招聘</a> <a href="${pageContext.request.contextPath}/user/toRegister" ka="header-register" class="btn btn-outline">注册</a>
                    <a href="${pageContext.request.contextPath}/user/tologin" ka="header-login" class="btn btn-outline">登录</a>

                </div>
            </c:if>
            <c:if test="${!empty sessionScope.user}">
                <ul>
                    <li class="cur"><a ka="header-resume" href="${pageContext.request.contextPath}/user/personal">简历</a>
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
            <div class="col-lg-12">
                <div class="inner-header">

                    <h3>个人信息</h3>

                </div>
            </div>
        </div>
    </div>
</div>
<section id="content">
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-lg-9 col-md-12 col-xs-12">
                <div class="add-resume box">
                    <form class="form-ad" enctype="multipart/form-data" method="POST" action="${pageContext.request.contextPath}/user/editUser">

                        <h3>个人基本信息</h3>

                        <div class="form-group">
                            <div class="row">
                                <div class="col-md-6">
                                    <label class="control-label">姓名</label>
                                    <input type="text" class="form-control" placeholder="请填写姓名" name="userName" value="${user.userName}">
                                </div>
                                <div class="col-md-6">
                                    <label class="control-label">性别</label>
                                    <div class="row">
                                        <div class="col-md-3">
                                            <input type="radio" class="form-control" name="userSex" value="男" checked>男
                                        </div>
                                        <div class="col-md-3">
                                            <input type="radio" class="form-control" name="userSex" value="女">女
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="form-group">
                            <div class="row">
                                <div class="col-md-6">
                                    <label class="control-label">开始工作时间</label>
                                    <input type="text" class="form-control" placeholder="请填写开始工作时间" name="userWorkDate" value="${user.userWorkDate}">
                                </div>
                                <div class="col-md-6">
                                    <label class="control-label">生日</label>
                                    <input type="text" class="form-control" placeholder="请填写生日" name="userBirth" value="${user.userBirth}">
                                </div>
                            </div>
                        </div>

                        <div class="form-group">
                            <div class="row">
                                <div class="col-md-6">
                                    <label class="control-label">电话</label>
                                    <input type="text" class="form-control" placeholder="请填写电话" name="userTel" value="${user.userTel}">
                                </div>
                                <div class="col-md-6">
                                    <label class="control-label">年龄</label>
                                    <input type="text" class="form-control" placeholder="请填写年龄" name="userAge" value="${user.userAge}">
                                </div>
                            </div>
                        </div>

                        <div class="form-group">
                            <div class="row">
                                <div class="col-md-6">
                                    <label class="control-label">电子邮箱（选填）</label>
                                    <input type="text" class="form-control" placeholder="Your@domain.com" name="userEmail" value="${user.userEmail}">
                                </div>
                                <div class="col-md-6">
                                    <label class="control-label">教育情况</label>
                                    <input type="text" class="form-control" placeholder="请输入教育情况" name="userEdu" value="${user.userEdu}">
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="button-group">
                                <div class="action-buttons">
                                    <label class="control-label">个人照片</label>
                                    <div id="preview">
                                        <img id="imghead" width=100% height=auto border=0 src='${user.userPhoto}'>
                                    </div>
                                    <input type="hidden" name="userPhoto" value="${user.userPhoto}"/>

                                    <input type="file" onchange="previewImage(this)" name="userPhoto1"/>
                                </div>
                            </div>
                        </div>

                        <button class="btn btn-common" type="submit" style="margin-top: 30px;margin-bottom: 30px;">Save</button>
                    </form>
                    <form class="form-ad" enctype="multipart/form-data" method="POST" action="${pageContext.request.contextPath}/user/editResume">
                        <h3>个人简历信息</h3>
                        <div class="form-group">
                            <div class="row">
                                <div class="col-md-6">
                                    <label class="control-label">简历姓名</label>
                                    <input type="text" class="form-control" placeholder="请输入简历姓名" name="resumeName" value="${resume.resumeName}">
                                </div>
                                <div class="col-md-6">
                                    <label class="control-label">简历电话</label>
                                    <input type="text" class="form-control" placeholder="请输入简历电话" name="resumeTel" value="${resume.resumeTel}">
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label">现居住地址</label>
                            <input type="text" class="form-control" placeholder="请输入现居住地址" name="address" value="${resume.address}">
                        </div>

                        <div class="form-group">
                            <label class="control-label">个人优势</label>
                            <textarea class="form-control" rows="7" name="personalPoint">${resume.personalPoint}</textarea>
                        </div>
                        <div class="form-group">
                            <label class="control-label">简历照片</label>
                            <div class="button-group">
                                <div class="action-buttons">
                                    <div id="preview1">
                                        <img id="imghead1" width=100% height=auto border=0 src='${resume.resumePhoto}' name="resumePhoto">
                                    </div>
                                    <input type="hidden" name="resumePhoto" value="${resume.resumePhoto}"/>

                                    <input type="file" onchange="previewImage1(this)" name="resumePhoto1"/>
                                </div>
                            </div>
                        </div>
                        <div class="divider">
                            <h3>工作经验</h3>
                        </div>
                        <textarea class="form-control" rows="7" name="workExperience" >${resume.workExperience}</textarea>

                        <div class="divider">
                            <h3>项目经验</h3>
                        </div>
                        <textarea class="form-control" rows="7" name="projectExp">${resume.projectExp}</textarea>

                        <div class="divider">
                            <h3>学历介绍</h3>
                        </div>
                        <textarea class="form-control" rows="7" name="eduExperience">${resume.eduExperience}</textarea>
                        <input type="hidden" value="${resume.resumeId}" name="resumeId"/>

                        <button class="btn btn-common" type="submit" style="margin-top: 30px;">Save</button>

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

<style type="text/css">
    .user-nav li.cur a, .user-nav li.cur a:hover {
        color: #00d7c6!important;
    }
    #preview{width:260px;height:190px;border:1px solid #000;overflow:hidden;}
    #imghead {filter:progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod=image);}

    #preview1{width:260px;height:190px;border:1px solid #000;overflow:hidden;}
    #imghead1 {filter:progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod=image);}

</style>

</html>