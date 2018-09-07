<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>查看订单</title>
<link rel="stylesheet" type="text/css" href="css/index.css" />
<script type="text/javascript" src="js/jquery-1.7.1.min.js"></script>

<script language="javascript" type="text/javascript">
	function sendout(orderid,aid){
		$.post(
			"updateStatus.do",
			{
				orderid:orderid,
				aid:aid
			},
			function(data){
				alert(data);
				window.location.href="processOrder.do?orderid="+orderid;
			}
		);
	}
</script>
</head>
<body class="mian_bj">
	<div class="mian_top_01">
		<div class="mian_top_r"></div>
		<div class="mian_top_l"></div>
		<div class="mian_top_c">
			<ul>
				<li><a href="LineManage.htm">
						<p>待处理订单</p>
				</a></li>
			</ul>
		</div>

		<!-- =====================订单详情循环输出============================== -->

		<div class="mian_b" style="width: 100%">
			<table width="100%" border="0" cellpadding="0" cellspacing="0"
				class="mian_b_bg_xz" align="center">
				<tr>
					<td width="40%" class="mian_b_bg_lm">&nbsp;</td>
					<td colspan="4" class="mian_b_bg_lm">待处理订单</td>
				</tr>
				<tr>
					<td width="10%" valign="top">订单编号：${OrderDetails[0].orderid }</td>
				</tr>
				<tr>
					<td>下单用户：${OrderDetails[0].uname}</td>
				</tr>
				<tr>
					<td valign="top">收货地址：${OrderDetails[0].useraddress }</td>
				</tr>
				<tr>
					<td valign="top">下单时间：${OrderDetails[0].ordertime }</td>
				</tr>
				<tr>
					<td valign="top">成交价：${OrderDetails[0].tranprice }</td>
				</tr>

				<tr>
					<td valign="top">备注：${OrderDetails[0].ordernotes }</td>
				</tr>
				<!-- 在这循环服装详情的服装 -->
				<c:forEach items="${OrderDetails }" var="od">
					<tr>
						<td>服装名称：${od.clothesname }&nbsp;尺码：${od.clothessize }&nbsp;颜色：${od.clothescolour }&nbsp;数量：${od.num }&nbsp;</td>
					</tr>
				</c:forEach>
				<tr>
					<td>&nbsp;</td>
				</tr>
				<tr>
					<td>&nbsp;</td>
					<td valign="top">订单状态：<c:if
							test="${OrderDetails[0].orderstatus ==-1}">
							<input type="button" value="<c:out value="订单已取消"></c:out>" />
							<input type="button" value="<c:out value="返回上一级"></c:out>"
								onclick="javascript:history.go(-1)" />
						</c:if> <c:if test="${OrderDetails[0].orderstatus ==0}">
							<input type="button" value="<c:out value="点击发货"></c:out>"
								onclick="sendout(${OrderDetails[0].orderid },${admin.aid })" />
							<input type="button" value="<c:out value="返回上一级"></c:out>"
								onclick="javascript:history.go(-1)" />
						</c:if> <c:if test="${OrderDetails[0].orderstatus ==1}">
							<input type="button" value="<c:out value="配送中"></c:out>" />
							<input type="button" value="<c:out value="返回上一级"></c:out>"
								onclick="javascript:history.go(-1)" />
						</c:if> <c:if test="${OrderDetails[0].orderstatus ==2}">
							<input type="button" value="<c:out value="已收货"></c:out>" />
							<input type="button" value="<c:out value="返回上一级"></c:out>"
								onclick="javascript:history.go(-1)" />
						</c:if> <c:if test="${OrderDetails[0].orderstatus ==4}">
							<input type="button" value="<c:out value="用户删除的订单"></c:out>" />
							<input type="button" value="<c:out value="返回上一级"></c:out>"
								onclick="javascript:history.go(-1)" />
						</c:if>
					</td>
					<td width="40%">&nbsp;</td>
				</tr>
			</table>
		</div>
	</div>
</body>
</html>
<script src="/common.js"></script>