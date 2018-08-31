<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    <%@ taglib uri="/WEB-INF/mytld.tld" prefix="mt" %>
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
							<a href="showShop.do?op=shop">
								<img src="img/logo/logo.png" alt="" />
							</a>
						</div> 
						<!--End Logo area -->
					</div>
					<div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
						<!--Start Header Right Cart area -->
						<div class="account_card_area"> 
							<ul id="account_nav">
								<li><a><i class="fa fa-key"></i>个人中心</a>
									<div class="account_menu_list">
										
										<div class="account_single_item">
											
											<ul id="account_single_nav_3">
												<li><a href="reglogin.jsp">我的账户</a></li>
												<li><a href="showCart.do">我的购物车</a></li>
												<li><a href="#">结账</a></li>
												<li><a href="reglogin.jsp">退出</a></li>
											</ul>
											
											
										</div>
										
									</div>
								</li>
								<%if(request.getSession().getAttribute("UserVO") != null && session.getAttribute("cartcount")!=null) {%>
								<li><a href="showCart.do"><i class="fa fa-shopping-cart"></i>购物车 <span class="cart_zero cart_zero1">${cartcount }</span></a>
										<%} else { %> 
								<li><a href="showCart.do"><i class="fa fa-shopping-cart"></i>购物车 <span ></span></a>
										<%} %>  
									<div class="cart_down_area">
									<%if(request.getSession().getAttribute("UserVO") != null && session.getAttribute("cart")!=null) {%>
										  <c:forEach items="${cart }" var="cart"> 
										<div class="cart_single">
											<a href="check.do?clothesid=${cart.clothesid}"><img src="upload/${cart.clothespic }" width="50px" height="50px" alt="" /></a>
											<h2><a href="check.do?clothesid=${cart.clothesid}">${cart.clothesname}</a> <a href="trash.do?cartid=${cart.cartid}"><span><i class="fa fa-trash"></i></span></a></h2>
											<p>${cart.cnum } x $${cart.clothesprice }</p>
										</div>
                                         </c:forEach> 
										<div class="cart_shoptings">
											<a href="checkout.jsp">结账</a>
										</div>
										<%} else { %>  
										    <div class="cart_shoptings">
												<a href="#">结账</a>
											</div>
										 <%} %> 
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
							
								<li><a href="show.do"><span class="Home">主页</span></a>
								</li>
								
								<li><a><span class="Clothings">分类</span></a>
									<!--Start Mega Menu area -->
									<div class="mega_menu_list"> 
										<div class="single_megamenu">
										<%if(session.getAttribute("clothesbigtag")!=null){%>
											  <c:forEach items="${clothesbigtag }" var="tag">  
													<h2><i class="fa fa-angle-right"></i><a href="showShop.do?op=tag&clothesbigtag=${tag.clothesbigtag }">${tag.clothesbigtag}</a></h2>
											 </c:forEach> 
										<%}%>
										</div>								
									</div> 
									<!--End Mega Menu area -->
								</li>
								<li><a><span class="Lookbook">品牌</span></a>
									<!--Start Mega Menu area -->
									<div class="mega_menu_list menu_home2_list" id="list"> 
										<div class="single_megamenu">
										<%if(session.getAttribute("clothesbrand")!=null){%>
											 <c:forEach items="${clothesbrand }" var="brand"> 
											    <h2><i class="fa fa-angle-right"></i><a href="showShop.do?op=brand&clothesbrand=${brand.clothesbrand}">${brand.clothesbrand}</a></h2>				
											 </c:forEach> 
										<%}%>
										</div>										
									</div> 
									<!--End Mega Menu area -->
								</li>
								<li><a><span class="Footwear">类型</span></a>
									<div class="mega_menu_list menu_home2_list" id="list">
									<div class="single_megamenu">
									<%if(session.getAttribute("typename")!=null){%>
										 <c:forEach items="${typename }" var="type"> 
											<h2><i class="fa fa-angle-right"></i><a href="showShop.do?op=type&clothestype=${type.typename}">${type.typename}</a></h2>				
										 </c:forEach> 
									<%}%>
									</div>
									</div>
								</li>
								<li><a href="showShop.do?op=shop"><span class="Sales">全部商品</span></a>
								</li>
								<li><a href="shop.jsp"><span class="Accessaries">帮助</span></a>
									<div class="home_mega_menu">
										<a href="reglogin.jsp">我的账户</a>
										<a href="showCart.do">购物车</a>
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
										<li><a href="show.do">主页</a>
										</li>
									
									
										<li><a>分类</a>																														
											<%if(session.getAttribute("clothesbigtag")!=null){%>
											<ul>
											  <c:forEach items="${clothesbigtag }" var="tag">  
		                                            <li><a href="showShop.do?op=tag&clothesbigtag=${tag.clothesbigtag }">${tag.clothesbigtag}</a>
										     </c:forEach> 
										    </ul>
										   <%}%>
										</li>
                                  
								   	
										<li><a >品牌</a>
											
										<%if(session.getAttribute("clothesbrand")!=null){%>
										<ul>	
											 <c:forEach items="${clothesbrand }" var="brand"> 
											 	<li><a href="showShop.do?op=brand&clothesbrand=${brand.clothesbrand}">${brand.clothesbrand}</a></li>
											 </c:forEach> 
										</ul>
										<%}%>
											
										</li>
								  
								 
										<li><a>类型</a>	
									<%if(session.getAttribute("typename")!=null){%>
									<ul>
										 <c:forEach items="${typename }" var="type"> 
										 	<li><a href="showShop.do?op=type&clothestype=${type.typename}">${type.typename}</a></li>
										 </c:forEach> 
									</ul>
									<%}%>										
										</li>
								 	
								
										<li><a href="showShop.do?op=shop">全部商品</a>	
										</li>
								  
								  			
										<li><a href="about-us.jsp">帮助</a>
											<ul>										
												<li><a href="reglogin.jsp">我的账户</a></li>
												<li><a href="showCart.do">购物车</a></li>
												<li><a href="contact.jsp">关于我们</a></li>
												<li><a href="contact.jsp">联系我们</a></li>
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