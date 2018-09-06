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
<!-- 自定义提示框css -->
<link rel="stylesheet" href="js/advice/message.css">


<script src="js/jquery-1.9.1.js"></script>
<script type="text/javascript">
        function changeNum(sign,id){
           var cartid="cartid"+id;
           var num="num"+id;
           var clothesprice="price"+id;
           $.post("changeNum.do?num="+sign,
        		   {
        	       cartid:$("#"+cartid).html(),
        	       cnum:$("#"+num).html(),
        	       clothesprice:$("#"+clothesprice).html(),
        		   },function(data){
        			   var d=eval('('+data+')');
        			   if(d.num==0){
        				   $("#tr"+id).remove();
        			   }else{
        				   $("#"+num).html(d.num);
        				   $("#pri"+id).html(d.totalprice);
        			   }
        			   queryNum();
        		   });
           }
        
        
        function queryNum(){
			var total_num=0;
			var total_price=0;
			$(".selectBox").each(function(){
				if($(this).is(":checked")){
					var num=parseInt($(this).parents(".order_list").find(".order_num").html()); 
					var price=parseFloat($(this).parents(".order_list").find(".order_price").text());
					total_num+=num;
					total_price+=price;
				}
			});
			$(".total_num").html(total_num);
			$(".total_Aprice").html(total_price);
        }
        var is;	
        $(function(){
		$("#selectAllBox").change(function() {
			var flag = $(this).is(":checked");
			if (flag) {
				var idStr = [];
				$(".selectBox").each(function() {
					$(this).prop("checked", true);
					idStr.push($(this).val());
				});
			} else {
				$(".selectBox").each(function() {
					$(this).removeAttr("checked", false);
				});
			}
			
			is = idStr;
			queryNum();
		});

    	$(".selectBox").change(function() {
			var idStr = [];
			$(".selectBox").each(function() {
				if ($(this).is(":checked")) {
					idStr.push($(this).val() );
				} else {
					$("#selectAllBox").prop("checked", false);
				}
			});
			var lengthSelected = $(".selectBox:checked").length;
			var length = $(".selectBox").length;
			if (lengthSelected == length) {
				$("#selectAllBox").prop("checked", true);
			}
			is = idStr;
			queryNum();
		});
    }); 
        
		 function make() {
			if (is == null || is.length <= 0 || is == "") {
				info();
				return;
			} else {
				//判断库存
				$.ajax({
					  url: "pandunStackNum.do",
					  type: "GET",
					  data: {
					    "arry": is,
					  },
					  traditional: true,//这里设置为true
					  success: function(data) {
						  if(data!='0'){
								alert(data+"库存不足");
							}else{
								window.location.href="checkout.do?arry="+is; 
							}
					  }
					});
				
				
			}
		} 
		
        function Delete(sign,id){
        	var cartid="cartid"+id;
        	$.post("deleteOne.do?num="+sign,
        		{
        		 cartid:$("#"+cartid).html(),
        		}
        		,function(data){
        		var d=eval('('+data+')');
        		if(d.end==null){
        			$("#tr"+id).remove();
        			$.get("showCarAgain.do", {}, function() {
        			});
        		}else{
        			alert("删除失败");
        		}
        	});
        }
        </script>
</head>
<body>
	<!--[if lt IE 8]>
            <p class="browserupgrade">You are using an <strong>outdated</strong> browser. Please <a href="http://browsehappy.com/">upgrade your browser</a> to improve your experience.</p>
        <![endif]-->
	<!--Start Header Top area -->

	<%@include file="header.jsp"%>
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
								<th height="22" width="100">
									<div align="CENTER">
										<input type="checkbox" id="selectAllBox"
											onclick="checkAllBoxBlur()" /> <font color="#000000">全选</font>
									</div>
								</th>
								<th height="22" width="120">购物车编号</th>
								<th>样图</th>
								<th height="22" width="120">产品名字</th>
								<th>颜色</th>
								<th height="22" width="80">尺寸</th>
								<th>单价</th>
								<th width="120">数量</th>
								<th>小计</th>
								<th>删除</th>
							</tr>
						<c:forEach items="${list}" var="c" varStatus="status">
								<tr id="tr${status.count }" class="order_list">
								    <td><div><input type="checkbox" class="selectBox" value="${c.cartid}"/></div></td>
								    <td id="cartid${status.count }">${c.cartid}</td>
									<td><a href="seeByPic.do?cartid=${c.cartid}"><img src="${c.clothespic}" width="100px" height="100px" alt="" /></a></td>
									<td><a href="#">${c.clothesname}</a></td>
									<td>${c.clothescolour }</td>
									<td>${c.clothessize }</td>
									<td>￥<strong id="price${status.count }">${c.clothesprice }</strong></td>
									<td><a href="javascript:void(0);"
										onclick="changeNum('reduce',${status.count})"
										style="color: blue">-</a> <span class="order_num"
										id="num${status.count }">${c.cnum}</span> <a
										href="javascript:void(0);"
										onclick="changeNum('add',${status.count})" style="color: blue">+</a>
									</td>
									<td>￥<strong class="order_price" id="pri${status.count }">${c.clothesprice*c.cnum }</strong></td>
									<td><a href="#"><img src="img/arrow/btn_trash.gif"
											onclick="Delete('delete',${status.count})" alt="" /></a></td>
								</tr>
							</c:forEach>
						</table>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
					<div class="shopping_cart_main">
						<div class="shopping_button">
							<a href="show.do"><button type="button" title="shop"
									class="continue_shopping">继续购物</button></a>
						</div>
						<div class="shopping_button">
							<a href="deleteAll.do"><button type="button" title="shop"
									class="continue_shopping">清空购物车</button></a>
						</div>
						<div class="shopping_button">
							<a href="showCart.do"><button type="button" title="shop"
									class="continue_shopping">更新购物车</button></a>
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
				<div class="col-lg-4 col-md-4 col-sm-12 col-xs-12"></div>
				<div class="col-lg-4 col-md-4 col-sm-12 col-xs-12"></div>
				<div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
					<div class="total_price">
						<table class="total_rate">
							<tr>
								<td>已选商品</td>
								<td><strong class="total_num">0</strong>件</td>
							</tr>
							<tr>
								<th>总&nbsp;价</th>
								<th>$<strong class="total_Aprice">0</strong></th>
							</tr>
						</table>
					</div>
					<div class="check_out_simble review_button ">
						<button type="submit" title="Submit Review" onclick="make()"
							id="makeOrder" class="button">结账</button>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!--End Estimate Shipping,Discount,Total checkout area -->

	<!--Start Branding area -->
	<%@ include file="brand.jsp"%>
	<!--End Branding area -->

	<!--Start Footer area -->

	<%@include file="footer.jsp"%>


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
	<!-- 自定义弹框提示 -->
	<script src="js/advice/message.min.js"></script>
	<script type="text/javascript">
	function info(){
        $.message({
            message:'请选择商品下单！',
            type:'info'
        });
    }
	
	
	
	</script>
</body>
</html>
