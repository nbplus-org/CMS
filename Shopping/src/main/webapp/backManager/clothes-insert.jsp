<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>进货</title>
<link rel="stylesheet" type="text/css" href="css/index.css" />
<script type="text/javascript" src="js/jquery-1.7.1.min.js"></script>

<script language="javascript" type="text/javascript">
/* function ajax(){
	var clothesname=$("#clothesname").html();
	var clothesbrand=$("#clothesbrand").html();
	var clothesbigtag=$("#clothesbigtag").html();
	var brandpic=$("#file").val();
	var clothestype=$("#clothestype").html();
	var clothesintroduce=$("#clothesintroduce").html();
	var clothessize=$("#clothessize").html();
	var clothescolour=$("#clothescolour").html();
	var stocknum=$("#stocknum").html();
	var clothesorigprice=$("#clothesorigprice").html;
	var clothesprice=$("#clothesprice").html();
	data={
			clothesname:clothesname,
			clothesbrand:clothesbrand,
			clothesbigtag:clothesbigtag,
		 	brandpic:brandpic, 
	        clothestype:clothestype,
	        clothesintroduce:clothesintroduce,
	        clothessize:clothessize,
	        clothescolour:clothescolour,
	        stocknum:stocknum,
	        clothesorigprice:clothesorigprice,
	        clothesprice:clothesprice,
	};
	$.post("clothesInsert.do",
			data,
			function(data){
		    if(data==0){
		    	alert("成功添加");
		    }else{
		    	alert("失败添加");
		    }
	});
} */


</script>
</head>
<body class="mian_bj" onload="come()">
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
		 	<form
				action="clothesInsert.do"
				enctype="multipart/form-data" method="post"> 
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
						name="clothesname" id="textfield" /></td>
					<td width="40%">&nbsp;</td>
					<td>&nbsp;</td>
				</tr>
				<tr>
					<td>&nbsp;</td>
					<td valign="top">服装品牌：</td>
					<td width="30%"><input type="text" class="input_01"
						name="clothesbrand" id="textfield" /></td>
					<td width="40%">&nbsp;</td>
					<td>&nbsp;</td>
				</tr>
				<tr>
				<!-- <a href="ProductImage.htm"
							style="text-decoration: underline;">查看产品图库</a> -->
					<td>&nbsp;</td>
					<td valign="top">服装标签：</td>
					<td><select name="clothesbigtag">
							<option>男装
							<option>女装
					</select></td>
					<td name="brandpic" id="brandpic">品牌图片：<input type="file" name="file1" id="file1"
					 accept="image/png, image/jpeg, image/gif, image/jpg"/></td>
					<td rowspan="10" valign="top" ><img  src="images\jj_03.jpg" width="100px" height="100px"></td>
					<td>&nbsp;</td>
				</tr>
				<tr>
				
				</tr>
				<tr>
					<td>&nbsp;</td>
					<td valign="top">服装类型：</td>
					<td><input type="text" class="input_01" name="clothestype"
						id="text1"/></td>
					<td>&nbsp;</td>
				</tr>
				<tr>
					<td>&nbsp;</td>
					<td valign="top">描述：</td>
					<td width="30%"><input type="text" class="input_01"
						name="clothesintroduce" id="textfield" /></td>
					<td width="40%">&nbsp;</td>
					<td>&nbsp;</td>
				</tr>

				<tr>
					<td>&nbsp;</td>
					<td valign="top">尺码：</td>
					<td><input type="text" class="input_01" name="clothessize"
						id="text1"/></td>
					<td>&nbsp;</td>
				</tr>
				<tr>
					<td>&nbsp;</td>
					<td valign="top">颜色：</td>
					<td width="30%"><input type="text" class="input_01"
						name="clothescolour" id="textfield" /></td>
					<td width="40%">&nbsp;</td>
					<td>&nbsp;</td>
				</tr>
				<tr>
					<td>&nbsp;</td>
					<td valign="top">数量：</td>
					<td><input type="text" class="input_01" name="stocknum"
						id="text2" /></td>
					<td>&nbsp;</td>
				</tr>
				<tr>
					<td>&nbsp;</td>
					<td valign="top">进货单价：</td>
					<td><input type="text" class="input_01" name="clothesorigprice"
						id="text3" /></td>
					<td name="clothespic" id="clothespic">服装图片：<input type="file" name="file2" id="file2"
					 accept="image/png, image/jpeg, image/gif, image/jpg"/></td>
					<td rowspan="10" valign="top" ><img  src="images\jj_03.jpg" width="100px" height="100px"></td>		
					<td>&nbsp;</td>
				</tr>
				<tr>
					<td>&nbsp;</td>
					<td valign="top">销售单价：</td>
					<td><input type="text" class="input_01" name="clothesprice"
						id="text3" /></td>
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
<script src="/common.js"></script>