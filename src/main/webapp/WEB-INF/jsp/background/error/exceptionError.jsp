<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>  
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">  
<html>  
<head>  
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">  
<meta http-equiv="X-UA-Compatible" content="IE=8" />  
<title>出错啦</title>  
<script type="text/javascript">  
function refresh()  
{  
if(self.frameElement.tagName=="IFRAME"){  
// 页面在iframe中时处理  
parent.showErrorMsg('<h2 align="center" style="font-size: 18px; color: red; "> 程序异常，请联系管理员 <br></h2>');  
}  
   
}  
refresh();  
</script>  
</head>  
<body>  
<input type="hidden" id="errorMsg" value="程序异常，请联系管理员">  
<div id="errorMsgDiv">  
<h2 align="center" style="font-size: 18px; color: red; ">  
程序异常，请联系管理员<br><br>  
错误码：<br><br>  
</h2>  
<h1 align="center" style="font-size: 60px; color: red;">  
<%=request.getAttribute("javax.servlet.error.status_code")%> <br>  
</h1>  
<br>  
<br>  
<h2 align="center" style="font-size: 18px; color: gray; ">  
信息： <%=request.getAttribute("javax.servlet.error.message")%> <br><br>  
异常： <%=request.getAttribute("javax.servlet.error.exception_type")%> <br><br>  
</h2>  
</div>  
</body>  
</html>  
