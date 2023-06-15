<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>login</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/client/css/index.css" type="text/css" />
<link rel="stylesheet" href="${pageContext.request.contextPath }/client/css/bootstrap.min.css" type="text/css" />
<script type="text/javascript" src="${pageContext.request.contextPath}/client/js/index.js"></script>

</head>
<body>
<h1 style="text-align:center;color:tomato;font-family:华文行楷;font-size:50px;"> 欢迎来到美妆商城</h1>
<p style="text-align:center;color:tomato;font-family:华文行楷;font-size:20px;">Welcome to the beautymall</p>
<div class="loginForm">
	<div class="divcontent">
		<h1>登录</h1>
		<form action="${pageContext.request.contextPath}/LoginServlet" method="post">
		<label>用&nbsp;户&nbsp;名：</label><input name="username" type="text" class="textinput" /><br><br>
		<label>密&nbsp;&nbsp;&nbsp;&nbsp;码：</label><input name="password" type="password" class="textinput" /><br><br>
		<input type="checkbox" name="checkbox" value="checkbox01" />记住用户名&nbsp;&nbsp;<input type="checkbox" name="checkbox" value="checkbox02" /> 自动登录<br><br>
		<input type="submit" id="login-button" onclick="formcheck()" class="btn btn-warning" value="登录" />&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;
		<a href="${pageContext.request.contextPath }/client/register.jsp" style="color: white;"><input type="button" class="btn btn-warning" value="注册"/></a><br>
		<font color="#ff0000">${requestScope["register_message"]}</font>
		</form>
	</div>
        
</div>
</body>
</html>