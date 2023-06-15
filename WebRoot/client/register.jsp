<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>register</title>
<%--导入css和js --%>
<link rel="stylesheet" href="${pageContext.request.contextPath }/client/css/bootstrap.min.css" type="text/css" />
<script type="text/javascript" src="${pageContext.request.contextPath}/client/js/form.js"></script>
<style type="text/css">
body {
            margin: 0;
            padding: 0;
            background:url(image/background.jpg) no-repeat;
            background-size:cover;
        }
        .registerForm{
              margin:50px auto;
              width:60%;
        }
        #divcontent{
               border:5px solid black;
			   border-color:gray;
			   border-style:groove;
			   margin:20px auto;
			   width:650px;
			   height:550px;
			   border-top-left-radius: 50px;
               border-top-right-radius: 50px;
               border-bottom-left-radius: 50px;
               border-bottom-right-radius: 50px;
			   background-color:oldlace;
			   opacity: 0.6;
			   padding:10px 0 0 35px;
			   
        }
        #divcontent h1{
		    font-size:35px;
		    margin:30px auto;
			font-family:"华文楷体";
		    color:tomato;
		    
		  }
		  #divcontent label{
		    font-family:"楷体";
		    color:tomato;
		    font-size:20px;
		  }
		  #divcontent .btn{
		  
		  font-size:18px;
		  }
</style>
</head>
<body>
<div class="registerForm">
<div id="divcontent">
		<form action="${pageContext.request.contextPath}/RegisterServlet" method="post" onsubmit="checkForm();">
		                <h1>新用户注册</h1>
						<label>用&nbsp;户&nbsp;名：</label><input type="text" class="textinput"  id="username" name="username" onkeyup="checkUsername();"/>
								&nbsp;&nbsp;<span id="usernameMsg"></span><font color="#999999">字母数字下划线1到10位, 不能是数字开头</font><br><br>
				        <label>密&nbsp;&nbsp;&nbsp;&nbsp;码：</label><input type="password" class="textinput"  id="password" name="password" onkeyup="checkPassword();"/>
								&nbsp;&nbsp;<span id="passwordMsg"></span><font color="#999999">密码请设置6-16位字符</font><br><br>
						<label>重复密码：</label><input type="password" class="textinput"  id="repassword" name="repassword" onkeyup="checkConfirm();"/>
								&nbsp;&nbsp;<span id="confirmMsg"></span><br><br>
						<label>性&nbsp;&nbsp;&nbsp;&nbsp;别：</label>&nbsp;&nbsp;
                                <input type="radio" name="gender" value="男" checked="checked" /> 男
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									<input type="radio" name="gender" value="女" /> 女<br><br>
						<label>联系电话：</label><input type="text" class="textinput" style="width: 350px" name="telephone" /><br><br>
						<label>个人介绍：</label><textarea class="textarea" name="introduce"></textarea><br><br>
									<div style="text-align:center;"><input type="submit" value="注册" name="submit" class="btn btn-warning"/></div>
		</form>
	</div>
	</div>
</body>
</html>