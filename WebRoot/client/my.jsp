<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>我的账户</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/client/css/bootstrap.min.css" type="text/css" />
<link rel="stylesheet" href="${pageContext.request.contextPath }/client/css/my.css" type="text/css" />
<script type="text/javascript" src="${pageContext.request.contextPath}/client/js/bootstrap.min.js"></script>
<script type="text/javascript">
	//退出确认框
	function confirm_logout() {   
	    var msg = "您确定要退出登录吗？";   
	    if (confirm(msg)==true){   
	    return true;   
	    }else{   
	    return false;   
	    }   
	} 
	</script>
</head>
<body>
<div class="container">
     <ul class="nav nav-tabs">
        <li><a href="${pageContext.request.contextPath }/client/index.jsp">首页</a></li>
        <li class="active"><a href="#myhome" data-toggle="tab">我的账户</a></li>
        <li><a href="${pageContext.request.contextPath}/FindOrderByUserServlet">我的订单</a></li>
        <li><a href="${pageContext.request.contextPath}/LogoutServlet" onclick="confirm_logout()">用户退出</a></li>
     </ul><br>
     <div class="tab-content">
          <div class="tab-pane active" id="myhome">
               <img src="${pageContext.request.contextPath }/client/images/myad.jpg" width="750" height="500" />
          </div>
     </div>
</div>
</body>
</html>