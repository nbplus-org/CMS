<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html class="no-js" lang="en">
    <head>
		<!-- Basic page needs
        ============================================ -->   
        <meta charset="utf-8">
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <title>Account | Hope</title>
        <meta name="description" content="">
		<!-- Mobile specific metas --> 
        <meta name="viewport" content="width=device-width, initial-scale=1">
		<!-- FONTS ============================================ -->
		<link href='http://fonts.googleapis.com/css?family=Josefin+Sans:400,600italic,300italic,700' rel='stylesheet' type='text/css'>
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
		<script type="text/javascript" src="easyui/jquery.min.js"></script>
        <script src="js/vendor/modernizr-2.8.3.min.js"></script>
        <!-- 密码强度css -->
        <link rel="stylesheet" href="js/password/style.css">
        <!-- 弹框css -->
		<link rel="stylesheet" href="css/tankuang.min.css">
        <link rel="stylesheet" href="css/tankuangAlertBox.css">
       
        <style type="text/css">
        .fangkuang{
         width: 300px;
         height: 350px;
         position: relative;
         left: 31.5%;
         top: 20%;
        }
        .phone{
        background: #f0f0f0;
	    padding: 9px 10px;
	    width: 300px;
	    height: 30px
        }
        </style>        
        
    </head>
    
    <body>
        <!--[if lt IE 8]>
            <p class="browserupgrade">You are using an <strong>outdated</strong> browser. Please <a href="http://browsehappy.com/">upgrade your browser</a> to improve your experience.</p>
        <![endif]-->
		<!--Start Header Top area -->
		<%@include file="header.jsp"   %>
		<!--End Main Menu area -->
		
		
		
		<!--Start Register & login area -->
	<div class="fangkuang">
		<div class="my_account_page_area">
			<div class="container">
				<div class="row">
					<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
						<div class="create_account">
							<h2>密码重置</h2>
						</div>
					</div>
				</div>
				
				<form action="" method="post" id="form1">
				<div class="row">
					<div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
						<div class="">
							
						    <ul class="register_form">
						 		<li>账号<span>*</span></li>
								<li>
									<div class="email_address">
										<input type="text" value="${zid }" disabled="disabled" class="email_test" id="zid" name="zid" autocomplete="off"/>
										<span id="sp3"></span>
									</div>
								</li>
								<li>新密码<span>*</span></li>
								<li>
									<div class="email_address page-wrap">
										<input type="password" value="" class="email_test" id="pwd" name="pwd" autocomplete="off"/><span id="sp1"></span>
										<div id="complexitywrap">
		                                <div id="complexity">0%</div>
									</div>
								</li>
								<li>确认新密码<span>*</span></li>
								<li>
									<div class="email_address">
										<input type="password" class="email_test" id="npwd" name="npwd" autocomplete="off"/>
										<span id="sp2"></span>
									</div>
								</li>
							</ul>
						</div>
						<div class="">
							<button type="button" class="create_button" onclick="judgepwd()">
								密码重置
							</button>
						</div>
					</div>
					
					<!-- 登陆块已删 -->
                  </form>
				</div>
			</div>
		</div>
	</div>
		
		<!--End Register & login area -->
		
		
		<!--Start Branding area -->
		<%-- <%@include file="brand.jsp" %> --%>
		<!--End Branding area -->
		
		
		<!--Start Footer area -->
	    <%-- <%@ include file="footer.jsp" %> --%>
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
		<!-- plugins JS  -->
        <script src="js/plugins.js"></script>
		<!-- main JS  -->
        <script src="js/main.js"></script>
       <!-- 密码强度js -->
       <script src="js/password/jquery.complexify.js"></script>
	   <script src="js/password/jquery.placeholder.min.js"></script>
	   <!-- 弹框js -->
       <script src="js/tankuangAlertBox.min.js"></script>
        
         <script type="text/javascript">
        
        //判断新旧密码是否一致   wang -----重置密码
        function judgepwd(){
        	var pwd=$("#pwd").val();
        	var npwd=$("#npwd").val();
        	var zid=$("#zid").val();
        	$("#sp1").html("");	
        	$("#sp2").html("");	
        	if(pwd==null||pwd==''){
        	  $("#sp1").html("请输入新密码！");	
        	}
        	else if(pwd==npwd){
        		var data={npwd:npwd,zid:zid,pwd:pwd};
    			$.post("resetpwd.do",data,function(data){
    				if(data=='1'){
    					//alert("重置成功");
    					showsetpwd();
        				
        				
    				}else if(data=='2'){
    					alert("重置失败,请联系管理员");
        				window.location.href="forgetpwd.jsp"; 
    					
    				}else if(data=='3'){
    					alert("身份失效");
        				window.location.href="forgetpwd.jsp"; 
    				}else{
    					 $("#sp2").html("确认新密码与新密码不一致");	
    				}
    			});
    			
        	}else{
        	   $("#sp2").html("确认新密码与新密码不一致");	
        	}

        } 
        
        
        
        //密码强度
        $(function(){
			$('input[placeholder]').placeholder();
			$("#pwd").complexify({}, function(valid, complexity){
				if (!valid) {
					$('#complexity').animate({'width':complexity + '%'}).removeClass('valid').addClass('invalid');
				} else {
					$('#complexity').animate({'width':complexity + '%'}).removeClass('invalid').addClass('valid');
				}
				$('#complexity').html(Math.round(complexity) + '%');
			});
		}); 
        //重置成功提示
        function showsetpwd() {
            PostbirdAlertBox.alert({
                'title': '提示',
                'content': '重置成功',
                'okBtn': '好的',
                'contentColor': 'green',
                'onConfirm': function () {
                	window.location.href="reglogin.jsp"; 
                }
            });
        }
        </script>
    </body>
</html>
    