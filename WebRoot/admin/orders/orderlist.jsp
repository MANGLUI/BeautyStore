<%@ page language="java" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<HTML>
<HEAD>
	<meta http-equiv="Content-Language" content="zh-cn">
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<link href="${pageContext.request.contextPath}/admin/css/Style.css" rel="stylesheet" type="text/css" />
	<script language="javascript" src="${pageContext.request.contextPath}/admin/js/public.js"></script>
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
</HEAD>
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
     <ul class="nav nav-tabs" style="background:#FFC1C1;">
        <a href="${pageContext.request.contextPath}/admin/login/home.jsp" data-toggle="tab">我的</a>&nbsp;&nbsp;&nbsp;&nbsp;
        <a href="${pageContext.request.contextPath}/ListProductServlet" data-toggle="tab">商品管理</a>&nbsp;&nbsp;&nbsp;&nbsp;
        <a href="${pageContext.request.contextPath}/FindOrdersServlet" data-toggle="tab">订单管理</a>
     </ul>
	<form id="Form1" name="Form1" action="${pageContext.request.contextPath}/FindOrderByManyConditionServlet" method="post">
		<table cellSpacing="1" cellPadding="0" width="100%" align="center" bgColor="#f5fafe" border="0">
			<TBODY>
				<tr>
					<td class="ta_01" align="center" bgColor="#CD9B9B">
						<strong>查 询 条 件</strong>
					</td>
				</tr>
				<tr>
					<td>
						<table cellpadding="0" cellspacing="0" border="0" width="100%">
							<tr>
								<td height="22" align="center" bgColor="#FFC1C1" class="ta_01">
									订单编号</td>
								<td class="ta_01" bgColor="#FFC1C1">
									<input type="text" name="id" size="15" value="" id="Form1_userName" class="bg" />
								</td>
								<td height="22" align="center" bgColor="#FFC1C1" class="ta_01">
									收件人：</td>
								<td class="ta_01" bgColor="#FFC1C1">
									<input type="text" name="receiverName" size="15" value="" id="Form1_userName" class="bg" />
								</td>
							</tr>
							<tr>
								<td width="100" height="22" align="center" bgColor="#FFC1C1" class="ta_01"></td>
								<td class="ta_01" bgColor="#FFC1C1">
									<font face="宋体" color="red"> &nbsp;</font>
								</td>
								<td align="right" bgColor="#FFC1C1" class="ta_01">
									<br /><br />
								</td>
								<td align="right" bgColor="#FFC1C1" class="ta_01">
									<button type="submit" id="search" name="search" value="&#26597;&#35810;" class="button_view">
										&#26597;&#35810;
									</button> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
									<input type="reset" name="reset" value="&#37325;&#32622;" class="button_view" />
								</td>
							</tr>
						</table>
					</td>
				</tr>
				<tr>
					<td class="ta_01" align="center" bgColor="#CD9B9B">
						<strong>订 单 列 表</strong>
					</td>
				</tr>
				<tr>
					<td class="ta_01" align="right"></td>
				</tr>
				<tr>
					<td class="ta_01" align="center" bgColor="#EEB4B4">
						<table cellspacing="0" cellpadding="1" rules="all"
							bordercolor="gray" border="1" id="DataGrid1"
							style="BORDER-RIGHT: gray 1px solid; BORDER-TOP: gray 1px solid; BORDER-LEFT: gray 1px solid; WIDTH: 100%; WORD-BREAK: break-all; BORDER-BOTTOM: gray 1px solid; BORDER-COLLAPSE: collapse; BACKGROUND-COLOR: #f5fafe; WORD-WRAP: break-word">
							<tr style="FONT-WEIGHT: bold; FONT-SIZE: 12pt; HEIGHT: 25px; BACKGROUND-COLOR: #CD9B9B">
								<td align="center" width="20%">订单编号</td>
								<td align="center" width="10%">收件人</td>
								<td align="center" width="15%">地址</td>
								<td align="center" width="10%">联系电话</td>
								<td width="11%" align="center">总价</td>
								<td width="8%" align="center">所属用户</td>
								<td width="10%" align="center">订单状态</td>
								<td width="7%" align="center">查看</td>
								<td width="7%" align="center">删除</td>
							</tr>
							<c:forEach items="${orders}" var="order">
								<tr onmouseover="this.style.backgroundColor = 'white'"
									onmouseout="this.style.backgroundColor = '#FFC1C1';">
									<td style="CURSOR: hand; HEIGHT: 22px" align="center" width="20%">${order.id}</td>
									<td style="CURSOR: hand; HEIGHT: 22px" align="center" width="10%">${order.receiverName}</td>
									<td style="CURSOR: hand; HEIGHT: 22px" align="center" width="15%">${order.receiverAddress }</td>
									<td style="CURSOR: hand; HEIGHT: 22px" align="center" width="10%">${order.receiverPhone }</td>
									<td style="CURSOR: hand; HEIGHT: 22px" align="center">${order.money}</td>
									<td width="8%" align="center">${order.user.username}</td>
									<td width="10%" align="center">${order.paystate==0?"未支付":"已支付"}</td>
									<td align="center" style="HEIGHT: 22px">
										<a href="${pageContext.request.contextPath}/FindOrderByIdServlet?id=${order.id}&type=admin">
											<img src="${pageContext.request.contextPath}/admin/images/button_view.gif" border="0" style="CURSOR: hand">
										</a>
									</td>
									<td align="center" style="HEIGHT: 22px">
                                        <!--  已支付，弹出提示框由操作人确认 -->
									    <c:if test="${order.paystate!=0 }">
											<a href="${pageContext.request.contextPath}//DelOrderByIdServlet?id=${order.id}&type=admin" onclick="javascript:return o_del()">
												<img src="${pageContext.request.contextPath}/admin/images/i_del.gif" width="16" height="16" border="0" style="CURSOR: hand">
											</a>
										</c:if> 
										<!--  未支付 ，不能删除-->
										<c:if test="${order.paystate==0 }">
											<a href="javascript:alert('不能删除未支付订单')">
												<img src="${pageContext.request.contextPath}/admin/images/i_del.gif" width="16" height="16" border="0" style="CURSOR: hand">
											</a>
										</c:if>
									</td>
								</tr>
							</c:forEach>
						</table>
					</td>
				</tr>
			</TBODY>
		</table>
	</form>
</body>
</HTML>