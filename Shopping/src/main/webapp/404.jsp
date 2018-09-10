<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html class="no-js" lang="en">
    <head>
		<!-- Basic page needs
        ============================================ -->   
        <meta charset="utf-8">
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <title>404 | Hope</title>
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
		
        
		
		<%@include file="header.jsp" %> 
		<!--End Main Menu area -->
		<!--Start 404 area -->
		<div class="404-hastech-area">
			<div class="container">
				<div class="row">
					<div class="col-lg-12">
						<div class="hastech-404-area-list">
							<div class="hastech-404-content">
								<h2>
									4
									<i class="fa fa-life-ring"></i>
									4!
								</h2>
							</div>
							<div class="error-heading">
								<h2>This page is not available</h2>
								<h3>We're sorry, but the Web address you've entered is no longer available. </h3>
							</div>
							<div class="error-form">
								<p>To find a product, please type its name in the field below.</p>
								<form action="#" method="post" id="errorForm" class="error-ser-form">
									<div class="error-form-group form-group">
										<span>Search our product catalog :</span>
										<input type="text" class="form-control input-feild" id="errorform" name="errorform" value="">
										<input type="submit" class="error-search" value="Search" name="errorsearch">
									</div>													
								</form>
							</div>
							<div class="error-back-home">
								<a class="add-tag-btn" href="index.html"><i class="fa fa-chevron-left"></i> Home Page</a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!--End 404 area -->
		<!--Start Branding area -->
	    
	    <%@ include file="brand.jsp" %>
	    
	    
		<!--End Branding area -->
        <%@include file="footer.jsp" %> 
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
