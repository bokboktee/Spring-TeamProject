<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
font-family: SF Pro KR, SF Pro Display, SF Pro Icons, AOS Icons, Apple Gothic,
	HY Gulim, MalgunGothic, HY Dotum, Lexi Gulim, Helvetica Neue, Helvetica,
	Arial, sans-serif ; .layerPopup img {
	margin-bottom: 20px;
}

.layerPopup:before {
	display: block;
	content: "";
	position: fixed;
	left: 0;
	top: 0;
	width: 100%;
	height: 100%;
	/* background: rgba(0, 0, 0, .5); */
	z-index: 9000
}

.layerPopup .layerBox {
	z-index: 10000;
	position: fixed;
	left: 50%;
	top: 50%;
	transform: translate(-50%, -50%);
	padding: 12px;
	background: #a9a9b0;
	border-radius: 6px;
}

.layerPopup .layerBox .title {
	margin-bottom: 10px;
	padding-bottom: 10px;
	font-weight: 600;
	border-bottom: 1px solid #d9d9d9;
}

.layerPopup .layerBox .btnTodayHide {
	font-size: 14px;
	font-weight: 600;
	color: black;
	float: left;
	text-decoration: none;
	width: 150px;
	height: 30px;
	line-height: 30px;
	border: black solid 1px;
	text-align: center;
	text-decoration: none;
}

.layerPopup div {
	display: inline;
}

.layerPopup form {
	margin-top: 5px;
	font-size: 16px;
	font-weight: 600;
	weight: 100%;
	height: 30px;
	line-height: 30px
}

.layerPopup #close {
	font-size: 16px;
	font-weight: 600;
	width: 40px;
	height: 30px;
	color: black;
	float: right;
	line-height: 30px;
	text-align: center;
	text-decoration: underline;
}

.layerPopup a {
	text-decoration: none;
	color: white;
	width: 50px;
	
	height: 40px;
}
</style>

</head>
<body>

	<!-- layer popup content -->
	<div class="layerPopup" id="layer_popup" style="visibility: visible;">
		<div class="layerBox" style="width: 400px;">
			<!-- <h4 class="title">FineApple 공지사항</h4> -->
			<a href="shopDetails.do?pNum=131">
				<div class="cont">
					<p>
						<img src="img/layer_img.jpg" width=100% height=500 usemap="#popup" alt="event page">
					</p>
				</div>
			</a>
			<form name="pop_form">
				<div id="check">
					<input type="checkbox" name="chkbox" value="checkbox" id='chkbox'>
					<label style="color: white;" for="chkbox">&nbsp&nbsp오늘 하루동안 보지 않기</label>
				</div>
				<div id="close">
					<a style="color: white;" href="javascript:closePop();">닫기</a>
				</div>
			</form>
		</div>
	</div>
	<script src="https://code.jquery.com/jquery-3.6.3.min.js" integrity="sha256-pvPw+upLPUjgMXY0G+8O0xUf+/Im1MZjXxxgOcBQBXU=" crossorigin="anonymous"></script>
	<!-- <script src="http://code.jquery.com/ui/1.11.4/jquery-ui.js"></script> -->
	<script type="text/javascript">
		//head 태그 안에 스크립트 선언
		function setCookie(name, value, expiredays) {
			var todayDate = new Date();
			todayDate.setDate(todayDate.getDate() + expiredays);
			document.cookie = name + "=" + escape(value) + "; path=/; expires="
					+ todayDate.toGMTString() + ";"
		}
		function closePop() {
			if (document.pop_form.chkbox.checked) {
				setCookie("nyangsinsa", "done", 1);
			}
			document.all['layer_popup'].style.visibility = "hidden";
		}
	</script>

	<script type="text/javascript">
		cookiedata = document.cookie;
		if (cookiedata.indexOf("nyangsinsa=done") < 0) {
			document.all['layer_popup'].style.visibility = "visible";
		} else {
			document.all['layer_popup'].style.visibility = "hidden";
		}
	</script>
	<!-- 	<script type="text/javascript">
		function popWindowOpen() {
			$('#layerBox').draggable({scroll:false});
		}
	</script>
 -->
</body>
</html>