<%@ page language="java" pageEncoding="UTF-8"%>
<HTML>
<HEAD>
	<meta http-equiv="Content-Language" content="zh-cn">
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<LINK href="${pageContext.request.contextPath}/admin/css/Style.css" type="text/css" rel="stylesheet">
</HEAD>
<body>
	<form id="userAction_save_do" name="Form1"
		action="${pageContext.request.contextPath}/AddProductServlet" method="post"
		enctype="multipart/form-data">
		&nbsp;
		<table cellSpacing="1" cellPadding="5" width="100%" align="center"
			bgColor="#eeeeee" style="border: 1px solid #8ba7e3" border="0">
			<tr>
				<td class="ta_01" align="center" bgColor="#CD9B9B" colSpan="4"
					height="26"><strong><STRONG>添加商品</STRONG> </strong>
				</td>
			</tr>
			<tr>
				<td align="center" bgColor="#FFC1C1" class="ta_01">商品名称：</td>
				<td class="ta_01" bgColor="#FFC1C1"><input type="text" name="name" class="bg" /></td>
				<td align="center" bgColor="#FFC1C1" class="ta_01">商品价格：</td>
				<td class="ta_01" bgColor="#FFC1C1">
					<input type="text" name="price" class="bg" />
				</td>
			</tr>
			<tr>
				<td align="center" bgColor="#FFC1C1" class="ta_01">商品数量：</td>
				<td class="ta_01" bgColor="#FFC1C1">
					<input type="text" name="pnum" class="bg" />
				</td>
				<td align="center" bgColor="#FFC1C1" class="ta_01">商品类别：</td>
				<td class="ta_01" bgColor="#FFC1C1">
					<select name="category" id="category">
						<option value="" selected="selected">--选择商品类加--</option>
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
				<td align="center" bgColor="#FFC1C1" class="ta_01">商品图片：</td>
				<td class="ta_01" bgColor="#FFC1C1" colspan="3">
				<input type="file" name="upload" size="30" value="" />
				</td>
			</tr>
			<TR>
				<TD class="ta_01" align="center" bgColor="#FFC1C1">商品描述：</TD>
				<TD class="ta_01" bgColor="#FFC1C1" colSpan="3">
					<textarea name="description" cols="30" rows="3" style="WIDTH: 96%"></textarea>
				</TD>
			</TR>
			
			<tr>
				<td class="ta_01" style="WIDTH: 100%" align="center"
					bgColor="#FFC1C1" colSpan="4">
					<input type="submit" class="button_ok" value="确定">	
					<FONT face="宋体">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</FONT>
					<input type="reset" value="重置" class="button_cancel">					
					<FONT face="宋体">
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					</FONT> 
					<INPUT class="button_ok" type="button" onclick="history.go(-1)" value="返回" />
					<span id="Label1"></span>
				</td>
			</tr>
		</table>
	</form>
</body>
</HTML>