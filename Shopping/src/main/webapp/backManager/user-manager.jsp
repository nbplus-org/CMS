<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>用户管理</title>
<link rel="stylesheet" type="text/css" href="css/index.css"/>
	<script type="text/javascript" src="js/jquery-1.7.1.min.js"></script>
	<script language="javascript" type="text/javascript">
		function click1(num) {

			if (document.getElementById(num).style.display == "block") {
				document.getElementById(num).style.display = "none";
			} else {
				document.getElementById(num).style.display = "block";

			}

		}

		//得到选择的checkbox
		function checkNames() {
			var obj = document.getElementsByName("checkName");
			var ids = [];
			var j = 0;
			for (var i = 0; i < obj.length; i++) {
				if (obj[i].checked) {
					ids[j] = obj[i].value;
					j++;
				}
			}
			obj.checked = false;
			$.ajax({
				url : "resetPwd.do",
				dataType : "json",
				type : "post",
				data : {
					"ids" : ids
				},//使用这种数组方式的，得加下一句才可以，使用传统方式
				traditional : true,
				success : function(data) {
					alert(data);
				}
			});
			alert("重置密码成功");
			window.location.reload();
		}

		//一般查询
		function commonSearch() {
			var val = $("#username").val();
			var href = "commonSearch.do?keyWord=" + val;
			window.location.href = href;
		}

		//高级查询
		function topSearch() {
			var nameTop = $("#username").val();
			var usexTop = $("#usexTop").val();
			var uemailTop = $("#uemailTop").val();
			var uphoneTop = $("#uphoneTop").val();
			var href = "topSearch.do?usex=" + usexTop + "&uemail=" + uemailTop
					+ "&uphone=" + uphoneTop+"&uname="+nameTop;
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
				<li><a href="selectAllUser.do">
						<p>用户管理</p>
				</a></li>
			</ul>
		</div>
		<div class="mian_b">
			<div class="mian_b1">

				<button onclick="checkNames()"
					style="height: 35px; width: 70px; font-size: 12px; float: left; margin: 5px; margin-top: 10px; margin-left: 15px;">密码重置</button>

				<p class="mian_b1_sousuo">
					<input id="username" type="text" placeholder="账号" value="${user.uname }"/>
				</p>
					<select id="usexTop" class="mian_b1_sousuo">
					<c:if test="${user.usex==null }">
						<option>性别</option>
					</c:if>
					<c:if test="${user.usex !=null}">
						<option>${user.usex ==1?"男":"女"}</option>
					</c:if>
						<option>男</option>
						<option>女</option>
					</select>
					<p class="mian_b1_sousuo">
					<input id="uemailTop" type="text" placeholder="邮箱" class="input_03" value="${user.uemail }"/>
				</p>
				<p class="mian_b1_sousuo">
					<input id="uphoneTop" type="text" placeholder="手机" class="input_03" value="${user.uphone }"/>
				</p>

				<a onclick="topSearch()" title="搜索">
					<p class="mian_b1_a3"></p>
				</a>
				<a href="selectAllUser.do" title="搜索全部">
					<p class="mian_b1_a3"></p>
				</a>

				<!-- <p class="mian_b1_a9">
					<a href="#" onclick="click1('search')">高级搜索>></a>
				</p> -->

			</div>
			<table width="100%" border="0" cellpadding="0" cellspacing="0"
				class="mian_b_bg" align="center">
				<tr>
					<td width="3%" class="mian_b_bg_lm"><input name=""
						type="hidden" value="" />&nbsp;</td>
					<td width="12%" class="mian_b_bg_lm"><span></span>用户编号</td>
					<td width="12%" class="mian_b_bg_lm"><span></span>用户账号</td>
					<td width="19%" class="mian_b_bg_lm"><span></span>密码</td>
					<td width="8%" class="mian_b_bg_lm"><span></span>性别</td>
					<td width="10%" class="mian_b_bg_lm"><span></span>手机号</td>
					<td width="12%" class="mian_b_bg_lm"><span></span>邮箱</td>
					<td width="10%" class="mian_b_bg_lm"><span></span>购物积分</td>
					<td width="14%" class="mian_b_bg_lm"><span></span>生日</td>
				</tr>

				<!-- jstl将查询的用户循环输出 -->
				<c:forEach items="${allUser }" var="user">
					<tr>
						<td><input name="checkName" type="checkbox"
							value=${user.uid } />&nbsp;</td>
						<td>${user.uid }</td>
						<td>${user.uname }</td>
						<td>${user.upwd }</td>
						<td>${user.usex =='1'?'男':'女'}</td>
						<td>${user.uphone }</td>
						<td>${user.uemail }</td>
						<td>${user.uintegral }</td>
						<td>${user.ubirthday }</td>
					</tr>
				</c:forEach>
			</table>
		</div>
		<br /> <a href="topSearch.do?uname=${user.uname }&uemail=${user.uemail }&uphone=${user.uphone }&usex=${user.usex }&page=1">首页</a>&nbsp;
		<c:if test="${currentPage != 1}">
			<a href="topSearch.do?uname=${user.uname }&uemail=${user.uemail }&uphone=${user.uphone }&usex=${user.usex }&page=${currentPage-1}">上一页</a>&nbsp;
		</c:if>

		<%
			int pageTimes = (Integer) request.getAttribute("pageTimes");
			for (int i = 1; i <= pageTimes; i++) {
		%>
		<a href="topSearch.do?uname=${user.uname }&uemail=${user.uemail }&uphone=${user.uphone }&usex=${user.usex }&page=<%=i%>"><%=i%></a>&nbsp;
		<%
			}
		%>
		<c:if test="${currentPage != pageTimes}">
			<a href="topSearch.do?uname=${user.uname }&uemail=${user.uemail }&uphone=${user.uphone }&usex=${user.usex }&page=${currentPage+1}">下一页</a>&nbsp;
		</c:if>
		<a href="topSearch.do?uname=${user.uname }&uemail=${user.uemail }&uphone=${user.uphone }&usex=${user.usex }&page=${pageTimes }">尾页</a>&nbsp;

	</div>

</body>
</html>
