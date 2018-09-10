<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>修改服装信息</title>
<link rel="stylesheet" type="text/css" href="css/index.css" />
	<!-- 弹框js -->
    <script src="js/tankuangAlertBox.min.js"></script>
    <!-- 自定义弹框提示 -->
	<script src="js/advice/message.min.js"></script>
<script type="text/javascript" src="js/jquery-1.7.1.min.js"></script>

<script language="javascript" type="text/javascript">

         function ajax(){
        	 var clodetailid=$("#clodetailid").val();
        	 var stocknum=$("#stocknum").val();
        	 var clothesid=$("#clothesid").val();
        	  var data={
        			  clodetailid:clodetailid,
        			  stocknum:stocknum,
        	  };
        	 $.post("addStocknum.do",data,function(data){
        		alert(data);
        		window.location.href="clothesSchedule.do?clothesid="+clothesid;
        	 });
         }
         
       /*   //失败的弹窗
         function showAlert() {
             PostbirdAlertBox.alert({
                 'title': '提示',
                 'content': '操作失败',
                 'okBtn': '好的',
                 'contentColor': 'red',
                 'onConfirm': function () {
                 
                 }
             });
         }
         
         //成功提示框
     	function success(){
             $.message('操作成功');
          }  */
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
							name="stocknum" id="stocknum"/><input type="hidden" value="${clothesid }" id="clothesid"></input></td>
						<td width="50%">&nbsp;</td>
						<td>&nbsp;</td>
					</tr>
			
					<tr>
						<td>&nbsp;</td>
						<td>&nbsp;</td>
						<td>
							<div align="center">
								<input type="submit" value="增加库存" onclick="ajax()" /> <input type="button"
									onclick="javascript:history.go(-1)" value="取消返回" />
								<%-- <span id="check"></span> <input type="hidden" name="clodetailid"
									id="clodetailid" value="${clodetailid }" /> --%>
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