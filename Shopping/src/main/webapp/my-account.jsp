<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html class="no-js" lang="en">
    <head>
		<!-- Basic page needs
        ============================================ -->   
        <meta charset="utf-8">
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <title>Account | Hope</title>
        <meta name="description" content="">
		<!-- Mobile specific metas --> 
        <meta name="viewport" content="width=device-width, initial-scale=1">
		<!-- FONTS ============================================ -->
		<link href='http://fonts.googleapis.com/css?family=Josefin+Sans:400,600italic,300italic,700' rel='stylesheet' type='text/css'>
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
    </head>
    <body>
        <!--[if lt IE 8]>
            <p class="browserupgrade">You are using an <strong>outdated</strong> browser. Please <a href="http://browsehappy.com/">upgrade your browser</a> to improve your experience.</p>
        <![endif]-->
		<!--Start Header Top area -->

        

		<%@include file="header.jsp" %>	
		
		<!--End Mobile Menu area -->
		
		<!--End Main Menu area -->
		<!--Start Register & login area -->
		<div class="my_account_page_area">
			<div class="container">
				<div class="row">
					<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
						<div class="create_account">
							<h2>登陆或注册</h2>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
						<div class="new_customer">
							<h3>新用户</h3>
							<p>By creating an account with our store, you will be able to move through the checkout process faster, store multiple shipping addresses, view and track your orders in your account and more.</p>
						    <ul class="register_form">
								<li>用户名<span>*</span></li>
								<li>
									<div class="email_address">
										<input type="text" class="email_test"/>
									</div>
								</li>
								<li>密码<span>*</span></li>
								<li>
									<div class="email_address">
										<input type="text" class="password"/>
									</div>
								</li>
								<li>昵称<span>*</span></li>
								<li>
									<div class="email_address">
										<input type="text" class="password"/>
									</div>
								</li>
								<li>电话<span>*</span></li>
								<li>
									<div class="qwer">
										<input type="text" class="password"/>
									</div>
								</li>
								<li>邮箱<span>*</span></li>
								<li>
									<div class="email_address">
										<input type="text" class="password"/>
									</div>
								</li>
								<li><h2><span>*</span>Required Fields</h2></li>
							</ul>
						</div>
						<div class="create_button_area">
							<button type="submit" class="create_button">
								Create an Account
							</button>
						</div>
					</div>
					<div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
						<div class="new_customer">
							<h3>Registered Customers</h3>
							<p>If you have an account with us, please log in.</p>
							<ul class="register_form">
								<li>Email Address<span>*</span></li>
								<li>
									<div class="email_address">
										<input type="text" class="email_test"/>
									</div>
								</li>
								<li>Password<span>*</span></li>
								<li>
									<div class="email_address">
										<input type="text" class="password"/>
									</div>
								</li>
								<li><h2><span>*</span>Required Fields</h2></li>
							</ul>
						</div>
						<div class="create_button_area">
							<a href="">Forgot Your Password?</a>
							<button type="submit" class="create_button">
								Login
							</button>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!--End Register & login area -->
		
		<!--Start Branding area -->
        <%@ include file="brand.jsp" %>
		<!--End Branding area -->
		
		
		<!--Start Footer area -->
        
        <%@include file="footer.jsp" %>
        
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
    </body>
</html>
