<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>美妆商城</title>
<style type="text/css">
#divpagecontent {
	width: 900px;
	margin-top: 10px;
	MARGIN-RIGHT: auto;
	MARGIN-LEFT: auto;	
}
.infocontent {
	background-color: #CC6666;
	border: 1px solid #CCCCCC;
	margin-left: 5px;
	width: 99%;
}

.infocontent td {
	padding: 5px;
}
.divmakeupcover {
	width: 300px;
	height: 300px;
	border: 3px solid #F3F2DE;
	background-color: #FFFFFF;
	margin: 8px;
	overflow: hidden;
	position: relative;
	display: table-cell;
	text-align: center;
	vertical-align: middle;
}

.divmakeupcover img {
	position: static;
	position: relative;
	top: 5%;
	padding-left: 20px;
	padding-right: 20px;
}
</style>
</head>
<body >
<jsp:include page="head.jsp" />
<div id="divpagecontent">
		<table width="100%" border="0" cellspacing="0">
			<tr>
				<td>
				    <div style="text-align:right; margin:5px 10px 5px 0px">
						<a href="${pageContext.request.contextPath }/index.jsp">首页</a>
						&nbsp;&nbsp;&nbsp;&nbsp;&gt;&nbsp;&nbsp;&nbsp;
						<a href="${pageContext.request.contextPath}/showProductByPage?category=${p.category}">&nbsp;${p.category}</a>
						&nbsp;&nbsp;&nbsp;&nbsp;&gt;&nbsp;&nbsp;&nbsp;&nbsp;${p.name}
					</div>
					<table cellspacing="0" class="infocontent">
						<tr>
							<td><h1>美妆商城</h1>
								<table width="100%%" border="0" cellspacing="0">
									<tr>
										<td width="30%">
											<div class="divmakeupcover">
												<p>
													<img src="${pageContext.request.contextPath}${p.imgurl}" width="213" height="269" border="0" />
												</p>
											</div>
											<div style="text-align:center; margin-top:10px">
												<a href="${pageContext.request.contextPath}/AddCartServlet?id=${p.id}">
													<img src="${pageContext.request.contextPath }/client/images/buybutton.gif" border="0" width="100" height="25" /> 
												</a>
											</div>
										</td>
										<td style="padding:20px 5px 5px 5px">
											<img src="${pageContext.request.contextPath }/client/images/miniicon3.gif" width="16" height="16" />
											<font class="name">&nbsp;${p.name}</font>
											<hr />售价：<font color="#FF0000">￥${p.price}</font>
											<hr /> 类别：${p.category }
											<hr />
											<p>
												<b>内容简介：</b>
											</p> ${p.description}
										</td>
									</tr>
								</table>
							</td>
						</tr>
					</table>
				</td>
			</tr>
		</table>
	</div>
</body>
</html>