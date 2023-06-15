<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>后台添加</title>
<link href="${pageContext.request.contextPath}/admin/css/Style.css" type="text/css" rel="stylesheet">
	<script language="javascript" src="${pageContext.request.contextPath}/admin/js/public.js"></script>
	<script language="javascript" src="${pageContext.request.contextPath}/admin/js/check.js"></script>
	<script type="text/javascript">
		//设置类别的默认值
		function setProductCategory(t) {
			var category = document.getElementById("category");
	
			var ops = category.options;
			for ( var i = 0; i < ops.length; i++) {
	
				if (ops[i].value == t) {
					ops[i].selected = true;
					return;
				}
			}
	
		};
	</script>
</head>
<body onload="setProductCategory('${p.category}')">
	<form id="userAction_save_do" name="Form1"
		action="${pageContext.request.contextPath}/EditProductServlet" method="post"
		enctype="multipart/form-data">
		<input type="hidden" name="id" value="${p.id}" /> &nbsp;
		<table cellSpacing="1" cellPadding="5" width="100%" align="center"
			bgColor="#eeeeee" style="border: 1px solid #8ba7e3" border="0">
			<tr>
				<td class="ta_01" align="center" bgColor="#CD9B9B" colSpan="4" height="26">
					<strong>编辑商品</strong>
				</td>
			</tr>
			<tr>
				<td align="center" bgColor="#EEB4B4" class="ta_01">商品名称：</td>
				<td class="ta_01" bgColor="	#FFC1C1">
					<input type="text" name="name" class="bg" value="${p.name }" />
				</td>
				<td align="center" bgColor="#EEB4B4" class="ta_01">商品价格：</td>
				<td class="ta_01" bgColor="	#FFC1C1">
					<input type="text" name="price" class="bg" value="${p.price }" />
				</td>
			</tr>
			<tr>
				<td align="center" bgColor="#EEB4B4" class="ta_01">商品数量：</td>
				<td class="ta_01" bgColor="	#FFC1C1">
					<input type="text" name="pnum" class="bg" value="${p.pnum}" />
				</td>
				<td align="center" bgColor="#EEB4B4" class="ta_01">商品类别：</td>
				<td class="ta_01" bgColor="	#FFC1C1">
					<select name="category" id="category">
						<option value="">--选择商品类加--</option>
						<option value="护肤套装">护肤套装</option>
						<option value="面膜">面膜</option>
						<option value="防晒">防晒</option>
						<option value="口红">口红</option>
						<option value="粉底">粉底</option>
						<option value="精华">精华</option>
						<option value="洁面卸妆">洁面卸妆</option>
					</select>
				</td>
			</tr>
			<tr>
				<td align="center" bgColor="#EEB4B4" class="ta_01">商品图片：</td>
				<td class="ta_01" bgColor="	#FFC1C1" colSpan="3">
				<input type="file" name="upload" size="30" value="" /></td>
			</tr>
			<TR>
				<TD class="ta_01" align="center" bgColor="#EEB4B4">商品描述：</TD>
				<TD class="ta_01" bgColor="	#FFC1C1" colSpan="3">
					<textarea name="description" cols="30" rows="3" style="WIDTH: 96%">${p.description}</textarea>
				</TD>
			</TR>
			<tr>
				<td class="ta_01" style="WIDTH: 100%" align="center" bgColor="#f5fafe" colSpan="4">
					<input type="submit" class="button_ok" value="确定"> 
					<FONT face="宋体">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</FONT>
					<input type="reset" value="重置" class="button_cancel" /> 
					<FONT face="宋体">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</FONT> 
					<INPUT class="button_ok" type="button" onclick="history.go(-1)" value="返回" />
					<span id="Label1"> </span>
				</td>
			</tr>
		</table>
	</form>
</body>
</html>