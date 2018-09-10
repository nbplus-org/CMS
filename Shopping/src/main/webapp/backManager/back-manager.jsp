<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>世尊家具综合管理系统</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<<<<<<< HEAD
<!-- 弹框css -->
<!--  <link rel="stylesheet" href="css/tankuang.min.css">  -->
<link rel="stylesheet" href="../css/tankuangAlertBox.css"/>
<!-- 弹框js -->
	<script src="../js/tankuangAlertBox.min.js"></script>
<script type="text/javascript">
	function pr(_id) {
		var select_id = parseInt(_id.replace("xx", ""));
		for (i = 1; i <= 8; i++) {
			if (i == select_id) {
				document.getElementById("xx" + i).className = "x_css";
			} else {
				document.getElementById("xx" + i).className = "y_css";
			}
		}
	}
	function outLogBack(){
		PostbirdAlertBox.confirm({
			'title' : '提示',
			'content' : '您确定要注销吗？?',
			'okBtn' : '是的',
			'contentColor' : 'red',
			'onConfirm' : function() {
				window.location.href = "outLogBack.do";
				//alert("回调触发后隐藏提示框");
			},
			'onCancel' : function() {
			}
		});
	}
</script>
<script language="javascript" type="text/javascript">
	function show(num) {
		document.getElementById(num).style.display = "block";
	}
	function hidden1(num) {
		document.getElementById(num).style.display = "none";
	}
</script>
<script language="javascript" type="text/javascript">
	function r(num) {
		document.getElementById(num).style.display = "block";
	}
	function r_1(num) {
		document.getElementById(num).style.display = "none";
	}
</script>
<script language="javascript" type="text/javascript">
	function srcchange(id) {
		if (id == "hr1") {
			document.getElementById("mainFrame").src = "rsxz/Employlee.html";
			document.getElementById("dTitle").innerHTML = "<img src='images/rensiManage.jpg' alt='' style='margin-top:5px'/>";
			document.getElementById("dTitle").style.display = "block";

		} else if (id == "hr2") {
			document.getElementById("mainFrame").src = "rsxz/RecruiterApply.html";
			document.getElementById("dTitle").innerHTML = "<img src='images/xingzhengManage.jpg' alt='' style='margin-top:5px'/>";
			document.getElementById("dTitle").style.display = "block";
		} else if (id == "hr3") {
			document.getElementById("mainFrame").src = "rsxz/ExaAppDocument.html";
			document.getElementById("dTitle").style.display = "none";
		} else if (id == "hr15") {
			document.getElementById("mainFrame").src = "notice/NoticeClass.html";
			document.getElementById("dTitle").style.display = "none";
		} else if (id == "hr16") {
			document.getElementById("mainFrame").src = "notice/NoticeShow.html";
			document.getElementById("dTitle").style.display = "none";
		} else if (id == "hr17") {
			document.getElementById("mainFrame").src = "notice/Notice.html";
			document.getElementById("dTitle").style.display = "none";
		} else if (id == "hr18") {
			document.getElementById("mainFrame").src = "notice/NoticeCount.html";
			document.getElementById("dTitle").style.display = "none";
		} else if (id == "hr19") {
			document.getElementById("mainFrame").src = "xtsz/XTCS.html";
			document.getElementById("dTitle").style.display = "none";
		} else if (id == "hr20") {
			document.getElementById("mainFrame").src = "xtsz/Branch.html";
			document.getElementById("dTitle").style.display = "none";
		} else if (id == "hr21") {
			document.getElementById("mainFrame").src = "xtsz/Role.html";
			document.getElementById("dTitle").style.display = "none";
		} else if (id == "hr22") {
			document.getElementById("mainFrame").src = "xtsz/Power.html";
			document.getElementById("dTitle").style.display = "none";
		} else if (id == "hr23") {
			document.getElementById("mainFrame").src = "xtsz/EaDoc.html";
			document.getElementById("dTitle").style.display = "none";
		}

		else if (id == "hr4") {
			document.getElementById("mainFrame").src = "knowledge/KnowLedgeClass.html";
			document.getElementById("dTitle").innerHTML = "<img src='images/itemdangan' alt='' style='margin-top:5px'/>";
			document.getElementById("dTitle").style.display = "block";
		} else if (id == "hr5") {

			document.getElementById("mainFrame").src = "knowledge/KnowLedge.html";
			document.getElementById("dTitle").innerHTML = "<img src='images/itemxinde.jpg' alt='' style='margin-top:5px'/>";
			document.getElementById("dTitle").style.display = "block";
		} else if (id == "hr6") {
			document.getElementById("mainFrame").src = "knowledge/openKnowLedge.html";
			document.getElementById("dTitle").innerHTML = "<img src='images/picmanager.jpg' alt='' style='margin-top:5px'/>";
			document.getElementById("dTitle").style.display = "block";
		} else if (id == "hr7") {

			document.getElementById("mainFrame").src = "knowledge/ChangjianWenti.htm";
			document.getElementById("dTitle").innerHTML = "<img src='images/question.jpg' alt='' style='margin-top:5px'/>";
			document.getElementById("dTitle").style.display = "block";
		} else if (id == "hr8") {
			document.getElementById("mainFrame").src = "task/Schedule.html";
			document.getElementById("dTitle").style.display = "none";
		} else if (id == "hr9") {
			document.getElementById("mainFrame").src = "task/TaskAllot.html";
			document.getElementById("dTitle").style.display = "none";
		} else if (id == "hr10") {
			document.getElementById("mainFrame").src = "task/TaskShow.html";
			document.getElementById("dTitle").style.display = "none";
		} else if (id == "hr51") {
			document.getElementById("mainFrame").src = "task/IssuedTask.html";
			document.getElementById("dTitle").style.display = "none";
		} else if (id == "hr11") {
			document.getElementById("mainFrame").src = "task/DelayTaskApply.html";
			document.getElementById("dTitle").style.display = "none";
		} else if (id == "hr12") {
			document.getElementById("mainFrame").src = "task/DelayTask.html";
			document.getElementById("dTitle").style.display = "none";
		} else if (id == "hr13") {
			document.getElementById("mainFrame").src = "task/MoveTaskApply.html";
			document.getElementById("dTitle").style.display = "none";
		} else if (id == "hr14") {
			document.getElementById("mainFrame").src = "task/MoveTask.html";
			document.getElementById("dTitle").style.display = "none";
		} else if (id == "hr24") {
			document.getElementById("mainFrame").src = "client/OrderManager.html";
			document.getElementById("dTitle").innerHTML = "<img src='images/orderManage.jpg' alt='' style='margin-top:5px'/>";
			document.getElementById("dTitle").style.display = "block";
		} else if (id == "hr25") {
			document.getElementById("mainFrame").src = "client/ClientManager.html";
			document.getElementById("dTitle").innerHTML = "<img src='images/clientManage.jpg' alt='' style='margin-top:5px'/>";
			document.getElementById("dTitle").style.display = "block";
		} else if (id == "hr26") {
			document.getElementById("mainFrame").src = "xtsz/NormalManage.htm";
			document.getElementById("dTitle").style.display = "none";
		} else if (id == "hr27") {
			document.getElementById("mainFrame").src = "xtsz/CustomManage.htm";
			document.getElementById("dTitle").style.display = "none";
		} else if (id == "hr34") {
			document.getElementById("mainFrame").src = "task/TaskResult.html";
			document.getElementById("dTitle").style.display = "none";
		} else if (id == "hr35") {
			document.getElementById("mainFrame").src = "item/ItemClass.html";
			document.getElementById("dTitle").style.display = "none";
		} else if (id == "hr36") {
			document.getElementById("mainFrame").src = "item/Item.html";
			document.getElementById("dTitle").style.display = "none";
		} else if (id == "hr37") {
			document.getElementById("mainFrame").src = "item/ItemPact.html";
			document.getElementById("dTitle").style.display = "none";
		} else if (id == "hr38") {
			document.getElementById("mainFrame").src = "item/TaskAllo.html";
			document.getElementById("dTitle").style.display = "none";
		} else if (id == "hr39") {
			document.getElementById("mainFrame").src = "item/TaskProShow.html";
			document.getElementById("dTitle").style.display = "none";
		} else if (id == "hr40") {
			document.getElementById("mainFrame").src = "item/TaskProRec.html";
			document.getElementById("dTitle").style.display = "none";
		} else if (id == "hr41") {
			document.getElementById("mainFrame").src = "item/ItemToFile.html";
			document.getElementById("dTitle").style.display = "none";
		} else if (id == "hr42") {
			document.getElementById("mainFrame").src = "item/ItemToFileAudit.html";
			document.getElementById("dTitle").style.display = "none";
		} else if (id == "hr43") {
			document.getElementById("mainFrame").src = "product/LineManage.htm";
			document.getElementById("dTitle").style.display = "none";
		} else if (id == "hr44") {
			document.getElementById("mainFrame").src = "product/StyleView.htm";
			document.getElementById("dTitle").style.display = "none";
		} else if (id == "hr45") {
			document.getElementById("mainFrame").src = "product/SpecificationView.htm";
			document.getElementById("dTitle").style.display = "none";
		} else if (id == "hr46") {
			document.getElementById("mainFrame").src = "product/productManage.html";
			document.getElementById("dTitle").style.display = "none";
		} else if (id == "hr47") {
			document.getElementById("mainFrame").src = "product/ProductDetail.htm";
			document.getElementById("dTitle").style.display = "none";
		} else if (id == "hr49") {
			document.getElementById("mainFrame").src = "product/FavoritesView.htm";
			document.getElementById("dTitle").style.display = "none";
		} else if (id == "hr50") {
			document.getElementById("mainFrame").src = "product/ProductShowMange.htm";
			document.getElementById("dTitle").style.display = "none";
		} else if (id == "hr497")//48
		{
			document.getElementById("mainFrame").src = "knowledge/Peixuzhiliao.htm";
			document.getElementById("dTitle").innerHTML = "<img src='images/peixunzhiliao.jpg' alt='' style='margin-top:5px'/>";
			document.getElementById("dTitle").style.display = "block";
		} else if (id == "hr498")//49
		{
			document.getElementById("mainFrame").src = "knowledge/OtherKnowLedge.htm";
			document.getElementById("dTitle").innerHTML = "<img src='images/otherziliao.jpg' alt='' style='margin-top:5px'/>";
			document.getElementById("dTitle").style.display = "block";
		} else if (id == "hr499") {
			document.getElementById("mainFrame").src = "knowledge/gerenzhiliaolist.htm";
			document.getElementById("dTitle").innerHTML = "<img src='images/gereziliao.jpg' alt='' style='margin-top:5px'/>";
			document.getElementById("dTitle").style.display = "block";
		} else if (id == "hr500") {
			document.getElementById("mainFrame").src = "knowledge/AuditKnowLedge.html";
			document.getElementById("dTitle").innerHTML = "<img src='images/knowledgeshenhe.jpg' alt='' style='margin-top:5px'/>";
			document.getElementById("dTitle").style.display = "block";
		}

	}
	function changeIcon(id) {
		if (id == "HR") {
			document.getElementById("dTitle").innerHTML = "<img src='images/rensiManage.jpg' alt='' style='margin-top:5px'/>";
			document.getElementById("dTitle").style.display = "block";
		} else if (id == "Notice") {
			document.getElementById("dTitle").style.display = "none";
		} else if (id == "KnowLedge") {
			document.getElementById("dTitle").innerHTML = "<img src='images/itemdangan.jpg' alt='' style='margin-top:5px'/>";
			document.getElementById("dTitle").style.display = "block";
		} else if (id == "Task") {
			document.getElementById("dTitle").style.display = "none";
		} else if (id == "Order") {
			document.getElementById("dTitle").innerHTML = "<img src='images/orderManage.jpg' alt='' style='margin-top:5px'/>";
			document.getElementById("dTitle").style.display = "block";
		} else if (id == "Item") {
			document.getElementById("dTitle").style.display = "none";
		} else if (id == "System") {
			document.getElementById("dTitle").style.display = "none";
		} else if (id == "Product") {
			document.getElementById("dTitle").style.display = "none";
		}
	}
</script>
<link rel="stylesheet" type="text/css" href="css/index.css" />
</head>
<body>
	<div style="width: 1430px; height: 100%;">
		<div class="mian_r" onmousemove="r(22)" onmouseout="r_1(22)">
			<div class="mian_r_bj png" style="display: none;" id="22"
				onmousemove="r(22)" onmouseout="r_1(22)">
				<div>
					<a href="#"> <img src="images\r_icon_03.png" /></a> <a href="#" />
					<img src="images\r_icon_06.png" /> </a> <a href="#"> <img
						src="images\r_icon_08.png" /></a> <a href="#"> <img
						src="images\r_icon_10.png" /></a>
				</div>
			</div>
		</div>
		<table height="100%" width="1425" border="0" cellpadding="0"
			cellspacing="0" style="overflow: hidden;">
			<tr>
				<td colspan="2" height="52">
					<div>
						<div id="header">
							<div class="header01">
								<p class="logo">
									<a href="#"> <img src="images/logo_03.gif"
										alt=""></a>
								</p>
								<p class="right_01"
									style="position: absolute; z-index: 9; width: e-xpression(this.nextSibling.offsetWidth); height: e-xpression(this.nextSibling.offsetHeight); top: e-xpression(this.nextSibling.offsetTop); left: e-xpression(this.nextSibling.offsetLeft);"
									frameborder="0">
									<img src="images/pic_06.gif" alt="">
								</p>
								<p class="right_02">
									您好，<span>${admin.aname }</span>，欢迎登录！
								</p>
							</div>
						</div>
					</div>
				</td>
			</tr>
			<tr>
				<td width="190" valign="top"
					style="background: url(images/lift_bj_02.gif) repeat-y;"
					background="images/lift_bj_02.gif ">

					<div class="side" style="position: absolute;">
						<ul id="nav">
							<li class="y_css" id="xx1" onmouseover="show(1)"
								onmouseout="hidden1(1)"><a href="selectAllUser.do"
								onclick="changeIcon('HR')" target="mainFrame"
								onmousedown="javascript:pr('xx1')"><span></span>
									<p class="icon_01">用户管理</p> </a></li>
							<li class="y_css" id="xx2"><a href="selectAllClothes.do"
								onclick="changeIcon('Notice')" target="mainFrame"
								onmousedown="javascript:pr('xx2')" onmouseover="show(2)"
								onmouseout="hidden1(2)"><span></span>
									<p class="icon_10">服装管理</p> </a></li>
							<li class="y_css" id="xx4"><a href="clothesAll.do"
								onclick="changeIcon('Task')" target="mainFrame"
								onmousedown="javascript:pr('xx4')" onmouseover="show(4)"
								onmouseout="hidden1(4)"><span></span>
									<p class="icon_04">库存管理</p> </a></li>
							<li class="y_css" id="xx3"><a
								href="selectAllOrderBystatus.do?orderstatus=4" target="mainFrame"
								onclick="changeIcon('KnowLedge')"
								onmousedown="javascript:pr('xx3')" onmouseover="show(3)"
								onmouseout="hidden1(3)"> <span></span>
									<p class="icon_02">订单管理</p>
							</a></li>
							<li class="y_css" id="xx5"><a
								href="pie-simple.jsp" onclick="changeIcon('Order')"
								target="mainFrame" onmousedown="javascript:pr('xx5')"
								onmouseover="show(5)" onmouseout="hidden1(5)"><span></span>
									<p class="icon_05">报表管理</p> </a></li>
						</ul>
					</div>
				</td>
				<td width="1215" valign="top">
					<div id="dTitle" style="float: left; margin-left: 30px;">
						<img src='images/shouye.jpg' alt='' style='margin-top: 5px'>
					</div>
					<div style="text-align: right; margin-right: 15px; float: right">

						<img src="images/middil_05.gif" alt=""><a onclick="outLogBack()"><img
								alt="" src="images/middil_06.gif"/></a></img>
					</div> <iframe frameborder="0" style="margin-top: 15px; height: 631px;"
						width="1215" id="mainFrame" name="mainFrame" src=""></iframe>
				</td>
				<td width="5" valign="top" style="position: relative;" height="93%">
				</td>
			</tr>
		</table>
	</div>
	
=======
<script type="text/javascript">
	function pr(_id) {
		var select_id = parseInt(_id.replace("xx", ""));
		for (i = 1; i <= 8; i++) {
			if (i == select_id) {
				document.getElementById("xx" + i).className = "x_css";
			} else {
				document.getElementById("xx" + i).className = "y_css";
			}
		}
	}
</script>
<script language="javascript" type="text/javascript">
	function show(num) {
		document.getElementById(num).style.display = "block";
	}
	function hidden1(num) {
		document.getElementById(num).style.display = "none";
	}
</script>
<script language="javascript" type="text/javascript">
	function r(num) {
		document.getElementById(num).style.display = "block";
	}
	function r_1(num) {
		document.getElementById(num).style.display = "none";
	}
</script>
<script language="javascript" type="text/javascript">
	function srcchange(id) {
		if (id == "hr1") {
			document.getElementById("mainFrame").src = "rsxz/Employlee.html";
			document.getElementById("dTitle").innerHTML = "<img src='images/rensiManage.jpg' alt='' style='margin-top:5px'/>";
			document.getElementById("dTitle").style.display = "block";

		} else if (id == "hr2") {
			document.getElementById("mainFrame").src = "rsxz/RecruiterApply.html";
			document.getElementById("dTitle").innerHTML = "<img src='images/xingzhengManage.jpg' alt='' style='margin-top:5px'/>";
			document.getElementById("dTitle").style.display = "block";
		} else if (id == "hr3") {
			document.getElementById("mainFrame").src = "rsxz/ExaAppDocument.html";
			document.getElementById("dTitle").style.display = "none";
		} else if (id == "hr15") {
			document.getElementById("mainFrame").src = "notice/NoticeClass.html";
			document.getElementById("dTitle").style.display = "none";
		} else if (id == "hr16") {
			document.getElementById("mainFrame").src = "notice/NoticeShow.html";
			document.getElementById("dTitle").style.display = "none";
		} else if (id == "hr17") {
			document.getElementById("mainFrame").src = "notice/Notice.html";
			document.getElementById("dTitle").style.display = "none";
		} else if (id == "hr18") {
			document.getElementById("mainFrame").src = "notice/NoticeCount.html";
			document.getElementById("dTitle").style.display = "none";
		} else if (id == "hr19") {
			document.getElementById("mainFrame").src = "xtsz/XTCS.html";
			document.getElementById("dTitle").style.display = "none";
		} else if (id == "hr20") {
			document.getElementById("mainFrame").src = "xtsz/Branch.html";
			document.getElementById("dTitle").style.display = "none";
		} else if (id == "hr21") {
			document.getElementById("mainFrame").src = "xtsz/Role.html";
			document.getElementById("dTitle").style.display = "none";
		} else if (id == "hr22") {
			document.getElementById("mainFrame").src = "xtsz/Power.html";
			document.getElementById("dTitle").style.display = "none";
		} else if (id == "hr23") {
			document.getElementById("mainFrame").src = "xtsz/EaDoc.html";
			document.getElementById("dTitle").style.display = "none";
		}

		else if (id == "hr4") {
			document.getElementById("mainFrame").src = "knowledge/KnowLedgeClass.html";
			document.getElementById("dTitle").innerHTML = "<img src='images/itemdangan' alt='' style='margin-top:5px'/>";
			document.getElementById("dTitle").style.display = "block";
		} else if (id == "hr5") {

			document.getElementById("mainFrame").src = "knowledge/KnowLedge.html";
			document.getElementById("dTitle").innerHTML = "<img src='images/itemxinde.jpg' alt='' style='margin-top:5px'/>";
			document.getElementById("dTitle").style.display = "block";
		} else if (id == "hr6") {
			document.getElementById("mainFrame").src = "knowledge/openKnowLedge.html";
			document.getElementById("dTitle").innerHTML = "<img src='images/picmanager.jpg' alt='' style='margin-top:5px'/>";
			document.getElementById("dTitle").style.display = "block";
		} else if (id == "hr7") {

			document.getElementById("mainFrame").src = "knowledge/ChangjianWenti.htm";
			document.getElementById("dTitle").innerHTML = "<img src='images/question.jpg' alt='' style='margin-top:5px'/>";
			document.getElementById("dTitle").style.display = "block";
		} else if (id == "hr8") {
			document.getElementById("mainFrame").src = "task/Schedule.html";
			document.getElementById("dTitle").style.display = "none";
		} else if (id == "hr9") {
			document.getElementById("mainFrame").src = "task/TaskAllot.html";
			document.getElementById("dTitle").style.display = "none";
		} else if (id == "hr10") {
			document.getElementById("mainFrame").src = "task/TaskShow.html";
			document.getElementById("dTitle").style.display = "none";
		} else if (id == "hr51") {
			document.getElementById("mainFrame").src = "task/IssuedTask.html";
			document.getElementById("dTitle").style.display = "none";
		} else if (id == "hr11") {
			document.getElementById("mainFrame").src = "task/DelayTaskApply.html";
			document.getElementById("dTitle").style.display = "none";
		} else if (id == "hr12") {
			document.getElementById("mainFrame").src = "task/DelayTask.html";
			document.getElementById("dTitle").style.display = "none";
		} else if (id == "hr13") {
			document.getElementById("mainFrame").src = "task/MoveTaskApply.html";
			document.getElementById("dTitle").style.display = "none";
		} else if (id == "hr14") {
			document.getElementById("mainFrame").src = "task/MoveTask.html";
			document.getElementById("dTitle").style.display = "none";
		} else if (id == "hr24") {
			document.getElementById("mainFrame").src = "client/OrderManager.html";
			document.getElementById("dTitle").innerHTML = "<img src='images/orderManage.jpg' alt='' style='margin-top:5px'/>";
			document.getElementById("dTitle").style.display = "block";
		} else if (id == "hr25") {
			document.getElementById("mainFrame").src = "client/ClientManager.html";
			document.getElementById("dTitle").innerHTML = "<img src='images/clientManage.jpg' alt='' style='margin-top:5px'/>";
			document.getElementById("dTitle").style.display = "block";
		} else if (id == "hr26") {
			document.getElementById("mainFrame").src = "xtsz/NormalManage.htm";
			document.getElementById("dTitle").style.display = "none";
		} else if (id == "hr27") {
			document.getElementById("mainFrame").src = "xtsz/CustomManage.htm";
			document.getElementById("dTitle").style.display = "none";
		} else if (id == "hr34") {
			document.getElementById("mainFrame").src = "task/TaskResult.html";
			document.getElementById("dTitle").style.display = "none";
		} else if (id == "hr35") {
			document.getElementById("mainFrame").src = "item/ItemClass.html";
			document.getElementById("dTitle").style.display = "none";
		} else if (id == "hr36") {
			document.getElementById("mainFrame").src = "item/Item.html";
			document.getElementById("dTitle").style.display = "none";
		} else if (id == "hr37") {
			document.getElementById("mainFrame").src = "item/ItemPact.html";
			document.getElementById("dTitle").style.display = "none";
		} else if (id == "hr38") {
			document.getElementById("mainFrame").src = "item/TaskAllo.html";
			document.getElementById("dTitle").style.display = "none";
		} else if (id == "hr39") {
			document.getElementById("mainFrame").src = "item/TaskProShow.html";
			document.getElementById("dTitle").style.display = "none";
		} else if (id == "hr40") {
			document.getElementById("mainFrame").src = "item/TaskProRec.html";
			document.getElementById("dTitle").style.display = "none";
		} else if (id == "hr41") {
			document.getElementById("mainFrame").src = "item/ItemToFile.html";
			document.getElementById("dTitle").style.display = "none";
		} else if (id == "hr42") {
			document.getElementById("mainFrame").src = "item/ItemToFileAudit.html";
			document.getElementById("dTitle").style.display = "none";
		} else if (id == "hr43") {
			document.getElementById("mainFrame").src = "product/LineManage.htm";
			document.getElementById("dTitle").style.display = "none";
		} else if (id == "hr44") {
			document.getElementById("mainFrame").src = "product/StyleView.htm";
			document.getElementById("dTitle").style.display = "none";
		} else if (id == "hr45") {
			document.getElementById("mainFrame").src = "product/SpecificationView.htm";
			document.getElementById("dTitle").style.display = "none";
		} else if (id == "hr46") {
			document.getElementById("mainFrame").src = "product/productManage.html";
			document.getElementById("dTitle").style.display = "none";
		} else if (id == "hr47") {
			document.getElementById("mainFrame").src = "product/ProductDetail.htm";
			document.getElementById("dTitle").style.display = "none";
		} else if (id == "hr49") {
			document.getElementById("mainFrame").src = "product/FavoritesView.htm";
			document.getElementById("dTitle").style.display = "none";
		} else if (id == "hr50") {
			document.getElementById("mainFrame").src = "product/ProductShowMange.htm";
			document.getElementById("dTitle").style.display = "none";
		} else if (id == "hr497")//48
		{
			document.getElementById("mainFrame").src = "knowledge/Peixuzhiliao.htm";
			document.getElementById("dTitle").innerHTML = "<img src='images/peixunzhiliao.jpg' alt='' style='margin-top:5px'/>";
			document.getElementById("dTitle").style.display = "block";
		} else if (id == "hr498")//49
		{
			document.getElementById("mainFrame").src = "knowledge/OtherKnowLedge.htm";
			document.getElementById("dTitle").innerHTML = "<img src='images/otherziliao.jpg' alt='' style='margin-top:5px'/>";
			document.getElementById("dTitle").style.display = "block";
		} else if (id == "hr499") {
			document.getElementById("mainFrame").src = "knowledge/gerenzhiliaolist.htm";
			document.getElementById("dTitle").innerHTML = "<img src='images/gereziliao.jpg' alt='' style='margin-top:5px'/>";
			document.getElementById("dTitle").style.display = "block";
		} else if (id == "hr500") {
			document.getElementById("mainFrame").src = "knowledge/AuditKnowLedge.html";
			document.getElementById("dTitle").innerHTML = "<img src='images/knowledgeshenhe.jpg' alt='' style='margin-top:5px'/>";
			document.getElementById("dTitle").style.display = "block";
		}

	}
	function changeIcon(id) {
		if (id == "HR") {
			document.getElementById("dTitle").innerHTML = "<img src='images/rensiManage.jpg' alt='' style='margin-top:5px'/>";
			document.getElementById("dTitle").style.display = "block";
		} else if (id == "Notice") {
			document.getElementById("dTitle").style.display = "none";
		} else if (id == "KnowLedge") {
			document.getElementById("dTitle").innerHTML = "<img src='images/itemdangan.jpg' alt='' style='margin-top:5px'/>";
			document.getElementById("dTitle").style.display = "block";
		} else if (id == "Task") {
			document.getElementById("dTitle").style.display = "none";
		} else if (id == "Order") {
			document.getElementById("dTitle").innerHTML = "<img src='images/orderManage.jpg' alt='' style='margin-top:5px'/>";
			document.getElementById("dTitle").style.display = "block";
		} else if (id == "Item") {
			document.getElementById("dTitle").style.display = "none";
		} else if (id == "System") {
			document.getElementById("dTitle").style.display = "none";
		} else if (id == "Product") {
			document.getElementById("dTitle").style.display = "none";
		}
	}
</script>
<link rel="stylesheet" type="text/css" href="css/index.css" />
</head>
<body>
	<div style="width: 1430px; height: 100%;">
		<div class="mian_r" onmousemove="r(22)" onmouseout="r_1(22)">
			<div class="mian_r_bj png" style="display: none;" id="22"
				onmousemove="r(22)" onmouseout="r_1(22)">
				<div>
					<a href="#"> <img src="images\r_icon_03.png" /></a> <a href="#" />
					<img src="images\r_icon_06.png" /> </a> <a href="#"> <img
						src="images\r_icon_08.png" /></a> <a href="#"> <img
						src="images\r_icon_10.png" /></a>
				</div>
			</div>
		</div>
		<table height="100%" width="1425" border="0" cellpadding="0"
			cellspacing="0" style="overflow: hidden;">
			<tr>
				<td colspan="2" height="52">
					<div>
						<div id="header">
							<div class="header01">
								<p class="logo">
									<a href="#"> <img src="images/logo_03.gif"
										alt=""></a>
								</p>
								<p class="right_01"
									style="position: absolute; z-index: 9; width: e-xpression(this.nextSibling.offsetWidth); height: e-xpression(this.nextSibling.offsetHeight); top: e-xpression(this.nextSibling.offsetTop); left: e-xpression(this.nextSibling.offsetLeft);"
									frameborder="0">
									<img src="images/pic_06.gif" alt="">
								</p>
								<p class="right_02">
									您好，<span>${admin.aname }</span>，欢迎登录！
								</p>
							</div>
						</div>
					</div>
				</td>
			</tr>
			<tr>
				<td width="190" valign="top"
					style="background: url(images/lift_bj_02.gif) repeat-y;"
					background="images/lift_bj_02.gif ">

					<div class="side" style="position: absolute;">
						<ul id="nav">
							<li class="y_css" id="xx1" onmouseover="show(1)"
								onmouseout="hidden1(1)"><a href="selectAllUser.do"
								onclick="changeIcon('HR')" target="mainFrame"
								onmousedown="javascript:pr('xx1')"><span></span>
									<p class="icon_01">用户管理</p> </a></li>
							<li class="y_css" id="xx2"><a href="selectAllClothes.do"
								onclick="changeIcon('Notice')" target="mainFrame"
								onmousedown="javascript:pr('xx2')" onmouseover="show(2)"
								onmouseout="hidden1(2)"><span></span>
									<p class="icon_10">服装管理</p> </a></li>
							<li class="y_css" id="xx4"><a href="clothesAll.do"
								onclick="changeIcon('Task')" target="mainFrame"
								onmousedown="javascript:pr('xx4')" onmouseover="show(4)"
								onmouseout="hidden1(4)"><span></span>
									<p class="icon_04">库存管理</p> </a></li>
							<li class="y_css" id="xx3"><a
								href="selectAllOrderBystatus.do?orderstatus=4" target="mainFrame"
								onclick="changeIcon('KnowLedge')"
								onmousedown="javascript:pr('xx3')" onmouseover="show(3)"
								onmouseout="hidden1(3)"> <span></span>
									<p class="icon_02">订单管理</p>
							</a></li>
							<li class="y_css" id="xx5"><a
								href="pie-simple.jsp" onclick="changeIcon('Order')"
								target="mainFrame" onmousedown="javascript:pr('xx5')"
								onmouseover="show(5)" onmouseout="hidden1(5)"><span></span>
									<p class="icon_05">报表管理</p> </a></li>
						</ul>
					</div>
				</td>
				<td width="1215" valign="top">
					<div id="dTitle" style="float: left; margin-left: 30px;">
						<img src='images/shouye.jpg' alt='' style='margin-top: 5px'>
					</div>
					<div style="text-align: right; margin-right: 15px; float: right">

						<img src="images/middil_05.gif" alt=""><a href="login.html"><img
								alt="" src="images/middil_06.gif"></a>
					</div> <iframe frameborder="0" style="margin-top: 15px; height: 631px;"
						width="1215" id="mainFrame" name="mainFrame" src=""></iframe>
				</td>
				<td width="5" valign="top" style="position: relative;" height="93%">
				</td>
			</tr>
		</table>
	</div>
>>>>>>> branch 'master' of https://github.com/nbplus-org/CMS.git
</body>
</html>
