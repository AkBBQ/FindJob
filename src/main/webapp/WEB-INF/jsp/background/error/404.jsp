<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>页面出错了，你访问的页面不存在！！！！</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/statics/css/pintuer.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/statics/css/admin.css">
    <script src="${pageContext.request.contextPath}/statics/js/jquery.js"></script>   
  </head>
  
  <body style="background :url(statics/images/404.jpg);text-align:center">
        <div style="margin: 0 auto;margin-top:200px"> 
                        <span style="color:red; font-size:25px">抱歉，您访问的页面已经迷失了！</span><br/>
                        
                        <a class="button button-little bg-red" href="${pageContext.request.contextPath }/user/doLogout.php"><span class="icon-home">返回登录页</span></a>
                        
        </div>        
  </body>
</html>