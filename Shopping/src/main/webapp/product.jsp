<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<!doctype html>
<html class="no-js" lang="en">
<head>
<!-- Basic page needs
        ============================================ -->
<meta charset="utf-8">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<title>Single Product | Hope</title>
<meta name="description" content="">
<!-- Mobile specific metas -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- FONTS -->
<link
	href='http://fonts.googleapis.com/css?family=Josefin+Sans:400,600italic,300italic,700'
	rel='stylesheet' type='text/css'>
<!-- Favicon -->
<link rel="shortcut icon" type="image/x-icon" href="img/favicon.ico">
<!-- font awesome -->
<link rel="stylesheet" href="css/font-awesome.min.css">
<!-- carousel CSS -->
<link rel="stylesheet" href="css/owl.carousel.css">
<!-- carousel Theme CSS -->
<link rel="stylesheet" href="css/owl.my_theme.css">
<!-- carousel transitions CSS -->
<link rel="stylesheet" href="css/owl.transitions.css">
<!-- nivo slider slider css -->
<link rel="stylesheet" href="css/nivo-slider.css">
<!-- animate css -->
<link rel="stylesheet" href="css/animate.css">
<!-- Price jquery-ui  -->
<link rel="stylesheet" href="css/jquery-ui.css">
<!-- fancy-box theme -->
<link rel="stylesheet" href="fancy-box/jquery.fancybox.css">
<!-- normalizer -->
<link rel="stylesheet" href="css/normalize.css">
<!-- bootstrap -->
<link rel="stylesheet" href="css/bootstrap.min.css">
<!-- Mobile menu css -->
<link rel="stylesheet" href="css/meanmenu.min.css">
<!-- main -->
<link rel="stylesheet" href="css/main.css">
<!-- style -->
<link rel="stylesheet" href="style.css">
<!-- Responsive css -->
<link rel="stylesheet" href="css/responsive.css">
<!-- modernizr JS -->
<script src="js/vendor/modernizr-2.8.3.min.js"></script>
<!-- 弹框css -->
<!--  <link rel="stylesheet" href="css/tankuang.min.css">  -->
<link rel="stylesheet" href="css/tankuangAlertBox.css">

<script src="js/jquery-1.9.1.js"></script>
<script type="text/javascript">
	function ajax() {
		var str = $("#qty").val();
		var color = $("#color").val();
		var size = $("#size").val();
		var clothesid = $("#clothesid").val();
		var data = {
			qty : str,
			color : color,
			size : size,
		};
		$
				.post(
						"checkNum.do?clothesid=" + clothesid,
						data,
						function(data) {
							$.get("showCarAgain.do", {}, function() {
							});
							$("#check").html("");
							if (data == 0) {
								PostbirdAlertBox
										.confirm({
											'title' : '提示',
											'content' : '添加成功,去购物车结算?',
											'okBtn' : '好的',
											'contentColor' : 'red',
											'onConfirm' : function() {
												window.location.href = "showCart.do";
											},
											'onCancel' : function() {
												window.location.href = "check.do?clothesid=${clothesid}";
											}
										});

								//alert("成功添加到购物车");
							} else if (data == 1) {
								$("#check").html("请填写完整的信息!");
								$("#check").css("color", "red");
							} else if (data == 4) {
								PostbirdAlertBox.alert({
									'title' : '提示',
									'content' : '系统故障,请稍后再试!',
									'okBtn' : '好的',
									'contentColor' : 'red',
									'onConfirm' : function() {
									},
								});
								//alert("系统故障,请稍后再试!");
							} else if (data == 5) {
								//未登陆
								PostbirdAlertBox.confirm({
									'title' : '提示',
									'content' : '您还没有登陆，去登陆?',
									'okBtn' : '好的',
									'contentColor' : 'red',
									'onConfirm' : function() {
										window.location.href = "reglogin.jsp";
									},
									'onCancel' : function() {
									}
								});

								/* $("#check").html("请先登录!")
								$("#check").css("color", "red"); */
							}
						});
	}

	function showPic(path) {
		document.getElementById("bigPic").src = path;
		/*  document .getElementById ("Pic").href=path;  */
	}
</script>
</head>
<body>
	<!--[if lt IE 8]>
            <p class="browserupgrade">You are using an <strong>outdated</strong> browser. Please <a href="http://browsehappy.com/">upgrade your browser</a> to improve your experience.</p>
        <![endif]-->
	<!--头部顶部区域开始-->

	<%@include file="header.jsp"%>

	<!--End Mobile Menu area -->
	<!--End Main Menu area -->



	<!-- breadcrumbs area -->
	<div class="breadcrumbs_area">
		<div class="container">
			<div class="row">
				<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
					<div class="breadcrumb-single breadcrumb_top">
						<ul id="breadcrumbs">
							<li><a href=""><i class="fa fa-home"></i>Home</a></li>
							<li><span>I</span></li>
							<li>LOREM IPSUM DOLOR</li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- End breadcrumbs area -->
	<!-- Start preview Product details area -->
	<div class="blog_single_view_area">
		<div class="container">
			<div class="row">
				<div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
					<div class="my_tabs">

						<div class="tab-content tab_content_style">
							<div id="tab1" class="tab-pane fade in active">

								<div class="blog_tabs">
									<a id="Pic" data-fancybox-group="gallery"
										title="Lorem ipsum dolor sit amet"><img
										src="${clothespic[0].clothespic}" id="bigPic" alt="" /></a>
								</div>

							</div>
						</div>

						<div class="blog_view_list">
							<ul class="tab_style tab_bottom">
								<c:forEach items="${clothespic}" var="p">
									<li class="active">
										<div class="blog_single_carousel">
											<a data-toggle="tab" href="#tab1"><img
												src="${p.clothespic}" onclick="showPic(src)" id="smartPic"
												alt="" /></a>
										</div>
									</li>
								</c:forEach>
							</ul>
						</div>

					</div>
				</div>
				<div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
					<div class="blog_product_details">
						<h2 class="blog_heading">
							<a href="">${clothes.clothesname}</a>
						</h2>
						<div class="product_rating">
							<i class="fa fa-star"></i> <i class="fa fa-star"></i> <i
								class="fa fa-star"></i> <i class="fa fa-star"></i> <i
								class="fa fa-star"></i>
						</div>
						<div class="product_rating"></div>
						<div class="pricing_rate">
							<p class="stack">
								Availability:<span class="in-stock"> In stock</span>
							</p>
							<p class="rating_dollor rating_margin">
								<span class="rating_value_one dollor_size">￥${clothes.clothesorigprice}</span>
								<span class="rating_value_two">￥${clothes.clothesprice}</span>
							</p>
							<p class="blog_texts">${clothes.clothesintroduce}</p>
						</div>
						<div class="product_blog_button ">
							<div class="cart_blog_details blog_icon_border">
								<a href="" target="blank"><i class="fa fa-heart-o"></i></a>
							</div>
							<div class="cart_blog_details blog_icon_border">
								<a href="" target="expand"><i class="fa fa-retweet"></i></a>
							</div>
							<div class="cart_blog_details blog_icon_border">
								<a href="" target="heart"><i class="fa fa-envelope"></i></a>
							</div>
						</div>
					</div>
					<div class="product_options_area">
						<div class="product_options_selection">
							<ul id="options_selection">
								<li><span class="star_color">*</span><span
									class="Product_color">color</span> <span class="required">*Required
										Fields</span></li>
								<li><select id="color" name="color">
										<option value="" id="color" name="color" selected="selected">--
											请选颜色 --</option>
										<c:forEach items="${color}" var="o">
											<option value="${o.clothescolour}">${o.clothescolour}</option>
										</c:forEach>
								</select></li>
								<li><span class="star_color">*</span><span
									class="Product_color">size</span></li>
								<li><select id="size" name="size">
										<option value="" id="size" name="size" selected="selected">--
											请选择尺码 --</option>
										<c:forEach items="${size}" var="m">
											<option value="${m.clothessize}">${m.clothessize }</option>
										</c:forEach>
								</select></li>
							</ul>
						</div>
						<div class="cart_blog_item">
							<p class="rating_dollor rating_margin">
								<span class="rating_value_one dollor_size">￥${clothes.clothesorigprice}</span>
								<span class="rating_value_two">￥${clothes.clothesprice}</span>
							</p>
							<div class="add-to-cart">
								<span style="font-size: 22px">数量:&nbsp;&nbsp;</span><input
									type="text" title="Qty" name="qty" id="qty" class="qty"
									value="1" />
								<button type="button" title="加入购物车" onclick="ajax()" id="buy"
									class="cart_button">
									<span>加入购物车</span>
								</button>
								<span id="check"></span> <input type="hidden" name="clothesid"
									id="clothesid" value="${clothes.clothesid }" />
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- End preview Product details area -->
	<!-- Start Product details tabs area -->
	<div class="product_collateral_area">
		<div class="container">
			<div class="row">
				<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
					<div class="my_tabs_description">
						<ul class="tab_style">
							<li class="active"><a data-toggle="tab" href="#tab-1">产品描述</a>
							</li>
							<li><a data-toggle="tab" href="#tab-2">产品标签</a></li>
							<li><a data-toggle="tab" href="#tab-3">评论</a></li>
						</ul>
						<div class="tab-content tab_content_style">
							<div id="tab-1" class="tab-pane fade in active">
								<div class="product_description">
									<p>${clothes.clothesintroduce}</p>
								</div>
							</div>
							<div id="tab-2" class="tab-pane fade">
								<div class="product_description">
									<div class="product_tag_area">
										<h2 style="FONT-SIZE: 20px">现有标签:</h2>
										<ul id="product_tags">
											<li><a style="color: blue" href="#">${clothes.clothestype }</a>
											<li><a style="color: blue" href="#">${clothes.clothesbigtag }</a>
											<li><a style="color: blue" href="#">${clothes.clothesbrand}</a>
										</ul>
									</div>
								</div>
							</div>
							<div id="tab-3" class="tab-pane fade">
								<div class="product_description">
									<ul id="Motorola">
										<c:if test="${review==null}">
											<li><span>暂无评论</span></li>
										</c:if>

										<c:forEach items="${review}" var="r" varStatus="status">
											<div class="product_tag_area">
												<h2 style="Font-Size: 15px">
													<c:if test="${r.state==1}">
													<span>用户：${r.uname }</span>
												</c:if>
												<c:if test="${r.state==0}">
													<span>匿名：</span>
												</c:if>
												</h2>
												<ul id="product_tags">
													<%-- <li style="color: blue"><span>服装名称:${clothes.clothesname}</span></li> --%>
													<li><span>评分</span> ${r.reviewstar }&nbsp;<span>颗星</span>
													<li>
														<%
															List<Map<String, String>> list = (List<Map<String, String>>) request.getAttribute("review");
														%>
													
												</ul>
												<div class="add_tags">
													<h2>评论:</h2>
												</div>
												<div>
													<p>${r.reviewstr }</p>
												</div>
												<div>
													<a><img src="${r.reviewpic}" width="200px"
														height="200px" alt="" /></a>
												</div>
											</div>
											<hr>
										</c:forEach>
									</ul>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- End Product details tabs area -->
	<!-- Start upsell products area -->
	<div class="upsell_products">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="feature_text feature_upsell">
						<h4>Upsell Products</h4>
					</div>
					<div class="row">
						<div class="upsell_product_list">
							<div class="col-lg-3">
								<div class="single_upsell">
									<a href="#"><img src="img/product/4.jpg" alt="" /></a>
									<div class="upsell_details">
										<h2>
											<a href="">Vivamus eu imper</a>
										</h2>
										<div class="product_rating">
											<i class="fa fa-star"></i> <i class="fa fa-star"></i> <i
												class="fa fa-star"></i> <i class="fa fa-star"></i> <i
												class="fa fa-star-o"></i>
										</div>
										<div class="product_rating">
											<a href="#">1 Review(s) <span>I</span></a> <a href="#">
												Add Your Review</a>
										</div>
										<p>$122.00</p>
									</div>
								</div>
							</div>
							<div class="col-lg-3">
								<div class="single_upsell">
									<a href="#"><img src="img/product/12_1.jpg" alt="" /></a>
									<div class="upsell_details">
										<h2>
											<a href="">Vivamus eu imper</a>
										</h2>
										<div class="product_rating">
											<i class="fa fa-star"></i> <i class="fa fa-star"></i> <i
												class="fa fa-star"></i> <i class="fa fa-star"></i> <i
												class="fa fa-star-o"></i>
										</div>
										<div class="product_rating">
											<a href="#">1 Review(s) <span>I</span></a> <a href="#">
												Add Your Review</a>
										</div>
										<p>$122.00</p>
									</div>
								</div>
							</div>
							<div class="col-lg-3">
								<div class="single_upsell">
									<a href="#"><img src="img/product/14_3.jpg" alt="" /></a>
									<div class="upsell_details">
										<h2>
											<a href="">Vivamus eu imper</a>
										</h2>
										<div class="product_rating">
											<i class="fa fa-star"></i> <i class="fa fa-star"></i> <i
												class="fa fa-star"></i> <i class="fa fa-star"></i> <i
												class="fa fa-star-o"></i>
										</div>
										<div class="product_rating">
											<a href="#">1 Review(s) <span>I</span></a> <a href="#">
												Add Your Review</a>
										</div>
										<p>$122.00</p>
									</div>
								</div>
							</div>
							<div class="col-lg-3">
								<div class="single_upsell">
									<a href="#"><img src="img/product/18_1.jpg" alt="" /></a>
									<div class="upsell_details">
										<h2>
											<a href="">Vivamus eu imper</a>
										</h2>
										<div class="product_rating">
											<i class="fa fa-star"></i> <i class="fa fa-star"></i> <i
												class="fa fa-star"></i> <i class="fa fa-star"></i> <i
												class="fa fa-star-o"></i>
										</div>
										<div class="product_rating">
											<a href="#">1 Review(s) <span>I</span></a> <a href="#">
												Add Your Review</a>
										</div>
										<p>$122.00</p>
									</div>
								</div>
							</div>
							<div class="col-lg-3">
								<div class="single_upsell">
									<a href="#"><img src="img/product/16.jpg" alt="" /></a>
									<div class="upsell_details">
										<h2>
											<a href="">Vivamus eu imper</a>
										</h2>
										<div class="product_rating">
											<i class="fa fa-star"></i> <i class="fa fa-star"></i> <i
												class="fa fa-star"></i> <i class="fa fa-star"></i> <i
												class="fa fa-star-o"></i>
										</div>
										<div class="product_rating">
											<a href="#">1 Review(s) <span>I</span></a> <a href="#">
												Add Your Review</a>
										</div>
										<p>$122.00</p>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- End upsell products area -->
	<!-- Start Related products area -->
	<div class="related_products_area">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="feature_text feature_upsell">
						<h4>Related Products</h4>
					</div>
					<div class="row">
						<div class="upsell_product_list">
							<div class="col-lg-3">
								<div class="single_upsell">
									<a href="#"><img src="img/product/16.jpg" alt="" /></a>
									<div class="upsell_details">
										<h2>
											<a href="">Vivamus eu imper</a>
										</h2>
										<div class="product_rating">
											<i class="fa fa-star"></i> <i class="fa fa-star"></i> <i
												class="fa fa-star"></i> <i class="fa fa-star"></i> <i
												class="fa fa-star-o"></i>
										</div>
										<div class="product_rating">
											<a href="#">1 Review(s) <span>I</span></a> <a href="#">
												Add Your Review</a>
										</div>
										<p>$122.00</p>
									</div>
								</div>
							</div>
							<div class="col-lg-3">
								<div class="single_upsell">
									<a href="#"><img src="img/product/17_2_1_1.jpg" alt="" /></a>
									<div class="upsell_details">
										<h2>
											<a href="">Vivamus eu imper</a>
										</h2>
										<div class="product_rating">
											<i class="fa fa-star"></i> <i class="fa fa-star"></i> <i
												class="fa fa-star"></i> <i class="fa fa-star"></i> <i
												class="fa fa-star-o"></i>
										</div>
										<div class="product_rating">
											<a href="#">1 Review(s) <span>I</span></a> <a href="#">
												Add Your Review</a>
										</div>
										<p>$122.00</p>
									</div>
								</div>
							</div>
							<div class="col-lg-3">
								<div class="single_upsell">
									<a href="#"><img src="img/product/18_1.jpg" alt="" /></a>
									<div class="upsell_details">
										<h2>
											<a href="">Vivamus eu imper</a>
										</h2>
										<div class="product_rating">
											<i class="fa fa-star"></i> <i class="fa fa-star"></i> <i
												class="fa fa-star"></i> <i class="fa fa-star"></i> <i
												class="fa fa-star-o"></i>
										</div>
										<div class="product_rating">
											<a href="#">1 Review(s) <span>I</span></a> <a href="#">
												Add Your Review</a>
										</div>
										<p>$122.00</p>
									</div>
								</div>
							</div>
							<div class="col-lg-3">
								<div class="single_upsell">
									<a href="#"><img src="img/product/6_1.jpg" alt="" /></a>
									<div class="upsell_details">
										<h2>
											<a href="">Vivamus eu imper</a>
										</h2>
										<div class="product_rating">
											<i class="fa fa-star"></i> <i class="fa fa-star"></i> <i
												class="fa fa-star"></i> <i class="fa fa-star"></i> <i
												class="fa fa-star-o"></i>
										</div>
										<div class="product_rating">
											<a href="#">1 Review(s) <span>I</span></a> <a href="#">
												Add Your Review</a>
										</div>
										<p>$122.00</p>
									</div>
								</div>
							</div>
							<div class="col-lg-3">
								<div class="single_upsell">
									<a href="#"><img src="img/product/13_4.jpg" alt="" /></a>
									<div class="upsell_details">
										<h2>
											<a href="">Vivamus eu imper</a>
										</h2>
										<div class="product_rating">
											<i class="fa fa-star"></i> <i class="fa fa-star"></i> <i
												class="fa fa-star"></i> <i class="fa fa-star"></i> <i
												class="fa fa-star-o"></i>
										</div>
										<div class="product_rating">
											<a href="#">1 Review(s) <span>I</span></a> <a href="#">
												Add Your Review</a>
										</div>
										<p>$122.00</p>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- End Related products area -->


	<!-- Start Branding area -->

	<%@include file="brand.jsp"%>



	<!-- End Branding area -->


	<!-- Start Footer area -->


	<%@include file="footer.jsp"%>


	<!-- End Footer area -->
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
	<!-- 弹框js -->
	<script src="js/tankuangAlertBox.min.js"></script>
</body>
</html>
