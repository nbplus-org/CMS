<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>服装管理</title>
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
				<li><a href="#">
						<p>服装一览</p>
				</a></li>
			</ul>
		</div>
		<div class="mian_b">
			<div class="mian_b1">

				 <p class="mian_b1_sousuo">
					<input id="clothesname" type="text" placeholder="服装名称" value="${clothes.clothesname }"/>
				</p>
				<p class="mian_b1_sousuo">
					<input id="clothesbrand" type="text" placeholder="服装品牌" value="${clothes.clothesbrand }"/>
				</p>
				<p class="mian_b1_sousuo">
					<input id="clothesbigtag" type="text" placeholder="服装类型" value="${clothes.clothesbigtag }"/>
				</p>
				<p class="mian_b1_sousuo">
					<input id="clothestype" type="text" placeholder="服装标签" value="${clothes.clothestype }"/>
				</p>
				<a onclick="conditionSelectClothes()" title="搜索">
					<p class="mian_b1_a3"></p>
				</a> 
				<a href="selectAllClothes.do" title="搜索全部">
				<p class="mian_b1_a3"></p>
				</a> 
			</div>
			<table width="100%" border="0" cellpadding="0" cellspacing="0"
				class="mian_b_bg">
				<tr>
					<td width="8%" class="mian_b_bg_lm"><span></span>订单编号</td>
					<td width="10%" class="mian_b_bg_lm"><span></span>服装名称</td>
					<td width="10%" class="mian_b_bg_lm"><span></span>服装品牌</td>
					<td width="8%" class="mian_b_bg_lm"><span></span>服装类型</td>
					<td width="12%" class="mian_b_bg_lm"><span></span>服装标签</td>
					<td width="8%" class="mian_b_bg_lm"><span></span>图片</td>
					<td width="12%" class="mian_b_bg_lm"><span></span>描述</td>
					<td class="mian_b_bg_lm"><span></span>操作</td>
				</tr>

				<!-- 循环得到服装 -->
				<c:forEach items="${allClothes }" var="c">
					<tr>
						<td>${c.clothesid }</td>
						<td>${c.clothesname }</td>
						<td>${c.clothesbrand }</td>
						<td>${c.clothesbigtag }</td>
						<td>${c.clothestype }</td>
						<td><img src="../${c. clothespicture}" width="60px" 
							height="50px" /></td>
						<td>${c. clothesintroduce}</td>
						<td width="8%">
							<div class="mian_b_icon_04">
								<a href="clothes-modify.do?clothesid=${c.clothesid }">修改信息</a>
							</div>
						</td>
					</tr>
				</c:forEach>
			</table>
		</div>
		<a
			href="conditionSelectClothes.do?clothesname=${clothes.clothesname }&clothesbrand=${clothes.clothesbrand }&clothesbigtag=${clothes.clothesbigtag }&clothestype=${clothes.clothestype }&page=1">首页</a>&nbsp;
		<c:if test="${currentPage != 1}">
			<a
				href="conditionSelectClothes.do?clothesname=${clothes.clothesname }&clothesbrand=${clothes.clothesbrand }&clothesbigtag=${clothes.clothesbigtag }&clothestype=${clothes.clothestype }&page=${currentPage-1}">上一页</a>&nbsp;
		</c:if>

		<%
			int pageTimes = (Integer) request.getAttribute("pageTimes");
			for (int i = 1; i <= pageTimes; i++) {
		%>
		<a
			href="conditionSelectClothes.do?clothesname=${clothes.clothesname }&clothesbrand=${clothes.clothesbrand }&clothesbigtag=${clothes.clothesbigtag }&clothestype=${clothes.clothestype }&page=<%=i%>"><%=i%></a>&nbsp;
		<%
			}
		%>
		<c:if test="${currentPage != pageTimes}">
			<a
				href="conditionSelectClothes.do?clothesname=${clothes.clothesname }&clothesbrand=${clothes.clothesbrand }&clothesbigtag=${clothes.clothesbigtag }&clothestype=${clothes.clothestype }&page=${currentPage+1}">下一页</a>&nbsp;
		</c:if>
		<a
			href="conditionSelectClothes.do?clothesname=${clothes.clothesname }&clothesbrand=${clothes.clothesbrand }&clothesbigtag=${clothes.clothesbigtag }&clothestype=${clothes.clothestype }&page=${pageTimes }">尾页</a>&nbsp;
	</div>
</body>
</html>
<script src="/common.js"></script>