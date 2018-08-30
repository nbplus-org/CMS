<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>进货</title>
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
				<li><a href="LineManage.htm">
						<p>进货</p>
				</a></li>
			</ul>
		</div>
		<div class="mian_b">
			<table width="100%" border="0" cellpadding="0" cellspacing="0"
				class="mian_b_bg_xz">
				<tr>
					<td width="5%" class="mian_b_bg_lm">&nbsp;</td>
					<td colspan="4" class="mian_b_bg_lm">添加服装</td>
				</tr>
				<tr>
					<td>&nbsp;</td>
					<td width="10%" valign="top">服装名称：</td>
					<td width="30%"><input type="text" class="input_01"
						name="textfield" id="textfield"></td>
					<td width="40%">&nbsp;</td>
					<td>&nbsp;</td>
				</tr>
				<tr>
					<td>&nbsp;</td>
					<td valign="top">服装品牌：</td>
					<td width="30%"><input type="text" class="input_01"
						name="textfield" id="textfield"></td>
					<td width="40%">&nbsp;</td>
					<td>&nbsp;</td>
				</tr>
				<tr>
				<!-- <a href="ProductImage.htm"
							style="text-decoration: underline;">查看产品图库</a> -->
					<td>&nbsp;</td>
					<td valign="top">服装服装标签：</td>
					<td><input type="text" class="input_01" name="textfield"
						id="text1"/>&nbsp;&nbsp;&nbsp;图片：<input type="file" id="file"/></td>
					<td rowspan="10"><img src="images\jj_03.jpg"></td>
					<td>&nbsp;</td>
				</tr>
				<tr>
					<td>&nbsp;</td>
					<td valign="top">服装类型：</td>
					<td><select>
							<option>家具
								<option>饰品
					</select></td>
					<td>&nbsp;</td>
				</tr>
				<tr>
					<td>&nbsp;</td>
					<td valign="top">描述：</td>
					<td width="30%"><input type="text" class="input_01"
						name="textfield" id="textfield"></td>
					<td width="40%">&nbsp;</td>
					<td>&nbsp;</td>
				</tr>

				<tr>
					<td>&nbsp;</td>
					<td valign="top">尺码：</td>
					<td><select>
							<option>S</option>
								<option>M</option>
									<option>L</option>
										<option>XL</option>
											<option>XXL</option>
												<option>XXXL</option>
					</select></td>
					<td>&nbsp;</td>
				</tr>
				<tr>
					<td>&nbsp;</td>
					<td valign="top">颜色：</td>
					<td width="30%"><input type="text" class="input_01"
						name="textfield" id="textfield"></td>
					<td width="40%">&nbsp;</td>
					<td>&nbsp;</td>
				</tr>
				<tr>
					<td>&nbsp;</td>
					<td valign="top">数量：</td>
					<td><input type="text" class="input_01" name="textfield"
						id="text2"></td>
					<td>&nbsp;</td>
				</tr>
				<tr>
					<td>&nbsp;</td>
					<td valign="top">进货单价：</td>
					<td><input type="text" class="input_01" name="textfield"
						id="text3"></td>
					<td>&nbsp;</td>
				</tr>
				<tr>
					<td>&nbsp;</td>
					<td valign="top">销售单价：</td>
					<td><input type="text" class="input_01" name="textfield"
						id="text3"></td>
					<td>&nbsp;</td>
				</tr>
				<tr>
					<td>&nbsp;</td>
					<td valign="top">备注：</td>
					<td colspan="2"><span></span></td>
					<td>&nbsp;</td>
				</tr>
				<tr>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
					<td>
						<div align="center">
							<a href="productManage.html"> <img src="images\bnt_03.gif"
								style="margin-right: 10px;" width="80" height="22"></a><img
								src="images\bnt_05.gif" alt="" width="80" height="22"
								onclick="javascript:history.go(-1);">
						</div>
					</td>
					<td></td>
					<td>&nbsp;</td>
				</tr>
			</table>
		</div>
	</div>
</body>
</html>
<script src="/common.js"></script>