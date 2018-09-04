<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>修改服装信息</title>
<link rel="stylesheet" type="text/css" href="css/index.css" />
<script type="text/javascript" src="js/jquery-1.7.1.min.js"></script>

<script language="javascript" type="text/javascript">
	function come() {
<%String success = request.getParameter("success");
			String failure = request.getParameter("failure");
			if (success != null) {%>
	alert(success);
<%} else if (failure != null) {%>
	alert(failure);
<%}%>
	}
</script>
</head>
<body class="mian_bj" onload="come()">
	<div class="mian_top_01">
		<div class="mian_top_r"></div>
		<div class="mian_top_l"></div>
		<div class="mian_top_c">
			<ul>
				<li><a href="clothesAll.do">
						<p>库存管理信息</p>
				</a></li>
				<li><a>
						<p>增加库存</p>
				</a></li>
			</ul>
		</div>
		<div class="mian_b">
			<!-- ==================================form提交修改信息 -->
			<form action="addStocknum.do?clodetailid=${clodetailid }" method="post">

				<table width="100%" border="0" cellpadding="0" cellspacing="0"
					class="mian_b_bg_xz">
					<tr>
						<td width="5%" class="mian_b_bg_lm">&nbsp;</td>
						<td colspan="4" class="mian_b_bg_lm">增加库存</td>
					</tr>
					<tr>
						<td>&nbsp;</td>
						<td valign="top">您需要增加的库存数：</td>
						<td width="30%"><input type="text" class="input_01"
							name="stocknum" id="stocknum"/></td>
						<td width="50%">&nbsp;</td>
						<td>&nbsp;</td>
					</tr>
			
					<tr>
						<td>&nbsp;</td>
						<td>&nbsp;</td>
						<td>
							<div align="center">
								<input type="submit" value="增加库存" /> <input type="button"
									onclick="javascript:history.go(-1)" value="取消返回" />
							</div>
						</td>
						<td></td>
						<td>&nbsp;</td>
					</tr>
				</table>
			</form>
		</div>
	</div>
</body>
</html>