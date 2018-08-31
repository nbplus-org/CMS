<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
<!-- 自定义提示框css -->
<link rel="stylesheet" href="js/advice/message.css">
<!-- modernizr JS -->
<script src="js/vendor/modernizr-2.8.3.min.js"></script>
<!--  -->
<script type="text/javascript" src="js/review/jquery.min.js"></script>
<style type="text/css">
.comment {
	width: 700px;
	margin: 200px auto 0px auto;
}

.comment-text-area {
	width: 700px;
}

.text-area {
	width: 680px;
	max-width: 680px;
	max-height: 150px;
	border: 5px #ebebeb solid;
	height: 150px;
	overflow: hidden;
	padding: 5px 5px 5px 5px;
	color: #999999;
}

.text-area-input-length {
	font-size: 12px;
	line-height: 30px;
}

.text-area-input-length span {
	margin: 0px 5px 0px 5px;
	color: red;
}

.text-area-bottom {
	text-align: right;
	margin: 5px 0px 0px 0px;
	float: right;
	padding: 0px 0px 0px 0px;
}

.text-area-bottom a {
	border: #ebebeb 2px solid;
	padding: 10px 20px 10px 20px;
	text-decoration: none;
	color: #000000;
	font-size: 14px;
}

.text-area-star {
	overflow: hidden;
	text-align: center;
}

.text-area-star label {
	float: left;
	line-height: 35px;
	height: 35px;
	font-size: 12px;
	margin: 0px 10px 10px 0px;
	padding: 0px 5px 0px 5px;
	cursor: pointer;
	border: 1px solid #ebebeb;
}

.red {
	color: red;
	border: 1px solid red !important;
}

.text-area-star label input {
	filter: alpha(opacity = 0);
	-moz-opacity: 0;
	opacity: 0;
	position: absolute;
}

.text-area-star label span {
	padding: 10px 10px 10px 10px;
	position: relative;
}
</style>
</head>
<body>
	<!--[if lt IE 8]>
            <p class="browserupgrade">You are using an <strong>outdated</strong> browser. Please <a href="http://browsehappy.com/">upgrade your browser</a> to improve your experience.</p>
        <![endif]-->
	<!--Start Header Top area -->
	<%-- <%@ include file="header.jsp"%> --%>
	<!--End Main Menu area -->
	<div class="comment">
		<div class="comment-level"></div>
		<div class="comment-text-area">
		    
		    
		    
			<div class="text-area-star">
			    <input id="input1" type="hidden" value="${clothesid.clothesid }">
			    <input id="input2" type="hidden" value="${orderdetailid }">
				<label><input type="radio" name="star" value="1" /><span>一星</span></label>
				<label><input type="radio" name="star" value="2" /><span>二星</span></label>
				<label><input type="radio" name="star" value="3" /><span>三星</span></label>
				<label><input type="radio" name="star" value="4" /><span>四星</span></label>
				<label class="red"><input type="radio" checked name="star"
					value="5" /><span>五星</span></label>
					匿名：
				<input id="shi" type="radio" checked="checked" name="1" value="1"/>是<input id="fou" type="radio"  name="1" value="0"/>否
			</div>
			<div>
				<textarea class="text-area text-area-input" name="content"></textarea>
			</div>
			<div class="text-area-input-length">
				您还可输入<span>20</span>个字
			</div>
			<div class="text-area-bottom">
				<a href="javascript:void(0);">提交数据</a>
			</div>
		</div>
	</div>
















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
	<!-- 自定义弹框提示 -->
	<script src="js/advice/message.min.js"></script>
	<script type="text/javascript">
		$(function() {

			$('.text-area-input').click(function() {
				if ($(this).val() == '请输入评论内容......') {
					$(this).css({
						color : '#000000'
					}).val('')
				}
			});

			//离开的时候
			$('.text-area-input').blur(function() {
				var iNum = $(this).val().length;
				var fixedLength = 20;//固定长度
				if (iNum < fixedLength) {
					$('.text-area-input-length span').html(fixedLength - iNum);
				} else {
					$(this).val($(this).val().substr(0, fixedLength - 1));//截取长度
					$('.text-area-input-length span').html(iNum - fixedLength);
				}
			});

			//按下的时候
			$('.text-area-input').keydown(function() {
				var iNum = $(this).val().length;
				var fixedLength = 20;//固定长度
				if (iNum < fixedLength) {
					$('.text-area-input-length span').html(fixedLength - iNum);
				} else {
					$(this).val($(this).val().substr(0, fixedLength - 1));//截取长度
					$('.text-area-input-length span').html(iNum - fixedLength);
				}
			});

			$('.text-area-bottom a').click(function() {
				var state = $('input[name=1]:checked').val();
				var reviewstar = $('input[name=star]:checked').val();
				var reviewstr = $('textarea[name=content]').val();
				var clothesid=$("#input1").val();
				var orderdetailid=$("#input2").val();
				
				//提交数据
				if(reviewstr==''|| state==''||reviewstar==''){
					info();
					
				}else{
					
					var data={state:state,reviewstar:reviewstar,
							reviewstr:reviewstr,clothesid:clothesid,orderdetailid:orderdetailid};
					$.post("submit.do",data,function(data){
						if(data=='1'){
							//评论成功，跳转页面
							
							success();
							window.location.href="seeorder.do"; 
							
						}else if(data=='0'){
								//失败，请重试
							fail();
						}
					});
					
					
					
					
				}
				
				
				
				
				
			});

			$('.text-area-star label').click(function() {
				var labelLength = $('.text-area-star label').length;
				for (var i = 0; i < labelLength; i++) {
					if (this == $('.text-area-star label').get(i)) {
						$('.text-area-star label').eq(i).addClass('red');
					} else {
						$('.text-area-star label').eq(i).removeClass('red');
					}
				}
			});

		});
		
		
		
		
		
		
		
		
		//信息提醒
		function info(){
            $.message({
                message:'请填写评论！',
                type:'info'
            });
        }
		
		function success(){
            $.message('评论成功');
        }
		
		function fail(){
            $.message({
                message:'失败,请重试',
                type:'error'
            });
        }
		
	</script>
	
	
	
	
	
	
	
	
	
</body>
</html>
