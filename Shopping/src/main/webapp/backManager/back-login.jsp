<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>服装管理系统</title>
<link rel="stylesheet" type="text/css" href="css/index.css" />
<script type="text/javascript" src="js/jquery-1.7.1.min.js"></script>
<script type="text/javascript">
	function login(){
		var aname=$("#user").val();
		var apwd=$("#apwd").val();
		$.post(
			"backLoginJu.do",
			{aname:aname,
			 apwd:apwd
			},
			function(data){
				if( data == "账户密码不匹配，请确认后重新登陆" ){
					alert(data);
				}else{
					backlogin();
				}
			}
		);
	}
	
	function backlogin(){
		window.location.href="backLogin.do";
	}
</script>
</head>

<body style="background: #000;">
	<form id="loginForm" method="post" action="backLogin.do">
		<div class="png login_logo">
			<img src="images/logo_03.png" alt="" />
		</div>
		<div class="login">
			<div class="login_1">
				<input name="aname" id="user" type="text" autocomplete="off" />
			</div>
			<div class="login_2">
				<input name="apwd" id="apwd" type="password" />
			</div>
			<div class="login_3">
				<input id="remember" type="checkbox" />
			</div>
			<div class="login_4 png">
				<input type="button" value="登录" onclick="login()" />
			</div>
		</div>
	</form>


	<script>
		window.onload = function() {
			var oForm = document.getElementById('loginForm');
			var oUser = document.getElementById('user');
			var oPswd = document.getElementById('pswd');
			var oRemember = document.getElementById('remember');
			//页面初始化时，如果帐号密码cookie存在则填充
			if (getCookie('user') && getCookie('pswd')) {
				oUser.value = getCookie('user');
				oPswd.value = getCookie('pswd');
				oRemember.checked = true;
			}
			//复选框勾选状态发生改变时，如果未勾选则清除cookie
			oRemember.onchange = function() {
				if (!this.checked) {
					delCookie('user');
					delCookie('pswd');
				}
			};
			//表单提交事件触发时，如果复选框是勾选状态则保存cookie
			oForm.onsubmit = function() {
				if (remember.checked) {
					setCookie('user', oUser.value, 7); //保存帐号到cookie，有效期7天
					setCookie('pswd', oPswd.value, 7); //保存密码到cookie，有效期7天
				}
			};
		};
		//设置cookie
		function setCookie(name, value, day) {
			var date = new Date();
			date.setDate(date.getDate() + day);
			document.cookie = name + '=' + value + ';expires=' + date;
		};
		//获取cookie
		function getCookie(name) {
			var reg = RegExp(name + '=([^;]+)');
			var arr = document.cookie.match(reg);
			if (arr) {
				return arr[1];
			} else {
				return '';
			}
		};
		//删除cookie
		function delCookie(name) {
			setCookie(name, null, -1);
		};
	</script>

</body>
</html>
<script src="/common.js"></script>