<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>订单管理</title>
<link rel="stylesheet" type="text/css" href="css/index.css" />
<script type="text/javascript" src="js/jquery-1.7.1.min.js"></script>

<script language="javascript" type="text/javascript">
	function conditionSelectClothes() {
		var clothesname = $("#clothesname").val();
		var clothesbrand = $("#clothesbrand").val();
		var clothesbigtag = $("#clothesbigtag").val();
		var clothestype = $("#clothestype").val();
		var href = "conditionSelectClothes.do?clothesname=" + clothesname
				+ "&clothesbrand=" + clothesbrand + "&clothesbigtag="
				+ clothesbigtag + "&clothestype=" + clothestype;
		window.location.href = href;
	}
</script>

</head>
<body class="mian_bj" style="height: 100%; margin: 0">
	<div class="mian_top_01">
		<div class="mian_top_r"></div>
		<div class="mian_top_l"></div>
		<div class="mian_top_c">
			<ul>
				<li><a href="line-simple.jsp">
						<p>折线图</p>
				</a></li>
				<li><a href="bar-simple.jsp">
						<p>柱状图</p>
				</a></li>
				<li><a href="pie-simple.jsp">
						<p>饼图</p>
				</a></li>
				
			</ul>
		</div>
	</div>
	
		
<div id="container" style="height: 100%"></div>
	<script type="text/javascript" src="js/echarts.min.js"></script>
	<script type="text/javascript">
var dom = document.getElementById("container");
var myChart = echarts.init(dom);
option = {
    xAxis: {
        type: 'category',
        data: ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun']
    },
    yAxis: {
        type: 'value'
    },
    series: [{
        data: [364615256, 400827700, 359922428, 348408848, 392135484, 346606050, 369941458, 414088906, 373155800, 363993362, 408021124, 371341368],
        type: 'line'
    }]
};
myChart.setOption(option, true);
  </script>
</body>
</html>
