<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!doctype html>
<html class="no-js" lang="en">
    <head>
		<!-- Basic page needs
        ============================================ --> 
        <meta charset="utf-8">
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <title>结账 | Hope</title>
        <meta name="description" content="">
		<!-- Mobile specific metas -->
        <meta name="viewport" content="width=device-width, initial-scale=1">
		<!-- FONTS -->
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
		<!-- 弹框css -->
		<!-- <link rel="stylesheet" href="css/tankuang.min.css"> -->
        <link rel="stylesheet" href="css/tankuangAlertBox.css">
		
		
		
        <script src="js/vendor/modernizr-2.8.3.min.js"></script>
        <style type="text/css">
        #sp1{
           color: red;
        
        }
        
        
        </style>
        
        
        
    </head>
    <body>
        <!--[if lt IE 8]>
            <p class="browserupgrade">You are using an <strong>outdated</strong> browser. Please <a href="http://browsehappy.com/">upgrade your browser</a> to improve your experience.</p>
        <![endif]-->
		<!--Start Header Top area -->
        
        
        <%@include file="header.jsp" %>
		<!--End Mobile Menu area -->
		<!--End Main Menu area -->
		
		
		
		<div class="checkout_accrodion_area">
			<div class="container">
				<div class="row">
				<form action="" method="post">
					<div class="col-lg-9 col-md-9 col-sm-12 col-xs-12">
						<div class="accordion" id="accordion2">
					
				          <!-- -- -->
					
							<div class="panel accordion-group">
								<div class="accordion-heading" id="headingTwo">
								  <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion2" href="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
									<span>1</span>账单信息
								  </a>
								</div>
								<div id="collapseTwo" class="panel-collapse collapse" aria-labelledby="headingTwo">
								  <div class="accordion-inner">
										<div class="row">
											<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
												<div class="billing_info">
													<ul class="billing_in">
														<li>名字<span>*</span></li>
														<li>
														<input type="text" id="uname" name="uname" value="${user.uname }" title="First Name" maxlength="255" class="input-text required-entry"></li>
														<li>电话<span>*</span></li>
														<li><input type="text" id="uphone" name="uphone" value="${user.uphone }" title="Company" class="input-text "></li>
														<div data-toggle="distpicker">
														<li>省份<span>*</span></li>
														<li>
															<select id="province" name="province" title="State/Province" class="validate-select required-entry">
															</select>
														</li>
														
														<li>市区<span>*</span></li>
														<li>
															<select name="city" id="city" class="validate-select" title="Country">
															</select>
														</li>
														<li>区/县<span>*</span></li>
														<li>
															<select name="area" id="area" class="validate-select" title="Country">
															</select>
														</li>
														</div>
														<li>详细地址<span>*</span></li>
														<li><input type="text" title="Street Address" name="detailedarea" id="detailedarea" value="" autocomplete="off" class="input-text  required-entry"></li>
														
														<li>备注<span></span></li>
														<li><input type="text" title="Street Address" name="ordernotes" id="ordernotes" value="" autocomplete="off" class="input-text  required-entry"></li>
													</ul>
												</div>
											</div>
										</div>
										
								  </div>
								</div>
							</div>
							
							<!-- ---- -->
							
				            <!-- ---- -->
				            
							<div class="panel accordion-group">
								<div class="accordion-heading" id="headingFive">
								  <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion2" href="#collapseFive" aria-expanded="false" aria-controls="collapseFive">
									<span>2</span>订单确认
								  </a>
								</div>
								<div id="collapseFive" class="panel-collapse collapse" aria-labelledby="headingFive">
								  <div class="accordion-inner">
										<div class="row">
											<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
												<div class="accordion_total_pricing">
									<!-- 村数组 --><%--  <input id="arry" type="hidden" value="${arry }"> --%>
													<table id="product_details_price">
														<tr>
															<th>产品名-数量</th>
															<th>颜色尺码</th>
															<th>单价</th>
															<th>总计</th>
														</tr>
														<c:forEach items="${list }" var="v" >
														<tr>
															<td><h2>${v.clothesname }x${v.cnum }</h2></td>
															<td>${v.clothescolour }-${v.clothessize }码</td>
															<td>￥${v.clothesprice }</td>
															<td>￥${v.cnum*v.clothesprice}</td>
														</tr>
														</c:forEach>
													</table>
													<table id="product_details_rate">
														<tr>
															<td>合计</td>
															<td>￥${total }</td>
														</tr>
														<tr>
															<td>折扣</td>
															<td>${f==0?"无折扣":f==95?"-5%":f==85?"-15%":f==75?"-25%":"-30%" }</td>
														</tr>
														<tr>
															<th>折后价</th>
															<th id="price">￥${f==0?total:total*f*0.01 }</th>
														</tr>
													</table>
												</div>
												<div class="Continue_button continue_top place_order">
													 <a href="forgetpwd.jsp">忘记密码?</a>
													<button type="button" onclick="judge()" id="b1" title="Submit Review" class="button">下单</button>
													<span id="sp1"></span>
												</div>
											</div>
										</div>
								  </div>
								</div>
							</div>
						</div>
					</div>
					</form>
					
				</div>
			</div>
		</div>
		
		<!--Start branding area -->
	    <%@ include file="brand.jsp" %>
		<!--End branding area -->
		
		
		<!--Start footer area -->
         
        <%@include file="footer.jsp" %>
         
		<!--End footer area -->
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
        
        <!-- 中国省市区地址三级联动插件 -->
        <script src="js/distpicker.data.js"></script>
        <script src="js/distpicker.js"></script>
        <script src="js/main.js"></script>
        <!-- 弹框js -->
        <script src="js/tankuangAlertBox.min.js"></script>

        <script type="text/javascript">
        
        function judge(){
            var detailarea=$("#detailedarea").val();
           
            $("#sp1").html("");
        	if(detailarea.length==0){
        		$("#sp1").html("请填写详细地址");
        	}else{
        		var data={};
        		$.post("playOrder.do",data,function(data){
        			    
        				//tan();
        				showPrompt();
        			
        		});
        	}  
        	
        }
        //弹框
        function showPrompt() {
            PostbirdAlertBox.prompt({
                'title': '请输入密码',
                'okBtn': '确定',
                onConfirm: function (data) {
                //表单数据
                var uname=$("#uname").val();
                var uphone=$("#uphone").val();
                var province=$("#province").val();
                var city=$("#city").val();
                var area=$("#area").val();
                var detailarea=$("#detailedarea").val();
                var ordernotes=$("#ordernotes").val();
                //获取数组的值
                
                
                //获取表格里的折后价
                var tb = document.getElementById('product_details_rate');    // table 的 id
                var rows = tb.rows;                           // 获取表格所有行
                var price=rows[2].cells[1].innerHTML;
                
                
                var pwd=data;   
                var data1={pwd:pwd,uname:uname,uphone:uphone,province:province,
                		   city:city,area:area,detailarea:detailarea,ordernotes:ordernotes,price:price
                		   };	
                $.post("panduanPwd.do",data1,function(data1){
                	if(data1==0){
                		showAlert();//密码错误
                	}else if(data1==1){
                		//提示
                		//刷新小购物车
                		$.get("showCarAgain.do", {}, function() {	}); 
                		/* window.location.href="showCarAgain.do";  */
                		window.location.href="seeorder.do";  //密码正确，跳转页面
                	}else{
                		showAlerts();//下单失败
                	}
                	
                });    
	
                },
                
            });
        }
        
        //密码错误提示框
        function showAlert() {
        PostbirdAlertBox.alert({
            'title': '提示',
            'content': '密码错误',
            'okBtn': '确定',
            'contentColor': 'red',
            'onConfirm': function () {
                //console.log("回调触发后隐藏提示框");
                //alert("回调触发后隐藏提示框");
            }
        });
    }
        
        function showAlerts() {
            PostbirdAlertBox.alert({
                'title': '错误',
                'content': '下单失败',
                'okBtn': '确定',
                'contentColor': 'red',
                'onConfirm': function () {
                    //console.log("回调触发后隐藏提示框");
                    //alert("回调触发后隐藏提示框");
                }
            });
        }
        
   </script>
        
        
    </body>
</html>
