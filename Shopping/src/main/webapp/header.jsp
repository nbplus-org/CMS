<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
  <!-- 顶部和菜单区域 -->  
  <!--Start Header Top area -->
		<div class="header_area_top"> 
			<div class="container">
				<div class="row">
					<div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
						<!--Start Search area -->
						<form action="#" name="myForm"> 
							<div class="search_box">
								<input name="Name" id="itp" class="input_text" type="text" value="搜索你想要的"/>
								<button type="submit" class="btn-search">
									<span><i class="fa fa-search"></i></span>
								</button>
							</div>
						</form> 
						<!--End Search area -->
					</div>
					<div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
						<!--Start Logo area -->
						<div class="logo"> 
							<a href="index.html">
								<img src="img/logo/logo.png" alt="" />
							</a>
						</div> 
						<!--End Logo area -->
					</div>
					<div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
						<!--Start Header Right Cart area -->
						<div class="account_card_area"> 
							<ul id="account_nav">
								<li><a href="#"><i class="fa fa-key"></i>个人中心</a>
									<div class="account_menu_list">
										
										<div class="account_single_item">
											
											<ul id="account_single_nav_3">
												<li><a href="my-account.html">我的账户</a></li>
												<li><a href="#">我的购物车</a></li>
												<li><a href="#">结账</a></li>
												<li><a href="#">退出</a></li>
											</ul>
											
											
										</div>
										
									</div>
								</li>
								<li><a href="cart.html"><i class="fa fa-shopping-cart"></i>购物车 <span class="cart_zero">2</span></a>
									<div class="cart_down_area">
										<div class="cart_single">
											<a href="#"><img src="img/cart/cart-1.jpg" alt="" /></a>
											<h2><a href="#">Pellentesque hendrerit</a> <a href="#"><span><i class="fa fa-trash"></i></span></a></h2>
											<p>1 x $222.00</p>
										</div>
										<div class="cart_single">
											<a href="#"><img src="img/cart/cart-2.jpg" alt="" /></a>
											<h2><a href="#">Pellentesque hendrerit</a> <a href="#"><span><i class="fa fa-trash"></i></span></a></h2>
											<p>1 x $222.00</p>
										</div>
										<div class="cart_shoptings">
											<a href="checkout.html">结账</a>
										</div>
									</div>
								</li>
							</ul>
						</div> 
						<!--End Header Right Cart area -->
					</div>
				</div>
			</div>
		</div> 
		<!--End Header Top area -->
		<!--Start Main Menu area -->
		<nav class="header_botttom_area">
			<div class="container">
				<div class="row">
					<div class="col-md-12">
						<div class="main_menu">
							<ul id="nav_menu" class="active_cl">
							
								<li><a href="index-2.jsp"><span class="Home">主页</span></a>
								</li>
								
								<li><a href="shop.html"><span class="Clothings">分类</span></a>
									<!--Start Mega Menu area -->
									<div class="mega_menu_list"> 
										<div class="single_megamenu">
											<h2>李宁</h2>
											<div class="items_list">
												<a href="shop.html"><i class="fa fa-angle-right"></i>Devenport</a>
												<a href="shop.html"><i class="fa fa-angle-right"></i>Door Bazar</a>
												<a href="shop.html"><i class="fa fa-angle-right"></i>Digital Software</a>
												<a href="shop.html"><i class="fa fa-angle-right"></i>Dental Care</a>
											</div>
										</div>
										<div class="single_megamenu">
											<h2>安踏</h2>
											<div class="items_list">
												<a href="shop.html"><i class="fa fa-angle-right"></i>Devenport</a>
												<a href="shop.html"><i class="fa fa-angle-right"></i>Door Bazar</a>
												<a href="shop.html"><i class="fa fa-angle-right"></i>Digital Software</a>
												<a href="shop.html"><i class="fa fa-angle-right"></i>Dental Care</a>
											</div>
										</div>
									
									
									</div> 
									<!--End Mega Menu area -->
								</li>
								<li><a href="shop.html"><span class="Lookbook">品牌</span></a>
									<!--Start Mega Menu area -->
									<div class="look_mega_menu"> 
										<div class="look_single">
											<h3>Davenport</h3>
											<div class="items_list_lk">
												<a href="shop.html"><i class="fa fa-angle-right"></i>Gold Ring</a>
												<a href="shop.html"><i class="fa fa-angle-right"></i>Games & Software</a>
											</div>
										</div>
										<div class="look_single">
											<h3>Digital Software</h3>
											<div class="items_list_lk">
												<a href="shop.html"><i class="fa fa-angle-right"></i>Air conditioner</a>
												<a href="shop.html"><i class="fa fa-angle-right"></i>Animals & Nature</a>
											</div>
										</div>
										<div class="look_single">
											<h3>Dental care</h3>
											<div class="items_list_lk">
												<a href="shop.html"><i class="fa fa-angle-right"></i>Apparel</a>
												<a href="shop.html"><i class="fa fa-angle-right"></i>Armoires</a>
											</div>
										</div>
										
									</div> 
									<!--End Mega Menu area -->
								</li>
								<li><a href="blog-left-sidebar.html"><span class="Footwear">类型</span></a>
									<div class="home_mega_menu">
										<a href="blog-left-sidebar.html">Blog Left Sidebar</a>
										<a href="blog-right-sidebar.html">Blog Right Sidebar </a>
										<a href="single-blog.html">Single Blog </a>
									</div>
								</li>
								<li><a href="shop.html"><span class="Sales">全部商品</span></a>
								</li>
								<li><a href="shop.html"><span class="Accessaries">帮助</span></a>
									<div class="home_mega_menu">
										<a href="about-us.jsp">我的账户</a>
										<a href="contact.jsp">购物车</a>
										<a href="cart.jsp">联系我们</a>
										<a href="my-account.jsp">关于我们</a>
									</div>
								</li>
							</ul>
						</div>
					</div>
				</div>
			</div>
			
			<!--start Mobile Menu area（手机菜单样式） -->
			<div class="mobile-menu-area">
				<div class="container">
					<div class="row">
						<div class="col-md-12">
							<div class="mobile-menu">
								<nav id="dropdown">
									<ul>
										<li><a href="http://bootexperts.com/html/hope-preview/hope/index-1.html">主页</a>
										</li>
										
										<li><a href="shop.html">分类</a>
											<ul>										
												<li><a href="shop.html">Learning</a>
													<ul>										
														<li><a href="shop.html">Devenport</a></li>
														<li><a href="shop.html">Door Bazar</a></li>
														<li><a href="shop.html">Digital Software</a></li>
														<li><a href="shop.html">Dental Care</a></li>
													</ul>
												</li>
												<li><a href="shop.html">Lighting</a>
													<ul>										
														<li><a href="shop.html">Devenport</a></li>
														<li><a href="shop.html">Door Bazar</a></li>
														<li><a href="shop.html">Digital Software</a></li>
														<li><a href="shop.html">Dental Care</a></li>
													</ul>
												</li>
												<li><a href="shop.html">Living Room</a></li>
												<li><a href="shop.html">Lamp</a></li>
											</ul>
										</li>
										<li><a href="shop.html">品牌</a>
											<ul>
												<li><a href="shop.html">Gold Ring</a></li>
												<li><a href="shop.html">Games & Software</a></li>
											</ul>
										</li>
										<li><a href="blog.html">类型</a>
											<ul>
												<li><a href="single-blog.html">Single Blog</a></li>
											</ul>
										</li>
										
										<li><a href="shop.html">全部商品</a>
											
											
										</li>
										
										<li><a href="about-us.html">帮助</a>
											<ul>										
												<li><a href="about-us.html">我的账户</a></li>
												<li><a href="contact.html">购物车</a></li>
												<li><a href="contact.html">关于我们</a></li>
												<li><a href="contact.html">联系我们</a></li>
											</ul>
										</li>
									</ul>
								</nav>
							</div>					
						</div>
					</div>
				</div>
			</div>
			<!--End Mobile Menu area -->
			</nav>