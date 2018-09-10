<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    <%@ taglib uri="/WEB-INF/mytld.tld" prefix="mt" %>
<!doctype html>
<html class="no-js" lang="en">
    <head>
		<!-- Basic page needs
        ============================================ --> 
        <meta charset="utf-8">
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <title>万能服装店</title>
        <meta name="description" content="">
		<!-- Mobile specific metas -->
        <meta name="viewport" content="width=device-width, initial-scale=1">
		<!-- FONTS  -->
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
		<!-- main  -->
        <link rel="stylesheet" href="css/main.css">
		<!-- Mobile menu css -->
        <link rel="stylesheet" href="css/meanmenu.min.css">
		<!-- style  -->
        <link rel="stylesheet" href="style.css">
		<!-- Responsive css -->
        <link rel="stylesheet" href="css/responsive.css">
		<!-- modernizr JS  -->
        <script src="js/vendor/modernizr-2.8.3.min.js"></script>
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
        
        
        
        
         <script src="js/jquery-1.9.1.js"></script>
         <script type="text/javascript">
  /*                 function searchByColor(var color){
                	  alert(color);
                	  var clothescolour=$("#clothescolour").html();
                	 var data={
                			 clothescolour:clothescolour,
                	 };
                	 $.post("showShop.do?op=color&clothescolour="+clothescolour,
                		data,
                		function(data){
                		 alert("展示成果");
                	 });
                	  location.reload(); 
                 } */   
         </script>
    </head>
    <body>
        <!--[if lt IE 8]>
            <p class="browserupgrade">You are using an <strong>outdated</strong> browser. Please <a href="http://browsehappy.com/">upgrade your browser</a> to improve your experience.</p>
        <![endif]-->
		<!--Start Header Top area -->

        
        <%@include file="header.jsp" %>

		<!--End Mobile Menu area -->
		<!--End Main Menu area -->
		
		
		
		<!--Start breadcrumbs area -->
		<div class="breadcrumbs_area">
			<div class="container">
				<div class="row">
					<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
						<div class="breadcrumb-single">
							<ul id="breadcrumbs">
								<li><a href="show.do"><i class="fa fa-home"></i>主页</a></li>
								<li><span>Ι</span></li>
								<li>Clothings</li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!--End breadcrumbs area -->
		<!--Start clothing product area -->
		<div class="clothing_product_area">
			<div class="container">
				<div class="row">
					<div class="col-lg-3 col-md-3 col-sm-3 col-xs-12">
						<div class="catagory_price_color">
							
							
							<div class="priceing_area">
								<h2>价格</h2>
								<div class="info_widget">
									<div class="price_filter">
										<div id="slider-range"></div>
										<div class="price_slider_amount">
										<form action="showShop.do?op=price" method="post">
											<input type="text" id="amount" name="price"  placeholder="Add Your Price" />
											<input type="submit"  onclick="Search()" value="Search"/>  
										</form>
										</div>
									</div>
								</div>
							</div>
							
							<div class="catagory_area">
								<%-- <h2>COLOR</h2>
								<ul class="catagory">
								<!--  <form action="searchByColor.do" method="post"> id="clothescolour" onclick="searchByColor(this.text())" -->
								<c:forEach items="${color}" var="c">
									<li ><i class="fa fa-angle-right"></i><a href="showShop.do?op=color&clothescolour=${c.clothescolour}"  name="clothescolour" style="font-size:15px"  >${c.clothescolour}</a></li> 
									<input type="submit"  id="clothescolour" name="clothescolour" onclick="searchByColor()" value="${c.clothescolour}"/>  
                               </c:forEach> --%>
								 <!-- </form> -->	
								<!-- <li><a href="#" id="clothescolour" name="clothescolour" onclick="searchByColor()"><i class="fa fa-angle-right"></i>${color[1].clothescolour}</a><span>(2)</span></li>
					                 <li><a href="searchByColor.do" name="color"><i class="fa fa-angle-right"></i>绿色</a><span>(8)</span></li>
									<li><a href="searchByColor.do" name="color"><i class="fa fa-angle-right"></i>灰色</a><span>(4)</span></li>
									<li><a href="searchByColor.do" name="color"><i class="fa fa-angle-right"></i>红色</a><span>(8)</span></li>
									<li><a href="searchByColor.do" name="color"><i class="fa fa-angle-right"></i>白色</a><span>(6)</span></li> -->
								</ul>
							</div>
						</div>
						<div class="popular_tag_area">
							<div class="popular_items">
								<h2>产品标签</h2>
								<ul id="single_popular">
								<c:forEach items="${tag}" var="t">
									<li><a href="showShop.do?op=tag&clothesbigtag=${t.clothesbigtag }">${t.clothesbigtag }</a></li>
								</c:forEach>
<!-- 									<li><a href="#">aliquet</a></li>
									<li><a href="#">convallis</a></li>
									<li><a href="#">eros</a></li>
									<li><a href="#">facilisis</a></li>
									<li><a href="#">fashion</a></li> -->
								</ul>
							</div>
						</div>
						<div class="row">
							<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
								<div class="popular_tag_area popular_tag_response">
									<div class="popular_items">
										<h2>COMPARE PRODUCTS</h2>
										<div class="conpany_product_details">
											<p>You have no items to compare.</p>
											<a href="#"><img src="img/banner/banner_left.jpg" alt="" /></a>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
								<div class="popular_tag_area">
									<div class="popular_items">
										<h2>BESTSELLERS</h2>
									</div>
								</div>
								<div class="clothing_carousel_list">
									<div class="single_clothing_product">
										<div class="clothing_item">
											<img src="img/bestseller/4.jpg" alt="" />
											<div class="product_clothing_details">
												<h2><a href="#">Nam ullamcorper vive</a></h2>
												<i class="fa fa-star"></i>
												<i class="fa fa-star"></i>
												<i class="fa fa-star"></i>
												<i class="fa fa-star"></i>
												<i class="fa fa-star"></i>
												<p>$123.00</p>
											</div>
										</div>
										<div class="clothing_item">
											<img src="img/bestseller/6_1.jpg" alt="" />
											<div class="product_clothing_details">
												<h2><a href="#">Nam ullamcorper vive</a></h2>
												<i class="fa fa-star"></i>
												<i class="fa fa-star"></i>
												<i class="fa fa-star"></i>
												<i class="fa fa-star"></i>
												<i class="fa fa-star"></i>
												<p>$123.00</p>
											</div>
										</div>
										<div class="clothing_item">
											<img src="img/bestseller/8.jpg" alt="" />
											<div class="product_clothing_details">
												<h2><a href="#">Nam ullamcorper vive</a></h2>
												<i class="fa fa-star"></i>
												<i class="fa fa-star"></i>
												<i class="fa fa-star"></i>
												<i class="fa fa-star"></i>
												<i class="fa fa-star"></i>
												<p>$123.00</p>
											</div>
										</div>
									</div>
									<div class="single_clothing_product">
										<div class="clothing_item">
											<img src="img/bestseller/10.jpg" alt="" />
											<div class="product_clothing_details">
												<h2><a href="#">Nam ullamcorper vive</a></h2>
												<i class="fa fa-star"></i>
												<i class="fa fa-star"></i>
												<i class="fa fa-star"></i>
												<i class="fa fa-star"></i>
												<i class="fa fa-star"></i>
												<p>$123.00</p>
											</div>
										</div>
										<div class="clothing_item">
											<img src="img/bestseller/11_1.jpg" alt="" />
											<div class="product_clothing_details">
												<h2><a href="#">Nam ullamcorper vive</a></h2>
												<i class="fa fa-star"></i>
												<i class="fa fa-star"></i>
												<i class="fa fa-star"></i>
												<i class="fa fa-star"></i>
												<i class="fa fa-star"></i>
												<p>$123.00</p>
											</div>
										</div>
										<div class="clothing_item">
											<img src="img/bestseller/16.jpg" alt="" />
											<div class="product_clothing_details">
												<h2><a href="#">Nam ullamcorper vive</a></h2>
												<i class="fa fa-star"></i>
												<i class="fa fa-star"></i>
												<i class="fa fa-star"></i>
												<i class="fa fa-star"></i>
												<i class="fa fa-star"></i>
												<p>$123.00</p>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="col-lg-9 col-md-9 col-sm-9 col-xs-12">
					
					     <!-- 样式 -->
					     
					     
						<div class="row">
							<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
							
								<div class="catagory_banner">
									 <img src="img/banner/category.jpg" alt="" /> 
								</div>
								
							</div>
						</div>
						
						<div class="my_tabs">
							<ul class="tab_style">
								<li class="active"><a data-toggle="tab" href="#tab1"><span><i class="fa fa-th"></i></span></a></li>
								<li><a data-toggle="tab" href="#tab2"><span><i class="fa fa-th-list"></i></span></a></li>
							</ul>
							<div class="limiter">
								<label>Show</label>
								<select>
									<option value="">9</option>
									<option value="" selected="selected">12</option>
									<option value="">24</option>
									<option value="">36</option>
								</select> per page        
							</div>
							<div class="sort-by">
								<label>Sort By</label>
								<select id="sort" name="sort">
									<option value="Name" selected="selected">Name</option>
									<option value="Price">Price</option>
								</select>
								<a href=""><i class="fa fa-long-arrow-up"></i></a>
							</div> -
							<div class="tab-content tab_content_style">
								<div id="tab1" class="tab-pane fade in active">
							 <c:forEach items="${show }" var="s" varStatus="vs">
				             <%-- <c:if test="${vs.index%3==0 }">
									<div class="row">
							 </c:if> --%>
										<div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
											<div class="product_list">
												<div class="single_product repomsive_768">
													<a href="check.do?clothesid=${s.clothesid}" target="main"><img src="${s.clothespic}" alt="" /></a>
													<div class="product_details">
														<h2 class="icoFontlist" title="${s.clothesname}">${s.clothesname}</h2>
														<p><span class="regular_price">￥${s.clothesorigprice }</span> <span class="popular_price">￥${s.clothesprice }</span></p>
													</div>
													<div class="product_detail">
														<div class="star_icon">
															<i class="fa fa-star"></i>
															<i class="fa fa-star"></i>
															<i class="fa fa-star"></i>
															<i class="fa fa-star"></i>
															<i class="fa fa-star-half-o"></i>
														</div>
														<div class="product_button">
															<div class="cart_details">
																<a href="check.do?clothesid=${s.clothesid}" target="blank">添加购物车</a>
															</div>
															<div class="cart_details">
																<a href="#" target="expand"><i class="fa fa-expand"></i></a>
															</div>
															<div class="cart_details">
																<a href="#" target="heart"><i class="fa fa-heart-o"></i></a>
															</div>
														</div>
													</div>
												</div>
											</div>
										</div>
							 <%-- <c:if test="${vs.index%3==0 }">
									</div>
							 </c:if> --%>
										
								</c:forEach>
																						
									</div>
									<br>
									<div class="row" align="center">
										<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
										<%-- <%if(request.getSession().getAttribute("op")!=null) %> --%>
											 <p style="color: black; font-size: 14px; font-family: 宋体">
					                            <a href="showShop.do?op=${op}&${type}=${value}&page=${pages-1}&rows=6"
						                       style="color: black; font-size: 14px; font-family: 宋体">上一页</a>  		
					                           <mt:page href="showShop.do?op=${op}&${type}=${value}" total="${total }" rows="6" />
					                          <a href="showShop.do?op=${op}&${type}=${value}&page=${pages+1}&rows=6"
						                       style="color:black; font-size: 14px; font-family: 宋体">下一页</a>  
					                           <font style="font-weight: bold;color:black; font-size: 14px; font-family: 宋体">${pages}</font>/
					                           <font style="font-weight: bold;color: black; font-size: 14px; font-family: 宋体">${allPage }</font>
					                           <font style="color: black; font-size: 14px; font-family: 宋体">共
					                           <font style="font-weight: bold;color:black">${total }</font>条纪录</font>
										</div>
									</div>
								</div>
						<%-- 	 	<div id="tab2" class="tab-pane fade">
									<div class="row">
										<div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
											<div class="product_blog_image">
												<div class="product_blog_image">
													<a href="product.html"><img src="img/product/1.jpg" alt="" /></a>
												</div>
											</div>
										</div>
										<div class="col-lg-8 col-md-8 col-sm-12 col-xs-12">
											<div class="blog_product_details">
												<h2 class="blog_heading"><a href="">Lorem ipsum dolor</a></h2>
												<div class="product_rating">
													<i class="fa fa-star"></i>
													<i class="fa fa-star"></i>
													<i class="fa fa-star"></i>
													<i class="fa fa-star"></i>
													<i class="fa fa-star"></i>
												</div>
												<div class="product_rating">
													<a href="#">1 Review(s) <span>I</span></a>
													<a href="#"> Add Your Review</a>
												</div>
												<div class="pricing_rate">
													<p class="rating_dollor"><span class="rating_value_one">$170.00</span> <span class="rating_value_two">$150.00</span></p>
													<p class="blog_texts">Nunc facilisis sagittis ullamcorper. Proin lectus ipsum, gravida et mattis vulputate, tristique ut lectus. Sed et lorem nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Aenean eleifend laoreet congue. Vivamus adipiscing nisl ut dolor dignissim semper. Nulla luctus malesuada tincidunt. Class aptent taciti sociosqu ad litora torquent per conubia nostra, p <a class="learn_more" href="#">Learn More</a></p>
												</div>
												<div class="product_blog_button">
													<div class="cart_blog_details">
														<a href="#" target="blank">Add to cart</a>
													</div>
													<div class="cart_blog_details">
														<a href="#" target="expand"><i class="fa fa-expand"></i></a>
													</div>
													<div class="cart_blog_details">
														<a href="#" target="heart"><i class="fa fa-heart-o"></i></a>
													</div>
												</div>
											</div>
										</div>
									</div>
									<div class="row">
										<div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
											<div class="product_blog_image">
												<div class="product_blog_image">
													<a href="product.html"><img src="img/product/4.jpg" alt="" /></a>
												</div>
											</div>
										</div>
										<div class="col-lg-8 col-md-8 col-sm-12 col-xs-12">
											<div class="blog_product_details">
												<h2 class="blog_heading"><a href="">Lorem ipsum dolor</a></h2>
												<div class="product_rating">
													<i class="fa fa-star"></i>
													<i class="fa fa-star"></i>
													<i class="fa fa-star"></i>
													<i class="fa fa-star"></i>
													<i class="fa fa-star"></i>
												</div>
												<div class="product_rating">
													<a href="#">1 Review(s) <span>I</span></a>
													<a href="#"> Add Your Review</a>
												</div>
												<div class="pricing_rate">
													<p class="rating_dollor"><span class="rating_value_one">$170.00</span> <span class="rating_value_two">$150.00</span></p>
													<p class="blog_texts">Nunc facilisis sagittis ullamcorper. Proin lectus ipsum, gravida et mattis vulputate, tristique ut lectus. Sed et lorem nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Aenean eleifend laoreet congue. Vivamus adipiscing nisl ut dolor dignissim semper. Nulla luctus malesuada tincidunt. Class aptent taciti sociosqu ad litora torquent per conubia nostra, p <a class="learn_more" href="#">Learn More</a></p>
												</div>
												<div class="product_blog_button">
													<div class="cart_blog_details">
														<a href="#" target="blank">Add to cart</a>
													</div>
													<div class="cart_blog_details">
														<a href="#" target="expand"><i class="fa fa-expand"></i></a>
													</div>
													<div class="cart_blog_details">
														<a href="#" target="heart"><i class="fa fa-heart-o"></i></a>
													</div>
												</div>
											</div>
										</div>
									</div>
									<div class="row">
										<div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
											<div class="product_blog_image">
												<div class="product_blog_image">
													<a href="product.html"><img src="img/product/6_1.jpg" alt="" /></a>
												</div>
											</div>
										</div>
										<div class="col-lg-8 col-md-8 col-sm-12 col-xs-12">
											<div class="blog_product_details">
												<h2 class="blog_heading"><a href="">Lorem ipsum dolor</a></h2>
												<div class="product_rating">
													<i class="fa fa-star"></i>
													<i class="fa fa-star"></i>
													<i class="fa fa-star"></i>
													<i class="fa fa-star"></i>
													<i class="fa fa-star"></i>
												</div>
												<div class="product_rating">
													<a href="#">1 Review(s) <span>I</span></a>
													<a href="#"> Add Your Review</a>
												</div>
												<div class="pricing_rate">
													<p class="rating_dollor"><span class="rating_value_one">$170.00</span> <span class="rating_value_two">$150.00</span></p>
													<p class="blog_texts">Nunc facilisis sagittis ullamcorper. Proin lectus ipsum, gravida et mattis vulputate, tristique ut lectus. Sed et lorem nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Aenean eleifend laoreet congue. Vivamus adipiscing nisl ut dolor dignissim semper. Nulla luctus malesuada tincidunt. Class aptent taciti sociosqu ad litora torquent per conubia nostra, p <a class="learn_more" href="#">Learn More</a></p>
												</div>
												<div class="product_blog_button">
													<div class="cart_blog_details">
														<a href="#" target="blank">Add to cart</a>
													</div>
													<div class="cart_blog_details">
														<a href="#" target="expand"><i class="fa fa-expand"></i></a>
													</div>
													<div class="cart_blog_details">
														<a href="#" target="heart"><i class="fa fa-heart-o"></i></a>
													</div>
												</div>
											</div>
										</div>
									</div>
									<div class="row">
										<div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
											<div class="product_blog_image">
												<div class="product_blog_image">
													<a href="product.html"><img src="img/product/12_1.jpg" alt="" /></a>
												</div>
											</div>
										</div>
										<div class="col-lg-8 col-md-8 col-sm-12 col-xs-12">
											<div class="blog_product_details">
												<h2 class="blog_heading"><a href="">Lorem ipsum dolor</a></h2>
												<div class="product_rating">
													<i class="fa fa-star"></i>
													<i class="fa fa-star"></i>
													<i class="fa fa-star"></i>
													<i class="fa fa-star"></i>
													<i class="fa fa-star"></i>
												</div>
												<div class="product_rating">
													<a href="#">1 Review(s) <span>I</span></a>
													<a href="#"> Add Your Review</a>
												</div>
												<div class="pricing_rate">
													<p class="rating_dollor"><span class="rating_value_one">$170.00</span> <span class="rating_value_two">$150.00</span></p>
													<p class="blog_texts">Nunc facilisis sagittis ullamcorper. Proin lectus ipsum, gravida et mattis vulputate, tristique ut lectus. Sed et lorem nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Aenean eleifend laoreet congue. Vivamus adipiscing nisl ut dolor dignissim semper. Nulla luctus malesuada tincidunt. Class aptent taciti sociosqu ad litora torquent per conubia nostra, p <a class="learn_more" href="#">Learn More</a></p>
												</div>
												<div class="product_blog_button">
													<div class="cart_blog_details">
														<a href="#" target="blank">Add to cart</a>
													</div>
													<div class="cart_blog_details">
														<a href="#" target="expand"><i class="fa fa-expand"></i></a>
													</div>
													<div class="cart_blog_details">
														<a href="#" target="heart"><i class="fa fa-heart-o"></i></a>
													</div>
												</div>
											</div>
										</div>
									</div>
									<div class="row">
										<div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
											<div class="product_blog_image">
												<div class="product_blog_image">
													<a href="product.html"><img src="img/product/18_1.jpg" alt="" /></a>
												</div>
											</div>
										</div>
										<div class="col-lg-8 col-md-8 col-sm-12 col-xs-12">
											<div class="blog_product_details">
												<h2 class="blog_heading"><a href="">Lorem ipsum dolor</a></h2>
												<div class="product_rating">
													<i class="fa fa-star"></i>
													<i class="fa fa-star"></i>
													<i class="fa fa-star"></i>
													<i class="fa fa-star"></i>
													<i class="fa fa-star"></i>
												</div>
												<div class="product_rating">
													<a href="#">1 Review(s) <span>I</span></a>
													<a href="#"> Add Your Review</a>
												</div>
												<div class="pricing_rate">
													<p class="rating_dollor"><span class="rating_value_one">$170.00</span> <span class="rating_value_two">$150.00</span></p>
													<p class="blog_texts">Nunc facilisis sagittis ullamcorper. Proin lectus ipsum, gravida et mattis vulputate, tristique ut lectus. Sed et lorem nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Aenean eleifend laoreet congue. Vivamus adipiscing nisl ut dolor dignissim semper. Nulla luctus malesuada tincidunt. Class aptent taciti sociosqu ad litora torquent per conubia nostra, p <a class="learn_more" href="#">Learn More</a></p>
												</div>
												<div class="product_blog_button">
													<div class="cart_blog_details">
														<a href="#" target="blank">Add to cart</a>
													</div>
													<div class="cart_blog_details">
														<a href="#" target="expand"><i class="fa fa-expand"></i></a>
													</div>
													<div class="cart_blog_details">
														<a href="#" target="heart"><i class="fa fa-heart-o"></i></a>
													</div>
												</div>
											</div>
										</div>
									</div>
									<div class="row">
										<div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
											<div class="product_blog_image">
												<div class="product_blog_image">
													<a href="product.html"><img src="img/product/13_4.jpg" alt="" /></a>
												</div>
											</div>
										</div>
										<div class="col-lg-8 col-md-8 col-sm-12 col-xs-12">
											<div class="blog_product_details">
												<h2 class="blog_heading"><a href="">Lorem ipsum dolor</a></h2>
												<div class="product_rating">
													<i class="fa fa-star"></i>
													<i class="fa fa-star"></i>
													<i class="fa fa-star"></i>
													<i class="fa fa-star"></i>
													<i class="fa fa-star"></i>
												</div>
												<div class="product_rating">
													<a href="#">1 Review(s) <span>I</span></a>
													<a href="#"> Add Your Review</a>
												</div>
												<div class="pricing_rate">
													<p class="rating_dollor"><span class="rating_value_one">$170.00</span> <span class="rating_value_two">$150.00</span></p>
													<p class="blog_texts">Nunc facilisis sagittis ullamcorper. Proin lectus ipsum, gravida et mattis vulputate, tristique ut lectus. Sed et lorem nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Aenean eleifend laoreet congue. Vivamus adipiscing nisl ut dolor dignissim semper. Nulla luctus malesuada tincidunt. Class aptent taciti sociosqu ad litora torquent per conubia nostra, p <a class="learn_more" href="#">Learn More</a></p>
												</div>
												<div class="product_blog_button">
													<div class="cart_blog_details">
														<a href="#" target="blank">Add to cart</a>
													</div>
													<div class="cart_blog_details">
														<a href="#" target="expand"><i class="fa fa-expand"></i></a>
													</div>
													<div class="cart_blog_details">
														<a href="#" target="heart"><i class="fa fa-heart-o"></i></a>
													</div>
												</div>
											</div>
										</div>
									</div>
									<div class="row">
										<div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
											<div class="product_blog_image">
												<div class="product_blog_image">
													<a href="product.html"><img src="img/product/14_3.jpg" alt="" /></a>
												</div>
											</div>
										</div>
										<div class="col-lg-8 col-md-8 col-sm-12 col-xs-12">
											<div class="blog_product_details">
												<h2 class="blog_heading"><a href="">Lorem ipsum dolor</a></h2>
												<div class="product_rating">
													<i class="fa fa-star"></i>
													<i class="fa fa-star"></i>
													<i class="fa fa-star"></i>
													<i class="fa fa-star"></i>
													<i class="fa fa-star"></i>
												</div>
												<div class="product_rating">
													<a href="#">1 Review(s) <span>I</span></a>
													<a href="#"> Add Your Review</a>
												</div>
												<div class="pricing_rate">
													<p class="rating_dollor"><span class="rating_value_one">$170.00</span> <span class="rating_value_two">$150.00</span></p>
													<p class="blog_texts">Nunc facilisis sagittis ullamcorper. Proin lectus ipsum, gravida et mattis vulputate, tristique ut lectus. Sed et lorem nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Aenean eleifend laoreet congue. Vivamus adipiscing nisl ut dolor dignissim semper. Nulla luctus malesuada tincidunt. Class aptent taciti sociosqu ad litora torquent per conubia nostra, p <a class="learn_more" href="#">Learn More</a></p>
												</div>
												<div class="product_blog_button">
													<div class="cart_blog_details">
														<a href="#" target="blank">Add to cart</a>
													</div>
													<div class="cart_blog_details">
														<a href="#" target="expand"><i class="fa fa-expand"></i></a>
													</div>
													<div class="cart_blog_details">
														<a href="#" target="heart"><i class="fa fa-heart-o"></i></a>
													</div>
												</div>
											</div>
										</div>
									</div>
									<div class="row">
										<div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
											<div class="product_blog_image">
												<div class="product_blog_image">
													<a href="product.html"><img src="img/product/16.jpg" alt="" /></a>
												</div>
											</div>
										</div>
										<div class="col-lg-8 col-md-8 col-sm-12 col-xs-12">
											<div class="blog_product_details">
												<h2 class="blog_heading"><a href="">Lorem ipsum dolor</a></h2>
												<div class="product_rating">
													<i class="fa fa-star"></i>
													<i class="fa fa-star"></i>
													<i class="fa fa-star"></i>
													<i class="fa fa-star"></i>
													<i class="fa fa-star"></i>
												</div>
												<div class="product_rating">
													<a href="#">1 Review(s) <span>I</span></a>
													<a href="#"> Add Your Review</a>
												</div>
												<div class="pricing_rate">
													<p class="rating_dollor"><span class="rating_value_one">$170.00</span> <span class="rating_value_two">$150.00</span></p>
													<p class="blog_texts">Nunc facilisis sagittis ullamcorper. Proin lectus ipsum, gravida et mattis vulputate, tristique ut lectus. Sed et lorem nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Aenean eleifend laoreet congue. Vivamus adipiscing nisl ut dolor dignissim semper. Nulla luctus malesuada tincidunt. Class aptent taciti sociosqu ad litora torquent per conubia nostra, p <a class="learn_more" href="#">Learn More</a></p>
												</div>
												<div class="product_blog_button">
													<div class="cart_blog_details">
														<a href="#" target="blank">Add to cart</a>
													</div>
													<div class="cart_blog_details">
														<a href="#" target="expand"><i class="fa fa-expand"></i></a>
													</div>
													<div class="cart_blog_details">
														<a href="#" target="heart"><i class="fa fa-heart-o"></i></a>
													</div>
												</div>
											</div>
										</div>
									</div>
									<div class="row">
										<div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
											<div class="product_blog_image">
												<div class="product_blog_image">
													<a href="product.html"><img src="img/product/17_2_1_1.jpg" alt="" /></a>
												</div>
											</div>
										</div>
										<div class="col-lg-8 col-md-8 col-sm-12 col-xs-12">
											<div class="blog_product_details">
												<h2 class="blog_heading"><a href="">Lorem ipsum dolor</a></h2>
												<div class="product_rating">
													<i class="fa fa-star"></i>
													<i class="fa fa-star"></i>
													<i class="fa fa-star"></i>
													<i class="fa fa-star"></i>
													<i class="fa fa-star"></i>
												</div>
												<div class="product_rating">
													<a href="#">1 Review(s) <span>I</span></a>
													<a href="#"> Add Your Review</a>
												</div>
												<div class="pricing_rate">
													<p class="rating_dollor"><span class="rating_value_one">$170.00</span> <span class="rating_value_two">$150.00</span></p>
													<p class="blog_texts">Nunc facilisis sagittis ullamcorper. Proin lectus ipsum, gravida et mattis vulputate, tristique ut lectus. Sed et lorem nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Aenean eleifend laoreet congue. Vivamus adipiscing nisl ut dolor dignissim semper. Nulla luctus malesuada tincidunt. Class aptent taciti sociosqu ad litora torquent per conubia nostra, p <a class="learn_more" href="#">Learn More</a></p>
												</div>
												<div class="product_blog_button">
													<div class="cart_blog_details">
														<a href="#" target="blank">Add to cart</a>
													</div>
													<div class="cart_blog_details">
														<a href="#" target="expand"><i class="fa fa-expand"></i></a>
													</div>
													<div class="cart_blog_details">
														<a href="#" target="heart"><i class="fa fa-heart-o"></i></a>
													</div>
												</div>
											</div>
										</div>
									</div>
									<div class="row">
										<div class="col-lg-12">
											<div class="blog_pagination">
												<h2>Page:</h2>
												<ul class="pagination_list">
													<li class="active">1</li>
													<li><a href="#">2</a></li>
													<li><a href="#">3</a></li>
													<li><a href="#"><img src="img/arrow/pager_arrow_right.gif" alt="" /></a></li>
												</ul>
											</div>
										</div>
									</div>
								</div>    --%>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!--End clothing product area -->
		
		<!--Start Branding area -->
	    <%@ include file="brand.jsp" %>
		<!--End Branding area -->
		
		<!--Start Footer area -->
	    
	    <%@include file="footer.jsp" %>
	    
	    
		<!--End footer area -->
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
