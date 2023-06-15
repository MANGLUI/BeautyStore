<%@ page language="java" contentType="text/html; charset=utf-8" import="java.util.*"
    pageEncoding="utf-8"%>
    <%@ page import="cn.store.domain.User"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>美妆商城head</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/client/css/bootstrap.min.css" type="text/css" />
<script type="text/javascript">
/* //退出确认框
function confirm_logout() {   
    var msg = "您确定要退出登录吗？";   
    if (confirm(msg)==true){   
    return true;   
    }else{   
    return false;   
    }   
}   */
/**
 * my_click和my_blur均是用于前台页面搜索框的函数
 */
//鼠标点击搜索框时执行
function my_click(obj, myid){
	//点击时，如果取得的值和搜索框默认value值相同，则将搜索框清空
	if (document.getElementById(myid).value == document.getElementById(myid).defaultValue){
	  document.getElementById(myid).value = '';
	  obj.style.color='#000';
	}
}
//鼠标不聚焦在搜索框时执行
function my_blur(obj, myid){
	//鼠标失焦时，如果搜索框没有输入值，则用搜索框的默认value值填充
	if (document.getElementById(myid).value == ''){
	 document.getElementById(myid).value = document.getElementById(myid).defaultValue;
	 obj.style.color='#999';
 }
}

/**
 * 点击搜索按钮执行的函数
 */
function search(){
	document.getElementById("searchform").submit();
}
</script>
<style type="text/css">
    #divhead h1{
    font-size:40px;
    color:#FFFFFF;
    font-family:"华文行楷";
    /* padding:50px 0 0 0; */
    margin:30px auto;
    }
    #divhead p{
    font-family:"华文行楷";
    color:#FFFFFF;
    font-size:20px;
    }
    #divhead{
    background:#EEB4B4;
    }
    #divmenu{
    font-size: 14px;
    background:#EEB4B4;
    }
    #divmenu a {
	font-size: 14px;
	color: #FFFFFF; 
	font-weight: bold;
	padding: 10px 10px 10px 10px;
}

#divmenu a:link {
	text-decoration: none;
	font-weight: bold;
}

#divmenu a:visited {
	text-decoration: none;
	color: #FFFFFF;
	font-weight: bold;
}

#divmenu a:hover {
	text-decoration: none;
	color: #999999; /*颜色变换*/
	font-weight: bold;
}

#divmenu a:active {
	text-decoration: none;
	color: #FFFFFF;
	font-weight: bold;
}
</style>
</head>
<body>
<div id="divhead">
     <div class="row">
          <div class="col-sm-8" style="text-align:center;">
             <a href="${pageContext.request.contextPath }/index.jsp">
					<h1>美妆商城</h1>
					<p>Welcome to the beautymall</p>
				</a>   
          </div>
          <div class="col-sm-4" style="text-align:right;color:#FFFFFF;padding:30px 40px 0 0;">
               <img src="${pageContext.request.contextPath}/client/images/cart.gif" width="26" height="23" style="margin-bottom:-4px" />
				   &nbsp;
				  <a href="${pageContext.request.contextPath}/client/cart.jsp">购物车</a> 
				| <a href="${pageContext.request.contextPath}/MyServlet">我的帐户</a>
				<% 
				User user = (User) request.getSession().getAttribute("user");
				if(null == user){
				%>
				| <a href="${pageContext.request.contextPath}/client/register.jsp">新用户注册</a>							
				<% 	
				}else{
				%>
				| <a href="${pageContext.request.contextPath}/LogoutServlet" onclick="confirm_logout()">用户退出</a>
				<br><br><br><p>欢迎您： ${user.username}<p/>
				<% 	
				}
				%>			
          </div>
     </div>
</div>
<div id="divmenu">
     <div class="row">
         <div class="col-sm-8" style="text-align:center;padding:5px 0 0 0;">
              <a href="${pageContext.request.contextPath}/showProductByPage?category=护肤套装">护肤套装</a> 
		      <a href="${pageContext.request.contextPath}/showProductByPage?category=面膜">面膜</a> 
		      <a href="${pageContext.request.contextPath}/showProductByPage?category=防晒">防晒</a> 
		      <a href="${pageContext.request.contextPath}/showProductByPage?category=口红">口红</a> 
		      <a href="${pageContext.request.contextPath}/showProductByPage?category=粉底">粉底</a>
		      <a href="${pageContext.request.contextPath}/showProductByPage?category=精华">精华</a> 
		      <a href="${pageContext.request.contextPath}/showProductByPage?category=洁面卸妆">洁面卸妆</a>
		      <a href="${pageContext.request.contextPath}/showProductByPage" style="color:#4F4F4F">全部商品目录</a>	
         </div>
         <div class="col-sm-4" style="text-align:center;padding:5px 0 0 0;">
         <form action="${pageContext.request.contextPath }/MenuSearchServlet" id="searchform">
              <input type="text" name="textfield" class="inputtable" id="textfield" value="请输入搜索的商品"
				onmouseover="this.focus();"
				onclick="my_click(this, 'textfield');"
				onBlur="my_blur(this, 'textfield');"/> 
				<a href="#"style="text-align:center;">
					<img src="${pageContext.request.contextPath}/client/images/serchbutton.gif" border="0" style="margin-top:-6px;" onclick="search()"/> 
				</a>
				</form>
         </div>
     </div>
</div>
</body>
</html>