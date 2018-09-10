<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<!doctype html>
<html class="no-js" lang="en">
<head>
<!-- Basic page needs
        ============================================ -->
<meta charset="utf-8">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<title>登陆注册</title>
<meta name="description" content="">
<!-- Mobile specific metas -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- FONTS ============================================ -->
<link
	href='http://fonts.googleapis.com/css?family=Josefin+Sans:400,600italic,300italic,700'
	rel='stylesheet' type='text/css'>
<!-- Favicon============================================ -->
<link rel="shortcut icon" type="image/x-icon" href="img/favicon.ico">
<!-- font awesome -->
<link rel="stylesheet" href="css/font-awesome.min.css">
<!-- carousel CSS  -->
<link rel="stylesheet" href="css/owl.carousel.css">
<!-- carousel Theme CSS  -->
<link rel="stylesheet" href="css/owl.my_theme.css">
<!-- carousel transitions CSS  -->
<link rel="stylesheet" href="css/owl.transitions.css">
<!-- nivo slider slider css -->
<link rel="stylesheet" href="css/nivo-slider.css">
<!-- animate css -->
<link rel="stylesheet" href="css/animate.css">
<!-- Price jquery-ui  -->
<link rel="stylesheet" href="css/jquery-ui.css">
<!-- fancy-box theme -->
<link rel="stylesheet" href="fancy-box/jquery.fancybox.css">
<!-- normalizer  -->
<link rel="stylesheet" href="css/normalize.css">
<!-- bootstrap  -->
<link rel="stylesheet" href="css/bootstrap.min.css">
<!-- Mobile menu css -->
<link rel="stylesheet" href="css/meanmenu.min.css">
<!-- main  -->
<link rel="stylesheet" href="css/main.css">
<!-- style  -->
<link rel="stylesheet" href="style.css">
<!-- Responsive css -->
<link rel="stylesheet" href="css/responsive.css">
<!-- modernizr JS ============================================ -->
<script src="js/vendor/modernizr-2.8.3.min.js"></script>

<!-- 自定义提示框css -->
<link rel="stylesheet" href="js/advice/message.css">
<script type="text/javascript" src="easyui/jquery.min.js"></script>
<script type="text/javascript">
       //成功提示框
     function success(){
      $.message('发送成功');
     }

     function fail(){
         $.message({
             message:'发送失败',
             type:'error'
         });
     }
  

     function fayoujian(){
	 var emailSpan= $("#emailSpan").text();  
	 if(emailSpan.length==0){
		 var email=$("#uEmail").val();
		 var data={email:email}
		 $.post("fayoujian.do",data,function(data){
			 if(data=='1'){
				 success();
			 }else if(data=='2'){
				 fail();
			 }else if(data=='0'){
				 $("#emailSpan").html("请输入邮箱");
			 }
			 
			 
		 });
	 }
	
	
    }


	//注册时判断用户名是否已被注册
	function judgeuname() {
		var str = $("#uName").val();
		$("#nameSpan").html("");
		$.post("judgeuName.do", {
			uname : str
		}, function(data) {
			if (data != "用户名可用") {
				$("#nameSpan").html("用户名已被注册");
				$("#nameSpan").css("color", "red");
			}
		});
	}

	//注册时判断邮箱是否已被注册
	function judgeuemail() {
		var str = $("#uEmail").val();
		var reg =  /^[A-Za-z0-9\u4e00-\u9fa5]+@[a-zA-Z0-9_-]+(\.[a-zA-Z0-9_-]+)+$/;
		var emailSpan = $("#emailSpan");
		if (reg.test(str) == false) {
			emailSpan.html("邮箱格式不正确，请输入正确的邮箱");
			emailSpan.css("color", "red");
		} else {
			emailSpan.html("");
			$.post("judgeuEmail.do", {
				uemail : str
			}, function(data) {
				if (data != "邮箱可用") {
					emailSpan.html("邮箱已被注册");
					emailSpan.css("color", "red");
				}
			});
		}
	}

	//判断密码格式，正则
	function judgeupwd() {

		var str = $("#uPwd").val();
		var reg = /^[a-zA-Z0-9]{6,16}$/;
		var pwdSpan = $("#pwdSpan");
		if (reg.test(str) == false) {
			pwdSpan.html("密码长度在6-16之间,仅数字，字母");
			pwdSpan.css("color", "red");
		} else {
			pwdSpan.html("");
		}
	}

	//注册时判断手机号是否已被注册
	function judgeuphone() {

		var str = $("#uPhone").val();
		var reg = /^1\d{10}$/;
		var phoneSpan = $("#phoneSpan");
		if (reg.test(str) == false) {
			phoneSpan.html("手机号码格式不正确");
			phoneSpan.css("color", "red");
		} else {
			phoneSpan.html("");
			$.post("judgeuPhone.do", {
				uphone : str
			}, function(data) {
				if (data != "手机号可用") {
					phoneSpan.html("手机号已被注册");
					phoneSpan.css("color", "red");
				}
			});
		}
	}

	//注册时判断邮箱验证码是否正确
	function judgeemail() {
		var str = $("#code").val();
		var data = {
			name : str
		};
		$.post("judgeCode.do", data, function(data) {
			if (data != "验证码正确") {
				$("#codeSpan").html("验证码错误");
				$("#codeSpan").css("color", "red");
			} else {
				$("#codeSpan").html("");
			}
		});
	}

	//提交时判断条件，满足条件时提交。否则不提交
	function onsub() {
		if ($("#nameSpan").text() == "" && $("#pwdSpan").text() == ""
				&& $("#phoneSpan").text() == "" && $("#emailSpan").text() == ""
				&& $("#codeSpan").text() == "") {
			return true;
		} else {
			return false;
		}
	}
	
	
	function zhuce(){
			 if(onsub()==true){
				  var uname=$("#uName").val();
				  var upwd=$("#uPwd").val();
				  var uphone=$("#uPhone").val();
				  var uemail=$("#uEmail").val();
				  var code=$("#code").val();
				  var usex = $("input[name='usex']:checked").val();
				  var data={uname:uname,upwd:upwd,uphone:uphone,uemail:uemail,code:code ,usex:usex };
				  $.post("regist.do",data,function(data){
					 if(data=='0'){
						alert("请完善信息");
					 }else if(data=='1'){
						 alert("注册成功,去登陆");
						 window.location.href="reglogin.jsp"; 
					 }else if(data=='2'){
						 alert("注册失败");
					 }
					  
				  });
				  
				  
			  }
			 
			  
		  
	}
	 
	
	
	
	
	
	
	
	
	
	
	
	
</script>

</head>


<body>
	<!--[if lt IE 8]>
            <p class="browserupgrade">You are using an <strong>outdated</strong> browser. Please <a href="http://browsehappy.com/">upgrade your browser</a> to improve your experience.</p>
        <![endif]-->
	<!--Start Header Top area -->


	<%@include file="header.jsp"%>

	<!--End Mobile Menu area -->

	<!--End Main Menu area -->
	<!--Start Register & login area -->
	<div class="my_account_page_area">
		<div class="container">
			<div class="row">
				<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
					<div class="create_account">
						<h2>登陆和注册</h2>

					</div>
				</div>
			</div>

			<form id="form1">
				<div class="row">
					<div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
						<div class="new_customer">
							<h3>新用户请来这注册</h3>
							<ul class="register_form">
								<li>用户名<span>*</span></li>
								<li>
									<div class="email_address">
										<input type="text" class="email_test" name="uname" id="uName"
											placeholder="请输入用户名 / 账号" onblur="judgeuname()"
											autocomplete="off" value="${user.uname }" /> <span id="nameSpan"></span>
									</div>
								</li>
								<li>密码<span>*</span></li>
								<li>
									<div class="email_address">
										<input type="password" class="email_test" name="upwd"
											id="uPwd" placeholder="6-16位数字或英文或符号" onblur="judgeupwd()" />
										<span id="pwdSpan"></span>
									</div>
								</li>

								<li>手机号<span>*</span></li>
								<li>
									<div class="email_address">
										<input type="text" class="email_test" name="uphone"
											id="uPhone" placeholder="请输入手机号" onblur="judgeuphone()"
											autocomplete="off" value="${user.uphone }"/> <span id="phoneSpan"></span>
									</div>
								</li>

								<li>邮箱<span>*</span></li>
								<li>
									<div class="email_address">
										<input type="text" id="uEmail" name="uemail"
											style="background: #f0f0f0;" placeholder="请输入邮箱"
											onblur="judgeuemail()" autocomplete="off" value="${user.uemail }"/>
										<button onclick="fayoujian()" type="button">发送验证码</button>
										<span id="emailSpan"></span>
									</div>
								</li>

								<li>验证码<span>*</span></li>
								<li>
									<div class="email_address">
										<input type="text" id="code" name="code" class="email_test"
											placeholder="请输入验证码" onblur="judgeemail()" autocomplete="off" />
										<span id="codeSpan"></span>
									</div>
								</li>

								<li>
									<div class="email_address">
										<input type="radio" checked="checked" name="usex" value="1"  />男
										<input id="woman" type="radio" name="usex" value="0" />女
									</div>
								</li>

							</ul>
						</div>
						<div class="create_button_area">
							<button type="button" class="create_button" onclick="zhuce()">注册</button>
						</div>
					</div>
			</form>

			<form action="login.do" method="post">

				<div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
					<div class="new_customer">
						<h3>老客户请来这登陆</h3>

						<ul class="register_form">
							<li>用户名<span>*</span></li>
							<li>
								<div class="email_address">
									<input type="text" name="uname" class="email_test" required
										placeholder="请输入用户名" autocomplete="off"/>
									<c:forEach items="${msg}">
										<span style="color: red">${msg}</span>
									</c:forEach>
								</div>
							</li>
							<li>密码<span>*</span></li>
							<li>
								<div class="email_address">
									<input type="password" class="email_test" name="upwd" required
										placeholder="请输入密码" autocomplete="off" />
								</div>
							</li>
							<li>验证码<span>*</span></li>
							<li>
								<div class="email_address">
									<input type="text" class="email_test" name="vcode" id="vcode"
										required placeholder="请输入下面的验证码" autocomplete="off" /> <img
										alt="" src="vcode.s" onclick="src='vcode.s?'+new Date()"
										width="75px">
									<c:forEach items="${msgcode}">
										<span style="color: red">${msgcode}</span>
									</c:forEach>
								</div>
							</li>
						</ul>
					</div>
					<div class="create_button_area">
						<a href="forgetpwd.jsp">忘记密码?</a>
						<button type="submit" class="create_button">登陆</button>
					</div>
				</div>
			</form>
		</div>


		<!--End Register & login area -->

		<!--Start Branding area -->
		<%@ include file="brand.jsp"%>
		<!--End Branding area -->


		<!--Start Footer area -->

		<%@include file="footer.jsp"%>

		<!--End Footer area -->
		<!-- jquery JS  -->
		<script src="js/vendor/jquery-1.11.3.min.js"></script>
		<!-- bootstrap JS -->
		<script src="js/bootstrap.min.js"></script>
		<!-- Mobile menu JS -->
		<script src="js/jquery.meanmenu.js"></script>
		<!-- jquery.easing js -->
		<script src="js/jquery.easing.1.3.min.js"></script>
		<!-- knob circle js -->
		<script src="js/jquery.knob.js"></script>
		<!-- fancybox JS -->
		<script src="fancy-box/jquery.fancybox.pack.js"></script>
		<!-- price slider JS  -->
		<script src="js/price-slider.js"></script>
		<!-- nivo slider JS -->
		<script src="js/jquery.nivo.slider.pack.js"></script>
		<!-- wow JS -->
		<script src="js/wow.js"></script>
		<!-- nivo-plugin JS -->
		<script src="js/nivo-plugin.js"></script>
		<!-- scrollUp JS -->
		<script src="js/jquery.scrollUp.js"></script>
		<!-- carousel JS  -->
		<script src="js/owl.carousel.min.js"></script>
		<!-- plugins JS  -->
		<script src="js/plugins.js"></script>
		<!-- main JS  -->
		<script src="js/main.js"></script>
			<!-- 自定义弹框提示 -->
   	<script src="js/advice/message.min.js"></script>
	</div>
</body>
</head>
</html>
