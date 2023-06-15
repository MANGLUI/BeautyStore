<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="p" uri="http://www.store.cn/tag"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>美妆商城</title>
<script>
    //当商品数量发生变化时触发该方法
	function changeProductNum(count, totalCount, id) {
		count = parseInt(count);
		totalCount = parseInt(totalCount);
		//如果数量为0，判断是否要删除商品
		if (count == 0) {
			var flag = window.confirm("确认删除商品吗?");

			if (!flag) {
				count = 1;
			}
		}
		if (count > totalCount) {
			alert("已达到商品最大购买量");
			count = totalCount;
		}
		location.href = "${pageContext.request.contextPath}/changeCart?id="
				+ id + "&count=" + count;
	}
	//删除购物车中的商品
	function cart_del() {   
	    var msg = "您确定要删除该商品吗？";   
	    if (confirm(msg)==true){   
	    return true;   
	    }else{   
	    return false;   
	    }   
	}   
</script>
<style type="text/css">
#divpagecontent {
	width: 900px;
	margin-top: 10px;
	MARGIN-RIGHT: auto;
	MARGIN-LEFT: auto;
	
	
}
.carttable {
	border: 1px solid #CCCCCC;
	width: 100%;
	background-color: #EEA2AD;
}
.infocontent {
	background-color: #FCFDEF;
	border: 1px solid #CCCCCC;
	margin-left: 5px;
	width: 99%;
}

.infocontent td {
	padding: 5px;
}
</style>
</head>
<body >
	<p:user/>
	<jsp:include page="head.jsp" />
	<div id="divpagecontent">
		<table width="100%" border="0" cellspacing="0">
			<tr>
				<td>
					<div style="text-align:right; margin:5px 10px 5px 0px">
						<a href="${pageContext.request.contextPath }/index.jsp">首页</a>
						&nbsp;&nbsp;&nbsp;&nbsp;&gt;&nbsp;&nbsp;&nbsp;&nbsp;购物车
					</div>
					<table cellspacing="0" class="infocontent">
						<tr>
							<td>
								<table width="100%" border="0" cellspacing="0">
									<tr>
										<td>
											<table cellspacing="1" class="carttable">
												<tr>
													<td width="10%" style="background-color:#FFC1C1;">序号</td>
													<td width="30%" style="background-color:#EEB4B4;">商品名称</td>
													<td width="10%" style="background-color:#CD9B9B;">价格</td>
													<td width="20%" style="background-color:#BC8F8F;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;数量</td>
													<td width="10%" style="background-color:#CD9B9B;">库存</td>
													<td width="10%" style="background-color:#EEB4B4;">小计</td>
													<td width="10%" style="background-color:#FFC1C1;">取消</td>
												</tr>
											</table>
											<!-- 循环输出商品信息 -->
											<c:set var="total" value="0" /> 
											<c:forEach items="${cart}" var="entry" varStatus="vs">
												<table width="100%" border="0" cellspacing="0">
													<tr>
														<td width="10%">${vs.count}</td>
														<td width="30%">${entry.key.name }</td>
														<td width="10%">${entry.key.price }</td>
														<td width="20%">
														    <!-- 减少商品数量 -->
															<input type="button" value='-' style="width:20px"
															       onclick="changeProductNum('${entry.value-1}','${entry.key.pnum}','${entry.key.id}')">
															 <!-- 商品数量显示 -->
															<input name="text" type="text" value="${entry.value}" style="width:40px;text-align:center" />
															<!-- 增加商品数量 -->
															<input type="button" value='+' style="width:20px"
															       onclick="changeProductNum('${entry.value+1}','${entry.key.pnum}','${entry.key.id}')">
														</td>
														<td width="10%">${entry.key.pnum}</td>
														<td width="10%">${entry.key.price*entry.value}</td>
														<td width="10%">
														    <!-- 删除商品 -->
															<a href="${pageContext.request.contextPath}/changeCart?id=${entry.key.id}&count=0"
															style="color:#FF0000; font-weight:bold" onclick="cart_del()">X</a>
														</td>
													</tr>
												</table>
												<c:set value="${total+entry.key.price*entry.value}" var="total" />
											</c:forEach>

											<table cellspacing="1" class="carttable">
												<tr>
													<td style="text-align:right; padding-right:40px;">
														<font style="color:#FF6600; font-weight:bold">合计：&nbsp;&nbsp;${total}元</font>
													</td>
												</tr>
											</table>
											<div style="text-align:right; margin-top:10px">
											    <!--继续购物 -->
												<a href="${pageContext.request.contextPath}/showProductByPage">
													<img src="images/gwc_jx.gif" border="0" />
												</a>
												&nbsp;&nbsp;&nbsp;&nbsp;
                                                 <!--结账 -->
												<a href="${pageContext.request.contextPath}/client/order.jsp">
													<img src="${pageContext.request.contextPath}/client/images/gwc_buy.gif" border="0" />
												</a>
											</div>
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
