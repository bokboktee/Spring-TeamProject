<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="nss" tagdir="/WEB-INF/tags/"%>
<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="UTF-8">
<meta name="description" content="Ogani Template">
<meta name="keywords" content="Ogani, unica, creative, html">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>냥신사 | 비밀번호 찾기</title>

<!-- favicon -->
<link rel="shortcut icon" type="image/x-icon" href="img/favicon.ico" />

<!-- google Font -->
<link href="https://fonts.googleapis.com/css2?family=Cairo:wght@200;300;400;600;900&display=swap" rel="stylesheet">

<!-- Css Styles -->
<link rel="stylesheet" href="css/bootstrap.min.css" type="text/css">
<link rel="stylesheet" href="css/font-awesome.min.css" type="text/css">
<link rel="stylesheet" href="css/elegant-icons.css" type="text/css">
<link rel="stylesheet" href="css/nice-select.css" type="text/css">
<link rel="stylesheet" href="css/jquery-ui.min.css" type="text/css">
<link rel="stylesheet" href="css/owl.carousel.min.css" type="text/css">
<link rel="stylesheet" href="css/slicknav.min.css" type="text/css">
<link rel="stylesheet" href="css/style.css" type="text/css">
<link rel="stylesheet" href="css/style_login.css" type="text/css">
<link rel="stylesheet" href="css/alert.css" type="text/css">
</head>

<body>
		<nss:header />

	<!-- ★★★★★여기에 페이지의 메인 코드를 넣어주세요★★★★★ -->

	<!--================Login Box Area =================-->
	<section class="login_box_area section-margin">
		<div class="container" align="center">

			<div class="col-lg-6">
				<div class="login_form_inner">
					<h3>비밀번호 찾기</h3>
					<form class="row login_form" action="findPw.do" id="contactForm" method="post">
					<input type="hidden" id="urlBack" name="urlBack" value=""/>
						<div class="col-md-12 form-group">
							<input type="text" class="form-control" id="userId" name="userId" placeholder="아이디 입력" onfocus="this.placeholder = ''" onblur="this.placeholder = '아이디 입력'" required>
						</div>
						<br>
						<div class="col-md-12 form-group">
							<input type="text" class="form-control" id="userName" name="userName" placeholder="이름 입력" onfocus="this.placeholder = ''" onblur="this.placeholder = '이름 입력'" required>
						</div>
						<div class="col-md-12 form-group">
							<input type="tel" style="width: 100%;" id="userPhoneNum" name="phoneNum" placeholder="전화번호 입력" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" required>
						</div>
						<br><br><br>
						<div class="col-md-12 form-group">
							<button type="submit" value="submit" class="button button-login w-100">비밀번호 찾기</button>
							<br><br>
						</div>
					</form>
				</div>
			</div>
		</div>
	</section>
	<!--================End Login Box Area =================-->

	<!-- Footer Section Begin -->
	<nss:footer />
	<!-- Footer Section End -->

	<!-- Js Plugins -->
	<script src="js/jquery-3.3.1.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/jquery.nice-select.min.js"></script>
	<script src="js/jquery-ui.min.js"></script>
	<script src="js/jquery.slicknav.js"></script>
	<script src="js/mixitup.min.js"></script>
	<script src="js/owl.carousel.min.js"></script>
	<script src="js/main.js"></script>
	<%--ajax 쓰기 위해 JQ연결 --%>
	<script src="https://code.jquery.com/jquery-3.6.3.min.js" integrity="sha256-pvPw+upLPUjgMXY0G+8O0xUf+/Im1MZjXxxgOcBQBXU=" crossorigin="anonymous"></script>
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	<script type="text/javascript">
	
		$(document).ready(function getURL() {
			var urlBack = document.referrer;
			$('#urlBack').attr('value', urlBack);
		});
	
		var number = 0; //랜덤문자인증번호 저장할 변수	
		//  var phoneCheck=0;  //인증번호 일치, 불일치 변수
		var userPhoneNum = 0; // 유저 폰번호 스코프때문에 위로 뺐음 
		var userName;
		var userId;
		//인증번호 전송하기: sms()
		function sms() {
			console.log('로그 1 : sms()라는 JS 함수가 연결되었음');
			userId = $("#userId").val();
			userName = $("#userName").val();
			userPhoneNum = $("#userPhoneNum").val();
			console.log('로그1 : userId ' + userId);
			console.log('로그2 : userName ' + userName);
			console.log('로그3 : userPhoneNum ' + userPhoneNum);
			if(userId == ''){
				swal({
					text : "아이디를 입력해주세요.",
					button : "확인"
				});
				return;
			}else if(userName == ''){
				swal({
					text : "이름을 입력해주세요.",
					button : "확인"
				});
				return;
			}else if(userPhoneNum==''){
				swal({
					text : "번호를 입력해주세요.",
					button : "확인"
				});
				return;
			}
			//Sms서블릿클래스로 이동함.
			$.ajax({
				type : 'POST',
				url : 'sms.do',
				data : {
					userPhoneNum : userPhoneNum
				},
				success : function(randNum) {
					console.log("로그:인증번호[" + randNum + "]")
					if (randNum != null) {
						swal({
							text : "인증번호 전송이 완료되었습니다!",
							button : "확인"
						});
						number = randNum; //랜덤문자인증번호
					} else {
						swal({
							text : "인증번호 전송이 불가합니다.",
							button : "확인"
						});
					}

				}
			})

		}

		//인증번호 비교: sms()
		function smsCheck() {
			console.log('로그 : smsCheck()라는 JS 함수가 연결되었음');
			var checkNum = $("#userCheck").val();
			console.log('로그(사용자가 입력한 값) : checkNum ' + checkNum);

			//SmsCheck서블릿클래스로 이동
			$.ajax({
				type : 'POST',
				url : 'checkSms.do',
				data : {
					randNum : number,
					checkNum : checkNum
				},
				success : function(result) {
					console.log("로그 result:[" + result + "]")
					console.log(typeof result);
					if (result == "1") {
						swal({
							text : "인증번호가 일치합니다!",
							button : "확인"
						});
						console.log('폰번호 :' + userPhoneNum);
						console.log(userName);
						var link = 'findPw.do?phoneNum=' + userPhoneNum
								+ '&userId=' + userId + '&userName='
								+ userName;
						location.href = link;
					} else {
						console.log('후후  : userPhoneNum ' + userPhoneNum);
						swal({
							text : "인증번호가 일치하지 않습니다. 다시 입력하세요!",
							button : "확인"
						});
					}
				}
			})
		}
	</script>

	<!-- TOP 버튼 -->
	<div style="width: 120px; position: fixed; bottom: 80px; right: 100px; z-index: 1;">
		<a href="#">
			<button type="button" class="button-top">▲ 맨위로</button>
		</a>
	</div>

</body>

</html>