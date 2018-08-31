<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>修改服装信息</title>
<link rel="stylesheet" type="text/css" href="css/index.css" />
<script type="text/javascript" src="js/jquery-1.7.1.min.js"></script>

<script language="javascript" type="text/javascript">
	function getPicDir(){
		var value=$("#file").val();
		var picDir= value.substring( value.lastIndexOf("\\")+1 );
		alert("value="+picDir);
		$("#showPic").attr('src',"../upload/"+picDir);
		
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
						<p>修改服装信息</p>
				</a></li>
			</ul>
		</div>
		<div class="mian_b">
			<!-- ==================================form提交修改信息 -->
			<form
				action="springUpload.do?clothesid=${clothesMsg.clothesid }&aid=${admin.aid }"
				enctype="multipart/form-data" method="post">

				<table width="100%" border="0" cellpadding="0" cellspacing="0"
					class="mian_b_bg_xz">
					<tr>
						<td width="5%" class="mian_b_bg_lm">&nbsp;</td>
						<td colspan="4" class="mian_b_bg_lm">修改服装信息</td>
					</tr>
					<tr>
						<td>&nbsp;</td>
						<td width="10%" valign="top">服装名称：</td>
						<td width="30%"><input type="text" class="input_01"
							name="clothesname" id="textfield"
							value="${clothesMsg.clothesname }" /></td>
						<td>图片：<input class="input_01" type="file" name="file" id="file"
							onchange="getPicDir()" accept="image/png, image/jpeg, image/gif, image/jpg" /></td>
						<td width="40%">&nbsp;</td>
						<td>&nbsp;</td>
					</tr>
					<tr>
						<td>&nbsp;</td>
						<td valign="top">服装品牌：</td>
						<td width="30%"><input type="text" class="input_01"
							name="clothesbrand" id="textfield"
							value="${clothesMsg.clothesbrand }" /></td>
						<td width="40%">&nbsp;</td>
						<td>&nbsp;</td>
					</tr>
					<tr>
						<!-- <a
							href="ProductImage.htm" style="text-decoration: underline;">查看产品图库</a> -->
						<td>&nbsp;</td>
						<td valign="top">服装服装标签：</td>
						<td width="30%"><input type="text" class="input_01"
							name="clothestype" id="text1" value="${clothesMsg.clothestype }" /></td>
						<td rowspan="10"><img src="../upload/${clothesMsg.brandpic }"
							width="200px" height="200px" id="showPic" /></td>
						<td>&nbsp;</td>
					</tr>
					<tr>
						<td>&nbsp;</td>
						<td valign="top">服装类型：</td>
						<td><input type="text" class="input_01" name="clothesbigtag"
							id="text1" value="${clothesMsg.clothesbigtag }" /></td>
						<td>&nbsp;</td>
					</tr>
					<tr>
						<td>&nbsp;</td>
						<td valign="top">描述：</td>
						<td><input type="text" class="input_01"
							name="clothesintroduce" id="textfield"
							value="${clothesMsg.clothesintroduce }" /></td>
						<td>&nbsp;</td>
					</tr>
					<tr>
						<td>&nbsp;</td>
						<td valign="top">原价：</td>
						<td><input type="text" class="input_01"
							name="clothesorigprice" id="text3"
							value="${clothesMsg.clothesorigprice }" /></td>
						<td>&nbsp;</td>
					</tr>
					<tr>
						<td>&nbsp;</td>
						<td valign="top">现价：</td>
						<td><input type="text" class="input_01" name="clothesprice"
							id="text3" value="${clothesMsg.clothesprice }" /></td>
						<td>&nbsp;</td>
					</tr>
					<tr>
						<td>&nbsp;</td>
						<td>&nbsp;</td>
						<td>
							<div align="center">
								<input type="submit" value="提交修改" /> <input type="button"
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