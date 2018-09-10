<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>库存管理信息</title>
<link rel="stylesheet" type="text/css" href="css/index.css" />
<script type="text/javascript" src="js/jquery-1.7.1.min.js"></script>

<script language="javascript" type="text/javascript">
</script>
</head>
<body class="mian_bj">
    	<div class="mian_top_01">
		<div class="mian_top_r"></div>
		<div class="mian_top_l"></div>
		<div class="mian_top_c">
			<ul>
				<li><a href="clothesAll.do">
						<p>库存管理信息</p>
				</a></li>
				<li><a >
						<p>库存详情信息</p>
				</a></li>
			</ul>
		</div>
		<div class="mian_b">
			<!-- ==================================form库存详情信息 -->

				<table width="100%" border="0" cellpadding="0" cellspacing="0"
					class="mian_b_bg">
				<tr>
					<td width="8%" class="mian_b_bg_lm"><span></span>详情编号</td>
					<td width="10%" class="mian_b_bg_lm"><span></span>服装名称</td>
					<td width="10%" class="mian_b_bg_lm"><span></span>服装颜色</td>
					<td width="8%" class="mian_b_bg_lm"><span></span>服装尺寸</td>
					<td width="12%" class="mian_b_bg_lm"><span></span>服装库存</td>
					<td width="8%" class="mian_b_bg_lm"><span></span>服装图片</td>
					<td width="12%" class="mian_b_bg_lm"><span></span>描述</td>
					<td class="mian_b_bg_lm"><span></span>操作</td>
				</tr>
				
								<!-- 循环得到服装 -->
				<c:forEach items="${allClothes }" var="c">
					<tr>
						<td>${c.clodetailid }</td>
						<td>${c.clothesname }</td>
						<td>${c.clothescolour }</td>
						<td>${c.clothessize }</td>
						<td>${c.stocknum }</td>
						<td><img src="../${c. clothespic}" width="60px" 
							height="50px" /></td>
						<td>${c. clothesintroduce}</td>
						<td width="8%">
							<div class="mian_b_icon_04">
								<a href="addNum.do?clodetailid=${c.clodetailid }&clothesid=${c.clothesid}">添加库存</a>
							</div>
						</td>
					</tr>
				</c:forEach>
				</table>
		</div>
				<a
			href="clothesSchedule.do?page=1&clothesid=${clothesid}">首页</a>&nbsp;
		<c:if test="${currentPage != 1}">
			<a
				href="clothesSchedule.do?page=${currentPage-1}&clothesid=${clothesid}">上一页</a>&nbsp;
		</c:if>

		<%
			int pageTimes = (Integer) request.getAttribute("pageTimes");
			for (int i = 1; i <= pageTimes; i++) {
		%>
		<a
			href="clothesSchedule.do?page=<%=i%>&clothesid=${clothesid}"><%=i%></a>&nbsp;
		<%
			}
		%>
		<c:if test="${currentPage != pageTimes}">
			<a
				href="clothesSchedule.do?page=${currentPage+1}&clothesid=${clothesid}">下一页</a>&nbsp;
		</c:if>
		<a
			href="clothesSchedule.do?page=${pageTimes }&clothesid=${clothesid}">尾页</a>&nbsp;
	</div>
</body>
</html>