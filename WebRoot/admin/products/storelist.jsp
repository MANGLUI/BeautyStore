<%@ page language="java" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<HTML>
<HEAD>
	<meta http-equiv="Content-Language" content="zh-cn">
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<link href="${pageContext.request.contextPath}/admin/css/Style.css" rel="stylesheet" type="text/css" />
	<script language="javascript" src="${pageContext.request.contextPath}/admin/js/public.js"></script>
	<script type="text/javascript">
	    //添加商品
		function addProduct() {
			window.location.href = "${pageContext.request.contextPath}/admin/products/addstore.jsp";
		}
		//删除商品
		function p_del() {   
			var msg = "您确定要删除该商品吗？";   
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
     <div class="tab-content">
     <div class="tab-pane active">
        <form id="Form1" name="Form1"
	action="${pageContext.request.contextPath}/FindProductByManyConditionServlet"
	method="post">
		<table cellSpacing="1" cellPadding="0" width="100%" align="center" bgColor="#EEB4B4" border="0">
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
								<td height="22" align="center" bgColor="#EEB4B4" class="ta_01">类别：</td>
								<td class="ta_01" bgColor="#EEB4B4">
								<select name="category" id="category">
										<option value="" selected="selected">--选择商品类别--</option>
										<option value="护肤套装">护肤套装</option>
						                <option value="面膜">面膜</option>
						                <option value="防晒">防晒</option>
						                <option value="口红">口红</option>
						                <option value="粉底">粉底</option>
						                <option value="精华">精华</option>
						                <option value="洁面卸妆">洁面卸妆</option>
								</select>
								</td>
								<td height="22" align="center" bgColor="#EEB4B4" class="ta_01">商品名称：</td>
								<td class="ta_01" bgColor="#EEB4B4">
									<input type="text" name="name" size="15" value="" id="Form1_userName" class="bg" />
								</td>
								
							</tr>
							<tr>
								<td width="100" height="22" align="center" bgColor="#EEB4B4" class="ta_01"></td>
								<td class="ta_01" bgColor="#EEB4B4">
									<font face="宋体" color="red"> &nbsp;</font>
								</td>
								<td align="right" bgColor="#EEB4B4" class="ta_01">
									<br /><br />
								</td>
								<td align="right" bgColor="#EEB4B4" class="ta_01">
									<button type="submit" id="search" name="search" value="&#26597;&#35810;" class="button_view">
										&#26597;&#35810;
									</button> 
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
									<input type="reset" name="reset" value="&#37325;&#32622;" class="button_view" />
								</td>
							</tr>
						</table>
					</td>
				</tr>
				<tr>
					<td class="ta_01" align="center" bgColor="#CD9B9B"><strong>商 品 列 表</strong>
					</TD>
				</tr>
				<tr>
					<td class="ta_01" align="right">
						<button type="button" id="add" name="add" value="&#28155;&#21152;" class="button_add" onclick="addProduct()">
							&#28155;&#21152;
						</button>
					</td>
				</tr>
				<tr>
					<td class="ta_01" align="center" bgColor="#EEB4B4">
						<table cellspacing="0" cellpadding="1" rules="all"
							bordercolor="gray" border="1" id="DataGrid1"
							style="BORDER-RIGHT: gray 1px solid; BORDER-TOP: gray 1px solid; BORDER-LEFT: gray 1px solid; WIDTH: 100%; WORD-BREAK: break-all; BORDER-BOTTOM: gray 1px solid; BORDER-COLLAPSE: collapse; BACKGROUND-COLOR: #EEB4B4; WORD-WRAP: break-word">
							<tr style="FONT-WEIGHT: bold; FONT-SIZE: 12pt; HEIGHT: 25px; BACKGROUND-COLOR: #CD9B9B">
								<td align="center" width="24%">商品编号</td>
								<td align="center" width="18%">商品名称</td>
								<td align="center" width="9%">商品价格</td>
								<td align="center" width="9%">商品数量</td>
								<td width="8%" align="center">商品类别</td>
								<td width="8%" align="center">编辑</td>
								<td width="8%" align="center">删除</td>
							</tr>
                            <!--  循环输出所有商品 -->
							<c:forEach items="${ps}" var="p">
								<tr onmouseover="this.style.backgroundColor = 'white'"
									onmouseout="this.style.backgroundColor = '#EEB4B4';">
									<td style="CURSOR: hand; HEIGHT: 22px" align="center" width="200">${p.id }</td>
									<td style="CURSOR: hand; HEIGHT: 22px" align="center" width="18%">${p.name }</td>
									<td style="CURSOR: hand; HEIGHT: 22px" align="center" width="8%">${p.price }</td>
									<td style="CURSOR: hand; HEIGHT: 22px" align="center" width="8%">${p.pnum }</td>
									<td style="CURSOR: hand; HEIGHT: 22px" align="center">${p.category}</td>
									<td align="center" style="HEIGHT: 22px" width="7%">
									    <a href="${pageContext.request.contextPath}/FindProductByIdServlet?id=${p.id}&type=admin">
											<img src="${pageContext.request.contextPath}/admin/images/i_edit.gif" border="0" style="CURSOR: hand"> 
										</a>
									</td>
									<td align="center" style="HEIGHT: 22px" width="7%">
										<a href="${pageContext.request.contextPath}/DeleteProductServlet?id=${p.id}" onclick="javascript:return p_del()">
												<img src="${pageContext.request.contextPath}/admin/images/i_del.gif"
												width="16" height="16" border="0" style="CURSOR: hand">
										</a>
									</td>
								</tr>
							</c:forEach>
						</table>
					</td>
				</tr>
			</TBODY>
		</table>
	</form></div>
     </div>
</div>
	<br />
	
</body>
</HTML>