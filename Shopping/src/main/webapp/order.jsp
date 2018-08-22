<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html class="no-js" lang="en">
    <head>
		<!-- Basic page needs
        ============================================ --> 
        <meta charset="utf-8">
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <title>order| Hope</title>
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
        <style type="text/css">
        .account_card_area ul#account_nav li a, .account_card_area ul#account_nav li div.account_menu_list .account_single_item h2, .account_card_area ul#account_nav li div.cart_down_area p, ul#nav_menu li a, ul#nav_menu li div.mega_menu_list .single_megamenu h2, ul#nav_menu li div.mega_menu_list .single_megamenu .items_list a, ul#nav_menu li div.look_mega_menu .look_single h3, ul#nav_menu li div.look_mega_menu .look_single .items_list_lk a, .shopping_details_des h2, table.cart_items td:nth-last-of-type(5), .cart_title h2, .upsell_details h2, .add-to-cart .cart_button, .product_clothing_details h2, .cart_blog_details a, .blog_product_details .blog_heading, .priceing_area h2, .price_slider_amount input[type="submit"], .popular_items h2, ul.catagory li a, .catagory_area h2, .create_button a, .new_customer h3, .create_account h2, .sign_up span, .social_icon a, .Social_list h2, .service_list h2, .single_blog a, .product_button a, .single_product h2, .feature_text h4, .single_image h3, .single_image h2, .account_card_area ul#account_nav li .cart_shoptings a, .shop_collection a{ 
	font-family: 'Josefin Sans', sans-serif;
	font-weight: bold;
}
table.cart_items{
	width:100%;
	border:1px solid #E5E5E5;
}
table.cart_items tr td a{
	text-decoration:none;
	color:#222;
}
table.cart_items tr td input{
	height:40px;
	width:40px;
	background:#f0f0f0;
	text-align:center;
	border:0px solid #f0f0f0;
}
table.cart_items tr td a:hover{
	color:#ff0000;
}
table.cart_items th{
	border-bottom:1px solid #E5E5E5;
}
table.cart_items th:nth-last-of-type(6){
	padding:10px 150px;
}
table.cart_items td:nth-last-of-type(6){
	padding:10px 150px;
}
table.cart_items td:nth-last-of-type(1){
	font-weight:bold;
}
table.cart_items td:nth-last-of-type(3){
	font-weight:bold;
}
table.cart_items td:nth-last-of-type(5){
	font-size:18px;
}
table.cart_items th, table.cart_items td{
	padding:10px 20px;
	text-align:center;
	border-right:1px solid #E5E5E5;
}
table.cart_items td{
	border-bottom:1px solid #E5E5E5;
}
        
</style>
        
        
    </head>
    <body>
        <!--[if lt IE 8]>
            <p class="browserupgrade">You are using an <strong>outdated</strong> browser. Please <a href="http://browsehappy.com/">upgrade your browser</a> to improve your experience.</p>
        <![endif]-->
		<!--Start Header Top area -->
		
		<%@include file="header.jsp" %>
		<!--End Main Menu area -->
		
		
		<!--Start Shopping Cart top area -->
		<div class="shopping_cart_area">
			<div class="container">
				<div class="row">
					<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
						<div class="cart_title">
							<h2>订单</h2>
						</div>
						<div class="shopping-cart-table">
							<table class="cart_items">
								<tr>
									<th>订单号</th>
									<th>样图</th>
									<th>产品名字</th>
									<th>编辑</th>
									<th>单价</th>
									<th>数量</th>
									<th>小计</th>
									<th>订单状态</th>
								</tr>
								<tr>
									<td><a href="#"><img src="img/arrow/btn_trash.gif" alt="" /></a></td>
									<td><a href="#"><img src="img/product/shop-cart-1.jpg" alt="" /></a></td>
									<td><a href="#">Pellentesque hendrerit</a></td>
									<td><a href="#">Edit</a></td>
									<td>$800.00</td>
									<td><input name="cart[390][qty]" value="1" size="4" title="Qty" class="input-text qty" maxlength="12"></td>
									<td>$800.00</td>
								</tr>
								<tr>
									<td><a href="#"><img src="img/arrow/btn_trash.gif" alt="" /></a></td>
									<td><a href="#"><img src="img/product/shop-cart-1.jpg" alt="" /></a></td>
									<td><a href="#">Pellentesque hendrerit</a></td>
									<td><a href="#">Edit</a></td>
									<td>$800.00</td>
									<td><input name="cart[390][qty]" value="1" size="4" title="Qty" class="input-text qty" maxlength="12"></td>
									<td>$800.00</td>
								</tr>
							</table>
						</div>
					</div>
				</div>
				
				
				
			</div>
		</div>
		<!--End Shopping Cart top area -->
		
		
		
		
		
		
		<!--Start Estimate Shipping,Discount,Total checkout area -->
		<!--End Estimate Shipping,Discount,Total checkout area -->
		
		<!--Start Branding area -->
	    <%@ include file="brand.jsp" %>
		<!--End Branding area -->
		
		<!--Start Footer area -->
         
        <%@include file="footer.jsp" %>
         
         
		<!--End Footer area -->
        <!-- jquery JS -->
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
		<!-- carousel JS -->
        <script src="js/owl.carousel.min.js"></script>
		<!-- plugins JS -->
        <script src="js/plugins.js"></script>
		<!-- main JS  -->
        <script src="js/main.js"></script>
    </body>
</html>
