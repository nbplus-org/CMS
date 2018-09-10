<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!doctype html>
<html class="no-js" lang="en">
<head>
<!-- Basic page needs
        ============================================ -->
<meta charset="utf-8">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<title>forgetpwd</title>
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
<script type="text/javascript" src="easyui/jquery.min.js"></script>
<script src="js/vendor/modernizr-2.8.3.min.js"></script>
<!-- 自定义提示框css -->
<link rel="stylesheet" href="js/advice/message.css">


<style type="text/css">
.fangkuang {
	width: 300px;
	height: 350px;
	position: relative;
	left: 31.5%;
	top: 20%;
}

.phone {
	background: #f0f0f0;
	padding: 9px 10px;
	width: 200px;
	height: 30px
}
</style>

</head>

<body>
	<!--[if lt IE 8]>
            <p class="browserupgrade">You are using an <strong>outdated</strong> browser. Please <a href="http://browsehappy.com/">upgrade your browser</a> to improve your experience.</p>
        <![endif]-->
	<!--Start Header Top area -->
	<%@include file="header.jsp"%>
	<!--End Main Menu area -->



	<!--Start Register & login area -->
	<div class="fangkuang">
		<div class="my_account_page_area">
			<div class="container">
				<div class="row">
					<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
						<div class="create_account">
							<h2>身份验证</h2>
						</div>
					</div>
				</div>
				<div class="row">

					<form action="judgecode.do" method="post">
						<div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
							<div class="">

								<ul class="register_form">
									<li>账号<span>*</span></li>
									<li>
										<div class="email_address">
											<input type="text" class="email_test" id="zid" name="zid"
												onblur="onid()" autocomplete="off" /> <span id="sp1">${msg1 }</span>
										</div>
									</li>
									<li>绑定的邮箱<span>*</span><span id="sp2"></span></li>

									<li>
										<div class="email_address ">
											<input type="text" value="" class="phone " id="email"
												onblur="onemail()" autocomplete="off" />
											<button onclick="sendemail()" type="button">发送验证码</button>
											<span id="sp3"></span>
										</div>
									</li>
									<li>验证码<span>*</span></li>
									<li>
										<div class="email_address">
											<input type="text" class="email_test" name="code"
												autocomplete="off" /> <span id="sp4">${msg }</span>
										</div>
									</li>
								</ul>

							</div>
							<div class="">
								<button type="submit" class="create_button">确定</button>
							</div>

						</div>
					</form>
					<!-- 登陆块已删 -->

				</div>
			</div>
		</div>
	</div>

	<!--End Register & login area -->


	<!--Start Branding area -->
	<%-- <%@include file="brand.jsp" %> --%>
	<!--End Branding area -->


	<!--Start Footer area -->
	<%-- <%@ include file="footer.jsp" %> --%>
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
	
	<script type="text/javascript">
		//账号失焦事件
		function onid() {
			var str = $("#zid").val();
			var data = {
				uname : str
			};
			$.post("zid.do", data, function(data) {
				$("#sp1").html("");
				$("#sp2").html("");
				if (data == '1') {
					$("#sp1").html("该用户未注册");
				} else {
					$("#sp2").html(data);
				}

			});
		}

		//发送邮箱点击事件
		function sendemail() {
			var str = $("#email").val();
			var str1 = $("#zid").val();
			var data = {
				email : str,
				uname : str1
			};
			$.post("email.do", data, function(data) {
				$("#sp1").html("");
				$("#sp3").html("");
				if (data == '1') {
					$("#sp1").html("该用户未注册");
				} else if (data == '2') {
					$("#sp3").html("请输入邮箱");
				} else if (data == '3') {
					$("#sp3").html("邮箱错误");
				} else {
					//alert("发送成功");
					//prompt("发送成功");
					success();
				}
			});
		}

		//正则表达式判断邮箱格式
		function onemail() {
			var str = $("#email").val();
			judge(str);
			function judge(str) {
				var reg = /^[A-Za-z0-9\u4e00-\u9fa5]+@[a-zA-Z0-9_-]+(\.[a-zA-Z0-9_-]+)+$/;
				if (reg.test(str)) {
					$("#sp3").html("");
				} else {
					$("#sp3").html("邮箱格式错误");
				}
			}

		}
		
		
		
		
		//成功提示框
		function success(){
           $.message('发送成功');
        }
		
	</script>
</body>
</html>
