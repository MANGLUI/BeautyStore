<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>确认支付</title>
</head>
<body>
	<!-- 确认支付form -->
	<form action="${pageContext.request.contextPath }/ChangeOrderStateServlet" method="post" 
	style="width:100%;text-align:center;font-family:kaiti;color:CC6666;
	background-color:CC9999;padding:20px 0 20px 0;">
		<h3>订单号：${orderid}</h3><br><h3>付款金额 ：${money}</h3>
			<input type="hidden" name="orderid" value="${orderid}"/> 
			<input type="submit" value="确认支付" />
	</form>
</body>
</html>