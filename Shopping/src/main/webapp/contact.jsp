<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html class="no-js" lang="en">
    <head>
		<!-- Basic page needs
        ============================================ -->   
        <meta charset="utf-8">
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <title>Contact | Hope</title>
        <meta name="description" content="">
		<!-- Mobile specific metas -->  
        <meta name="viewport" content="width=device-width, initial-scale=1">
		<!-- FONTS ============================================ -->
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
		<!-- 自定义提示框css -->
        <link rel="stylesheet" href="js/advice/message.css">
        <script src="js/vendor/modernizr-2.8.3.min.js"></script>
    </head>
    <body>
        <!--[if lt IE 8]>
            <p class="browserupgrade">You are using an <strong>outdated</strong> browser. Please <a href="http://browsehappy.com/">upgrade your browser</a> to improve your experience.</p>
        <![endif]-->
        
		<!--Start Header Top area -->
		
		<!--End Header Top area -->
		<!--Start Main Menu area -->
		<%@include file="header.jsp" %>
		
		
		<!--End Main Menu area -->
		<div class="breadcrumbs-area">
			<div class="container">
				<div class="row">
					<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
						<div class="breadcrumb-single blog_top_area">
							<ul id="breadcrumbs">
								<li><a href=""><i class="fa fa-home"></i>Home</a></li>
								<li><span>Ι</span></li>
								<li>Contact Us</li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!--Start company details area -->
		<div class="company_contact_details">
			<div class="container">
				<div class="row">
					<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
						<div class="get_touch">
							 <h2>与我们取得联系</h2>
							 <p>我们拥有两种思想。现在我想向你们介绍你们的第二个想法，那就是隐藏的神秘的潜意识。我们的潜意识包含着这样的力量和复杂性，这简直让人难以想象。</p>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-lg-8 col-md-8 col-sm-12 col-xs-12">
						<div class="contact_us_info">
						    <form action="" method="post" id="form1">
							<input type="text" placeholder="名字 *" id="name">
							<input type="text" placeholder="您的邮箱 *" id="email">
							<input type="text" placeholder="主题" id="title">
							<textarea placeholder="内容 *" rows="10" cols="30" id="str"></textarea>
							<div class="controls">
								<input type="button" onclick="formsubmit()" class="btn btn-large btn-primary submit" value="提交">
							</div>
							</form>
						</div>
					</div>
					<div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
						<div class="company_right_area">
							<h6>信息</h6>
							<div class="contact_addon_content">
								<p><span><i class="fa fa-map-marker"></i></span> 湖南省衡阳市湖南工学院</p>
								<p><span><i class="fa fa-envelope"></i></span> 1428383239@qq.com</p>
								<p><span><i class="fa fa-phone"></i></span> 199-0841-2046</p>
							</div>
                        </div>
						<div class="company_right_hour">
							<h6>营业时间</h6>
						   <p>星期一 &ndash; 星期五: 9点 to 20 点 星晴六: 9点 to 17点 星期天: 全天</p>
						   <div class="single_icons_contact">
								<ul id="social_contact_icon">
									<li><a  class="black-tooltip s-1" title="" data-placement="top" data-toggle="tooltip" ><i class="fa fa-facebook"></i> </a></li>
									<li><a  class="black-tooltip s-2" title="" data-placement="top" data-toggle="tooltip" ><i class="fa fa-twitter"></i></a></li>
									<li><a  class="black-tooltip s-3" title="" data-placement="top" data-toggle="tooltip" ><i class="fa fa-google-plus"></i></a></li>
									<li><a  class="black-tooltip s-4" title="" data-placement="top" data-toggle="tooltip" ><i class="fa fa-pinterest"></i></a></li>
									<li><a  class="black-tooltip s-5" title="" data-placement="top" data-toggle="tooltip" ><i class="fa fa-behance"></i></a></li>
								</ul>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!--End company details area -->
		
		

		<!--Start Footer area -->
		
		
        <%@include file="footer.jsp" %>
        
        
        
		<!--End Footer area -->
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
		<!-- google map API JS  -->
		<script src="https://maps.googleapis.com/maps/api/js"></script>
		<script type="text/javascript">
			function initialize() {
              var mapOptions = {
                zoom: 15,
                scrollwheel: false,
                center: new google.maps.LatLng(23.81033, 90.41252)
              };

              var map = new google.maps.Map(document.getElementById('googleMap'),
                  mapOptions);
              var marker = new google.maps.Marker({
                position: map.getCenter(),
                animation:google.maps.Animation.BOUNCE,
                icon: 'img/map.png',
                map: map
              });

            }
         
            
            //表单提交
            function formsubmit(){
            	var name=$("#name").val();
            	var email=$("#email").val();
            	var title=$("#title").val();
            	var str=$("#str").val();
            	if(name==''||email==''||title==''||str==''){
            		fail();
            	}else{
            	var data={name:name,email:email,title:title,str:str};
            	$.post("contactUs.do",data,function(data){
            		if(data=='0'){
            			fail();
            		}else if(data=='1'){
            			success();
            			 $(':input','#form1').not(':button,:submit,:reset,:hidden').val('') ;
            		}
            		
            	});
            	}
            	
            }
          //信息提醒
    		function fail(){
            $.message({
                message:'请完善信息',
                type:'error'
            });
        }

    		function success(){
                $.message('提交成功');
            }
		</script>
		<!-- plugins JS  -->
        <script src="js/plugins.js"></script>
		<!-- main JS  -->
        <script src="js/main.js"></script>
        <!-- 自定义弹框提示 -->
	    <script src="js/advice/message.min.js"></script>
    </body>
</html>
