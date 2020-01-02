<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Trabajo HTML5 Responsive Template</title>
    <!-- Favicon -->
    <link rel="icon" href="/assets/images/favicon.png" type="image/png" sizes="32x32">
    <!-- All CSS -->
    <link rel="stylesheet" href="/assets/css/bootstrap.min.css">
    <link rel="stylesheet" href="/assets/css/aos.min.css">
    <link rel="stylesheet" href="/assets/css/fontawesome-all.min.css">
    <link rel="stylesheet" href="/assets/css/magnific.min.css">
    <link rel="stylesheet" href="/assets/css/owl.carousel.min.css">
    <link rel="stylesheet" href="/assets/css/select2.min.css">
    <link rel="stylesheet" href="/assets/css/slimmenu.min.css">
    <link rel="stylesheet" href="/assets/css/style.css">
   <link rel="stylesheet" href="/assets/css/newStyle.css">
    <!-- Google font -->
    <link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700" rel="stylesheet">
</head>
   <body>
      <div id="header">
         <div class="inner home-inner">
             <div class="logo"> <a href="https://www.zhipin.com/" ka="header-home-logo" title="BOSS直聘"><span>BOSS直聘</span></a>

             </div>
             <div class="nav">
                 <ul>
                     <li class="cur"><a ka="header-home" href="${pageContext.request.contextPath}/user/index">首页</a>
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
      <main class="main-content-area">
         <!--slider-start -->
         <div class="slider-area clearfix">
            <div class="container">
			  <div class="row">
			  	<div class="col-lg-12">
				 <div class="slider-wrapper">
	               <div class="row">
                  <div class="col-md-68 mx-auto">
                     <div class="slider-text text-center">
                        <div class="slide-title">
                           <h1><div class="mobile-show">5,000+ Jobs Available</div><div class="mobile-hide">5,000+ Jobs <span class="typed"></span> </div></h1>
                           <div class="typed-strings">
                              <p>Available</p>
                           </div>
                           <p>Fusitae risusvol ptatem vitae iaculis gravida, luctus dui fermentum mauris.</p>
                        </div>
                        <div class="slider-btn">
                           <div class="buttonfx btn-green"><a class="shutter-in-horizontal green-border-2" href="#">Apply Now</a></div>
                           <div class="btn-trasparent-green buttonfx curtainup"><a class="shutter-in-horizontal green-border-2"  href="#">Join with Us</a></div>
                        </div> 
                     </div>
                  </div>
               </div>
				 <div class="job-search-bar">
					<div class="search-bar text-center">
					   <form action="#" class="">
						  <div class="form-row">
							 <div class="col-md-4">
								<input type="search" placeholder="工作关键字" />
							 </div>
							 <div class="col-md-4">
								<select class="custom-multi-select" name="state">
								  <option value="" disabled selected>工作种类</option>
								   <option value="AL">General</option>
								   <option value="AL">Finance</option>
								   <option value="AL">Banking</option>
								   <option value="AL">Programming</option>
								   <option value="AL">NGO</option>
								   <option value="WY">Others</option>
								</select>
							 </div>
							 <div class="col-md-4">
								<button type="submit" class="buttonfx curtainup">找工作</button>
							 </div>
						  </div>
					   </form>
					</div>
				 </div>			
				</div>
				</div>
			  </div>

            </div>
         </div>
         <!--slider-end -->

         <!--work-area-start -->
         <div class="how-work-area pt-100 pb-100 clearfix">
            <div class="container">
               <div class="how-work-wrapper text-center">
                  <div class="row">
                     <div class="col-md-4">
                        <div class="work-block" data-aos="fade-up">
                           <div class="icon">
                              <a href="#"><img src="/assets/images/lock.png" alt="image" /></a>
                           </div>
                           <div class="title">
                              <h3>Create Account</h3>
                           </div>
                        </div>
                     </div>
                     <div class="col-md-4">
                        <div class="work-block">
                           <div class="icon">
                              <a href="#"><img src="/assets/images/search.png" alt="image" /></a>
                           </div>
                           <div class="title">
                              <h3>Serach Job</h3>
                           </div>
                         </div>
                     </div>
                     <div class="col-md-4">
                        <div class="work-block m-0">
                           <div class="icon">
                              <a href="#"><img src="/assets/images/resume.png" alt="image" /></a>
                           </div>
                           <div class="title">
                              <h3>Submit Resume</h3>
                           </div>
                        </div>
                     </div>
                  </div>
               </div>
            </div>
         </div>
         <!--work-area-end -->
         <!--job-post-area-start -->;
         <div class="job-post-area pt-100 bg-color2 pb-100 minus-15 clearfix" style="padding-top: 0px;padding-bottom: 20px">
            <div class="container">
               <div class="row">
                  <div class="col-md-12">
                     <div class="section-title text-left">
                        <span>本周热聘工作</span>
                        <h2>特色职位</h2>
                        <div class="line"></div>
                     </div>
                  </div>
               </div>
               <div class="common-tab-box job-tab-box">
                  <ul class="cur">
                   <c:forEach items="${positionDTOList}" var="position">
                     <li>
                        <div class="sub-li">
                           <a href="${pageContext.request.contextPath}/job/positionDetail?positionId=${position.positionId}" ka="index_rcmd_job_1" class="job-info" target="_blank">
                              <p>${position.positionName}<span class="salary">${position.positionPrice}</span>
                              </p>
                              <p class="job-text">${position.positionAddr}<span class="vline"></span>${position.positionRequest}<span class="vline"></span>本科</p>
                           </a>
                           <a href="#" ka="index_rcmd_company_1_custompage" class="user-info" >
                              <p>
                                 <img src="${position.releasePhoto}"
                                  >${position.companyName} <span class="user-text">${position.releaseName}<span class="vline"></span>${position.releasePosition}</span>
                              </p>
                           </a>
                        </div>
                     </li>
                   </c:forEach>
                  </ul>
                  <p class="common-tab-more"><a class="btn btn-outline" href="${pageContext.request.contextPath}/job/jobList" ka="open_joblist">查看更多</a></p>
               </div>
              </div>
         </div>

         <div class="job-categories-area bg-color2 pt-100 pb-100 clearfix " style="padding-top: 0">
            <div class="container">
               <div class="row">
                  <div class="col-md-12">
                     <div class="section-title text-left">
                        <span>最受欢迎的类别</span>
                        <h2>工作类别</h2>
                        <div class="line"></div>
                     </div>
                  </div>
               </div>
               <div class="cat-list-items">
                  <div class="row">
                     <div class="col-md-4">
                        <div class="single-category text-center" data-aos="flip-up">
                           <div class="cat-icon"><a href="#"><img src="/assets/images/cat-1.jpg" alt="image" /></a></div>
                           <div class="cat-details">
                              <h4><a href="#">Accounting / finance</a><span>(10 open vacancies)</span></h4>
                           </div>
                        </div>

                     </div>
                     <div class="col-md-4">
                        <div class="single-category text-center">
                           <div class="cat-icon"><a href="#"><img src="/assets/images/cat-2.jpg" alt="image" /></a></div>
                           <div class="cat-details">
                              <h4><a href="#">Education training</a><span>(15 open vacancies)</span></h4>
                           </div>
                        </div>
                     </div>
                     <div class="col-md-4">
                        <div class="single-category text-center" data-aos="flip-up">
                           <div class="cat-icon"><a href="#"><img src="/assets/images/cat-3.jpg" alt="image" /></a></div>
                           <div class="cat-details">
                              <h4><a href="#">Book services </a><span>(17 open vacancies)</span></h4>
                           </div>
                        </div>
                     </div>
                     <div class="col-md-4">
                        <div class="single-category text-center">
                           <div class="cat-icon"><a href="#"><img src="/assets/images/cat-4.jpg" alt="image" /></a></div>
                           <div class="cat-details">
                              <h4><a href="#">Health care</a><span>(9 open vacancies)</span></h4>
                           </div>
                        </div>
                     </div>
                     <div class="col-md-4">
                        <div class="single-category text-center" >
                           <div class="cat-icon"><a href="#"><img src="/assets/images/cat-5.jpg" alt="image" /></a></div>
                           <div class="cat-details">
                              <h4><a href="#">Automotive job</a><span>(6 open vacancies)</span></h4>
                           </div>
                        </div>
                     </div>
                     <div class="col-md-4">
                        <div class="single-category text-center">
                           <div class="cat-icon"><a href="#"><img src="/assets/images/cat-6.jpg" alt="image" /></a></div>
                           <div class="cat-details">
                              <h4><a href="#">Sales  marketing</a><span>(12 open vacancies)</span></h4>
                           </div>
                        </div>
                     </div>
                     <div class="col-md-4">
                        <div class="single-category text-center" data-aos="flip-up">
                           <div class="cat-icon"><a href="#"><img src="/assets/images/cat-7.jpg" alt="image" /></a></div>
                           <div class="cat-details">
                              <h4><a href="#">Sales  marketing</a><span>(12 open vacancies)</span></h4>
                           </div>
                        </div>
                     </div>
                     <div class="col-md-4">
                        <div class="single-category text-center">
                           <div class="cat-icon"><a href="#"><img src="/assets/images/cat-8.jpg" alt="image" /></a></div>
                           <div class="cat-details">
                              <h4><a href="#">Sales  marketing</a><span>(12 open vacancies)</span></h4>
                           </div>
                        </div>
                     </div>
                     <div class="col-md-4">
                        <div class="single-category text-center" data-aos="flip-up">
                           <div class="cat-icon"><a href="#"><img src="/assets/images/cat-9.jpg" alt="image" /></a></div>
                           <div class="cat-details">
                              <h4><a href="#">Sales  marketing</a><span>(12 open vacancies)</span></h4>
                           </div>
                        </div>
                     </div>
                  </div>
               </div>
            </div>
         </div>


         <div class="job-post-area pt-100 bg-color2 pb-100 minus-15 clearfix" style="padding-top: 0px;padding-bottom: 20px">
            <div class="container">
               <div class="row">
                  <div class="col-md-12">
                     <div class="section-title text-left">
                        <span>本周热门企业</span>
                        <h2>热门企业</h2>
                        <div class="line"></div>
                     </div>
                  </div>
               </div>
         <div class="common-tab-box company-tab-box">
          <ul class="cur">
            <c:forEach items="${companyList}" var="company">
               <li>
                  <div class="sub-li">
                     <a href="${pageContext.request.contextPath}/company/companyDetail?companyId=${company.companyId}" target="_blank" ka="index_rcmd_companylogo_1_custompage" class="company-info">
                        <img src=${company.companyPhoto} data-src="https://img.bosszhipin.com/beijin/mcs/chatphoto/20190228/a83fc908c1bcb5510b35da79ebc74a9286b6a9e98aa8f150dd17e2f5328c5178.jpg?x-oss-process=image/resize,w_100,limit_0"
                             alt="">
                        <div class="conpany-text">
                           <h4>${company.companyName}</h4>

                           <p>${company.finance}<span class="vline">

                           </span>${company.companyType}</p>
                        </div>
                     </a>
                     <a href="${pageContext.request.contextPath}/company/companyDetail?companyId=${company.companyId}" target="_blank" ka="index_rcmd_company_1_custompage" class="about-info">
                        <p><span class="pull-right"><span class="text-blue">1189</span>位BOSS在线</span><span class="text-blue">3704</span>个热招职位</p>
                     </a>
                  </div>
               </li>
               </c:forEach>
               <%--<li>--%>
                  <%--<div class="sub-li">--%>
                     <%--<a href="/gongsi/29c1ab68d5e3d3360nN63Q~~.html" target="_blank" ka="index_rcmd_companylogo_2_custompage" class="company-info">--%>
                        <%--<img src="https://img.bosszhipin.com/beijin/mcs/chatphoto/20190309/d6f0340071a81ecdcaab162fee9c9920c7421cffdbdea8d6f11cda4aeefd5586.jpg?x-oss-process=image/resize,w_100,limit_0" data-src="https://img.bosszhipin.com/beijin/mcs/chatphoto/20190309/d6f0340071a81ecdcaab162fee9c9920c7421cffdbdea8d6f11cda4aeefd5586.jpg?x-oss-process=image/resize,w_100,limit_0"--%>
                             <%--alt="">--%>
                        <%--<div class="conpany-text">--%>
                           <%--<h4>软通动力</h4>--%>

                           <%--<p>已上市<span class="vline"></span>计算机软件</p>--%>
                        <%--</div>--%>
                     <%--</a>--%>
                     <%--<a href="/gongsir/29c1ab68d5e3d3360nN63Q~~.html" target="_blank" ka="index_rcmd_company_2_custompage" class="about-info">--%>
                        <%--<p><span class="pull-right"><span class="text-blue">606</span>位BOSS在线</span><span class="text-blue">3845</span>个热招职位</p>--%>
                     <%--</a>--%>
                  <%--</div>--%>
               <%--</li>--%>
               <%--<li>--%>
                  <%--<div class="sub-li">--%>
                     <%--<a href="/gongsi/0ebccb6654a7d8181nR52dq-Ew~~.html" target="_blank" ka="index_rcmd_companylogo_3_custompage" class="company-info">--%>
                        <%--<img src="https://img.bosszhipin.com/beijin/mcs/chatphoto/20170915/e2006207efa1eb77e6676dfb8e39732d206e543653a4eb98497a2562aec28822.jpg?x-oss-process=image/resize,w_100,limit_0" data-src="https://img.bosszhipin.com/beijin/mcs/chatphoto/20170915/e2006207efa1eb77e6676dfb8e39732d206e543653a4eb98497a2562aec28822.jpg?x-oss-process=image/resize,w_100,limit_0"--%>
                             <%--alt="">--%>
                        <%--<div class="conpany-text">--%>
                           <%--<h4>安荣科技</h4>--%>

                           <%--<p>A轮<span class="vline"></span>计算机软件</p>--%>
                        <%--</div>--%>
                     <%--</a>--%>
                     <%--<a href="/gongsir/0ebccb6654a7d8181nR52dq-Ew~~.html" target="_blank" ka="index_rcmd_company_3_custompage" class="about-info">--%>
                        <%--<p><span class="pull-right"><span class="text-blue">9</span>位BOSS在线</span><span class="text-blue">24</span>个热招职位</p>--%>
                     <%--</a>--%>
                  <%--</div>--%>
               <%--</li>--%>
               <%--<li>--%>
                  <%--<div class="sub-li">--%>
                     <%--<a href="/gongsi/c503941426190fc81HZ82t20.html" target="_blank" ka="index_rcmd_companylogo_4_custompage" class="company-info">--%>
                        <%--<img src="https://img.bosszhipin.com/beijin/mcs/chatphoto/20190213/1d67bf3c62cd4211f9b6acc69a8b9b52b07098ec58df2b2ecc67d0300702155d.png?x-oss-process=image/resize,w_100,limit_0" data-src="https://img.bosszhipin.com/beijin/mcs/chatphoto/20190213/1d67bf3c62cd4211f9b6acc69a8b9b52b07098ec58df2b2ecc67d0300702155d.png?x-oss-process=image/resize,w_100,limit_0"--%>
                             <%--alt="">--%>
                        <%--<div class="conpany-text">--%>
                           <%--<h4>水滴互助</h4>--%>

                           <%--<p>C轮<span class="vline"></span>互联网金融</p>--%>
                        <%--</div>--%>
                     <%--</a>--%>
                     <%--<a href="/gongsir/c503941426190fc81HZ82t20.html" target="_blank" ka="index_rcmd_company_4_custompage" class="about-info">--%>
                        <%--<p><span class="pull-right"><span class="text-blue">10</span>位BOSS在线</span><span class="text-blue">12</span>个热招职位</p>--%>
                     <%--</a>--%>
                  <%--</div>--%>
               <%--</li>--%>
               <%--<li>--%>
                  <%--<div class="sub-li">--%>
                     <%--<a href="/gongsi/aa456cb60b5eb9e81ndz3ty1.html" target="_blank" ka="index_rcmd_companylogo_5_custompage" class="company-info">--%>
                        <%--<img src="https://img.bosszhipin.com/beijin/mcs/bar/20190918/53c16d3a02ced9ce20505a30956595d4be1bd4a3bd2a63f070bdbdada9aad826.png?x-oss-process=image/resize,w_100,limit_0" data-src="https://img.bosszhipin.com/beijin/mcs/bar/20190918/53c16d3a02ced9ce20505a30956595d4be1bd4a3bd2a63f070bdbdada9aad826.png?x-oss-process=image/resize,w_100,limit_0"--%>
                             <%--alt="">--%>
                        <%--<div class="conpany-text">--%>
                           <%--<h4>作业帮</h4>--%>

                           <%--<p>D轮及以上<span class="vline"></span>互联网</p>--%>
                        <%--</div>--%>
                     <%--</a>--%>
                     <%--<a href="/gongsir/aa456cb60b5eb9e81ndz3ty1.html" target="_blank" ka="index_rcmd_company_5_custompage" class="about-info">--%>
                        <%--<p><span class="pull-right"><span class="text-blue">190</span>位BOSS在线</span><span class="text-blue">709</span>个热招职位</p>--%>
                     <%--</a>--%>
                  <%--</div>--%>
               <%--</li>--%>
               <%--<li>--%>
                  <%--<div class="sub-li">--%>
                     <%--<a href="/gongsi/f3e62b9ed1bfa70b1nNy09w~.html" target="_blank" ka="index_rcmd_companylogo_6_custompage" class="company-info">--%>
                        <%--<img src="https://img.bosszhipin.com/beijin/mcs/bar/20181012/468dd286df85f74a94ba56c40292f03cbe1bd4a3bd2a63f070bdbdada9aad826.jpg?x-oss-process=image/resize,w_100,limit_0" data-src="https://img.bosszhipin.com/beijin/mcs/bar/20181012/468dd286df85f74a94ba56c40292f03cbe1bd4a3bd2a63f070bdbdada9aad826.jpg?x-oss-process=image/resize,w_100,limit_0"--%>
                             <%--alt="">--%>
                        <%--<div class="conpany-text">--%>
                           <%--<h4>微博</h4>--%>

                           <%--<p>已上市<span class="vline"></span>互联网</p>--%>
                        <%--</div>--%>
                     <%--</a>--%>
                     <%--<a href="/gongsir/f3e62b9ed1bfa70b1nNy09w~.html" target="_blank" ka="index_rcmd_company_6_custompage" class="about-info">--%>
                        <%--<p><span class="pull-right"><span class="text-blue">139</span>位BOSS在线</span><span class="text-blue">437</span>个热招职位</p>--%>
                     <%--</a>--%>
                  <%--</div>--%>
               <%--</li>--%>
               <%--<li>--%>
                  <%--<div class="sub-li">--%>
                     <%--<a href="/gongsi/e715aa1be4283fc21nd62tq5.html" target="_blank" ka="index_rcmd_companylogo_7_custompage" class="company-info">--%>
                        <%--<img src="https://img.bosszhipin.com/beijin/mcs/bar/20190103/02e628201e926b143612962b62057942be1bd4a3bd2a63f070bdbdada9aad826.jpg?x-oss-process=image/resize,w_100,limit_0" data-src="https://img.bosszhipin.com/beijin/mcs/bar/20190103/02e628201e926b143612962b62057942be1bd4a3bd2a63f070bdbdada9aad826.jpg?x-oss-process=image/resize,w_100,limit_0"--%>
                             <%--alt="">--%>
                        <%--<div class="conpany-text">--%>
                           <%--<h4>博彦科技</h4>--%>

                           <%--<p>已上市<span class="vline"></span>计算机软件</p>--%>
                        <%--</div>--%>
                     <%--</a>--%>
                     <%--<a href="/gongsir/e715aa1be4283fc21nd62tq5.html" target="_blank" ka="index_rcmd_company_7_custompage" class="about-info">--%>
                        <%--<p><span class="pull-right"><span class="text-blue">228</span>位BOSS在线</span><span class="text-blue">1168</span>个热招职位</p>--%>
                     <%--</a>--%>
                  <%--</div>--%>
               <%--</li>--%>
               <%--<li>--%>
                  <%--<div class="sub-li">--%>
                     <%--<a href="/gongsi/2dc45ffa1846af1f1HZ92tm-.html" target="_blank" ka="index_rcmd_companylogo_8_custompage" class="company-info">--%>
                        <%--<img src="https://img.bosszhipin.com/beijin/upload/com/logo/20190916/8b51ed8dc0a4f327c6fb5a3bb2356d02e5e3f4710cae9169e9ca51aa58165710.jpg?x-oss-process=image/resize,w_100,limit_0" data-src="https://img.bosszhipin.com/beijin/upload/com/logo/20190916/8b51ed8dc0a4f327c6fb5a3bb2356d02e5e3f4710cae9169e9ca51aa58165710.jpg?x-oss-process=image/resize,w_100,limit_0"--%>
                             <%--alt="">--%>
                        <%--<div class="conpany-text">--%>
                           <%--<h4>支付宝口碑</h4>--%>

                           <%--<p>D轮及以上<span class="vline"></span>O2O</p>--%>
                        <%--</div>--%>
                     <%--</a>--%>
                     <%--<a href="/gongsir/2dc45ffa1846af1f1HZ92tm-.html" target="_blank" ka="index_rcmd_company_8_custompage" class="about-info">--%>
                        <%--<p><span class="pull-right"><span class="text-blue">109</span>位BOSS在线</span><span class="text-blue">203</span>个热招职位</p>--%>
                     <%--</a>--%>
                  <%--</div>--%>
               <%--</li>--%>
               <%--<li>--%>
                  <%--<div class="sub-li">--%>
                     <%--<a href="/gongsi/28a141158f3aa4f403V-2d0~.html" target="_blank" ka="index_rcmd_companylogo_9_custompage" class="company-info">--%>
                        <%--<img src="https://img.bosszhipin.com/beijin/mcs/bar/20190103/de236faf59006be3156c4bd28963693abe1bd4a3bd2a63f070bdbdada9aad826.jpg?x-oss-process=image/resize,w_100,limit_0" data-src="https://img.bosszhipin.com/beijin/mcs/bar/20190103/de236faf59006be3156c4bd28963693abe1bd4a3bd2a63f070bdbdada9aad826.jpg?x-oss-process=image/resize,w_100,limit_0"--%>
                             <%--alt="">--%>
                        <%--<div class="conpany-text">--%>
                           <%--<h4>农田管家</h4>--%>

                           <%--<p>B轮<span class="vline"></span>移动互联网</p>--%>
                        <%--</div>--%>
                     <%--</a>--%>
                     <%--<a href="/gongsir/28a141158f3aa4f403V-2d0~.html" target="_blank" ka="index_rcmd_company_9_custompage" class="about-info">--%>
                        <%--<p><span class="pull-right"><span class="text-blue">4</span>位BOSS在线</span><span class="text-blue">10</span>个热招职位</p>--%>
                     <%--</a>--%>
                  <%--</div>--%>
               <%--</li>--%>
               <%--<li>--%>
                  <%--<div class="sub-li">--%>
                     <%--<a href="/gongsi/87e9bf91b3ece9dd1nR_2t27GQ~~.html" target="_blank" ka="index_rcmd_companylogo_10_custompage" class="company-info">--%>
                        <%--<img src="https://img.bosszhipin.com/beijin/mcs/chatphoto/20190730/382bbd1178e7c9189368368e229d2bd5e5256d542bf1117a730e9a510da46b2a_s.jpg?x-oss-process=image/resize,w_100,limit_0" data-src="https://img.bosszhipin.com/beijin/mcs/chatphoto/20190730/382bbd1178e7c9189368368e229d2bd5e5256d542bf1117a730e9a510da46b2a_s.jpg?x-oss-process=image/resize,w_100,limit_0"--%>
                             <%--alt="">--%>
                        <%--<div class="conpany-text">--%>
                           <%--<h4>小黑鱼</h4>--%>

                           <%--<p>A轮<span class="vline"></span>互联网</p>--%>
                        <%--</div>--%>
                     <%--</a>--%>
                     <%--<a href="/gongsir/87e9bf91b3ece9dd1nR_2t27GQ~~.html" target="_blank" ka="index_rcmd_company_10_custompage" class="about-info">--%>
                        <%--<p><span class="pull-right"><span class="text-blue">38</span>位BOSS在线</span><span class="text-blue">97</span>个热招职位</p>--%>
                     <%--</a>--%>
                  <%--</div>--%>
               <%--</li>--%>
               <%--<li>--%>
                  <%--<div class="sub-li">--%>
                     <%--<a href="/gongsi/92e05e7431035db003Jz29U~.html" target="_blank" ka="index_rcmd_companylogo_11_custompage" class="company-info">--%>
                        <%--<img src="https://img.bosszhipin.com/beijin/mcs/chatphoto/20160418/31656ffbae01e1260ddb9cce6be2e36625d4d77513bbdf88b8bdcf31d5160bac.jpg?x-oss-process=image/resize,w_100,limit_0" data-src="https://img.bosszhipin.com/beijin/mcs/chatphoto/20160418/31656ffbae01e1260ddb9cce6be2e36625d4d77513bbdf88b8bdcf31d5160bac.jpg?x-oss-process=image/resize,w_100,limit_0"--%>
                             <%--alt="">--%>
                        <%--<div class="conpany-text">--%>
                           <%--<h4>新橙科技</h4>--%>

                           <%--<p>不需要融资<span class="vline"></span>计算机软件</p>--%>
                        <%--</div>--%>
                     <%--</a>--%>
                     <%--<a href="/gongsir/92e05e7431035db003Jz29U~.html" target="_blank" ka="index_rcmd_company_11_custompage" class="about-info">--%>
                        <%--<p><span class="pull-right"><span class="text-blue">3</span>位BOSS在线</span><span class="text-blue">14</span>个热招职位</p>--%>
                     <%--</a>--%>
                  <%--</div>--%>
               <%--</li>--%>
               <%--<li>--%>
                  <%--<div class="sub-li">--%>
                     <%--<a href="/gongsi/2e80bd4edde272231nJy3Nq_.html" target="_blank" ka="index_rcmd_companylogo_12_custompage" class="company-info">--%>
                        <%--<img src="https://img.bosszhipin.com/beijin/mcs/chatphoto/20191008/89f0e7f31bd37b743d5d870c3145a42bbe3799b2cfcbdb6ffddf9231c2579f6f_s.jpg?x-oss-process=image/resize,w_100,limit_0" data-src="https://img.bosszhipin.com/beijin/mcs/chatphoto/20191008/89f0e7f31bd37b743d5d870c3145a42bbe3799b2cfcbdb6ffddf9231c2579f6f_s.jpg?x-oss-process=image/resize,w_100,limit_0"--%>
                             <%--alt="">--%>
                        <%--<div class="conpany-text">--%>
                           <%--<h4>微拍堂</h4>--%>

                           <%--<p>A轮<span class="vline"></span>电子商务</p>--%>
                        <%--</div>--%>
                     <%--</a>--%>
                     <%--<a href="/gongsir/2e80bd4edde272231nJy3Nq_.html" target="_blank" ka="index_rcmd_company_12_custompage" class="about-info">--%>
                        <%--<p><span class="pull-right"><span class="text-blue">14</span>位BOSS在线</span><span class="text-blue">86</span>个热招职位</p>--%>
                     <%--</a>--%>
                  <%--</div>--%>
               <%--</li>--%>
            </ul>
            <ul class="">
               <li>
                  <div class="sub-li">
                     <a href="/gongsi/7869686494e4fef81nR-2t8~.html" target="_blank" ka="index_rcmd_companylogo_13_custompage" class="company-info">
                        <img src="" data-src="https://img.bosszhipin.com/beijin/mcs/bar/20180305/d4ac57051749c90c176daf8fd20699c4be1bd4a3bd2a63f070bdbdada9aad826.jpg?x-oss-process=image/resize,w_100,limit_0" alt="">
                        <div class="conpany-text">
                           <h4>海尔集团</h4>

                           <p>已上市<span class="vline"></span>互联网</p>
                        </div>
                     </a>
                     <a href="/gongsir/7869686494e4fef81nR-2t8~.html" target="_blank" ka="index_rcmd_company_13_custompage" class="about-info">
                        <p><span class="pull-right"><span class="text-blue">120</span>位BOSS在线</span><span class="text-blue">446</span>个热招职位</p>
                     </a>
                  </div>
               </li>
               <li>
                  <div class="sub-li">
                     <a href="/gongsi/8b4a18e027d7440f1XZ40t26.html" target="_blank" ka="index_rcmd_companylogo_14_custompage" class="company-info">
                        <img src="" data-src="https://img.bosszhipin.com/beijin/upload/com/logo/20190710/aefcb4fd7aca9d5a5e050af0c667a73812d84318f3c54d2ac588617eb05830fd.png?x-oss-process=image/resize,w_100,limit_0" alt="">
                        <div class="conpany-text">
                           <h4>德邦物流</h4>

                           <p>已上市<span class="vline"></span>物流/仓储</p>
                        </div>
                     </a>
                     <a href="/gongsir/8b4a18e027d7440f1XZ40t26.html" target="_blank" ka="index_rcmd_company_14_custompage" class="about-info">
                        <p><span class="pull-right"><span class="text-blue">51</span>位BOSS在线</span><span class="text-blue">710</span>个热招职位</p>
                     </a>
                  </div>
               </li>
               <li>
                  <div class="sub-li">
                     <a href="/gongsi/dd2b76b867445f401nZ52tm5.html" target="_blank" ka="index_rcmd_companylogo_15_custompage" class="company-info">
                        <img src="" data-src="https://img.bosszhipin.com/beijin/mcs/chatphoto/20190215/20750fb2472c1b091c2d08f75e730654989046e7082a32ccec99d88eb8a1f19e.jpg?x-oss-process=image/resize,w_100,limit_0" alt="">
                        <div class="conpany-text">
                           <h4>同程旅游</h4>

                           <p>已上市<span class="vline"></span>旅游</p>
                        </div>
                     </a>
                     <a href="/gongsir/dd2b76b867445f401nZ52tm5.html" target="_blank" ka="index_rcmd_company_15_custompage" class="about-info">
                        <p><span class="pull-right"><span class="text-blue">125</span>位BOSS在线</span><span class="text-blue">171</span>个热招职位</p>
                     </a>
                  </div>
               </li>
               <li>
                  <div class="sub-li">
                     <a href="/gongsi/a55d55bc1ba958001nB6298~.html" target="_blank" ka="index_rcmd_companylogo_16_custompage" class="company-info">
                        <img src="" data-src="https://img.bosszhipin.com/beijin/mcs/chatphoto/20160408/bff2aca2457b7c3681137c88d35cfb6f4a801d8da5c3d4f607bbae6ca1abd3f7.jpg?x-oss-process=image/resize,w_100,limit_0" alt="">
                        <div class="conpany-text">
                           <h4>学大教育</h4>

                           <p>已上市<span class="vline"></span>在线教育</p>
                        </div>
                     </a>
                     <a href="/gongsir/a55d55bc1ba958001nB6298~.html" target="_blank" ka="index_rcmd_company_16_custompage" class="about-info">
                        <p><span class="pull-right"><span class="text-blue">184</span>位BOSS在线</span><span class="text-blue">481</span>个热招职位</p>
                     </a>
                  </div>
               </li>
               <li>
                  <div class="sub-li">
                     <a href="/gongsi/6289e701090a10463nZ7.html" target="_blank" ka="index_rcmd_companylogo_17_custompage" class="company-info">
                        <img src="" data-src="https://img.bosszhipin.com/beijin/mcs/bar/brand/921.jpg?x-oss-process=image/resize,w_100,limit_0" alt="">
                        <div class="conpany-text">
                           <h4>东软集团</h4>

                           <p>已上市<span class="vline"></span>计算机软件</p>
                        </div>
                     </a>
                     <a href="/gongsir/6289e701090a10463nZ7.html" target="_blank" ka="index_rcmd_company_17_custompage" class="about-info">
                        <p><span class="pull-right"><span class="text-blue">127</span>位BOSS在线</span><span class="text-blue">501</span>个热招职位</p>
                     </a>
                  </div>
               </li>
               <li>
                  <div class="sub-li">
                     <a href="/gongsi/1ad7c189e961d7e01n173NU~.html" target="_blank" ka="index_rcmd_companylogo_18_custompage" class="company-info">
                        <img src="" data-src="https://img.bosszhipin.com/beijin/mcs/chatphoto/7aefd8f78bd319f6cd7999a1080e273a-e1ec6ecc3e5467941n173NWjShIFlQ~~.jpeg?x-oss-process=image/resize,w_100,limit_0" alt="">
                        <div class="conpany-text">
                           <h4>伊的家</h4>

                           <p>不需要融资<span class="vline"></span>电子商务</p>
                        </div>
                     </a>
                     <a href="/gongsir/1ad7c189e961d7e01n173NU~.html" target="_blank" ka="index_rcmd_company_18_custompage" class="about-info">
                        <p><span class="pull-right"><span class="text-blue">8</span>位BOSS在线</span><span class="text-blue">46</span>个热招职位</p>
                     </a>
                  </div>
               </li>
               <li>
                  <div class="sub-li">
                     <a href="/gongsi/7bcf04c02aa3e29233J6294~.html" target="_blank" ka="index_rcmd_companylogo_19_custompage" class="company-info">
                        <img src="" data-src="https://img.bosszhipin.com/beijin/logo/3a6706fb200f6f255bd3fa5813885b51be1bd4a3bd2a63f070bdbdada9aad826.jpg?x-oss-process=image/resize,w_100,limit_0" alt="">
                        <div class="conpany-text">
                           <h4>红星美凯龙互联网集团</h4>

                           <p>已上市<span class="vline"></span>互联网</p>
                        </div>
                     </a>
                     <a href="/gongsir/7bcf04c02aa3e29233J6294~.html" target="_blank" ka="index_rcmd_company_19_custompage" class="about-info">
                        <p><span class="pull-right"><span class="text-blue">90</span>位BOSS在线</span><span class="text-blue">340</span>个热招职位</p>
                     </a>
                  </div>
               </li>
               <li>
                  <div class="sub-li">
                     <a href="/gongsi/aff3a2aa29b3825a03d539-0.html" target="_blank" ka="index_rcmd_companylogo_20_custompage" class="company-info">
                        <img src="" data-src="https://img.bosszhipin.com/beijin/mcs/chatphoto/20161207/2213da8dbaab079f656b022d4a0f9ac1e6935d5ea4c43efe67982c75f6e52dc5.jpg?x-oss-process=image/resize,w_100,limit_0" alt="">
                        <div class="conpany-text">
                           <h4>华强方特</h4>

                           <p>已上市<span class="vline"></span>建筑设计</p>
                        </div>
                     </a>
                     <a href="/gongsir/aff3a2aa29b3825a03d539-0.html" target="_blank" ka="index_rcmd_company_20_custompage" class="about-info">
                        <p><span class="pull-right"><span class="text-blue">29</span>位BOSS在线</span><span class="text-blue">204</span>个热招职位</p>
                     </a>
                  </div>
               </li>
               <li>
                  <div class="sub-li">
                     <a href="/gongsi/129a2470f523a9e61XRy09k~.html" target="_blank" ka="index_rcmd_companylogo_21_custompage" class="company-info">
                        <img src="" data-src="https://img.bosszhipin.com/beijin/mcs/bar/20180906/264cb4ef6e48712ef00a04ab1de87e54be1bd4a3bd2a63f070bdbdada9aad826.png?x-oss-process=image/resize,w_100,limit_0" alt="">
                        <div class="conpany-text">
                           <h4>新东方</h4>

                           <p>已上市<span class="vline"></span>在线教育</p>
                        </div>
                     </a>
                     <a href="/gongsir/129a2470f523a9e61XRy09k~.html" target="_blank" ka="index_rcmd_company_21_custompage" class="about-info">
                        <p><span class="pull-right"><span class="text-blue">170</span>位BOSS在线</span><span class="text-blue">879</span>个热招职位</p>
                     </a>
                  </div>
               </li>
               <li>
                  <div class="sub-li">
                     <a href="/gongsi/5894f0f90b9359c51nx_3964.html" target="_blank" ka="index_rcmd_companylogo_22_custompage" class="company-info">
                        <img src="" data-src="https://img.bosszhipin.com/beijin/mcs/bar/20180329/ba7ccb8c2fb1f38a2feae9ef97847de4be1bd4a3bd2a63f070bdbdada9aad826.jpg?x-oss-process=image/resize,w_100,limit_0" alt="">
                        <div class="conpany-text">
                           <h4>BOE</h4>

                           <p>已上市<span class="vline"></span>计算机软件</p>
                        </div>
                     </a>
                     <a href="/gongsir/5894f0f90b9359c51nx_3964.html" target="_blank" ka="index_rcmd_company_22_custompage" class="about-info">
                        <p><span class="pull-right"><span class="text-blue">64</span>位BOSS在线</span><span class="text-blue">396</span>个热招职位</p>
                     </a>
                  </div>
               </li>
               <li>
                  <div class="sub-li">
                     <a href="/gongsi/af10089279c521c40nV429m6.html" target="_blank" ka="index_rcmd_companylogo_23_custompage" class="company-info">
                        <img src="" data-src="https://img.bosszhipin.com/beijin/mcs/chatphoto/20190212/318b1722d4df00d602d5984a3bb7875eb47cd8a4d4aaa25f7cd53c4100c165c4.jpg?x-oss-process=image/resize,w_100,limit_0" alt="">
                        <div class="conpany-text">
                           <h4>汉能控股集团</h4>

                           <p>已上市<span class="vline"></span>其他行业</p>
                        </div>
                     </a>
                     <a href="/gongsir/af10089279c521c40nV429m6.html" target="_blank" ka="index_rcmd_company_23_custompage" class="about-info">
                        <p><span class="pull-right"><span class="text-blue">26</span>位BOSS在线</span><span class="text-blue">82</span>个热招职位</p>
                     </a>
                  </div>
               </li>
               <li>
                  <div class="sub-li">
                     <a href="/gongsi/08e179ad9c0b07f31nN92NS8.html" target="_blank" ka="index_rcmd_companylogo_24_custompage" class="company-info">
                        <img src="" data-src="https://img.bosszhipin.com/beijin/mcs/chatphoto/20190420/cb0a4ec827915aea6d37d7cc37bfe24bbb0c6c17f505b8df76479de141c38dab.jpg?x-oss-process=image/resize,w_100,limit_0" alt="">
                        <div class="conpany-text">
                           <h4>苹果装饰</h4>

                           <p>未融资<span class="vline"></span>工程施工</p>
                        </div>
                     </a>
                     <a href="/gongsir/08e179ad9c0b07f31nN92NS8.html" target="_blank" ka="index_rcmd_company_24_custompage" class="about-info">
                        <p><span class="pull-right"><span class="text-blue">77</span>位BOSS在线</span><span class="text-blue">200</span>个热招职位</p>
                     </a>
                  </div>
               </li>
            </ul>
            <ul class="">
               <li>
                  <div class="sub-li">
                     <a href="/gongsi/8cb217c93097ee5a1XJ43Ny-.html" target="_blank" ka="index_rcmd_companylogo_25_custompage" class="company-info">
                        <img src="" data-src="https://img.bosszhipin.com/beijin/logo/e0206f972f663f9f220574dfbf341adebe1bd4a3bd2a63f070bdbdada9aad826.jpg?x-oss-process=image/resize,w_100,limit_0" alt="">
                        <div class="conpany-text">
                           <h4>浙江执御</h4>

                           <p>C轮<span class="vline"></span>移动互联网</p>
                        </div>
                     </a>
                     <a href="/gongsir/8cb217c93097ee5a1XJ43Ny-.html" target="_blank" ka="index_rcmd_company_25_custompage" class="about-info">
                        <p><span class="pull-right"><span class="text-blue">36</span>位BOSS在线</span><span class="text-blue">117</span>个热招职位</p>
                     </a>
                  </div>
               </li>
               <li>
                  <div class="sub-li">
                     <a href="/gongsi/f24ec0c4ee1e997d1HVy0w~~.html" target="_blank" ka="index_rcmd_companylogo_26_custompage" class="company-info">
                        <img src="" data-src="https://img.bosszhipin.com/beijin/mcs/bar/20190702/ad9669e0ce57d94b19561e5f19fe1b0ebe1bd4a3bd2a63f070bdbdada9aad826.jpg?x-oss-process=image/resize,w_100,limit_0" alt="">
                        <div class="conpany-text">
                           <h4>掌门1对1</h4>

                           <p>D轮及以上<span class="vline"></span>互联网</p>
                        </div>
                     </a>
                     <a href="/gongsir/f24ec0c4ee1e997d1HVy0w~~.html" target="_blank" ka="index_rcmd_company_26_custompage" class="about-info">
                        <p><span class="pull-right"><span class="text-blue">314</span>位BOSS在线</span><span class="text-blue">6283</span>个热招职位</p>
                     </a>
                  </div>
               </li>
               <li>
                  <div class="sub-li">
                     <a href="/gongsi/5622f8b675961e231nd93tm5.html" target="_blank" ka="index_rcmd_companylogo_27_custompage" class="company-info">
                        <img src="" data-src="https://img.bosszhipin.com/beijin/mcs/chatphoto/20190214/c0ab14eb1512bcb559f58656b7bc06f55e44022e01e6930256a4d902ad56cc53.jpg?x-oss-process=image/resize,w_100,limit_0" alt="">
                        <div class="conpany-text">
                           <h4>家装e站</h4>

                           <p>已上市<span class="vline"></span>O2O</p>
                        </div>
                     </a>
                     <a href="/gongsir/5622f8b675961e231nd93tm5.html" target="_blank" ka="index_rcmd_company_27_custompage" class="about-info">
                        <p><span class="pull-right"><span class="text-blue">4</span>位BOSS在线</span><span class="text-blue">14</span>个热招职位</p>
                     </a>
                  </div>
               </li>
               <li>
                  <div class="sub-li">
                     <a href="/gongsi/495c7009197a8d471XB42tq8.html" target="_blank" ka="index_rcmd_companylogo_28_custompage" class="company-info">
                        <img src="" data-src="https://img.bosszhipin.com/beijin/mcs/chatphoto/8a48561b5d743c51114eaf213555c9ff-16f72acb2fb061bc1XB42tq8DggQl9s~.jpeg?x-oss-process=image/resize,w_100,limit_0" alt="">
                        <div class="conpany-text">
                           <h4>映客直播</h4>

                           <p>已上市<span class="vline"></span>移动互联网</p>
                        </div>
                     </a>
                     <a href="/gongsir/495c7009197a8d471XB42tq8.html" target="_blank" ka="index_rcmd_company_28_custompage" class="about-info">
                        <p><span class="pull-right"><span class="text-blue">40</span>位BOSS在线</span><span class="text-blue">158</span>个热招职位</p>
                     </a>
                  </div>
               </li>
               <li>
                  <div class="sub-li">
                     <a href="/gongsi/e1201ba8dcb6c0651nR42du-Ew~~.html" target="_blank" ka="index_rcmd_companylogo_29_custompage" class="company-info">
                        <img src="" data-src="https://img.bosszhipin.com/beijin/mcs/chatphoto/20190328/3853a811f22ce8beb96ba068956244a8099add37087baa6794412557bb92327f_s.jpg?x-oss-process=image/resize,w_100,limit_0" alt="">
                        <div class="conpany-text">
                           <h4>达达-京东到家</h4>

                           <p>D轮及以上<span class="vline"></span>O2O</p>
                        </div>
                     </a>
                     <a href="/gongsir/e1201ba8dcb6c0651nR42du-Ew~~.html" target="_blank" ka="index_rcmd_company_29_custompage" class="about-info">
                        <p><span class="pull-right"><span class="text-blue">140</span>位BOSS在线</span><span class="text-blue">410</span>个热招职位</p>
                     </a>
                  </div>
               </li>
               <li>
                  <div class="sub-li">
                     <a href="/gongsi/de146a1c921591461nF53Nu_.html" target="_blank" ka="index_rcmd_companylogo_30_custompage" class="company-info">
                        <img src="" data-src="https://img.bosszhipin.com/beijin/mcs/chatphoto/20170919/54f8a06ca67d6f52cfeb400c844124728c1ca286fb5e8cfb5748de220b513d7f.jpg?x-oss-process=image/resize,w_100,limit_0" alt="">
                        <div class="conpany-text">
                           <h4>祥云</h4>

                           <p>D轮及以上<span class="vline"></span>旅游</p>
                        </div>
                     </a>
                     <a href="/gongsir/de146a1c921591461nF53Nu_.html" target="_blank" ka="index_rcmd_company_30_custompage" class="about-info">
                        <p><span class="pull-right"><span class="text-blue">15</span>位BOSS在线</span><span class="text-blue">138</span>个热招职位</p>
                     </a>
                  </div>
               </li>
               <li>
                  <div class="sub-li">
                     <a href="/gongsi/33fdd48dbd00b0601X1y2tW5.html" target="_blank" ka="index_rcmd_companylogo_31_custompage" class="company-info">
                        <img src="" data-src="https://img.bosszhipin.com/beijin/mcs/chatphoto/20190226/164b82edf7a017fe77d066ef64eee6f0f02b02c0d1653c5ce3d6e5a755b5bd58_s.jpg?x-oss-process=image/resize,w_100,limit_0" alt="">
                        <div class="conpany-text">
                           <h4>诺嘉国际</h4>

                           <p>B轮<span class="vline"></span>医疗健康</p>
                        </div>
                     </a>
                     <a href="/gongsir/33fdd48dbd00b0601X1y2tW5.html" target="_blank" ka="index_rcmd_company_31_custompage" class="about-info">
                        <p><span class="pull-right"><span class="text-blue">84</span>位BOSS在线</span><span class="text-blue">222</span>个热招职位</p>
                     </a>
                  </div>
               </li>
               <li>
                  <div class="sub-li">
                     <a href="/gongsi/7d821536a0675eef0nx83dy6.html" target="_blank" ka="index_rcmd_companylogo_32_custompage" class="company-info">
                        <img src="" data-src="https://img.bosszhipin.com/beijin/mcs/chatphoto/20180521/04f86d71ae8443684684b03c2efb3cd8cfcd208495d565ef66e7dff9f98764da.jpg?x-oss-process=image/resize,w_100,limit_0" alt="">
                        <div class="conpany-text">
                           <h4>掌众金服</h4>

                           <p>B轮<span class="vline"></span>互联网</p>
                        </div>
                     </a>
                     <a href="/gongsir/7d821536a0675eef0nx83dy6.html" target="_blank" ka="index_rcmd_company_32_custompage" class="about-info">
                        <p><span class="pull-right"><span class="text-blue">38</span>位BOSS在线</span><span class="text-blue">83</span>个热招职位</p>
                     </a>
                  </div>
               </li>
               <li>
                  <div class="sub-li">
                     <a href="/gongsi/4c36c76882b7ea9b1n192tu8.html" target="_blank" ka="index_rcmd_companylogo_33_custompage" class="company-info">
                        <img src="" data-src="https://img.bosszhipin.com/beijin/mcs/chatphoto/20180822/fb0b1f21d8c4d8a1cead6338b7948a6dcfcd208495d565ef66e7dff9f98764da.jpg?x-oss-process=image/resize,w_100,limit_0" alt="">
                        <div class="conpany-text">
                           <h4>银客集团</h4>

                           <p>C轮<span class="vline"></span>互联网金融</p>
                        </div>
                     </a>
                     <a href="/gongsir/4c36c76882b7ea9b1n192tu8.html" target="_blank" ka="index_rcmd_company_33_custompage" class="about-info">
                        <p><span class="pull-right"><span class="text-blue">10</span>位BOSS在线</span><span class="text-blue">16</span>个热招职位</p>
                     </a>
                  </div>
               </li>
               <li>
                  <div class="sub-li">
                     <a href="/gongsi/217e0ed147244f9b1nV-29g~.html" target="_blank" ka="index_rcmd_companylogo_34_custompage" class="company-info">
                        <img src="" data-src="https://img.bosszhipin.com/beijin/mcs/chatphoto/20190621/a52fa3774ff663340b23e38aef4317928f1014ca88a849675be6784d6dbc660a_s.jpg?x-oss-process=image/resize,w_100,limit_0" alt="">
                        <div class="conpany-text">
                           <h4>北京汇通天下</h4>

                           <p>D轮及以上<span class="vline"></span>互联网</p>
                        </div>
                     </a>
                     <a href="/gongsir/217e0ed147244f9b1nV-29g~.html" target="_blank" ka="index_rcmd_company_34_custompage" class="about-info">
                        <p><span class="pull-right"><span class="text-blue">35</span>位BOSS在线</span><span class="text-blue">122</span>个热招职位</p>
                     </a>
                  </div>
               </li>
               <li>
                  <div class="sub-li">
                     <a href="/gongsi/75ff51ba5127f26a1HJ42N0~.html" target="_blank" ka="index_rcmd_companylogo_35_custompage" class="company-info">
                        <img src="" data-src="https://img2.bosszhipin.com/mcs/chatphoto/20160323/5b8fddc6ef89fd65269890347ab14361de2545bb76ad6216a12aad2ff888c6f4.jpg?x-oss-process=image/resize,w_100,limit_0" alt="">
                        <div class="conpany-text">
                           <h4>中衍期货</h4>

                           <p>D轮及以上<span class="vline"></span>证券/期货</p>
                        </div>
                     </a>
                     <a href="/gongsir/75ff51ba5127f26a1HJ42N0~.html" target="_blank" ka="index_rcmd_company_35_custompage" class="about-info">
                        <p><span class="pull-right"><span class="text-blue">4</span>位BOSS在线</span><span class="text-blue">6</span>个热招职位</p>
                     </a>
                  </div>
               </li>
               <li>
                  <div class="sub-li">
                     <a href="/gongsi/1f94c7a713759c161XFy0w~~.html" target="_blank" ka="index_rcmd_companylogo_36_custompage" class="company-info">
                        <img src="" data-src="https://img.bosszhipin.com/beijin/logo/8c6c09b50b537db53f049f79a998fa33be1bd4a3bd2a63f070bdbdada9aad826.png?x-oss-process=image/resize,w_100,limit_0" alt="">
                        <div class="conpany-text">
                           <h4>蛋壳公寓</h4>

                           <p>C轮<span class="vline"></span>互联网</p>
                        </div>
                     </a>
                     <a href="/gongsir/1f94c7a713759c161XFy0w~~.html" target="_blank" ka="index_rcmd_company_36_custompage" class="about-info">
                        <p><span class="pull-right"><span class="text-blue">424</span>位BOSS在线</span><span class="text-blue">850</span>个热招职位</p>
                     </a>
                  </div>
               </li>
            </ul>
            <ul class="">
               <li>
                  <div class="sub-li">
                     <a href="/gongsi/3804617bb6a6689f1XJz2tW9.html" target="_blank" ka="index_rcmd_companylogo_37_custompage" class="company-info">
                        <img src="" data-src="https://img.bosszhipin.com/beijin/mcs/chatphoto/20170613/58e3fc5a67e713b1b6e527c16cd31f66ee7a989d6744ac3c107b2eafa0a2bdad.jpg?x-oss-process=image/resize,w_100,limit_0" alt="">
                        <div class="conpany-text">
                           <h4>顶呱呱</h4>

                           <p>C轮<span class="vline"></span>企业服务</p>
                        </div>
                     </a>
                     <a href="/gongsir/3804617bb6a6689f1XJz2tW9.html" target="_blank" ka="index_rcmd_company_37_custompage" class="about-info">
                        <p><span class="pull-right"><span class="text-blue">89</span>位BOSS在线</span><span class="text-blue">176</span>个热招职位</p>
                     </a>
                  </div>
               </li>
               <li>
                  <div class="sub-li">
                     <a href="/gongsi/1f7ad3863ebc681c03B62Ni-.html" target="_blank" ka="index_rcmd_companylogo_38_custompage" class="company-info">
                        <img src="" data-src="https://img.bosszhipin.com/beijin/mcs/chatphoto/20180105/69eab038c19ce97f90f97b183bb7403f95991de3a139196bee81e1c7160e44d7.jpg?x-oss-process=image/resize,w_100,limit_0" alt="">
                        <div class="conpany-text">
                           <h4>acg国际艺术教育</h4>

                           <p>已上市<span class="vline"></span>在线教育</p>
                        </div>
                     </a>
                     <a href="/gongsir/1f7ad3863ebc681c03B62Ni-.html" target="_blank" ka="index_rcmd_company_38_custompage" class="about-info">
                        <p><span class="pull-right"><span class="text-blue">6</span>位BOSS在线</span><span class="text-blue">17</span>个热招职位</p>
                     </a>
                  </div>
               </li>
               <li>
                  <div class="sub-li">
                     <a href="/gongsi/b699550894c5c52c1XJ70t20.html" target="_blank" ka="index_rcmd_companylogo_39_custompage" class="company-info">
                        <img src="" data-src="https://img.bosszhipin.com/beijin/mcs/chatphoto/20161026/31301e04998980bc94fcb86c07d50cdcad49d1194227dbfe9ef2ca4ee04ebbcd.jpg?x-oss-process=image/resize,w_100,limit_0" alt="">
                        <div class="conpany-text">
                           <h4>泰盈科技</h4>

                           <p>已上市<span class="vline"></span>通信/网络设备</p>
                        </div>
                     </a>
                     <a href="/gongsir/b699550894c5c52c1XJ70t20.html" target="_blank" ka="index_rcmd_company_39_custompage" class="about-info">
                        <p><span class="pull-right"><span class="text-blue">174</span>位BOSS在线</span><span class="text-blue">868</span>个热招职位</p>
                     </a>
                  </div>
               </li>
               <li>
                  <div class="sub-li">
                     <a href="/gongsi/46bef247c4c713fa1XB4298~.html" target="_blank" ka="index_rcmd_companylogo_40_custompage" class="company-info">
                        <img src="" data-src="https://img2.bosszhipin.com/mcs/chatphoto/20160319/12e3ecc704dbf864a4ecce2f7567243842fefbf14897dcff674ed403f9f1e055.jpg?x-oss-process=image/resize,w_100,limit_0" alt="">
                        <div class="conpany-text">
                           <h4>第一物业</h4>

                           <p>已上市<span class="vline"></span>物业服务</p>
                        </div>
                     </a>
                     <a href="/gongsir/46bef247c4c713fa1XB4298~.html" target="_blank" ka="index_rcmd_company_40_custompage" class="about-info">
                        <p><span class="pull-right"><span class="text-blue">106</span>位BOSS在线</span><span class="text-blue">329</span>个热招职位</p>
                     </a>
                  </div>
               </li>
               <li>
                  <div class="sub-li">
                     <a href="/gongsi/08958dfae7554d521HR43tQ~.html" target="_blank" ka="index_rcmd_companylogo_41_custompage" class="company-info">
                        <img src="" data-src="https://img2.bosszhipin.com/mcs/chatphoto/20160323/44c6fb44e9a0b680b25916ec9ab8b47041d338d2e123a3fd9ae1eccbd739a494.jpg?x-oss-process=image/resize,w_100,limit_0" alt="">
                        <div class="conpany-text">
                           <h4>鼎捷软件</h4>

                           <p>已上市<span class="vline"></span>计算机软件</p>
                        </div>
                     </a>
                     <a href="/gongsir/08958dfae7554d521HR43tQ~.html" target="_blank" ka="index_rcmd_company_41_custompage" class="about-info">
                        <p><span class="pull-right"><span class="text-blue">50</span>位BOSS在线</span><span class="text-blue">405</span>个热招职位</p>
                     </a>
                  </div>
               </li>
               <li>
                  <div class="sub-li">
                     <a href="/gongsi/e7137cfb41a8fc891X163ti9.html" target="_blank" ka="index_rcmd_companylogo_42_custompage" class="company-info">
                        <img src="" data-src="https://img.bosszhipin.com/beijin/mcs/chatphoto/20171127/734a9a22caadc544fde1e0acffd73da5cfcd208495d565ef66e7dff9f98764da.jpg?x-oss-process=image/resize,w_100,limit_0" alt="">
                        <div class="conpany-text">
                           <h4>东方园林</h4>

                           <p>已上市<span class="vline"></span>其他行业</p>
                        </div>
                     </a>
                     <a href="/gongsir/e7137cfb41a8fc891X163ti9.html" target="_blank" ka="index_rcmd_company_42_custompage" class="about-info">
                        <p><span class="pull-right"><span class="text-blue">4</span>位BOSS在线</span><span class="text-blue">11</span>个热招职位</p>
                     </a>
                  </div>
               </li>
               <li>
                  <div class="sub-li">
                     <a href="/gongsi/26741356c134005a1XN409S_.html" target="_blank" ka="index_rcmd_companylogo_43_custompage" class="company-info">
                        <img src="" data-src="https://img.bosszhipin.com/beijin/mcs/chatphoto/20160519/65af62e67fac9a95902c7424fd983417a913d92db28697eac97819731866a743.jpg?x-oss-process=image/resize,w_100,limit_0" alt="">
                        <div class="conpany-text">
                           <h4>大鹏教育</h4>

                           <p>未融资<span class="vline"></span>互联网</p>
                        </div>
                     </a>
                     <a href="/gongsir/26741356c134005a1XN409S_.html" target="_blank" ka="index_rcmd_company_43_custompage" class="about-info">
                        <p><span class="pull-right"><span class="text-blue">24</span>位BOSS在线</span><span class="text-blue">235</span>个热招职位</p>
                     </a>
                  </div>
               </li>
               <li>
                  <div class="sub-li">
                     <a href="/gongsi/6af7c5e84b345c661HV_2Nm6.html" target="_blank" ka="index_rcmd_companylogo_44_custompage" class="company-info">
                        <img src="" data-src="https://img.bosszhipin.com/beijin/logo/0bddb44a2c34af3289f813d3d210f93ebe1bd4a3bd2a63f070bdbdada9aad826.jpg?x-oss-process=image/resize,w_100,limit_0" alt="">
                        <div class="conpany-text">
                           <h4>腾展叮咚</h4>

                           <p>已上市<span class="vline"></span>移动互联网</p>
                        </div>
                     </a>
                     <a href="/gongsir/6af7c5e84b345c661HV_2Nm6.html" target="_blank" ka="index_rcmd_company_44_custompage" class="about-info">
                        <p><span class="pull-right"><span class="text-blue">28</span>位BOSS在线</span><span class="text-blue">153</span>个热招职位</p>
                     </a>
                  </div>
               </li>
               <li>
                  <div class="sub-li">
                     <a href="/gongsi/d7a7b06b36d7b2d91nd93No~.html" target="_blank" ka="index_rcmd_companylogo_45_custompage" class="company-info">
                        <img src="" data-src="https://img2.bosszhipin.com/mcs/chatphoto/20151217/69b0821ec002fed4d3dc8ae2664b36a6cd94a57e7b47814996f8b6e9368f2a6b.jpg?x-oss-process=image/resize,w_100,limit_0" alt="">
                        <div class="conpany-text">
                           <h4>中国网库</h4>

                           <p>已上市<span class="vline"></span>互联网</p>
                        </div>
                     </a>
                     <a href="/gongsir/d7a7b06b36d7b2d91nd93No~.html" target="_blank" ka="index_rcmd_company_45_custompage" class="about-info">
                        <p><span class="pull-right"><span class="text-blue">24</span>位BOSS在线</span><span class="text-blue">47</span>个热招职位</p>
                     </a>
                  </div>
               </li>
               <li>
                  <div class="sub-li">
                     <a href="/gongsi/5655835880426ec51nN62t-0.html" target="_blank" ka="index_rcmd_companylogo_46_custompage" class="company-info">
                        <img src="" data-src="https://img.bosszhipin.com/beijin/mcs/bar/20190103/5324a3b1d81a4567248e501ffba13f97be1bd4a3bd2a63f070bdbdada9aad826.jpg?x-oss-process=image/resize,w_100,limit_0" alt="">
                        <div class="conpany-text">
                           <h4>同程艺龙</h4>

                           <p>已上市<span class="vline"></span>互联网</p>
                        </div>
                     </a>
                     <a href="/gongsir/5655835880426ec51nN62t-0.html" target="_blank" ka="index_rcmd_company_46_custompage" class="about-info">
                        <p><span class="pull-right"><span class="text-blue">150</span>位BOSS在线</span><span class="text-blue">708</span>个热招职位</p>
                     </a>
                  </div>
               </li>
               <li>
                  <div class="sub-li">
                     <a href="/gongsi/c8030fe4d962e1991XVz2d-6.html" target="_blank" ka="index_rcmd_companylogo_47_custompage" class="company-info">
                        <img src="" data-src="https://img.bosszhipin.com/beijin/mcs/chatphoto/20180713/ba004e43909fab1adcac62315b6f432ecfcd208495d565ef66e7dff9f98764da.jpg?x-oss-process=image/resize,w_100,limit_0" alt="">
                        <div class="conpany-text">
                           <h4>金蝶</h4>

                           <p>已上市<span class="vline"></span>移动互联网</p>
                        </div>
                     </a>
                     <a href="/gongsir/c8030fe4d962e1991XVz2d-6.html" target="_blank" ka="index_rcmd_company_47_custompage" class="about-info">
                        <p><span class="pull-right"><span class="text-blue">12</span>位BOSS在线</span><span class="text-blue">32</span>个热招职位</p>
                     </a>
                  </div>
               </li>
               <li>
                  <div class="sub-li">
                     <a href="/gongsi/2fe8cb0526887eb71XVz2dW0.html" target="_blank" ka="index_rcmd_companylogo_48_custompage" class="company-info">
                        <img src="" data-src="https://img.bosszhipin.com/beijin/mcs/chatphoto/20160509/3509c77cf378fc2af88847e2732be2adc473ac228e16ffaa4e47d3573563c982.jpg?x-oss-process=image/resize,w_100,limit_0" alt="">
                        <div class="conpany-text">
                           <h4>世纪文都教育</h4>

                           <p>B轮<span class="vline"></span>在线教育</p>
                        </div>
                     </a>
                     <a href="/gongsir/2fe8cb0526887eb71XVz2dW0.html" target="_blank" ka="index_rcmd_company_48_custompage" class="about-info">
                        <p><span class="pull-right"><span class="text-blue">13</span>位BOSS在线</span><span class="text-blue">70</span>个热招职位</p>
                     </a>
                  </div>
               </li>
            </ul>
            <p class="common-tab-more"><a class="btn btn-outline" href="${pageContext.request.contextPath}/company/companyList" ka="open_brand">查看更多</a>
            </p>
         </div>
            </div>
         <!--job-post-area-end -->
         <!--apps-download-area-start -->
       <!--apps-download-area-end -->
         <!--job-browse-area-start -->
         <div class="job-browse-area pt-100 pb-100 clearfix" style="background-image:url(assets/images/bg-2.jpg)">
            <div class="container">
               <div class="row">
                  <div class="col-md-12">
                     <div class="details-text text-center" data-aos="flip-up">
                        <div class="title pb-3">
                           <div class="heading-two mb-2">
                              <h2>Browse Our <span>6,000+ </span>Latest Jobs</h2>
                           </div>
                           <p>Get your best job in here</p>
                        </div>
                        <div class="btn-trasparent-white buttonfx curtainup"><a href="#">Get started now</a></div>
                     </div>
                  </div>
               </div>
            </div>
         </div>
         <!--job-browse-area-end -->
         <!--job-categories-area-start -->
       <!--job-categories-area-end -->
         <!--testimonial-area-start -->
         <div class="testimonial-area pt-100 pb-100 clearfix" id="tastimonial">
            <div class="container">
               <div class="row">
                  <div class="col-md-12">
                     <div class="section-title text-left">
                        <span>Cover story</span>
                        <h2>Success Stories</h2>
                        <div class="line"></div>
                     </div>
                  </div>
               </div>
               <div class="row">
                  <div class="col-md-12">
                     <div class="testimonial-slider owl-carousel">
                        <div class="testi-stories  text-left">
                           <blockquote class="testimonial">
                              <p>Porttitor lacus luctus accumsan tortor posuere ac ut consequat semper viverra nam libero justo laoreet sit amet cursus sit amet dictum sit amet justo donec enim diam vulputate ut pharetra</p>
                           </blockquote>
                           <div class="arrow-down"></div>
                           <p class="testimonial-author"><img src="/assets/images/testimonial-2.png" alt="image" /> Neil Roberts | <span>Designer</span></p>
                        </div>
                        <div class="testi-stories  text-left">
                           <blockquote class="testimonial">
                              <p>Mollis nunc sed id semper risus in hendrerit gravida rutrum quisque non tellus orci ac auctor augue mauris augue neque gravida in fermentum et sollicitudin ac orci phasellus egestas tellu</p>
                           </blockquote>
                           <div class="arrow-down"></div>
                           <p class="testimonial-author"><img src="/assets/images/testimonial-1.png" alt="image" /> Jhon Doe | <span>Photgrapher</span></p>
                        </div>
                     </div>
                  </div>
               </div>
            </div>
         </div>
         <!--testimonial-area-end -->
		 		 <!--team-area-start -->
         <div class="team-area pt-100 pb-100 clearfix bg-color2">
            <div class="container">
               <div class="team-wrapper text-center">
				   <div class="row">
					  <div class="col-md-12">
						 <div class="section-title text-left">
							<span>Our top three freelancer</span>
							<h2>Top Freelancer</h2>
							<div class="line"></div>
						 </div>
					  </div>
				   </div>
                  <div class="row">
                     <div class="col-md-4">
                        <div class="team-reviewer" data-aos="fade-up">
                           <div class="image">
                              <a href="#"><img src="/assets/images/team-img.jpg" alt="image" /></a>
							   <ul class="team-social list-inline">
								  <li class="facebook"><a href="#"><i class="fa fa-facebook-f"></i></a></li>
								  <li class="twitter"><a href="#"><i class="fa fa-twitter"></i></a></li>
								  <li class="linkedin"><a href="#"><i class="fa fa-linkedin"></i></a></li>
							   </ul>
							  
                           </div>
                           <div class="content">
                              <h4><a href="#">Paul Molive</a></h4>
							  <p>Web Developer </p>
							  <ul class="team-star list-inline">
								<li class="list-inline-item">
									<i class="fa fa-star" aria-hidden="true"></i>
								</li><li class="list-inline-item">
									
									<i class="fa fa-star-o" aria-hidden="true"></i>
								</li><li class="list-inline-item">
									<i class="fa fa-star-o" aria-hidden="true"></i>
								</li><li class="list-inline-item">
									<i class="fa fa-star-o" aria-hidden="true"></i>
								</li>
								<li class="list-inline-item">
									<i class="fa fa-star-o" aria-hidden="true"></i>
								</li>
							  </ul>
                           </div>
                           
                        </div>
                     </div>  <div class="col-md-4">
                        <div class="team-reviewer" data-aos="fade-up">
                           <div class="image">
                              <a href="#"><img src="/assets/images/team-img2.jpg" alt="image" /></a>
							   <ul class="team-social list-inline">
								  <li class="facebook"><a href="#"><i class="fa fa-facebook-f"></i></a></li>
								  <li class="twitter"><a href="#"><i class="fa fa-twitter"></i></a></li>
								  <li class="linkedin"><a href="#"><i class="fa fa-linkedin"></i></a></li>
							   </ul>
							  
                           </div>
                           <div class="content">
                              <h4><a href="#">Paige Turner</a></h4>
							  <p>Php Developer </p>
							  <ul class="team-star list-inline">
								<li class="list-inline-item">
									<i class="fa fa-star" aria-hidden="true"></i>
								</li><li class="list-inline-item">
									<i class="fa fa-star" aria-hidden="true"></i>
								</li><li class="list-inline-item">
									<i class="fa fa-star" aria-hidden="true"></i>
								</li><li class="list-inline-item">
									<i class="fa fa-star-o" aria-hidden="true"></i>
								</li>
								<li class="list-inline-item">
									<i class="fa fa-star-o" aria-hidden="true"></i>
								</li>
							  </ul>
                           </div>
                           
                        </div>
                     </div>  <div class="col-md-4">
                        <div class="team-reviewer" data-aos="fade-up">
                           <div class="image">
                              <a href="#"><img src="/assets/images/team-img3.jpg" alt="image" /></a>
							   <ul class="team-social list-inline">
								  <li class="facebook"><a href="#"><i class="fa fa-facebook-f"></i></a></li>
								  <li class="twitter"><a href="#"><i class="fa fa-twitter"></i></a></li>
								  <li class="linkedin"><a href="#"><i class="fa fa-linkedin"></i></a></li>
							   </ul>
							  
                           </div>
                           <div class="content">
                              <h4><a href="#">Bob Frapples</a></h4>
							  <p>Java Developer </p>
							 <ul class="team-star list-inline">
								<li class="list-inline-item">
									<i class="fa fa-star" aria-hidden="true"></i>
								</li><li class="list-inline-item">
									<i class="fa fa-star" aria-hidden="true"></i>
								</li><li class="list-inline-item">
									<i class="fa fa-star" aria-hidden="true"></i>
								</li><li class="list-inline-item">
									<i class="fa fa-star" aria-hidden="true"></i>
								</li>
								<li class="list-inline-item">
									<i class="fa fa-star-o" aria-hidden="true"></i>
								</li>
							  </ul>
                           </div>
                           
                        </div>
                     </div> 
                  </div>
               </div>
            </div>
         </div>
         <!--team-area-end -->
         <!--video-area-start -->
         <!--blog-area-start -->
         <div class="blog-area bg-color2 pt-100 pb-100 clearfix">
            <div class="container">
               <div class="row">
                  <div class="col-md-12">
                     <div class="section-title text-left">
                        <span>Get the latest news</span>
                        <h2>Latest Blog</h2>
                        <div class="line"></div>
                     </div>
                  </div>
               </div>
               <div class="blog-wrapper">
                  <div class="row">
                     <div class="col-md-4">
                        <div class="blog-block" data-aos="fade-in">
                           <div class="blog-img">
                              <div class="image-div">
                                 <img src="/assets/images/blog-img-1.png" alt="image" />
                                 <div class="blog-overlay">
                                    <p><a href="blog-details.html"><i class="fa fa-link" aria-hidden="true"></i></a></p>
                                 </div>
                              </div>
                           </div>
                           <div class="blog-content">
                              <div class="blog-title">
                                 <h3><a href="blog-details.html">Get your dream job in Envato </a></h3>
                              </div>
                              <ul class="blog-meta mb-3 list-inline">
                                 <li class="list-inline-item">By <a href="#">Malina</a></li>
                                 <li class="list-inline-item"> Feb 21, 2018</li>
                              </ul>
                              <div class="content">
                                 <p>Vitae tempus quam pellentesque nec nam aliquam sem et tortor consequat id porta nibh venenatis cras sed felis eget   </p>
                              </div>
                           </div>
                        </div>
                     </div>
                     <div class="col-md-4">
                        <div class="blog-block" data-aos="fade-in">
                           <div class="blog-img">
                              <div class="image-div">
                                 <img src="/assets/images/blog-img-2.png" alt="image" />
                                 <div class="blog-overlay">
                                    <p><a href="blog-details.html"><i class="fa fa-link" aria-hidden="true"></i></a></p>
                                 </div>
                              </div>
                           </div>
                           <div class="blog-content">
                              <div class="blog-title">
                                 <h3><a href="blog-details.html">CEO needed for the reputated company </a></h3>
                              </div>
                              <ul class="blog-meta mb-3 list-inline">
                                 <li class="list-inline-item">By <a href="#">Malina</a></li>
                                 <li class="list-inline-item"> Feb 21, 2018</li>
                              </ul>
                              <div class="content">
                                 <p>Faucibus pulvinar elementum integer enim neque volutpat ac tincidunt vitae semper quis lectus nulla at volutpat diam  </p>
                              </div>
                           </div>
                        </div>
                     </div>
                     <div class="col-md-4">
                        <div class="blog-block" data-aos="fade-in">
                           <div class="blog-img">
                              <div class="image-div">
                                 <img src="/assets/images/blog-img-3.png" alt="image" />
                                 <div class="blog-overlay">
                                    <p><a href="blog-details.html"><i class="fa fa-link" aria-hidden="true"></i></a></p>
                                 </div>
                              </div>
                           </div>
                           <div class="blog-content">
                              <div class="blog-title">
                                 <h3><a href="blog-details.html">Secret tips to be success in your business </a></h3>
                              </div>
                              <ul class="blog-meta mb-3 list-inline">
                                 <li class="list-inline-item">By <a href="#">Malina</a></li>
                                 <li class="list-inline-item"> Feb 21, 2018</li>
                              </ul>
                              <div class="content">
                                 <p>Lorem ipsum dolor sit amet, imperdiet elit nisl etiam ducimus, molestie etiam tempus, tincidunt egetid enim hendrerit interdum </p>
                              </div>
                           </div>
                        </div>
                     </div>
                  </div>
               </div>
            </div>
         </div>
         <!--blog-area-end -->
         <!--client-area-start -->
         <div class="client-area pt-100 pb-100 clearfix">
            <div class="container">
               <div class="row">
                  <div class="col-lg-8">
                     <div class="client-logo">
                        <a href="#"><img src="/assets/images/company-logo.png" alt="image" /></a>
                     </div>
                  </div>
                  <div class="col-lg-4 d-flex align-items-center justify-content-center">
                     <div class="client-content">
                          <h5> See Why Over </h5>
						  <h3 class="client-big">10,00258+</h3>
                          <p>Companies have already used Trabajo </p>
						  <a href="#tastimonial" class="client-btn">Trabajo Reviews </a>
                     </div>
                  </div>
               </div>
            </div>
         </div>
         <!--client-area-end -->
      </main>
      <!--footer-area-start -->
      <footer>
         <div class="footer-area minus-30 pt-100 pb-100 clearfix">
            <div class="container">
               <div class="row">
                  <div class="col-lg-3 col-md-3 col-sm-6">
                     <div class="footer-widget">
                        <div class="widget-title">
                           <a href="index.jsp"><img src="/assets/images/footer-logo.png" alt="image" /></a>
                        </div>
                        <p>Cras semper auctor neque vitae tempus quam pellentesque nec nam aliquam sem et tortor consequat id porta nibh venenatis cras sed felis eget  </p>
                        <div class="social-link mt-4">
                           <ul>
                              <li class="facebook"><a href="#"><i class="fa fa-facebook-f"></i></a></li>
                              <li class="twitter"><a href="#"><i class="fa fa-twitter"></i></a></li>
                              
                              <li class="linkedin"><a href="#"><i class="fa fa-linkedin" ></i></a></li>
                           </ul>
                        </div>
                     </div>
                  </div>
                  <div class="col-lg-3 col-md-3 col-sm-6">
                     <div class="footer-widget">
                        <div class="widget-title">
                           <h3>Candidates</h3>
                        </div>
                        <div class="widget-link">
                           <ul>
                              <li><a href="#"><i class="fa fa-angle-right" aria-hidden="true"></i>Browse Jobs</a></li>
                              <li><a href="#"><i class="fa fa-angle-right" aria-hidden="true"></i>Submit Resume</a></li>
                              <li><a href="#"><i class="fa fa-angle-right" aria-hidden="true"></i>My Bookmarks</a></li>
                              <li><a href="#"><i class="fa fa-angle-right" aria-hidden="true"></i>Job Alerts</a></li>
                           </ul>
                        </div>
                     </div>
                  </div>
                  <div class="col-lg-3 col-md-3 col-sm-6">
                     <div class="footer-widget">
                        <div class="widget-title">
                           <h3>Employers</h3>
                        </div>
                        <div class="widget-link">
                           <ul>
                              <li><a href="#"><i class="fa fa-angle-right" aria-hidden="true"></i>Employers</a></li>
                              <li><a href="#"><i class="fa fa-angle-right" aria-hidden="true"></i>Add Job</a></li>
                              <li><a href="#"><i class="fa fa-angle-right" aria-hidden="true"></i>Jobs Listing</a></li>
                              <li><a href="#"><i class="fa fa-angle-right" aria-hidden="true"></i>Employers Grid</a></li>
                              <li><a href="#"><i class="fa fa-angle-right" aria-hidden="true"></i>Employer Listing</a></li>
                           </ul>
                        </div>
                     </div>
                  </div>
                  <div class="col-lg-3 col-md-3 col-sm-6">
                     <div class="footer-widget">
                        <div class="widget-title">
                           <h3>Subscribe Us</h3>
                        </div>
                        <div class="widget-text">
                           <form action="#">
                              <input type="email" placeholder="Your Email" />
                              <button type="submit" class="buttonfx curtainup">Subscribe</button>
                           </form>
                           <p>Nceptos, nulla dictumst neque nam aliquam</p>
                        </div>
                     </div>
                  </div>
               </div>
            </div>
         </div>
         <div class="footer-bottom-area clearfix">
            <div class="container">
               <div class="row">
                  <div class="col-md-12">
                     <div class="footer-bottom text-center">
                        <p>&copy; copyright - 2019 trabajo - Designed By <a href="http://www.17sucai.com/">Themeix</a></p>
                     </div>
                  </div>
               </div>
            </div>
         </div>
      </footer>
      <!--footer-area-end -->
      <!-- ==================== START PRELOADER HERE ===================================== -->
      <div class="preloader" id="preloader">
         <div class="lds-ripple">
            <div></div>
            <div></div>
         </div>
      </div>
      <!-- ==================== END PRELOADER HERE ===================================== -->		
      <!-- ====================ALL JS FILE HERE===================================== -->
      <!-- jQuery -->
	  <script src="/assets/js/modules/jquery-3.4.1.min.js"></script>
	  <script src="/assets/js/modules/bootstrap.min.js"></script>
	  <script src="/assets/js/modules/proper.js"></script>
	  <script src="/assets/js/modules/jquery.waypoints.min.js"></script>
	  <script src="/assets/js/modules/owl.carousel.min.js"></script>
	  <script src="/assets/js/modules/magnific.min.js"></script>
	  <script src="/assets/js/modules/typing.min.js"></script>
	  <script src="/assets/js/modules/select2.min.js"></script>
	  <script src="/assets/js/modules/aos.min.js"></script>
	  <script src="/assets/js/modules/slimmenu.min.js"></script>
	  <!-- vendor 
      <script src="assets/js/vendor.min.js"></script>
	   -->
      <script src="/assets/js/app.js"></script>
      <script>
	    /*  Type js  */
		if((".typed").length > 0) {
			var options = {
				stringsElement: '.typed-strings',
				typeSpeed: 100,
				backDelay: 700,
				loop:!0,
				startDelay:500,
				cursorChar: '|',
			}
			var typed = new Typed(".typed", options);
		} 
	  </script>	  
	  
   </body>

</html>
