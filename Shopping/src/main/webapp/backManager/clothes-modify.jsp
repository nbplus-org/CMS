<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>修改服装信息</title>
<link rel="stylesheet" type="text/css" href="css/index.css" />
<script type="text/javascript" src="js/jquery-1.7.1.min.js"></script>

<script language="javascript" type="text/javascript">
	function getPicDir() {
		var value = $("#file").val();
		var picDir = value.substring(value.lastIndexOf("\\") + 1);
		$("#showPic").attr('src', "../upload/" + picDir);
		//alert(showPic.src);
	}

	function xiugai() {
		var src=showPic.src;
		var picDir = src.substring(src.lastIndexOf("upload"));
		$.post("springUpload.do", {
			clothesid : $("#clothesid").val(),
			clothesname : $("#clothesname").val(),
			clothesbrand : $("#clothesbrand").val(),
			clothestype : $("#clothestype").val(),
			srcpic : picDir,
			clothesbigtag : $("#clothesbigtag").val(),
			clothesintroduce : $("#clothesintroduce").val(),
			clothesorigprice : $("#clothesorigprice").val(),
			clothesprice : $("#clothesprice").val(),
		}, function(data) {
			alert(data);
		});
		
	}

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
				<li><a href="LineManage.htm">
						<p>修改服装信息</p>
				</a></li>
			</ul>
		</div>
		<div class="mian_b">
			<!-- ==================================form提交修改信息 -->
			<!-- <form
				action="springUpload.do?clothesid=${clothesMsg[0].clothesid }&aid=${admin.aid }&srcpic="
				enctype="multipart/form-data" method="post"> -->

			<table width="100%" border="0" cellpadding="0" cellspacing="0"
				class="mian_b_bg_xz">
				<tr>
					<td width="5%" class="mian_b_bg_lm">&nbsp;</td>
					<td colspan="4" class="mian_b_bg_lm">修改服装信息</td>
				</tr>
				<tr>
					<td>&nbsp;</td>
					<td width="10%" valign="top">服装名称：</td>
					<td width="30%"><input type="hidden" id="clothesid"
						value="${clothesMsg[0].clothesid }" /><input type="text"
						class="input_01" name="clothesname" id="clothesname"
						value="${clothesMsg[0].clothesname }" /></td>
					<td>图片：<input class="input_01" type="file" name="file"
						id="file" onchange="getPicDir()"
						accept="image/png, image/jpeg, image/gif, image/jpg" /></td>
					<td width="40%">&nbsp;</td>
					<td>&nbsp;</td>
				</tr>
				<tr>
					<td>&nbsp;</td>
					<td valign="top">服装品牌：</td>
					<td width="30%"><input type="text" class="input_01"
						name="clothesbrand" id="clothesbrand"
						value="${clothesMsg[0].clothesbrand }" /></td>
					<td width="40%">&nbsp;</td>
					<td>&nbsp;</td>
				</tr>
				<tr>
					<!-- <a
							href="ProductImage.htm" style="text-decoration: underline;">查看产品图库</a> -->
					<td>&nbsp;</td>
					<td valign="top">服装服装标签：</td>
					<td width="30%"><input type="text" class="input_01"
						name="clothestype" id="clothestype"
						value="${clothesMsg[0].clothestype }" /></td>
					<td rowspan="10"><img src="../${clothesMsg[0].clothespicture }"
						width="200px" height="200px" id="showPic" name="srcpic" /></td>
					<td>&nbsp;</td>
				</tr>
				<tr>
					<td>&nbsp;</td>
					<td valign="top">服装类型：</td>
					<td><input type="text" class="input_01" name="clothesbigtag"
						id="clothesbigtag" value="${clothesMsg[0].clothesbigtag }" /></td>
					<td>&nbsp;</td>
				</tr>
				<tr>
					<td>&nbsp;</td>
					<td valign="top">描述：</td>
					<td><input type="text" class="input_01"
						name="clothesintroduce" id="clothesintroduce"
						value="${clothesMsg[0].clothesintroduce }" /></td>
					<td>&nbsp;</td>
				</tr>
				<tr>
					<td>&nbsp;</td>
					<td valign="top">原价：</td>
					<td><input type="text" class="input_01"
						name="clothesorigprice" id="clothesorigprice"
						value="${clothesMsg[0].clothesorigprice }" /></td>
					<td>&nbsp;</td>
				</tr>
				<tr>
					<td>&nbsp;</td>
					<td valign="top">现价：</td>
					<td><input type="text" class="input_01" name="clothesprice"
						id="clothesprice" value="${clothesMsg[0].clothesprice }" /></td>
					<td>&nbsp;</td>
				</tr>
				<tr>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
					<td>
						<div align="center">
							<input type="button" value="提交修改" onclick="xiugai()" /> <a href="selectAllClothes.do"><input
								type="button" value="取消返回" /></a>
						</div>
					</td>
					<td></td>
					<td>&nbsp;</td>
				</tr>
			</table>
			<!-- </form> -->
		</div>
	</div>
</body>
</html>