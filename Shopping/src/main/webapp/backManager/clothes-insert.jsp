<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>进货</title>
<link rel="stylesheet" type="text/css" href="css/index.css" />
<script type="text/javascript" src="js/jquery-1.7.1.min.js"></script>

<script language="javascript" type="text/javascript">
         
         function checkInfo(){
        	 if(document.insertForm.clothesname.value==""){
        		    alert("服装名不能为空");
        		    return false;
        		 }
        	 if(document.insertForm.clothesbrand.value==""){
     		    alert("服装品牌不能为空");
     		    return false;
     		 }
        	 if(document.insertForm.file1.value==""){
      		    alert("品牌图片不能为空");
      		    return false;
      		 }
        	 if(document.insertForm.clothestype.value==""){
       		    alert("服装类型不能为空");
       		    return false;
       		 }
        	 if(document.insertForm.clothesintroduce.value==""){
        		    alert("服装描述不能为空");
        		    return false;
        		 }
        	 if(document.insertForm.clothesintroduce.value==""){
     		    alert("服装描述不能为空");
     		    return false;
     		 }
        	 if(document.insertForm.clothesbigtag.value!="包包"){
            	 if(document.insertForm.clothessize.value==""){
          		    alert("服装尺寸不能为空");
          		    return false;
          		 }else{
          			 return true;
          		 }

     		 }
           	 if(document.insertForm.clothescolour.value==""){
      		    alert("服装颜色不能为空");
      		    return false;
      		 }       	 
           	 if(document.insertForm.stocknum.value==""){
       		    alert("库存数量不能为空");
       		    return false;
       		 }          	 
           	 if(document.insertForm.clothesorigprice.value==""){
        		    alert("进货单价不能为空");
        		    return false;
        		 }          	 
           	 if(document.insertForm.file2.value==""){
     		    alert("服装图片不能为空");
     		    return false;
     		 }
           	 if(document.insertForm.clothesprice.value==""){
      		    alert("销售单价不能为空");
      		    return false;
      		 }
           	 
         }
	
         //onchang事件，显示图片
         function showBrandPic1(){
        	var value = $("#file1").val();
     		var picDir = value.substring(value.lastIndexOf("\\") + 1);
     		$("#showBrandPic").show();
     		$("#showBrandPic").attr('src', "../upload/" + picDir);
     	//	alert(showBrandPic.src);
         }
         
         function showClothesPic2(){
         	var value = $("#file2").val();
      		var picDir = value.substring(value.lastIndexOf("\\") + 1);
      		$("#showClothesPic").show();
      		$("#showClothesPic").attr('src', "../upload/" + picDir);
      	//	alert(showClothesPic.src);
          }
         
</script>
</head>
<body class="mian_bj" onload="come()">
	<div class="mian_top_01">
		<div class="mian_top_r"></div>
		<div class="mian_top_l"></div>
		<div class="mian_top_c">
			<ul>
				<li><a>
						<p>进货</p>
				</a></li>
			</ul>
		</div>
		<div class="mian_b">
		 	 <form
				action="clothesInsert.do" 
				enctype="multipart/form-data" method="post" name="insertForm" onSubmit="return checkInfo()">  
			<table width="100%" border="0" cellpadding="0" cellspacing="0"
				class="mian_b_bg_xz">
				<tr>
					<td width="5%" class="mian_b_bg_lm">&nbsp;</td>
					<td colspan="5" class="mian_b_bg_lm">添加服装</td>
				</tr>
				<tr>
					<td>&nbsp;</td>
					<td width="10%" valign="top">服装名称：</td>
					<td width="30%"><input type="text" class="input_01"
						name="clothesname"  /></td>
					<td width="10%">&nbsp;</td>
					<td>&nbsp;</td>
				</tr>
				<tr>
					<td>&nbsp;</td>
					<td valign="top">服装品牌：</td>
					<td width="30%"><input type="text" class="input_01"
						name="clothesbrand" /></td>
					<td width="20%">&nbsp;</td>
					<td rowspan="5"><img src="../"
						width="150px" height="150px" id="showBrandPic" name="showBrandPic" style="display: none;"/></td>
					<td>&nbsp;</td>
				</tr>
				<tr>
				<!-- <a href="ProductImage.htm"
							style="text-decoration: underline;">查看产品图库</a> -->
					<td>&nbsp;</td>
					<td valign="top">服装标签：</td>
					<td><input type="text" class="input_01" name="clothesbigtag"
						 /></td>
					<td  id="brandpic">品牌图片：<input type="file" name="file1" id="file1" onchange="showBrandPic1()"
					 accept="image/png, image/jpeg, image/gif, image/jpg" /></td>
					<td>&nbsp;</td>
				</tr>
				<tr>
				
				</tr>
				<tr>
					<td>&nbsp;</td>
					<td valign="top">服装类型：</td>
					<td><input type="text" class="input_01" name="clothestype"
						/></td>
					<td>&nbsp;</td>
				</tr>
				<tr>
					<td>&nbsp;</td>
					<td valign="top">描述：</td>
					<td width="30%"><input type="text" class="input_01"
						name="clothesintroduce"  /></td>
					<td width="40%">&nbsp;</td>
					<td>&nbsp;</td>
				</tr>

				<tr>
					<td>&nbsp;</td>
					<td valign="top">尺码：</td>
					<td><input type="text" class="input_01" name="clothessize"
						/></td>
					<td>&nbsp;</td>
				</tr>
				<tr>
					<td>&nbsp;</td>
					<td valign="top">颜色：</td>
					<td width="30%"><input type="text" class="input_01"
						name="clothescolour"  /></td>
					<td width="40%">&nbsp;</td>
					<td>&nbsp;</td>
				</tr>
				<tr>
					<td>&nbsp;</td>
					<td valign="top">数量：</td>
					<td><input type="text" class="input_01" name="stocknum"
						 /></td>
					<td>&nbsp;</td>
				</tr>
				<tr>
					<td>&nbsp;</td>
					<td valign="top">进货单价：</td>
					<td><input type="text" class="input_01" name="clothesorigprice"
						 /></td>
					<td name="clothespic" id="clothespic">服装图片：<input type="file" name="file2" id="file2"
					 accept="image/png, image/jpeg, image/gif, image/jpg" onchange="showClothesPic2()"/></td>
					 <td rowspan="10"><img src="../"
						width="150px" height="150px" id="showClothesPic" name="showClothesPic" style="display: none;"/></td>
					<td>&nbsp;</td>
				</tr>
				<tr>
					<td>&nbsp;</td>
					<td valign="top">销售单价：</td>
					<td><input type="text" class="input_01" name="clothesprice"
						 /></td>
					<td>&nbsp;</td>
				</tr>
				<tr>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
					<td>
						<div align="center">
							<input type="submit" value="新增商品" /> <input type="button"
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