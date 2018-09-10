<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
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
<link
	href='http://fonts.googleapis.com/css?family=Josefin+Sans:400,600italic,300italic,700'
	rel='stylesheet' type='text/css'>
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
<!-- 订单css -->
<link href="js/order/css/style.css" rel="stylesheet" type="text/css" />
<!-- 弹框css -->
<!--  <link rel="stylesheet" href="css/tankuang.min.css">  -->
<link rel="stylesheet" href="css/tankuangAlertBox.css"> 
<!-- 自定义提示框css -->
<link rel="stylesheet" href="js/advice/message.css">
<style type="text/css"> 

#aa {
text-decoration:none;  /*超链接无下划线*/
}
.aui-well-item-fr{
    color: red;
}
.pinglun{
color: red;
}
#aaa{
text-decoration:none;  /*超链接无下划线*/
}

</style>

</style>


</head>





<body>
	<!--[if lt IE 8]>
            <p class="browserupgrade">You are using an <strong>outdated</strong> browser. Please <a href="http://browsehappy.com/">upgrade your browser</a> to improve your experience.</p>
        <![endif]-->
	<!--Start Header Top area -->

	<%-- <%@include file="header.jsp" %> --%>
	<!--End Main Menu area -->


	<!--Start Shopping Cart top area -->
	<section class="aui-flexView">

		<section class="aui-scrollView">
			<%@include file="header.jsp"%>
			<!-- <header class="aui-navBar aui-navBar-fixed"> -->
				
				<div class="aui-center">
					<span class="aui-center-title">我的订单</span>
				</div>
				
			<!-- </header> -->
			<div class="aui-tab" data-ydui-tab>
				<ul class="tab-nav">
					<li class="tab-nav-item tab-active"><a href="javascript:;">全部</a>
					</li>
					<li class="tab-nav-item"><a href="javascript:;">待发货</a></li>
					<li class="tab-nav-item"><a href="javascript:;">待收货</a></li>
					<li class="tab-nav-item"><a href="javascript:;">待评价</a></li>
					<li class="tab-nav-item"><a href="javascript:;">已完成</a></li>
				</ul>
				<div class="divHeight"></div>
				<div class="tab-panel">
				    <!-- 全部订单 -->
					<div class="tab-panel-item tab-active">
					    <c:forEach items="${order }" var="v" >
						<div class="tab-item">
							<a id="aa" class="aui-well-item aui-well-item-clear">
								<div class="aui-well-item-bd">
									<h3>订单号:${v.orderid }</h3>
								</div>
								<div class="aui-well-item-bd">
									<h3>下单时间:
									<fmt:formatDate value="${v.ordertime }" pattern="yyyy年MM月dd日"/>
									</h3>
								</div>
								<div class="aui-well-item-bd">
									<h3>预计送达:
									<fmt:formatDate value="${v.arrivaltime }" pattern="yyyy年MM月dd日" /> 
									</h3>
								</div>
							    <p>收货人:${v.uname }</p>&nbsp;&nbsp;&nbsp;
							    <p>电话:${v.uphone }</p>&nbsp;&nbsp;&nbsp;
								<span class="aui-well-item-fr">${v.orderstatus==-1?'已取消':v.orderstatus==0?'已支付  待发货':v.orderstatus==1?'已发货,正在路上':'交易完成' }</span>
							</a>
							<c:forEach items="${v.orderDetailVo }" var="o" >
							<div class="aui-mail-product">
<<<<<<< HEAD
								<a href="javascript:;" class="aui-mail-product-item">
									<div class="aui-mail-product-item-hd">
										<img src="${o.clothesDetailVo.clothespic }" alt="">
									</div>
									<div class="aui-mail-product-item-bd">
										<p>商品名:${o.clothesDetailVo.clothesVo.clothesname }
										        ${o.clothesDetailVo.clothesVo.clothesbrand }
										        ${o.clothesDetailVo.clothescolour }
										        ${o.clothesDetailVo.clothessize }码
										</p>
										<p>价格:￥${o.clothesDetailVo.clothesVo.clothesprice }</p>
										<p>数量:${o.num }</p>
									</div>
									
									<div class="">
										<p>地址 :${v.useraddress }</p>
									</div>
									&nbsp;&nbsp;
									<div class="">
									<p  id="${o.orderdetailid}" onclick="pinglun(this)" class="pinglun">${v.orderstatus==2&&o.reviewstatus==0?'未评论':v.orderstatus==2&&o.reviewstatus==1?'已评论':'' }</p> 
									</div>
								</a>
							</div>
							</c:forEach>
							<a href="javascript:;" class="aui-mail-payment" id="aaa">
								<p>
									<!-- 共<em>1</em> 件商品 --> 实付款: ￥<i>${v.tranprice }</i>
								</p>
							</a>
							<div class="aui-mail-button">
								<a  id="${v.orderid }" onclick="operation(this)">${v.orderstatus==0?'取消订单':v.orderstatus==1?'确认收货':'删除订单' }</a> 
							</div>
						</div>
						<div class="divHeight"></div>
					</c:forEach>
					<mt:page href="ResfoodServlet?op=query" total="${total}" rows="4"/></p>
					</div>
					
					
					<!-- 待发货 -->
					<div class="tab-panel-item">
					
						<c:forEach items="${order0 }" var="v" >
						<div class="tab-item">
							<a id="aa" class="aui-well-item aui-well-item-clear">
								<div class="aui-well-item-bd">
									<h3>订单号:${v.orderid }</h3>
								</div>
								<div class="aui-well-item-bd">
									<h3>下单时间:
									<fmt:formatDate value="${v.ordertime }" pattern="yyyy年MM月dd日"/>
									</h3>
								</div>
								<div class="aui-well-item-bd">
									<h3>预计送达:
									<fmt:formatDate value="${v.arrivaltime }" pattern="yyyy年MM月dd日" /> 
									</h3>
								</div>
							    <p>收货人:${v.uname }</p>&nbsp;&nbsp;&nbsp;
							    <p>电话:${v.uphone }</p>&nbsp;&nbsp;&nbsp;
								<span class="aui-well-item-fr">${v.orderstatus==-1?'已取消':v.orderstatus==0?'已支付  待发货':v.orderstatus==1?'已发货,正在路上':'交易完成' }</span>
							</a>
							<c:forEach items="${v.orderDetailVo }" var="o" >
							<div class="aui-mail-product">
								<a href="javascript:;" class="aui-mail-product-item">
									<div class="aui-mail-product-item-hd">
										<img src="${o.clothesDetailVo.clothespic }" alt="">
									</div>
									<div class="aui-mail-product-item-bd">
										<p>商品名:${o.clothesDetailVo.clothesVo.clothesname }
										        ${o.clothesDetailVo.clothesVo.clothesbrand }
										        ${o.clothesDetailVo.clothescolour }
										        ${o.clothesDetailVo.clothessize }码
										</p>
										<p>价格:￥${o.clothesDetailVo.clothesVo.clothesprice }</p>
										<p>数量:${o.num }</p>
									</div>
									
									<div class="">
										<p>地址 :${v.useraddress }</p>
									</div>
									&nbsp;&nbsp;
									<div class="">
									<p  id="${o.orderdetailid}" onclick="pinglun(this)" class="pinglun">${v.orderstatus==2&&o.reviewstatus==0?'未评论':v.orderstatus==2&&o.reviewstatus==1?'已评论':'' }</p>
									</div>
								</a>
							</div>
							</c:forEach>
							<a href="javascript:;" class="aui-mail-payment" id="aaa">
								<p>
									<!-- 共<em>1</em> 件商品 --> 实付款: ￥<i>${v.tranprice }</i>
								</p>
							</a>
							<div class="aui-mail-button">
								<a  id="${v.orderid }" onclick="operation(this)">${v.orderstatus==0?'取消订单':v.orderstatus==1?'确认收货':'删除订单' }</a> 
							</div>
						</div>
						<div class="divHeight"></div>
					</c:forEach>
					
					
					</div>
					
					
					<!-- 待收货 -->
					<div class="tab-panel-item">
							    <c:forEach items="${order1 }" var="v" >
						<div class="tab-item">
							<a id="aa" class="aui-well-item aui-well-item-clear">
								<div class="aui-well-item-bd">
									<h3>订单号:${v.orderid }</h3>
								</div>
								<div class="aui-well-item-bd">
									<h3>下单时间:
									<fmt:formatDate value="${v.ordertime }" pattern="yyyy年MM月dd日"/>
									</h3>
								</div>
								<div class="aui-well-item-bd">
									<h3>预计送达:
									<fmt:formatDate value="${v.arrivaltime }" pattern="yyyy年MM月dd日" /> 
									</h3>
								</div>
							    <p>收货人:${v.uname }</p>&nbsp;&nbsp;&nbsp;
							    <p>电话:${v.uphone }</p>&nbsp;&nbsp;&nbsp;
								<span class="aui-well-item-fr">${v.orderstatus==-1?'已取消':v.orderstatus==0?'已支付  待发货':v.orderstatus==1?'已发货,正在路上':'交易完成' }</span>
							</a>
							<c:forEach items="${v.orderDetailVo }" var="o" >
							<div class="aui-mail-product">
								<a href="javascript:;" class="aui-mail-product-item">
									<div class="aui-mail-product-item-hd">
										<img src="${o.clothesDetailVo.clothespic }" alt="">
									</div>
									<div class="aui-mail-product-item-bd">
										<p>商品名:${o.clothesDetailVo.clothesVo.clothesname }
										        ${o.clothesDetailVo.clothesVo.clothesbrand }
										        ${o.clothesDetailVo.clothescolour }
										        ${o.clothesDetailVo.clothessize }码
										</p>
										<p>价格:￥${o.clothesDetailVo.clothesVo.clothesprice }</p>
										<p>数量:${o.num }</p>
									</div>
									
									<div class="">
										<p>地址 :${v.useraddress }</p>
									</div>
									&nbsp;&nbsp;
									<div class="">
									<p  id="${o.orderdetailid}" onclick="pinglun(this)" class="pinglun">${v.orderstatus==2&&o.reviewstatus==0?'未评论':v.orderstatus==2&&o.reviewstatus==1?'已评论':'' }</p>
									</div>
								</a>
							</div>
							</c:forEach>
							<a href="javascript:;" class="aui-mail-payment" id="aaa">
								<p>
									<!-- 共<em>1</em> 件商品 --> 实付款: ￥<i>${v.tranprice }</i>
								</p>
							</a>
							<div class="aui-mail-button">
								<a  id="${v.orderid }" onclick="operation(this)">${v.orderstatus==0?'取消订单':v.orderstatus==1?'确认收货':'删除订单' }</a> 
							</div>
						</div>
						<div class="divHeight"></div>
					</c:forEach>
					
					
					</div>
					
					
					
					<!-- 待评价 -->
					<div class="tab-panel-item">
						<c:forEach items="${order4 }" var="v" >
						<div class="tab-item">
							<a id="aa" class="aui-well-item aui-well-item-clear">
								<div class="aui-well-item-bd">
									<h3>订单号:${v.orderid }</h3>
								</div>
								<div class="aui-well-item-bd">
									<h3>下单时间:
									<fmt:formatDate value="${v.ordertime }" pattern="yyyy年MM月dd日"/>
									</h3>
								</div>
								<div class="aui-well-item-bd">
									<h3>预计送达:
									<fmt:formatDate value="${v.arrivaltime }" pattern="yyyy年MM月dd日" /> 
									</h3>
								</div>
							    <p>收货人:${v.uname }</p>&nbsp;&nbsp;&nbsp;
							    <p>电话:${v.uphone }</p>&nbsp;&nbsp;&nbsp;
								<span class="aui-well-item-fr">${v.orderstatus==-1?'已取消':v.orderstatus==0?'已支付  待发货':v.orderstatus==1?'已发货,正在路上':'交易完成' }</span>
							</a>
							<c:forEach items="${v.orderDetailVo }" var="o" >
							<div class="aui-mail-product">
								<a href="javascript:;" class="aui-mail-product-item">
									<div class="aui-mail-product-item-hd">
										<img src="${o.clothesDetailVo.clothespic }" alt="">
									</div>
									<div class="aui-mail-product-item-bd">
										<p>商品名:${o.clothesDetailVo.clothesVo.clothesname }
										        ${o.clothesDetailVo.clothesVo.clothesbrand }
										        ${o.clothesDetailVo.clothescolour }
										        ${o.clothesDetailVo.clothessize }码
										</p>
										<p>价格:￥${o.clothesDetailVo.clothesVo.clothesprice }</p>
										<p>数量:${o.num }</p>
									</div>
									
									<div class="">
										<p>地址 :${v.useraddress }</p>
									</div>
									&nbsp;&nbsp;
									<div class="">
									<p  id="${o.orderdetailid}" onclick="pinglun(this)" class="pinglun">${v.orderstatus==2&&o.reviewstatus==0?'未评论':v.orderstatus==2&&o.reviewstatus==1?'已评论':'' }</p>
									</div>
								</a>
							</div>
							</c:forEach>
							<a href="javascript:;" class="aui-mail-payment" id="aaa">
								<p>
									<!-- 共<em>1</em> 件商品 --> 实付款: ￥<i>${v.tranprice }</i>
								</p>
							</a>
							<div class="aui-mail-button">
								<a  id="${v.orderid }" onclick="operation(this)">${v.orderstatus==0?'取消订单':v.orderstatus==1?'确认收货':'删除订单' }</a>  
							</div>
						</div>
						<div class="divHeight"></div>
					</c:forEach> 
					
					
					</div>
					
					<!-- 已完成-->
					<div class="tab-panel-item">
							    <c:forEach items="${order2 }" var="v" >
						<div class="tab-item">
							<a id="aa" class="aui-well-item aui-well-item-clear">
								<div class="aui-well-item-bd">
									<h3>订单号:${v.orderid }</h3>
								</div>
								<div class="aui-well-item-bd">
									<h3>下单时间:
									<fmt:formatDate value="${v.ordertime }" pattern="yyyy年MM月dd日"/>
									</h3>
								</div>
								<div class="aui-well-item-bd">
									<h3>预计送达:
									<fmt:formatDate value="${v.arrivaltime }" pattern="yyyy年MM月dd日" /> 
									</h3>
								</div>
							    <p>收货人:${v.uname }</p>&nbsp;&nbsp;&nbsp;
							    <p>电话:${v.uphone }</p>&nbsp;&nbsp;&nbsp;
								<span class="aui-well-item-fr">${v.orderstatus==-1?'已取消':v.orderstatus==0?'已支付  待发货':v.orderstatus==1?'已发货,正在路上':'交易完成' }</span>
							</a>
							<c:forEach items="${v.orderDetailVo }" var="o" >
							<div class="aui-mail-product">
								<a href="javascript:;" class="aui-mail-product-item">
=======
								<a href="check.do?clothesid=${o.clothesDetailVo.clothesid}" class="aui-mail-product-item">
									<div class="aui-mail-product-item-hd">
										<img src="${o.clothesDetailVo.clothespic }" alt="">
									</div>
									<div class="aui-mail-product-item-bd">
										<p>商品名:${o.clothesDetailVo.clothesVo.clothesname }
										        ${o.clothesDetailVo.clothesVo.clothesbrand }
										        ${o.clothesDetailVo.clothescolour }
										        ${o.clothesDetailVo.clothessize }码
										</p>
										<p>价格:￥${o.clothesDetailVo.clothesVo.clothesprice }</p>
										<p>数量:${o.num }</p>
									</div>
									
									<div class="">
										<p>地址 :${v.useraddress }</p>
									</div>
									&nbsp;&nbsp;
									<div class="">
									<p  id="${o.orderdetailid}" onclick="pinglun(this)" class="pinglun">${v.orderstatus==2&&o.reviewstatus==0?'未评论':v.orderstatus==2&&o.reviewstatus==1?'已评论':'' }</p> 
									</div>
								</a>
							</div>
							</c:forEach>
							<a href="javascript:;" class="aui-mail-payment" id="aaa">
								<p>
									<!-- 共<em>1</em> 件商品 --> 实付款: ￥<i>${v.tranprice }</i>
								</p>
							</a>
							<div class="aui-mail-button">
								<a  id="${v.orderid }" onclick="operation(this)">${v.orderstatus==0?'取消订单':v.orderstatus==1?'确认收货':'删除订单' }</a> 
							</div>
						</div>
						<div class="divHeight"></div>
					</c:forEach>
					<mt:page href="ResfoodServlet?op=query" total="${total}" rows="4"/></p>
					</div>
					
					
					<!-- 待发货 -->
					<div class="tab-panel-item">
					
						<c:forEach items="${order0 }" var="v" >
						<div class="tab-item">
							<a id="aa" class="aui-well-item aui-well-item-clear">
								<div class="aui-well-item-bd">
									<h3>订单号:${v.orderid }</h3>
								</div>
								<div class="aui-well-item-bd">
									<h3>下单时间:
									<fmt:formatDate value="${v.ordertime }" pattern="yyyy年MM月dd日"/>
									</h3>
								</div>
								<div class="aui-well-item-bd">
									<h3>预计送达:
									<fmt:formatDate value="${v.arrivaltime }" pattern="yyyy年MM月dd日" /> 
									</h3>
								</div>
							    <p>收货人:${v.uname }</p>&nbsp;&nbsp;&nbsp;
							    <p>电话:${v.uphone }</p>&nbsp;&nbsp;&nbsp;
								<span class="aui-well-item-fr">${v.orderstatus==-1?'已取消':v.orderstatus==0?'已支付  待发货':v.orderstatus==1?'已发货,正在路上':'交易完成' }</span>
							</a>
							<c:forEach items="${v.orderDetailVo }" var="o" >
							<div class="aui-mail-product">
								<a href="check.do?clothesid=${o.clothesDetailVo.clothesid}" class="aui-mail-product-item">
									<div class="aui-mail-product-item-hd">
										<img src="${o.clothesDetailVo.clothespic }" alt="">
									</div>
									<div class="aui-mail-product-item-bd">
										<p>商品名:${o.clothesDetailVo.clothesVo.clothesname }
										        ${o.clothesDetailVo.clothesVo.clothesbrand }
										        ${o.clothesDetailVo.clothescolour }
										        ${o.clothesDetailVo.clothessize }码
										</p>
										<p>价格:￥${o.clothesDetailVo.clothesVo.clothesprice }</p>
										<p>数量:${o.num }</p>
									</div>
									
									<div class="">
										<p>地址 :${v.useraddress }</p>
									</div>
									&nbsp;&nbsp;
									<div class="">
									<p  id="${o.orderdetailid}" onclick="pinglun(this)" class="pinglun">${v.orderstatus==2&&o.reviewstatus==0?'未评论':v.orderstatus==2&&o.reviewstatus==1?'已评论':'' }</p>
									</div>
								</a>
							</div>
							</c:forEach>
							<a href="javascript:;" class="aui-mail-payment" id="aaa">
								<p>
									<!-- 共<em>1</em> 件商品 --> 实付款: ￥<i>${v.tranprice }</i>
								</p>
							</a>
							<div class="aui-mail-button">
								<a  id="${v.orderid }" onclick="operation(this)">${v.orderstatus==0?'取消订单':v.orderstatus==1?'确认收货':'删除订单' }</a> 
							</div>
						</div>
						<div class="divHeight"></div>
					</c:forEach>
					
					
					</div>
					
					
					<!-- 待收货 -->
					<div class="tab-panel-item">
							    <c:forEach items="${order1 }" var="v" >
						<div class="tab-item">
							<a id="aa" class="aui-well-item aui-well-item-clear">
								<div class="aui-well-item-bd">
									<h3>订单号:${v.orderid }</h3>
								</div>
								<div class="aui-well-item-bd">
									<h3>下单时间:
									<fmt:formatDate value="${v.ordertime }" pattern="yyyy年MM月dd日"/>
									</h3>
								</div>
								<div class="aui-well-item-bd">
									<h3>预计送达:
									<fmt:formatDate value="${v.arrivaltime }" pattern="yyyy年MM月dd日" /> 
									</h3>
								</div>
							    <p>收货人:${v.uname }</p>&nbsp;&nbsp;&nbsp;
							    <p>电话:${v.uphone }</p>&nbsp;&nbsp;&nbsp;
								<span class="aui-well-item-fr">${v.orderstatus==-1?'已取消':v.orderstatus==0?'已支付  待发货':v.orderstatus==1?'已发货,正在路上':'交易完成' }</span>
							</a>
							<c:forEach items="${v.orderDetailVo }" var="o" >
							<div class="aui-mail-product">
								<a href="check.do?clothesid=${o.clothesDetailVo.clothesid}" class="aui-mail-product-item">
									<div class="aui-mail-product-item-hd">
										<img src="${o.clothesDetailVo.clothespic }" alt="">
									</div>
									<div class="aui-mail-product-item-bd">
										<p>商品名:${o.clothesDetailVo.clothesVo.clothesname }
										        ${o.clothesDetailVo.clothesVo.clothesbrand }
										        ${o.clothesDetailVo.clothescolour }
										        ${o.clothesDetailVo.clothessize }码
										</p>
										<p>价格:￥${o.clothesDetailVo.clothesVo.clothesprice }</p>
										<p>数量:${o.num }</p>
									</div>
									
									<div class="">
										<p>地址 :${v.useraddress }</p>
									</div>
									&nbsp;&nbsp;
									<div class="">
									<p  id="${o.orderdetailid}" onclick="pinglun(this)" class="pinglun">${v.orderstatus==2&&o.reviewstatus==0?'未评论':v.orderstatus==2&&o.reviewstatus==1?'已评论':'' }</p>
									</div>
								</a>
							</div>
							</c:forEach>
							<a href="javascript:;" class="aui-mail-payment" id="aaa">
								<p>
									<!-- 共<em>1</em> 件商品 --> 实付款: ￥<i>${v.tranprice }</i>
								</p>
							</a>
							<div class="aui-mail-button">
								<a  id="${v.orderid }" onclick="operation(this)">${v.orderstatus==0?'取消订单':v.orderstatus==1?'确认收货':'删除订单' }</a> 
							</div>
						</div>
						<div class="divHeight"></div>
					</c:forEach>
					
					
					</div>
					
					
					
					<!-- 待评价 -->
					<div class="tab-panel-item">
						<c:forEach items="${order4 }" var="v" >
						<div class="tab-item">
							<a id="aa" class="aui-well-item aui-well-item-clear">
								<div class="aui-well-item-bd">
									<h3>订单号:${v.orderid }</h3>
								</div>
								<div class="aui-well-item-bd">
									<h3>下单时间:
									<fmt:formatDate value="${v.ordertime }" pattern="yyyy年MM月dd日"/>
									</h3>
								</div>
								<div class="aui-well-item-bd">
									<h3>预计送达:
									<fmt:formatDate value="${v.arrivaltime }" pattern="yyyy年MM月dd日" /> 
									</h3>
								</div>
							    <p>收货人:${v.uname }</p>&nbsp;&nbsp;&nbsp;
							    <p>电话:${v.uphone }</p>&nbsp;&nbsp;&nbsp;
								<span class="aui-well-item-fr">${v.orderstatus==-1?'已取消':v.orderstatus==0?'已支付  待发货':v.orderstatus==1?'已发货,正在路上':'交易完成' }</span>
							</a>
							<c:forEach items="${v.orderDetailVo }" var="o" >
							<div class="aui-mail-product">
								<a href="check.do?clothesid=${o.clothesDetailVo.clothesid}" class="aui-mail-product-item">
									<div class="aui-mail-product-item-hd">
										<img src="${o.clothesDetailVo.clothespic }" alt="">
									</div>
									<div class="aui-mail-product-item-bd">
										<p>商品名:${o.clothesDetailVo.clothesVo.clothesname }
										        ${o.clothesDetailVo.clothesVo.clothesbrand }
										        ${o.clothesDetailVo.clothescolour }
										        ${o.clothesDetailVo.clothessize }码
										</p>
										<p>价格:￥${o.clothesDetailVo.clothesVo.clothesprice }</p>
										<p>数量:${o.num }</p>
									</div>
									
									<div class="">
										<p>地址 :${v.useraddress }</p>
									</div>
									&nbsp;&nbsp;
									<div class="">
									<p  id="${o.orderdetailid}" onclick="pinglun(this)" class="pinglun">${v.orderstatus==2&&o.reviewstatus==0?'未评论':v.orderstatus==2&&o.reviewstatus==1?'已评论':'' }</p>
									</div>
								</a>
							</div>
							</c:forEach>
							<a href="javascript:;" class="aui-mail-payment" id="aaa">
								<p>
									<!-- 共<em>1</em> 件商品 --> 实付款: ￥<i>${v.tranprice }</i>
								</p>
							</a>
							<div class="aui-mail-button">
								<a  id="${v.orderid }" onclick="operation(this)">${v.orderstatus==0?'取消订单':v.orderstatus==1?'确认收货':'删除订单' }</a>  
							</div>
						</div>
						<div class="divHeight"></div>
					</c:forEach> 
					
					
					</div>
					
					<!-- 已完成-->
					<div class="tab-panel-item">
							    <c:forEach items="${order2 }" var="v" >
						<div class="tab-item">
							<a id="aa" class="aui-well-item aui-well-item-clear">
								<div class="aui-well-item-bd">
									<h3>订单号:${v.orderid }</h3>
								</div>
								<div class="aui-well-item-bd">
									<h3>下单时间:
									<fmt:formatDate value="${v.ordertime }" pattern="yyyy年MM月dd日"/>
									</h3>
								</div>
								<div class="aui-well-item-bd">
									<h3>预计送达:
									<fmt:formatDate value="${v.arrivaltime }" pattern="yyyy年MM月dd日" /> 
									</h3>
								</div>
							    <p>收货人:${v.uname }</p>&nbsp;&nbsp;&nbsp;
							    <p>电话:${v.uphone }</p>&nbsp;&nbsp;&nbsp;
								<span class="aui-well-item-fr">${v.orderstatus==-1?'已取消':v.orderstatus==0?'已支付  待发货':v.orderstatus==1?'已发货,正在路上':'交易完成' }</span>
							</a>
							<c:forEach items="${v.orderDetailVo }" var="o" >
							<div class="aui-mail-product">
								<a href="check.do?clothesid=${o.clothesDetailVo.clothesid}" class="aui-mail-product-item">
>>>>>>> branch 'master' of https://github.com/nbplus-org/CMS.git
									<div class="aui-mail-product-item-hd">
										<img src="${o.clothesDetailVo.clothespic }" alt="">
									</div>
									<div class="aui-mail-product-item-bd">
										<p>商品名:${o.clothesDetailVo.clothesVo.clothesname }
										        ${o.clothesDetailVo.clothesVo.clothesbrand }
										        ${o.clothesDetailVo.clothescolour }
										        ${o.clothesDetailVo.clothessize }码
										</p>
										<p>价格:￥${o.clothesDetailVo.clothesVo.clothesprice }</p>
										<p>数量:${o.num }</p>
									</div>
									
									<div class="">
										<p>地址 :${v.useraddress }</p>
										
									</div>
									&nbsp;&nbsp;
									<div class="">
									<p  id="${o.orderdetailid}" onclick="pinglun(this)" class="pinglun">${v.orderstatus==2&&o.reviewstatus==0?'未评论':v.orderstatus==2&&o.reviewstatus==1?'已评论':'' }</p>
									</div>
								</a>
							</div>
							</c:forEach>
							<a href="javascript:;" class="aui-mail-payment" id="aaa">
								<p>
									<!-- 共<em>1</em> 件商品 --> 实付款: ￥<i>${v.tranprice }</i>
								</p>
							</a>
							<div class="aui-mail-button">
							    
								<a  id="${v.orderid }" onclick="operation(this)">${v.orderstatus==0?'取消订单':v.orderstatus==1?'确认收货':'删除订单' }</a>  
							</div>
						</div>
						<div class="divHeight"></div>
					</c:forEach>
					
					
				      </div>
						
						
					</div>
				</div>
			</div>
			<%-- <%@include file="footer.jsp"%> --%>
		</section>
	</section>









	<!--End Shopping Cart top area -->






	<!--Start Estimate Shipping,Discount,Total checkout area -->
	<!--End Estimate Shipping,Discount,Total checkout area -->

	<!--Start Branding area -->
	<%-- <%@ include file="brand.jsp" %> --%>
	<!--End Branding area -->

	<!--Start Footer area -->

	<%-- <%@include file="footer.jsp" %>  --%>


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
	<!-- 订单js -->
	<script type="text/javascript" src="js/order/js/jquery.min.js"></script>
	<script type="text/javascript" src="js/order/js/tab.js"></script>
	<!-- 弹框js -->
    <script src="js/tankuangAlertBox.min.js"></script>
    <!-- 自定义弹框提示 -->
	<script src="js/advice/message.min.js"></script>
    <script type="text/javascript">
     //订单操作函数          
     function operation(obj){
    	     var orderstatus='';
             var a=$(obj).text();
             if(a=='取消订单'){
            	 orderstatus='0'
            	 showConfirm(obj,orderstatus);
            }else if(a=='确认收货'){
            	 orderstatus='1';
            	 showConfirm(obj,orderstatus);
            }else if(a=='删除订单'){
            	  orderstatus='2';
            	  showConfirm(obj,orderstatus);
            }
             
             
             
            
     }
     
     //确定取消订单弹框
     function showConfirm(obj,orderstatus){
    	 var str='';
    	 if(orderstatus==0){
    		 str='确认取消该订单';
    	 }else if(orderstatus==1){
    		 str='确认货物已收到';
    	 }else if(orderstatus==2){
    		 str='确认删除该订单';
    	 }else if(orderstatus=='' || orderstatus==-1 ){
    		 str='确认删除该订单';
    	 }
    	 
         PostbirdAlertBox.confirm({
             'title': '提示',
             'content':str ,
             'okBtn': '是的',
             'contentColor': 'red',
             'onConfirm': function () {
            	 
            	 var orderid=obj.id;
            	 var data={orderstatus:orderstatus,orderid:orderid};
            	 $.post("orderOperation.do",data,function(data){
            		 if(data==1){
            			 success();//成功弹窗
            			 window.location.href="seeorder.do";//刷新页面
            		 }else{
            			 showAlert();
            		 }
            		 
            	 });
             }
         });
     }
     //失败的弹窗
     function showAlert() {
         PostbirdAlertBox.alert({
             'title': '提示',
             'content': '操作失败',
             'okBtn': '好的',
             'contentColor': 'red',
             'onConfirm': function () {
             
             }
         });
     }
     
     //成功提示框
	function success(){
        $.message('操作成功');
     }
     
     ///////////////-----平论代码
     function pinglun(obj){
    	 var p=$(obj).text();
    	 var orderdetailid=obj.id;
    	 if(p=='未评论'){
    		 window.location.href="review.do?orderdetailid="+orderdetailid;
    	 }
    	 
     }
     
    
    
     
     
     
     
     
     
     
    
    </script>
    
    
    
    
    
    
    
</body>
</html>
