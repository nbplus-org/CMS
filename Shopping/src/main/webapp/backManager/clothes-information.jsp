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
				<li><a>
						<p>库存管理信息</p>
				</a></li>
				<li><a href="clothes-insert.jsp">
						<p>新增产品</p>
				</a></li>
			</ul>
		</div>
		<div class="mian_b">
			<!-- ==================================form库存管理信息 -->

				<table width="100%" border="0" cellpadding="0" cellspacing="0"
					class="mian_b_bg">
				<tr>
					<td width="8%" class="mian_b_bg_lm"><span></span>服装编号</td>
					<td width="10%" class="mian_b_bg_lm"><span></span>服装名称</td>
					<td width="10%" class="mian_b_bg_lm"><span></span>服装品牌</td>
					<td width="8%" class="mian_b_bg_lm"><span></span>服装类型</td>
					<td width="12%" class="mian_b_bg_lm"><span></span>服装标签</td>
					<td width="8%" class="mian_b_bg_lm"><span></span>品牌图片</td>
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
						<td><img src="../${c. brandpic}" width="60px" 
							height="50px" /></td>
						<td>${c. clothesintroduce}</td>
						<td width="8%">
							<div class="mian_b_icon_04">
								<a href="clothesSchedule.do?clothesid=${c.clothesid }">库存详情</a>
							</div>
						</td>
					</tr>
				</c:forEach>
				</table>
		</div>
				<a
			href="clothesAll.do?page=1">首页</a>&nbsp;
		<c:if test="${currentPage != 1}">
			<a
				href="clothesAll.do?page=${currentPage-1}">上一页</a>&nbsp;
		</c:if>

		<%
			int pageTimes = (Integer) request.getAttribute("pageTimes");
			for (int i = 1; i <= pageTimes; i++) {
		%>
		<a
			href="clothesAll.do?page=<%=i%>"><%=i%></a>&nbsp;
		<%
			}
		%>
		<c:if test="${currentPage != pageTimes}">
			<a
				href="clothesAll.do?page=${currentPage+1}">下一页</a>&nbsp;
		</c:if>
		<a
			href="clothesAll.do?page=${pageTimes }">尾页</a>&nbsp;
	</div>
</body>
</html>