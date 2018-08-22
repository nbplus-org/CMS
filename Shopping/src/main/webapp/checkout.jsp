<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html class="no-js" lang="en">
    <head>
		<!-- Basic page needs
        ============================================ --> 
        <meta charset="utf-8">
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <title>结账 | Hope</title>
        <meta name="description" content="">
		<!-- Mobile specific metas -->
        <meta name="viewport" content="width=device-width, initial-scale=1">
		<!-- FONTS -->
		<link href='http://fonts.googleapis.com/css?family=Josefin+Sans:400,600italic,300italic,700' rel='stylesheet' type='text/css'>
		<!-- Favicon -->
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
		<!-- modernizr JS -->
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
		
		
		
		<div class="checkout_accrodion_area">
			<div class="container">
				<div class="row">
					<div class="col-lg-9 col-md-9 col-sm-12 col-xs-12">
						<div class="accordion" id="accordion2">
					
				          <!-- -- -->
					
							<div class="panel accordion-group">
								<div class="accordion-heading" id="headingTwo">
								  <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion2" href="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
									<span>1</span>账单信息
								  </a>
								</div>
								<div id="collapseTwo" class="panel-collapse collapse" aria-labelledby="headingTwo">
								  <div class="accordion-inner">
										<div class="row">
											<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
												<div class="billing_info">
													<ul class="billing_in">
														<li>名字<span>*</span></li>
														<li>
														<input type="text" id="billing:firstname" name="billing[firstname]" value="" title="First Name" maxlength="255" class="input-text required-entry"></li>
														<li>电话<span>*</span></li>
														<li><input type="text" id="billing:company" name="billing[company]" value="" title="Company" class="input-text "></li>
														<li>邮箱<span>*</span></li>
														<li><input type="text" name="billing[email]" id="billing:email" value="" title="Email Address" class="input-text validate-email required-entry"></li>
														
														<div data-toggle="distpicker">
														<li>省份<span>*</span></li>
														<li>
															<select id="province" name="province" title="State/Province" class="validate-select required-entry">
															</select>
														</li>
														
														<li>市区<span>*</span></li>
														<li>
															<select name="city" id="city" class="validate-select" title="Country">
															</select>
														</li>
														<li>区/县<span>*</span></li>
														<li>
															<select name="area" id="area" class="validate-select" title="Country">
															</select>
														</li>
														</div>
														<li>详细地址<span>*</span></li>
														<li><input type="text" title="Street Address" name="billing[street][]" id="billing:street1" value="" class="input-text  required-entry"></li>
														
													</ul>
												</div>
											</div>
										</div>
										<div class="row">
											<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
												<div class="Continue_button">
													<button type="submit" title="Submit Review" class="button">Continue</button>
												</div>
											</div>
										</div>
								  </div>
								</div>
							</div>
							
							<!-- ---- -->
							
				            <!-- ---- -->
				            
							<div class="panel accordion-group">
								<div class="accordion-heading" id="headingFive">
								  <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion2" href="#collapseFive" aria-expanded="false" aria-controls="collapseFive">
									<span>5</span>订单确认
								  </a>
								</div>
								<div id="collapseFive" class="panel-collapse collapse" aria-labelledby="headingFive">
								  <div class="accordion-inner">
										<div class="row">
											<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
												<div class="accordion_total_pricing">
													<table id="product_details_price">
														<tr>
															<th>产品名</th>
															<th>价格</th>
															<th>数量</th>
															<th>总计</th>
														</tr>
														<tr>
															<td><h2>Pellentesque hendrerit</h2></td>
															<td>$800.00</td>
															<td>1</td>
															<td>$800.00</td>
														</tr>
														<tr>
															<td><h2>Vivamus eu imper</h2></td>
															<td>$999.00</td>
															<td>1</td>
															<td>$999.00</td>
														</tr>
													</table>
													<table id="product_details_rate">
														<tr>
															<td>Subtotal</td>
															<td>$1,799.00</td>
														</tr>
														<tr>
															<td>Shipping & Handling (Flat Rate - Fixed)</td>
															<td>$10.00</td>
														</tr>
														<tr>
															<th>Grand Total</th>
															<th>$1,809.00</th>
														</tr>
													</table>
												</div>
												<div class="Continue_button continue_top place_order">
													<h2>Forgot an Item? <a href="#">Forgot your password?</a></h2>
													<button type="submit" title="Submit Review" class="button">下单</button>
												</div>
											</div>
										</div>
								  </div>
								</div>
							</div>
						</div>
					</div>
					<div class="col-lg-3 col-md-3 col-sm-12 col-xs-12">
						<div class="check_progress">
							<h2>结账进度</h2>
							<ul id="progress_btn">
								<li><i class="fa fa-minus"></i>Billing Address</li>
								<li><i class="fa fa-minus"></i>Shipping Address</li>
								<li><i class="fa fa-minus"></i>Shipping Method</li>
								<li><i class="fa fa-minus"></i>Payment Method</li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
		
		<!--Start branding area -->
	    <%@ include file="brand.jsp" %>
		<!--End branding area -->
		
		
		<!--Start footer area -->
         
        <%@include file="footer.jsp" %>
         
		<!--End footer area -->
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
        
        <!-- 中国省市区地址三级联动插件 -->
        <script src="js/distpicker.data.js"></script>
        <script src="js/distpicker.js"></script>
        <script src="js/main.js"></script>
    </body>
</html>
