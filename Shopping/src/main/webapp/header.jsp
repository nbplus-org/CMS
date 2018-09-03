<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="/WEB-INF/mytld.tld" prefix="mt"%>
<!-- 顶部和菜单区域 -->
<!--Start Header Top area -->

<!-- <script language="javascript" type="text/javascript">
	function click1(num) {

		if (document.getElementById(num).style.display == "block") {
			document.getElementById(num).style.display = "none";
		} else {
			document.getElementById(num).style.display = "block";

		}

	}
</script> -->
<!-- <script type="text/javascript">
		$(function() {
			window.location.href = "show.do";
		})
	</script> -->
<div class="header_area_top">
	<div class="container">
		<div class="row">
			<div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
				<!--Start Search area -->
				<form action="#" name="myForm">
					<div class="search_box">
						<input name="Name" id="itp" class="input_text" type="text"
							placeholder="搜索你想要的" />
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
					<a href="showShop.do?op=shop"> <img src="img/logo/logo.png"
						alt="" />
					</a>
				</div>
				<!--End Logo area -->
			</div>
			<div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
				<!--Start Header Right Cart area -->
				<div class="account_card_area">
					<ul id="account_nav">

						<li><c:if test="${sessionScope.UserVO!=null }">
								<a><i class="fa fa-key"></i>${sessionScope.UserVO.uname }</a>
							</c:if> <c:if test="${sessionScope.UserVO==null }">
								<a href="reglogin.jsp"><i class="fa fa-key"></i>请登陆</a>
							</c:if>

							<div class="account_menu_list">

								<div class="account_single_item">

									<ul id="account_single_nav_3">
										<li><a href="showCart.do">我的购物车</a></li>
										<li><a href="seeorder.do">我的订单</a></li>
										<li><a href="outLog.do">退出登陆</a></li>
									</ul>


								</div>

							</div></li>
						<%
							if (request.getSession().getAttribute("UserVO") != null && session.getAttribute("cartcount") != null) {
						%>
						<li><a href="showCart.do"><i class="fa fa-shopping-cart"></i>购物车
								<span class="cart_zero cart_zero1">${cartcount }</span></a> <%
 	} else {
 %>
						<li><a href="showCart.do"><i class="fa fa-shopping-cart"></i>购物车
								<span></span></a> <%
 	}
 %>
							<div class="cart_down_area">
								<%
									if (request.getSession().getAttribute("UserVO") != null && session.getAttribute("cart") != null) {
								%>
								<c:forEach items="${cart }" var="cart">
									<div class="cart_single">
										<a href="check.do?clothesid=${cart.clothesid}"><img
											src="upload/${cart.clothespic }" width="50px" height="50px"
											alt="" /></a>
										<h2>
											<a href="check.do?clothesid=${cart.clothesid}">${cart.clothesname}</a>
											<a href="trash.do?cartid=${cart.cartid}"><span><i
													class="fa fa-trash"></i></span></a>
										</h2>
										<p>${cart.cnum }x$${cart.clothesprice}</p>
									</div>
								</c:forEach>
								<div class="cart_shoptings">
									<a href="checkout.jsp">结账</a>
								</div>
								<%
									} else {
								%>
								<div class="cart_shoptings">
									<a href="#">结账</a>
								</div>
								<%
									}
								%>
							</div></li>
					</ul>
				</div>
				<!--End Header Right Cart area -->
			</div>
		</div>
	</div>
</div>
<!--End Header Top area -->
<!--Start Main Menu area -->

<!--服装分类选择开始  -->
<%
	if (request.getSession().getAttribute("clothesbigtag") == null) {
%>
<script type="text/javascript">
	window.location.href = "show.do";
</script>
<%
	}
%>

<div class="header_botttom_area">
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<div class="main_menu">
					<ul id="nav_menu" class="active_cl">
						<li><a href="show.do"><span class="Home">主页</span></a></li>
						<!--=======大标签开始循环============ -->
						<li><a><span class="Clothings">分类</span></a>
							<div class="mega_menu_list">
								<c:forEach items="${clothesbigtag}" var="bigtag">

									<div class="single_megamenu">
										<!-- 大标签的循环输出 -->
										<h2>
											<a href="shop.html">${bigtag.clothesbigtag }</a>&nbsp;&nbsp;&nbsp;
										</h2>

									</div>
								</c:forEach>
							</div></li>

						<li><a><span class="Clothings">品牌</span></a>
							<div class="mega_menu_list">
								<c:forEach items="${clothesbrand}" var="brand" varStatus="num">
									<c:if test="${num.index<5 }">
										<div class="single_megamenu">
											<!-- 大标签的循环输出 -->
											<h2>
												<a href="shop.html">${brand.clothesbrand }</a>
											</h2>
										</div>
									</c:if>
								</c:forEach>
								<h2 align="left">......</h2>
							</div></li>

						<%-- <%
										if (session.getAttribute("clothesbrand") != null) {
									%>
									<c:forEach items="${clothesbrand }" var="brand">
										<h2>
											<i class="fa fa-angle-right"></i><a
												href="showShop.do?op=brand&clothesbrand=${brand.clothesbrand}">${brand.clothesbrand}</a>
										</h2>
									</c:forEach>
									<%
										}
									%> --%>

						<li><a><span class="Clothings">款式</span></a>
							<div class="mega_menu_list">
								<c:forEach items="${typename}" var="typename">

									<div class="single_megamenu">
										<!-- 大标签的循环输出 -->
										<h2>
											<a href="shop.html">${typename.typename }</a>&nbsp;&nbsp;&nbsp;
										</h2>

									</div>
								</c:forEach>
							</div></li>
						<li><a href="shop.jsp"><span class="Accessaries">帮助</span></a>
							<div class="home_mega_menu">
								<c:if test="${UserVO!=null }">
									<a href="index.jsp">我的账户</a>
								</c:if>
								<c:if test="${UserVO=null }">
									<a onclick="goLogin">我的账户</a>
								</c:if>
								<c:if test="${UserVO!=null }">
									<a href="showCart.do">购物车</a>
								</c:if>
								<c:if test="${UserVO==null }">
									<a onclick="goLogin()">购物车</a>
								</c:if>
							</div></li>
					</ul>
				</div>
			</div>
		</div>
	</div>

	<!--End Mobile Menu area -->
</div>