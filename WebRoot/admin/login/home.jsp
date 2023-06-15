<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>管理员首页</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/admin/css/bootstrap.min.css" type="text/css" />
<script type="text/javascript" src="${pageContext.request.contextPath}/admin/js/bootstrap.min.js"></script>
<style>
		BODY {
	MARGIN: 0px;
	BACKGROUND-COLOR: #ffffff;
	FONT-SIZE: 12px;
	
}

TD {
	FONT-SIZE: 12px;
	COLOR: #000000
}

TH {
	FONT-SIZE: 12px;
	COLOR: #000000
}
.height1{width:100%; height:74px; background-color:#CD9B9B;}
.height1 h1{
font-family:"华文行楷";color:#FFFFFF;text-align:center;padding:20px 0 0 0;
}

    </style>
    <script type="text/javascript">
	function exitSys() {
		var flag = window.confirm("确认退出系统吗?");
		if (flag) {
			window.open('', '_parent', '');
			window.close();
		}
		//如果你使用的是firefox浏览器必须要做以下设置 
		//1、在地址栏输入about:config然后回车，警告确认 
		//2、在过滤器中输入”dom.allow_scripts_to_close_windows“，双击即可将此值设为true 即可完成了 

	}
</script>
</head>
<body>
<div class="height1">
		<h1>美妆商城后台管理系统</h1>
	</div>
	<table width="100%" border="0" cellspacing="0" cellpadding="0">
		<tr>
			<td height="26" valign="bottom"
				background="${pageContext.request.contextPath}/admin/images/mis_01.jpg">
				<table width="100%" border="0" cellspacing="0" cellpadding="0">
					<tr>
						<td width="85%" align="left">
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
							<font color="#000000">
								<script language="JavaScript">								
									tmpDate = new Date();
									date = tmpDate.getDate();
									month = tmpDate.getMonth() + 1;
									year = tmpDate.getFullYear();
									document.write(year);
									document.write("年");
									document.write(month);
									document.write("月");
									document.write(date);
									document.write("日 ");

									myArray = new Array(6);
									myArray[0] = "星期日"
									myArray[1] = "星期一"
									myArray[2] = "星期二"
									myArray[3] = "星期三"
									myArray[4] = "星期四"
									myArray[5] = "星期五"
									myArray[6] = "星期六"
									weekday = tmpDate.getDay();
									if (weekday == 0 | weekday == 6) {
										document.write(myArray[weekday])
									} else {
										document.write(myArray[weekday])
									};								
								</script> 
							</font>
						</td>
						<td width="15%">
							<table width="100%" border="0" cellspacing="0" cellpadding="0">
								<tr>
									<td width="16" background="${pageContext.request.contextPath}/admin/images/mis_05b.jpg">
										<img src="${pageContext.request.contextPath}/admin/images/mis_05a.jpg" width="6" height="18">
									</td>
									<td width="155" valign="bottom" background="${pageContext.request.contextPath}/admin/images/mis_05b.jpg">
										<font color="blue"><a href="javascript:void(0)"
											onclick="exitSys()">退出系统</a> </font></td>
									<td width="10" align="right" background="${pageContext.request.contextPath}/admin/images/mis_05b.jpg">
										<img src="${pageContext.request.contextPath}/admin/images/mis_05c.jpg" width="6" height="18">
									</td>
								</tr>
							</table>
						</td>
						<td align="right" width="5%"></td>
					</tr>
				</table>
			</td>
		</tr>
	</table>
	<div class="container">
     <ul class="nav nav-tabs">
        <li class="active"><a href="#myhome" data-toggle="tab">我的</a></li>
        <li><a href="${pageContext.request.contextPath}/ListProductServlet">商品管理</a></li>
        <li><a href="${pageContext.request.contextPath}/FindOrdersServlet">订单管理</a></li>
     </ul><br>
     <div class="tab-content">
          <div class="tab-pane active" id="myhome">
              <form name="Form1" method="post" id="Form1">
	<table width="100%" border="0" height="88">
		<tr>
			<td colspan=3 class="ta_01" align="center" bgcolor="#EEB4B4" style="font-family:楷体;color:gray;"><strong>系统首页</strong></td>
		</tr>
		<tr>
			<td width="65%" height="84" align="center" valign="top" >
				<br />
				<span class="size:48;" style="font-family:楷体;color:#8B6969;">登录成功！开始管理后台</span>
			</td>
		</tr>
		<tr><td height=2></td></tr>	
	</table>
	</form>
          </div>
     </div>
</div>
</body>
</html>