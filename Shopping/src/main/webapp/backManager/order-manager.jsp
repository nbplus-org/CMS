<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>订单管理</title>
<link rel="stylesheet" type="text/css" href="css/index.css" />
<script type="text/javascript" src="js/jquery-1.7.1.min.js"></script>

<script language="javascript" type="text/javascript">
	function conditionSelectClothes() {
		var clothesname = $("#clothesname").val();
		var clothesbrand = $("#clothesbrand").val();
		var clothesbigtag = $("#clothesbigtag").val();
		var clothestype = $("#clothestype").val();
		var href = "conditionSelectClothes.do?clothesname=" + clothesname
				+ "&clothesbrand=" + clothesbrand + "&clothesbigtag="
				+ clothesbigtag + "&clothestype=" + clothestype;
		window.location.href = href;
	}
</script>

</head>
<body class="mian_bj">
	<div class="mian_top_01">
		<div class="mian_top_r"></div>
		<div class="mian_top_l"></div>
		<div class="mian_top_c">
			<ul>
				<li><a href="selectAllOrderBystatus.do?orderstatus=4">
						<p>全部订单</p>
				</a></li>
				<li><a href="selectAllOrderBystatus.do?orderstatus=0">
						<p>待处理订单</p>
				</a></li>
				<li><a href="selectAllOrderBystatus.do?orderstatus=1">
						<p>待收货订单</p>
				</a></li>
				<li><a href="selectAllOrderBystatus.do?orderstatus=2">
						<p>已收货</p>
				</a></li>
				<li><a href="selectAllOrderBystatus.do?orderstatus=-1">
						<p>用户已取消订单</p>
				</a></li>
			</ul>
		</div>
		<div class="mian_b">
			<!-- <div class="mian_b1">

				<p class="mian_b1_sousuo">
					<input id="clothesname" type="text" placeholder="服装名称">
				</p>
				<p class="mian_b1_sousuo">
					<input id="clothesbrand" type="text" placeholder="服装品牌">
				</p>
				<p class="mian_b1_sousuo">
					<input id="clothesbigtag" type="text" placeholder="服装类型">
				</p>
				<p class="mian_b1_sousuo">
					<input id="clothestype" type="text" placeholder="服装标签">
				</p>
				<a onclick="conditionSelectClothes()" title="搜索">
					<p class="mian_b1_a3"></p>
				</a>
			</div> -->
			<table width="100%" border="0" cellpadding="0" cellspacing="0"
				class="mian_b_bg">
				<tr>
					<td width="3%" class="mian_b_bg_lm"><input name=""
						type="hidden" value="">&nbsp;&nbsp; </td>
					<td width="8%" class="mian_b_bg_lm"><span></span>订单号</td>
					<td width="8%" class="mian_b_bg_lm"><span></span>下单人</td>
					<td width="6%" class="mian_b_bg_lm"><span></span>联系电话</td>
					<td width="18%" class="mian_b_bg_lm"><span></span>收货地址</td>
					<td width="10%" class="mian_b_bg_lm"><span></span>下单时间</td>
					<td width="6%" class="mian_b_bg_lm"><span></span>交易金额</td>
					<td width="14%" class="mian_b_bg_lm"><span></span>备注</td>
					<td class="mian_b_bg_lm"><span></span>操作</td>
				</tr>

				<!-- 循环得到服装 -->
				<c:forEach items="${allOrder }" var="o">
					<tr>
						<td><input name="" type="hidden" value=""/>&nbsp; </td>
						<td>${o.orderid }</td>
						<td>${o.uname }</td>
						<td>${o.uphone }</td>
						<td>${o.useraddress }</td>
						<td><fmt:formatDate value="${o.ordertime}" 
								pattern="yyyy-MM-dd HH:mm:ss" /></td>
						<td>${o.tranprice}</td>
						<td>${o.ordernotes}</td>
						<td width="8%">
							<div class="mian_b_icon_04">
								<a href="processOrder.do?orderid=${o.orderid }"> <c:if
										test="${o.orderstatus ==-1}">
										<input type="button" value="<c:out value="订单已取消"></c:out>"
											title="点击查看详情" />
									</c:if> <c:if test="${o.orderstatus ==0}">
										<input type="button" value="<c:out value="待发货"></c:out>"
											title="点击查看详情" />
									</c:if> <c:if test="${o.orderstatus ==1}">
										<input type="button" value="<c:out value="配送中"></c:out>"
											title="点击查看详情" />
									</c:if> <c:if test="${o.orderstatus ==2}">
										<input type="button" value="<c:out value="已收货"></c:out>"
											title="点击查看详情" />
									</c:if>
								</a>
							</div>
						</td>
					</tr>
				</c:forEach>
			</table>
		</div>
		<a href="selectAllOrderBystatus.do?orderstatus=${orderstatus }&page=1">首页</a>&nbsp;
		<c:if test="${currentPage != 1}">
			<a
				href="selectAllOrderBystatus.do?orderstatus=${orderstatus }&page=${currentPage-1}">上一页</a>&nbsp;
		</c:if>

		<%
			int pageTimes = (Integer) request.getAttribute("pageTimes");
			for (int i = 1; i <= pageTimes; i++) {
		%>
		<a
			href="selectAllOrderBystatus.do?orderstatus=${orderstatus }&page=<%=i%>"><%=i%></a>&nbsp;
		<%
			}
		%>
		<c:if test="${currentPage != pageTimes}">
			<a
				href="selectAllOrderBystatus.do?orderstatus=${orderstatus }&page=${currentPage+1}">下一页</a>&nbsp;
		</c:if>
		<a
			href="selectAllOrderBystatus.do?orderstatus=${orderstatus }&page=${pageTimes }">尾页</a>&nbsp;
	</div>
</body>
</html>
<script src="/common.js"></script>