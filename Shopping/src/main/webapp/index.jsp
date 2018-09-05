<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="/WEB-INF/mytld.tld" prefix="mt"%>
<!doctype html>
<html class="no-js" lang="en">
<head>
<!-- 基本页面需求
        ============================================ -->
<meta charset="utf-8">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<title>万能服装店</title>
<meta name="description" content="">
<!-- Mobile specific metas -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 字体 -->
<link
	href='http://fonts.googleapis.com/css?family=Josefin+Sans:400,600italic,300italic,700'
	rel='stylesheet' type='text/css'>
<!-- 图标 -->
<link rel="shortcut icon" type="image/x-icon" href="img/favicon.ico">
<!-- font awesome -->
<link rel="stylesheet" href="css/font-awesome.min.css">
<!-- 旋转木马样式 CSS -->
<link rel="stylesheet" href="css/owl.carousel.css">
<!-- 旋转木马 主题 CSS -->
<link rel="stylesheet" href="css/owl.my_theme.css">
<!-- 旋转木马 过度 CSS -->
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
<!-- <script src="http://code.jquery.com/jquery-1.11.3.min.js"></script> -->
        <style type="text/css">
.icoFontlist:hover
    {
        width: 225px;
        font-size: 12px;
        border: 0px solid #ddd;
        overflow: hidden;
        text-align: left;
        text-overflow: ellipsis;
        white-space: nowrap;
        color:blue;
        text-decoration:underline;
        cursor:pointer; 
    }
.icoFontlist{
        width: 225px;
        font-size: 12px;
        border: 0px solid #ddd;
        color:#5f5f5f;
        overflow: hidden;
        text-align: left;
        text-overflow: ellipsis;
        white-space: nowrap;
    }
        </style>
<script type="text/javascript">
	function goLogin() {
		PostbirdAlertBox.confirm({
			'title' : '提示',
			'content' : '您还没有登陆，去登陆?',
			'okBtn' : '好的',
			'contentColor' : 'red',
			'onConfirm' : function() {
				window.location.href = "reglogin.jsp";
				//alert("回调触发后隐藏提示框");
			},
			'onCancel' : function() {
			}
		});
	}

	function seeOrder() {
		PostbirdAlertBox.confirm({
			'title' : '提示',
			'content' : '您还没有登陆，去登陆?',
			'okBtn' : '好的',
			'contentColor' : 'red',
			'onConfirm' : function() {
				window.location.href = "reglogin.jsp";
				//alert("回调触发后隐藏提示框");
			},
			'onCancel' : function() {
			}
		});
	}
	//搜索框的模糊查询
	function fuzzySelect(value) {
		$.get("fuzzySelect.do", {
			value : value
		}, function(data) {
			$("#searchContent").autocomplete({
				source : data
			});
		});
	}

	function search() {
		var value=$("#searchContent").val();
		window.location.href="showShop.do?op=search&value="+value;
	}
</script>
</head>
<body>
	<!--[if lt IE 8]>
            <p class="browserupgrade">You are using an <strong>outdated</strong> browser. Please <a href="http://browsehappy.com/">upgrade your browser</a> to improve your experience.</p>
        <![endif]-->
	<!--开始头部区域 -->
	<div class="home2_header_top_area">
		<div class="container">
			<div class="row">
				<div class="col-lg-3 col-md-3 col-sm-12 col-xs-12">
					<!--开始标志区 -->
					<div class="logo logo_border">
						<a href="showShop.do?op=shop"> <img
							src="img/logo/logo-home-2.png" alt="" />
						</a>
					</div>
					<!--结束标志区 -->
				</div>
				<div class="col-lg-9 col-md-9 col-sm-12 col-xs-12">
					<div class="home2_contact_info">
						<div class="contact_info_text">
							<h3>联系我们:15570921217</h3>
						</div>
						<!--账户开始区域 -->
						<div class="account_card_area account_cart_home2">
							<ul id="account_nav">
								<li>
									<%
										if (request.getSession().getAttribute("UserVO") != null) {
									%> <a class="list_cl" href="#"> <i class="fa fa-key"></i></a> <i
									style="color: white">${UserVO.uname}</i> <%
 	} else {
 %> <a class="list_cl" href="reglogin.jsp"> <i class="fa fa-key"></i>请登录
								</a> <%
 	}
 %> <%
 	if (request.getSession().getAttribute("UserVO") != null) {
 %>
									<div class="account_menu_list">
										<div class="account_single_item">
											<ul id="account_single_nav_3">
												<li><a href="showCart.do">我的购物车</a></li>
												<li><a href="seeorder.do">我的订单</a></li>
												<li><a href="outLog.do">退出登陆</a></li>
											</ul>
										</div>
									</div> <%
 	}
 %>
								</li>
								<%
									if (request.getSession().getAttribute("UserVO") != null) {
								%>
								<li><a class="list_cl" href="showCart.do"><i
										class="fa fa-shopping-cart"></i>购物车 <span
										class="cart_zero cart_zero1">${cartcount }</span></a> <%
 	} else {
 %>
								<li><a class="list_cl" onclick="goLogin()"><i
										class="fa fa-shopping-cart"></i>购物车 <span></span></a> <%
 	}
 %>
									<div class="cart_down_area">
										<%
											if (request.getSession().getAttribute("UserVO") != null) {
										%>
										<c:forEach items="${cart }" var="cart">
											<div class="cart_single">
												<a href="check.do?clothesid=${cart.clothesid}"><img
													src="${cart.clothespic }" width="50px" height="50px" alt="" /></a>
												<h2>
													<a href="check.do?clothesid=${cart.clothesid}">${cart.clothesname}</a>
													<a href="trash.do?cartid=${cart.cartid}"><span><i
															class="fa fa-trash"></i></span></a>
												</h2>
												<p>${cart.cnum }x$${cart.clothesprice}</p>
											</div>
										</c:forEach>
										<div class="cart_shoptings">
											<a href="checkoutAll.do">结账</a>
										</div>
										<%
											}
										%>
									</div></li>

							</ul>
						</div>
						<!--结束 账户 区域 -->
					</div>
					<div class="row">
						<div class="col-lg-8 col-md-8 col-sm-8 col-xs-12">
							<!--主菜单开始区域 -->
							<div class="main_menu main_menu_tb">
								<ul id="nav_menu" class="active_cl nav_manu_lf">
									<li><a class="home2_size" href="show.do"><span
											class="Home">主页</span></a></li>

									<li><a class="home2_size"><span class="Clothings"
											id="menu">分类</span></a> <!-- 下面div是购物的分类 -->
										<div class="mega_menu_list menu_home2_list" id="list">
											<div class="single_megamenu">
												<c:forEach items="${clothesbigtag }" var="tag">
													<h2>
														<i class="fa fa-angle-right"></i><a
															href="showShop.do?op=tag&clothesbigtag=${tag.clothesbigtag }">${tag.clothesbigtag}</a>
													</h2>
												</c:forEach>
											</div>
										</div></li>
									<li><a class="home2_size"><span class="Clothings"
											id="menu">品牌</span></a>
										<div class="mega_menu_list menu_home2_list" id="list">
											<div class="single_megamenu">
												<c:forEach items="${clothesbrand }" var="brand"
													varStatus="status">
													<c:if test="${status.index<5 }">
														<h2>
															<i class="fa fa-angle-right"></i><a
																href="showShop.do?op=brand&clothesbrand=${brand.clothesbrand}">${brand.clothesbrand}</a>
														</h2>
													</c:if>
												</c:forEach>
												<span>......</span>
											</div>
										</div></li>


									<li><a class="home2_size"><span class="Footwear">类型</span></a>
										<div class="mega_menu_list menu_home2_list" id="list">
											<div class="single_megamenu">
												<c:forEach items="${typename }" var="type">
													<h2>
														<i class="fa fa-angle-right"></i><a
															href="showShop.do?op=type&clothestype=${type.typename}">${type.typename}</a>
													</h2>
												</c:forEach>
											</div>
										</div></li>


									<li><a class="home2_size" href="showShop.do?op=shop"><span
											class="Sales">全部商品</span></a></li>
									<li><a class="home2_size"><span class="Accessaries">帮助</span></a>
										<div class="home_mega_menu menu_home2_looktr">

											<a href="seeorder.do">我的订单</a> <a href="showCart.do">购物车</a>

											<a href="about-us.jsp">关于我们</a> <a href="contact.jsp">联系我们</a>

										</div></li>
								</ul>
							</div>
							<!--主菜单结束区域 -->
						</div>
						<div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
							<!--搜索开始区域-->
							<div class="search_box_hopme2">
								<form action="#" name="myForm">
									<div class="search_box seach_box_home2_area">
										<input name="Name" id="searchContent" class="input_text"
											type="text" list="source" placeholder="输入你想要的" autocomplete="off"
											 />
										<!-- oninput="fuzzySelect(value)" -->
										<!-- 自定义下拉框 -->
										<!-- <datalist id="source">

										</datalist> -->
										<%-- <c:forEach items="${searchResult }" var="result">
												<option value="${result }"></option>
											</c:forEach> --%>
										<button type="button" class="btn-search" onclick="search()">
											<i class="fa fa-search"></i>
										</button>

									</div>
								</form>
							</div>
							<!--搜索结束区域 -->
						</div>
					</div>
				</div>
			</div>
		</div>
		<!--移动菜单开始区域 -->
		<div class="mobile-menu-area">
			<div class="container">
				<div class="row">
					<div class="col-lg-8 col-md-8 col-sm-8 col-xs-12">
						<div class="mobile-menu">
							<nav id="dropdown">
								<ul>
									<li><a
										href="http://bootexperts.com/html/hope-preview/hope/index-1.html">主页</a>
									</li>

									<li><a>分类</a> <%
 	if (session.getAttribute("clothesbigtag") != null) {
 %>
										<ul>
											<c:forEach items="${clothesbigtag }" var="tag">
												<li><a
													href="showShop.do?op=tag&clothesbigtag=${tag.clothesbigtag }">${tag.clothesbigtag}</a>
											</c:forEach>
										</ul> <%
 	}
 %></li>
									<li><a>品牌</a> <%
 	if (session.getAttribute("clothesbrand") != null) {
 %>
										<ul>
											<c:forEach items="${clothesbrand }" var="brand">
												<li><a
													href="showShop.do?op=brand&clothesbrand=${brand.clothesbrand}">${brand.clothesbrand}</a></li>
											</c:forEach>
										</ul> <%
 	}
 %></li>
									<li><a>类型</a> <%
 	if (session.getAttribute("typename") != null) {
 %>
										<ul>
											<c:forEach items="${typename }" var="type">
												<li><a
													href="showShop.do?op=type&clothestype=${type.typename}">${type.typename}</a></li>
											</c:forEach>
										</ul> <%
 	}
 %></li>
									<li><a href="showShop.do?op=shop">全部商品</a></li>
									<li><a href="about-us.jsp">帮助</a>
										<ul>
											<li><a href="contact.jsp">关于我们</a></li>
											<li><a href="contact.jsp">联系我们</a></li>
										</ul></li>
								</ul>
							</nav>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!--移动菜单结束区域 -->
	</div>
	<!--头部结束区域 -->
	<!-- slider-area start -->
	<section class="slider-area">
		<!-- slider start -->
		<div class="slider home2_slider">
			<div id="mainSlider" class="nivoSlider nevo-slider">
				<img src="img/slider/slider-3.jpg" alt="main slider"
					title="#htmlcaption0" /> <img src="img/slider/slider-1.jpg"
					alt="main slider" title="#htmlcaption1" /> <img
					src="img/slider/slider-2.jpg" alt="main slider"
					title="#htmlcaption2" />
			</div>
			<div id="htmlcaption0" class="nivo-html-caption slider-caption">
				<div class="slider-progress"></div>
				<div class="slider-text">
					<div class="middle-text">
						<div class="width-cap">
							<h3 class="slider2-tiile-top home2_slider2-tiile-top top-ani-2">
								<span>纯手工制作</span>
							</h3>
							<h2
								class="slider2-tiile-middle home2_slider2-tiile-middle middle-ani-2">
								<span>Nike</span>
							</h2>
							<div class="slider2-readmore slider2-readmore_home2">
								<a href="#">耐克球鞋</a>
							</div>
							<div class="slider2-shop slider2-shop_home2">
								<a href="#">不要犹豫，放肆起来！</a>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div id="htmlcaption1" class="nivo-html-caption slider-caption">
				<div class="slider-progress"></div>
				<div class="slider-text">
					<div class="middle-text">
						<div class="width-cap">
							<h3 class="slider-tiile-top top-ani-1">
								<span>疯狂夏日</span>
							</h3>
							<h2 class="slider-tiile-middle middle-ani-1">
								<span>凉快说来就来</span>
							</h2>
							<div class="slider-readmore">
								<a href="#">半腰短袖</a>
							</div>
							<div class="slider-shopping">
								<a href="#">不要犹豫</a>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div id="htmlcaption2" class="nivo-html-caption slider-caption">
				<div class="slider-progress"></div>
				<div class="slider-text">
					<div class="middle-text">
						<div class="width-cap">
							<h3 class="slider2-tiile-top top-ani-2">
								<span>真皮包包</span>
							</h3>
							<h2 class="slider2-tiile-middle middle-ani-2">
								<span>Michael Kors</span>
							</h2>
							<div class="slider2-readmore">
								<a href="#">MK时尚女包</a>
							</div>
							<div class="slider2-shop">
								<a href="#">立刻买吧</a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- slider end -->
	</section>
	<!-- slider-area end -->
	<!--start home-2 banner area -->
	<div class="home2_banner_area">
		<div class="container">
			<div class="row">
				<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
					<div class="shopping_world">
						<p>全世界免费送货. 不需要最低呢限度的追捕.</p>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
					<div class="home2_banner_single">
						<div class="home2_banner_one">
							<a href="#"> <img src="img/banner/banner-1.jpg" alt="banner" />
							</a>
						</div>
						<div class="home2_banner_text">
							<h4>真皮包包</h4>
							<h3>6折厂价热销</h3>
						</div>
					</div>
				</div>
				<div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
					<div class="home2_banner_single">
						<div class="home2_banner_one">
							<a href="#"> <img src="img/banner/banner-2.jpg" alt="banner" />
							</a>
						</div>
						<div class="home2_banner_text">
							<h4>品牌服装</h4>
							<h3>全场七折</h3>
						</div>
					</div>
				</div>
				<div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
					<div class="home2_banner_single">
						<div class="home2_banner_one">
							<a href="#"> <img src="img/banner/banner-3.jpg" alt="banner" />
							</a>
						</div>
						<div class="home2_banner_text">
							<h4>潮流鞋</h4>
							<h3>-35% 出售</h3>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!--End home-2 banner area -->
	<!--品牌开始区域 -->



	<%@ include file="brand.jsp"%>




	<!--品牌结束区域 -->
	<!--特色区域      div循环-->
	<div class="feature_area">
		<div class="container">
			<div class="row">
				<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
					<div class="feature_text">
						<h4>本店特色</h4>
					</div>
				</div>
			</div>
			<c:forEach items="${show }" var="s" varStatus="vs">
				<c:if test="${vs.index%4==0 }">
					<div class="row">
				</c:if>
				<div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
					<div class="product_list">
						<div class="single_product">
							<a href="check.do?clothesid=${s.clothesid}" target="main"><img
								src="${s.clothespic}" alt="" /></a>
							<div class="product_details">
								<h2 class="icoFontlist">${s.clothesname}</h2>
								<p>
									<span class="regular_price">￥${s.clothesorigprice }</span> <span
										class="popular_price">￥${s.clothesprice }</span>
								</p>
							</div>
							<div class="product_detail">
								<div class="star_icon">
									<i class="fa fa-star"></i> <i class="fa fa-star"></i> <i
										class="fa fa-star"></i> <i class="fa fa-star"></i> <i
										class="fa fa-star-half-o"></i>
								</div>
								<div class="product_button">
									<div class="cart_details">
										<a href="check.do?clothesid=${s.clothesid}" target="blank">添加购物车</a>
									</div>
									<div class="cart_details">
										<a href="check.do?clothesid=${s.clothesid}" target="expand"><i
											class="fa fa-expand"></i></a>
									</div>
									<div class="cart_details">
										<a href="#" target="heart"><i class="fa fa-heart-o"></i></a>
									</div>
								</div>
							</div>
							<div class="sale_product">
								<h5>售卖</h5>
							</div>
						</div>
					</div>
				</div>
			</c:forEach>


			<div class="row" align="center">
				<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
					<p style="color: black; font-size: 14px; font-family: 宋体">
						<a href="show.do?page=${pages-1}&rows=8"
							style="color: black; font-size: 14px; font-family: 宋体">上一页</a>
						<mt:page href="show.do" total="${total }" rows="8" />
						<a href="show.do?page=${pages+1}&rows=8"
							style="color: black; font-size: 14px; font-family: 宋体">下一页</a> <font
							style="font-weight: bold; color: black; font-size: 14px; font-family: 宋体">${pages}</font>/
						<font
							style="font-weight: bold; color: black; font-size: 14px; font-family: 宋体">${allPage }</font>
						<font style="color: black; font-size: 14px; font-family: 宋体">共
							<font style="font-weight: bold; color: black">${total }</font>条纪录
						</font>

					</p>
				</div>
			</div>
		</div>
	</div>
	<!--特色区域结束 -->
	<!--联系信息区域结束 -->
	<div class="service_info_area home2_service_info">
		<div class="container">
			<div class="row">
				<div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
					<div class="service_list">
						<h2>
							<i class="fa fa-envelope-o"></i> 1628443167@qq.com
						</h2>
					</div>
				</div>
				<div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
					<div class="service_list">
						<h3>
							<i class="fa fa-phone"></i> 15570921217
						</h3>
					</div>
				</div>
				<div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
				<a href="contact.jsp">
					<div class="Social_list">
						<h2 align="center">联系我们</h2>
					</div>
				</a>
				</div>
			</div>
		</div>
	</div>
	<!--联系信息结束区域 -->
	<!--博客开始区域 -->
	<div class="blog_post_area home2_blog_bt">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="feature_text">
						<h4>猜你喜欢</h4>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="carousel_blog_list">
					<div class="col-lg-3">
						<div class="single_blog">
							<a href="#"><img src="img/blog-post-image/cl-1.jpg" alt="" /></a>
							<div class="blog_details">
								<a href="#">William Eto</a>
								<p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit,
									sed diam...</p>
								<h3>18 Aug 2015</h3>
								<a href="#">
									<div class="read_more">
										<i class="fa fa-angle-right"></i>
									</div>
								</a>
							</div>
						</div>
					</div>
					<div class="col-lg-3">
						<div class="single_blog">
							<a href="#"><img src="img/blog-post-image/cl-2.jpg" alt="" /></a>
							<div class="blog_details">
								<a href="#">William Eto</a>
								<p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit,
									sed diam...</p>
								<h3>18 Aug 2015</h3>
								<a href="#">
									<div class="read_more">
										<i class="fa fa-angle-right"></i>
									</div>
								</a>
							</div>
						</div>
					</div>
					<div class="col-lg-3">
						<div class="single_blog">
							<a href="#"><img src="img/blog-post-image/cl-3.jpg" alt="" /></a>
							<div class="blog_details">
								<a href="#">William Eto</a>
								<p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit,
									sed diam...</p>
								<h3>18 Aug 2015</h3>
								<a href="#">
									<div class="read_more">
										<i class="fa fa-angle-right"></i>
									</div>
								</a>
							</div>
						</div>
					</div>
					<div class="col-lg-3">
						<div class="single_blog">
							<a href="#"><img src="img/blog-post-image/cl-4.jpg" alt="" /></a>
							<div class="blog_details">
								<a href="#">William Eto</a>
								<p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit,
									sed diam...</p>
								<h3>18 Aug 2015</h3>
								<a href="#">
									<div class="read_more">
										<i class="fa fa-angle-right"></i>
									</div>
								</a>
							</div>
						</div>
					</div>
					<div class="col-lg-3">
						<div class="single_blog">
							<a href="#"><img src="img/blog-post-image/cl-3.jpg" alt="" /></a>
							<div class="blog_details">
								<a href="#">William Eto</a>
								<p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit,
									sed diam...</p>
								<h3>18 Aug 2015</h3>
								<a href="#">
									<div class="read_more">
										<i class="fa fa-angle-right"></i>
									</div>
								</a>
							</div>
						</div>
					</div>
					<div class="col-lg-3">
						<div class="single_blog">
							<a href="#"><img src="img/blog-post-image/cl-1.jpg" alt="" /></a>
							<div class="blog_details">
								<a href="#">William Eto</a>
								<p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit,
									sed diam...</p>
								<h3>18 Aug 2015</h3>
								<a href="#">
									<div class="read_more">
										<i class="fa fa-angle-right"></i>
									</div>
								</a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!--博客结束 -->
	<!--页尾区域开始 -->
	<%@include file="footer.jsp"%>
	<!--页尾结束 -->
	<!-- jquery JS -->
	<script src="js/vendor/jquery-1.11.3.min.js"></script>
	<!-- fancybox JS -->
	<script src="fancy-box/jquery.fancybox.pack.js"></script>
	<!-- price slider JS  -->
	<script src="js/price-slider.js"></script>
	<!-- Mobile menu JS -->
	<script src="js/jquery.meanmenu.js"></script>
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
	<!-- bootstrap JS -->
	<script src="js/bootstrap.min.js"></script>
	<!-- plugins JS -->
	<script src="js/plugins.js"></script>
	<!-- main JS  -->
	<script src="js/main.js"></script>
	<!-- 弹框js -->
	<script src="js/tankuangAlertBox.min.js"></script>
</body>
</html>
