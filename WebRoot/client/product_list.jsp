<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
	<title>Store列表</title>
<style type="text/css">
#divpagecontent {
	width: 900px;
	margin-top: 10px;
	MARGIN-RIGHT: auto;
	MARGIN-LEFT: auto;
	
	
}
.listcontent {
	background-color: #CC6666;
	border: 1px solid #CCCCCC;
	margin-left: 5px;
	width: 99%;
}

.listcontent td {
	padding: 20px;
}

.divmakeuppic {
	width: 131px;
	height: 145px;
	border: 1px solid #CCCCCC;
	background-color: #FFFFFF;
	margin-bottom: 8px;
	overflow: hidden;
	display: table-cell;
	position: relative;
	text-align: center;
	vertical-align: middle;
}

.divmakeuppic img {
	position: static;
	position: relative;
	top: 5%;
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

.divlisttitle {
	line-height: 120%;
	text-align:left;
}
.divlisttitle a{
	color:#FFFFFF;
}

.inputbutton {
	color: #000000;
	background-color: #FFFFFF;
	padding: 1px;
	border: 1px solid #999999;
}


.pagination {
	padding: 5px;
	width: 790px;
	margin: 5px auto;
	text-align: center;
}

.pagination ul {
	width:270px;
	margin: 5px auto;
	padding: 5px;
	font-size: 12px;
}

.pagination li {
	list-style-type: none;
	float:left;
	padding: 1px;
	margin: 1px;
}

.pagination a,.pagination a:visited {
	padding:5px;
	border: 1px solid #9aafe5;
	text-decoration: none;
	color: #2e6ab1;
}



.pagination li.currentpage {
	font-weight: bold;
	padding: 5px;
	border: 1px solid navy;
	background-color: #2e6ab1;
	color: #FFF;
}
.disablepage_a{
	display:block; 
	width:75px; 
	height:15px;
	}
.disablepage_a:link,.disablepage_a:visited{!important; padding:0; border:0;}
.disablepage_a:hover{!important; padding:0; border:0; background:none; }
.pagination li.disablepage_p {
	width: 75px;
	height: 15px;
	padding: 5px;
	color: #929292;
	background:url(../images/previous_page.png) no-repeat center center;
}

.pagination li.disablepage_p2 {
	width: 75px;
	height: 15px;
	padding: 5px;
	color: #929292;
	background:url(../images/previous_page2.png) no-repeat center center;
}

.pagination li.disablepage_n{	
	width: 75px;
	height: 15px;
	padding: 5px;
	margin-right:-20px;
	color: #929292;
	background:url(../images/next_page.png) no-repeat center center;
}

.pagination li.disablepage_n2{	
	width: 75px;
	height: 15px;
	padding: 5px;
	color: #929292;background:url(../images/next_page2.png) no-repeat center center;
}

.pagination li.nextpage {
	font-weight: bold;
	padding: 5px;
}
</style>
</head>
<body>
	<jsp:include page="head.jsp" />
	<div id="divpagecontent">
		 <table width="100%" border="0" cellspacing="0">
			<tr>
				<td>
					<div style="text-align:right; margin:5px 10px 5px 0px">
						<a href="${pageContext.request.contextPath }/index.jsp">首页</a>
						&nbsp;&nbsp;&nbsp;&nbsp;&gt;&nbsp;&nbsp;&nbsp;&nbsp;
						${bean.category}
						&nbsp;&nbsp;&nbsp;&nbsp;&gt;&nbsp;&nbsp;&nbsp;&nbsp;
						美妆列表
					</div>
					<table cellspacing="0" class="listcontent">
						<tr>
							<td>
								<h4>商品目录</h4>
								<hr />
								<h4>${bean.category}</h4>&nbsp;&nbsp;&nbsp;&nbsp;共${bean.totalCount}种商品
								<hr />
								<div style="margin-top:20px; margin-bottom:5px">
									<img src="${pageContext.request.contextPath }/client/images/productlist.gif" width="100%" height="38" />
								</div>

								<table cellspacing="0" class="commoditylist">
									<tr>
										<c:forEach items="${bean.ps}" var="p" varStatus="vs">
											<td>
												<div class="divmakeuppic">
													<p>
														<a href="${pageContext.request.contextPath}/FindProductByIdServlet?id=${p.id}">
															<img src="${pageContext.request.contextPath}${p.imgurl}" width="115" height="129" border="0" /> 
														</a>
													</p>
												</div>
												<br>
												<div class="divlisttitle">
													<a href="${pageContext.request.contextPath}/FindProductByIdServlet?id=${p.id}">名称： ${p.name}<br />售价：￥${p.price} </a>
												</div>
											</td>
										</c:forEach>
									</tr>
								</table>
								<div class="pagination">
									<ul>
										<c:if test="${bean.currentPage!=1}">
											<li class="disablepage_p">
												<a class="disablepage_a" href="${pageContext.request.contextPath}/showProductByPage?currentPage=${bean.currentPage-1}&category=${bean.category}"></a>
											</li>
										</c:if>
										<c:if test="${bean.currentPage==1}">
											<li class="disablepage_p2"></li>
										</c:if>
										<c:forEach begin="1" end="${bean.totalPage}" var="pageNum">
											<c:if test="${pageNum==bean.currentPage}">
												<li class="currentpage">${pageNum }</li>
											</c:if>
											<c:if test="${pageNum!=bean.currentPage}">
												<li><a href="${pageContext.request.contextPath}/showProductByPage?currentPage=${pageNum}&category=${bean.category}">${pageNum}</a>
												</li>
											</c:if>
										</c:forEach>

										<c:if test="${bean.currentPage==bean.totalPage||bean.totalPage==0}">
											<li class="disablepage_n2"></li>
										</c:if>
										<c:if test="${bean.currentPage!=bean.totalPage&&bean.totalPage!=0}">
											<li class="disablepage_n">
												<a class="disablepage_a" href="${pageContext.request.contextPath}/showProductByPage?currentPage=${bean.currentPage+1}&category=${bean.category}"></a>
											</li>
										</c:if>
									</ul>
								</div>
							</td>
						</tr>
					</table>
				</td>
			</tr>
		</table>
	</div>
</body>
</html>
