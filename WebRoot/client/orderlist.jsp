<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="p" uri="http://www.store.cn/tag"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
	<title>美妆商城</title>
	<link rel="stylesheet" href="${pageContext.request.contextPath }/client/css/bootstrap.min.css" type="text/css" />
<script type="text/javascript" src="${pageContext.request.contextPath}/client/js/bootstrap.min.js"></script>
	<script type="text/javascript">
	//删除订单
	function o_del() {   
	    var msg = "您确定要删除该订单吗？";   
	    if (confirm(msg)==true){   
	    return true;   
	    }else{   
	    return false;   
	    }   
	} 
	</script>
	<style type="text/css">
	body{
	background:#F5F5DC;
	text-align:center;
}
.container{
	margin:50px auto;
}
.nav li{
	font-size:20px;
	font-family:"楷体";
	color:gray;
}
	</style>
</head>
<body >
	<!-- 使用了自定义标签 -->
	<p:user/>
	<div id="divpagecontent">
	<div class="container">
     <ul class="nav nav-tabs">
        <li><a href="${pageContext.request.contextPath }/client/index.jsp">首页</a></li>
        <li><a href="${pageContext.request.contextPath}/FindOrderByUserServlet">我的订单</a></li>
        <li><a href="${pageContext.request.contextPath}/LogoutServlet" onclick="confirm_logout()">用户退出</a></li>
     </ul><br>
     <div class="tab-content">
          <table cellspacing="0" class="infocontent">
						<tr>
							<td style="padding:20px"><p><b>我的订单</b></p>
								<p>
								</p>
								<table width="100%" border="0" cellspacing="0" class="tableopen">
									<tr>
										<td bgcolor="#FFC1C1" class="tableopentd01">订单号</td>
										<td bgcolor="#EEB4B4" class="tableopentd01">收件人</td>
										<td bgcolor="#CD9B9B" class="tableopentd01">订单时间</td>
										<td bgcolor="#BC8F8F" class="tableopentd01">状态</td>
										<td bgcolor="#FFC1C1" class="tableopentd01">操作</td>
									</tr>
									<c:forEach items="${orders}" var="order">
										<tr>
											<td class="tableopentd02">${order.id}</td>
											<td class="tableopentd02">${order.receiverName }</td>
											<td class="tableopentd02">${order.ordertime}</td>
											<td class="tableopentd02">${order.paystate==0?"未支付":"已支付"}</td>
											<td class="tableopentd03">
												<a href="${pageContext.request.contextPath}/FindOrderByIdServlet?id=${order.id}">查看</a>&nbsp;&nbsp;
												<c:if test="${order.paystate==0 }">
													<a href="${pageContext.request.contextPath}/DelOrderByIdServlet?id=${order.id}"  onclick="javascript:return o_del()">刪除</a>
												</c:if> 
												<c:if test="${order.paystate!=0 }">
													<a href="${pageContext.request.contextPath}/DelOrderByIdServlet?id=${order.id}&type=client" onclick="javascript:return o_del()">刪除</a>
												</c:if>
											</td>
										</tr>
									</c:forEach>
								</table>
							</td>
						</tr>
					</table>
				</td>
			</tr>
		</table>
      
</div></div></div>
</body>
</html>
