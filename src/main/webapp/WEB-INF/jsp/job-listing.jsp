﻿<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>招聘职位</title>
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
      <!--header-start -->
      <div id="header">
          <div class="inner home-inner">
              <div class="logo"> <a href="" ka="header-home-logo" title="BOSS直聘"><p style="font-size: 20px;color: #00c2b3">猿猿招聘网</p></a>
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

      <!--header-end -->
    <div class="header-banner clearfix" style="background-image:url(/assets/images/header-bg.jpg)">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="banner-text text-center">
                        <h1>Showing all jobs</h1>
                        <ul class="breadcumb list-inline">
							<li class="list-inline-item"><a href="index.jsp">Home</a></li>
							<li class="list-inline-item">Job Listing</li>
						</ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <main class="main-content-area pt-100 pb-100 job-bar-static" style="background:#f6f6f8;">
        <div class="job-list-area ">
		    
            <div class="container">
			    <div class="row">
			    	<div class="col-md-12">
                 <div class="job-search-bar">
                        <div class="search-bar text-center">
                           <form action="#" class="">
                              <div class="form-row">
                                 <div class="col-md-3">
                                    <input type="search" placeholder="职位名称关键字" name="positionName" value="${positionName}"/>
                                 </div>
                                 <div class="col-md-3">
                                    <select class="custom-multi-select" name="position" value="${position}">
                                        <option value="">全部</option>
                                       <option value="杭州">杭州</option>
                                       <option value="北京">北京</option>
                                       <option value="上海">上海</option>
                                       <option value="深圳">深圳</option>
                                       <option value="南京">南京</option>
                                       <option value="广州">广州</option>
                                    </select>
                                 </div>
                                 <div class="col-md-3">
                                    <select class="custom-multi-select" name="state">
                                       <option value="AL">Alabama</option>
                                       <option value="AL">Alabama</option>
                                       <option value="AL">Alabama</option>
                                       <option value="AL">Alabama</option>
                                       <option value="AL">Alabama</option>
                                       <option value="WY">Wyoming</option>
                                    </select>
                                 </div>
                                 <div class="col-md-3">
                                    <button type="submit" class="buttonfx curtainup">搜索工作</button>
                                 </div>
                              </div>
                           </form>
                        </div>
                     </div>
					</div>
			    </div>
                <div class="job-list" style="box-sizing:content-box;">
                    <ul>
                        <c:forEach items="${positionList}" var="job">
                        <li>
                            <div class="job-primary">
                                <div class="info-primary">
                                    <h3 class="name">
                                        <a href="${pageContext.request.contextPath}/job/positionDetail?positionId=${job.positionId}" data-jid="5bee32559ec955620n182NS7EFc~" data-itemid="1" data-lid="9TKDa0JQ1Bm.search.1" data-jobid="59639605" data-index="0" ka="search_list_1" target="_blank">
                                            <div class="job-title">${job.positionName}</div>
                                            <span class="red">${job.positionPrice}</span>

                                            <div class="info-detail" style="top: 0px;"></div>
                                        </a>
                                    </h3>

                                    <p>${job.positionAddr} <em class="vline"></em>${job.positionRequest}<em class="vline"></em>本科</p>
                                </div>
                                <div class="info-company">
                                    <div class="company-text">
                                        <h3 class="name"><a href="" ka="search_list_company_1_custompage" target="_blank">${job.companyName}</a></h3>

                                        <p>${job.finance}<em class="vline"></em>${job.companyType}<em class="vline"></em>${job.companyPerson}</p>
                                    </div>
                                </div>
                                <div class="info-publis">
                                    <h3 class="name"><img src="${job.releasePhoto}">${job.releaseName}<em class="vline"></em>${job.releasePosition}</h3>

                                    <p>发布于${job.releaseDate}</p>
                                </div>

                            </div>
                        </li>
                        </c:forEach>
                        <%--<li>--%>
                            <%--<div class="job-primary">--%>
                                <%--<div class="info-primary">--%>
                                    <%--<h3 class="name">--%>
                                        <%--<a href="/job_detail/83c7395e57f0bfbd0nN53921FFc~.html" data-jid="83c7395e57f0bfbd0nN53921FFc~" data-itemid="2" data-lid="9TKDa0JQ1Bm.search.2" data-jobid="57340845" data-index="1" ka="search_list_2" target="_blank">--%>
                                            <%--<div class="job-title">前端工程师</div>--%>
                                            <%--<span class="red">10-15K·13薪</span>--%>

                                            <%--<div class="info-detail" style="top: 0px;"></div>--%>
                                        <%--</a>--%>
                                    <%--</h3>--%>

                                    <%--<p>杭州 余杭区 仓前<em class="vline"></em>1-3年<em class="vline"></em>本科</p>--%>
                                <%--</div>--%>
                                <%--<div class="info-company">--%>
                                    <%--<div class="company-text">--%>
                                        <%--<h3 class="name"><a href="/gongsi/832983f8b4bb26d803Z63N-5Fw~~.html" ka="search_list_company_2_custompage" target="_blank">数式科技</a></h3>--%>

                                        <%--<p>互联网<em class="vline"></em>天使轮<em class="vline"></em>20-99人</p>--%>
                                    <%--</div>--%>
                                <%--</div>--%>
                                <%--<div class="info-publis">--%>
                                    <%--<h3 class="name"><img src="https://img.bosszhipin.com/beijin/mcs/useravatar/20190315/e22583e32c5bf37fd6edfd3295506823057979453f89e2ea960c2b2af75c1e90_s.png?x-oss-process=image/resize,w_40,limit_0">范女士<em class="vline"></em>HR</h3>--%>

                                    <%--<p>发布于10月12日</p>--%>
                                <%--</div>--%>

                            <%--</div>--%>
                        <%--</li>--%>
                        <%--<li>--%>
                            <%--<div class="job-primary">--%>
                                <%--<div class="info-primary">--%>
                                    <%--<h3 class="name">--%>
                                        <%--<a href="/job_detail/0ce8828afc4f50e40n1_3t68F1c~.html" data-jid="0ce8828afc4f50e40n1_3t68F1c~" data-itemid="3" data-lid="9TKDa0JQ1Bm.search.3" data-jobid="59553175" data-index="2" ka="search_list_3" target="_blank">--%>
                                            <%--<div class="job-title">前端开发工程师</div>--%>
                                            <%--<span class="red">11-22K·15薪</span>--%>

                                            <%--<div class="info-detail" style="top: 0px;"></div>--%>
                                        <%--</a>--%>
                                    <%--</h3>--%>

                                    <%--<p>杭州 余杭区 仓前<em class="vline"></em>1-3年<em class="vline"></em>本科</p>--%>
                                <%--</div>--%>
                                <%--<div class="info-company">--%>
                                    <%--<div class="company-text">--%>
                                        <%--<h3 class="name"><a href="/gongsi/1f1899216bf70b801HV53tu1FA~~.html" ka="search_list_company_3_custompage" target="_blank">百应科技</a></h3>--%>

                                        <%--<p>互联网<em class="vline"></em>A轮<em class="vline"></em>100-499人</p>--%>
                                    <%--</div>--%>
                                <%--</div>--%>
                                <%--<div class="info-publis">--%>
                                    <%--<h3 class="name"><img src="https://img.bosszhipin.com/boss/avatar/avatar_10.png?x-oss-process=image/resize,w_40,limit_0">方女士<em class="vline"></em>HR</h3>--%>

                                    <%--<p>发布于10月17日</p>--%>
                                <%--</div>--%>

                            <%--</div>--%>
                        <%--</li>--%>
                    </ul>
                </div>
                <div class="row" style="padding-bottom: 30px;text-align: center;">
                    <div class="col-md-12 mx-auto d-block">
                        <%--<div class="pagi-text clearfix">--%>
                            <%--<ul class="pagination clearfix">--%>
                                <%--<li class="page-item"><a class="page-link" href="#">Previous</a></li>--%>
                                <%--<li class="page-item"><a class="page-link" href="#">1</a></li>--%>
                                <%--<li class="page-item"><a class="page-link" href="#">2</a></li>--%>
                                <%--<li class="page-item"><a class="page-link" href="#">3</a></li>--%>
                                <%--<li class="page-item"><a class="page-link" href="#"><i class="fa fa-angle-double-right" aria-hidden="true"></i></a></li>--%>
                            <%--</ul>--%>
                        <%--</div>--%>
                            <tr>
                                <td>
                                    <c:if test="${currentPage==1 && currentPage!=util.totalPage}">
                                        第${util.currentPage}/${util.totalPage}页
                                        <a class="page" href="${pageContext.request.contextPath}/job/jobList?currentPage=${currentPage+1} " >下一页</a>
                                        <a class="page" href="${pageContext.request.contextPath}/job/jobList?currentPage=${util.totalPage}" >尾页</a>
                                    </c:if>
                                </td>
                                <td>
                                    <c:if test="${currentPage>1 && currentPage<util.totalPage}">
                                        第${util.currentPage}/${util.totalPage}页
                                        <a class="page" href="${pageContext.request.contextPath}/job/jobList?currentPage=1">首页</a>
                                        <a class="page" href="${pageContext.request.contextPath}/job/jobList?currentPage=${currentPage-1}">上一页</a>
                                        <a class="page" href="${pageContext.request.contextPath}/job/jobList?currentPage=${currentPage+1}">下一页</a>
                                        <a class="page" href="${pageContext.request.contextPath}/job/jobList?currentPage=${util.totalPage}">尾页</a>
                                    </c:if>
                                </td>
                                <td>
                                    <c:if test="${currentPage==util.totalPage && currentPage!=1}">
                                        <c:if test="${currentPage!=null}">
                                            第${util.currentPage}/${util.totalPage}页
                                            <a class="page" href="${pageContext.request.contextPath}/job/jobList?currentPage=1">首页</a>
                                            <a class="page" href="${pageContext.request.contextPath}/job/jobList?currentPage=${currentPage-1}">上一页</a>
                                        </c:if>
                                    </c:if>
                                </td>
                            </tr>

                    </div>
                </div>
            </div>
        </div>
    </main>
    <!--footer-area-start -->
      <footer>
         <div class="footer-area pt-100 pb-100 clearfix minus-30">
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
                        <p>&copy; Copyright - 2019 trabajo - Designed By <a href="http://www.17sucai.com/">Themeix</a></p>
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
   </body>
<style type="text/css">
    .job-list *, ::after, ::before {
         box-sizing: initial;
    }
</style>
</html>
