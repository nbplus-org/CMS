<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html class="no-js" lang="en">
    <head>
		<!-- Basic page needs
        ============================================ --> 
        <meta charset="utf-8">
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <title>Shopping Cart | Hope</title>
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
		<!--End Main Menu area -->
		
		
		<!--Start Shopping Cart top area -->
		<div class="shopping_cart_area">
			<div class="container">
				<div class="row">
					<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
						<div class="cart_title">
							<h2>购物车</h2>
						</div>
						<div class="shopping-cart-table">
							<table class="cart_items">
								<tr>
									<th>删除</th>
									<th>样图</th>
									<th>产品名字</th>
									<th>编辑</th>
									<th>单价</th>
									<th>数量</th>
									<th>小计</th>
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
				<div class="row">
					<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
						<div class="shopping_cart_main">
							<div class="shopping_button">
								<button type="button" title="shop"  class="continue_shopping">继续购物</button>
							</div>
							<div class="shopping_button">
								<button type="button" title="shop"  class="continue_shopping">清空购物车</button>
							</div>
							<div class="shopping_button">
								<button type="button" title="shop"  class="continue_shopping">更新购物车</button>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!--End Shopping Cart top area -->
		<!--Start Estimate Shipping,Discount,Total checkout area -->
		<div class="cart-collaterals-item">
			<div class="container">
				<div class="row">
					<div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
						<div class="shopping_details_des">
							<h2>估计运费</h2>
							<h3>进入目的地获得运输和税收.</h3>
							<div class="shopping_form">
								<h4>国家<span>*</span></h4>
								<select name="country_id" id="country" class="validate-select" title="Country">
									<option value="AF">Afghanistan</option>
									<option value="AX">脜land Islands</option>
									<option value="AL">Albania</option>
									<option value="DZ">Algeria</option>
								</select>
								
								<h4>国家省</h4>
								<select id="region_id" name="region_id" title="State/Province" class="required-entry validate-select">
									<option value="">Please select region, state or province</option>
									<option value="1">Alabama</option>
									<option value="2">Alaska</option>
									<option value="3">American Samoa</option>
									<option value="4">Arizona</option>
									<option value="5">Arkansas</option>
									<option value="6">Armed Forces Africa</option>
									<option value="7">Armed Forces Americas</option>
									<option value="8">Armed Forces Canada</option>
									<option value="9">Armed Forces Europe</option>
									<option value="10">Armed Forces Middle East</option>
									<option value="11">Armed Forces Pacific</option>
								</select>
								<h4>邮政编码</h4>
								<input class="input-text validate-postcode" type="text" name="estimate_postcode" value="">
								<div class="review_button product_tag_add">
									<button type="submit" title="Submit Review" class="button">得到报价</button>
								</div>
							</div>
						</div>
					</div>
					<div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
						<div class="shopping_details_des">
							<h2>贴现码</h2>
							<h3>输入优惠券代码，如果你有一个.</h3>
							<div class="shopping_form">
								<input class="input-text validate-postcode" type="text" name="estimate_postcode" value="">
								<div class="review_button product_tag_add">
									<button type="submit" title="Submit Review" class="button">使用优惠卷</button>
								</div>
							</div>
						</div>
					</div>
					<div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
						<div class="total_price">
							<table class="total_rate">
								<tr>
									<td>小计</td>
									<td>$800.00</td>
								</tr>
								<tr>
									<th>Grand Total</th>
									<th>$800.00</th>
								</tr>
							</table>
						</div>
						<div class="check_out_simble review_button ">
							<button type="submit" title="Submit Review" class="button">结账</button>
							<h2><a href="">多地址结账</a></h2>
						</div>
					</div>
				</div>
			</div>
		</div>
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
