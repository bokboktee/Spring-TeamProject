<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="nss" tagdir="/WEB-INF/tags/"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="UTF-8">
<meta name="description" content="Ogani Template">
<meta name="keywords" content="Ogani, unica, creative, html">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>냥신사 | 로그인</title>

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
</head>

<body>

	<!-- 헤더(태그) -->
	<nss:header />

	<!-- ★★★★★여기에 페이지의 메인 코드를 넣어주세요★★★★★ -->
	
	<!--================Login Box Area =================-->
	<section class="login_box_area section-margin">
		<div class="container">
			<div class="row">
				<div class="col-lg-6">
					<div class="login_box_img">
						<div class="hover">
							<h4><spring:message code="message.login.firstvisit" /></h4>
							<p><spring:message code="message.login.welcom" /></p>
							<a class="button button-account" href="register.do"><spring:message code="message.login.signup" /></a>
						</div>
					</div>
				</div>
				<div class="col-lg-6">
					<div class="login_form_inner">
						<h3><spring:message code="message.login.login" /></h3>
						<form class="row login_form" action="selectOneMemberLogin.do" id="contactForm" method="POST">
							<input type="hidden" id="urlBackLogin" name="urlBack" value=""/>
							<div class="col-md-12 form-group">
								<input type="text" class="form-control" id="id" name="userId" placeholder="<spring:message code="message.login.id" />" onfocus="this.placeholder = ''" onblur="this.placeholder = '아이디 입력'" required>
							</div>
							<div class="col-md-12 form-group">
								<input type="password" class="form-control" id="password" name="userPw" placeholder="<spring:message code="message.login.pw" />" onfocus="this.placeholder = ''" onblur="this.placeholder = '비밀번호 입력'" required>
							</div>
							<div class="col-md-12 form-group">
								<button type="submit" value="submit" class="button button-login w-100"><spring:message code="message.login.login" /></button>
								<a id="kakao-login-btn" href="javascript:kakaoLogin()">
									<img src="img/kakao_login.png" alt="카카오 로그인 버튼" style="border-radius: 30px;" />
								</a>
								<br>
								<a id="urlBackFindId" href=""><spring:message code="message.login.findid" /></a>
								&nbsp; / &nbsp;
								<a id="urlBackFindPw" href=""><spring:message code="message.login.findpw" /></a>
								<br>
								<br>
							</div>
						</form>
					</div>
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
	
	<!-- 카카오 스크립트 -->
	<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
	<!-- 카카오 스크립트 end -->

	<script>
		$(document).ready(function getURL() {
			var urlBack = document.referrer;
			$('#urlBackLogin').attr('value', urlBack);
			$('#urlBackFindId').attr('href', 'findIdView.do?urlBack=' + urlBack);
			$('#urlBackFindPw').attr('href', 'findPwView.do?urlBack=' + urlBack);
		});
		
		Kakao.init('a4736b83f633d7309942ec1e31da7d0f'); // SDK를 초기화함 / 발급 받은 키 중 javascript키를 사용해준다.
		console.log(Kakao.isInitialized()); // sdk초기화여부판단

		var name = ""; //  이름을 저장할 변수
		/* 카카오 로그인  */
		function kakaoLogin() { // 카카오 로그인 버튼 클릭시 실행되는 함수  
			Kakao.Auth
					.login({
						success : function(response) { // 로그인에 성공하면 받아오는 데이터
							console.log(Kakao.Auth.getAccessToken())
							console.log(response)
							Kakao.API
									.request({
										url : '/v2/user/me', // --> 로그인시 url
										success : function(response) { // 로그인 성공시 받아올 데이터
											console.log(response)
											var name = response.kakao_account.profile.nickname;
											var id = response.id;
											var pw = response.id;
											location.href = "loginCheck.do?userName="
													+ name + "&userId=" + id;
											console.log(response)
											console
													.log(response.kakao_account.profile.nickname) // 로그인 성공한 유저 nickname
											name = response.kakao_account.profile.nickname //  로그인한 유저 이름 저장
										},
										fail : function(error) { // 로그인 실패시
											console.log(error)
										},
									})
						},
						fail : function(error) { // 로그인 실패시
							console.log(error)
						},
					})
		}
		/*  로그인 end */

		/*    로그아웃 */
		/*    function kakaoLogout() {
		      console.log("너 뭐니?" + Kakao.Auth.getAccessToken())
		      if (!Kakao.Auth.getAccessToken()) { // 로그인하지 않은 상태에서 로그아웃 시도
		         console.log("너 뭐니?" + Kakao.Auth.getAccessToken())
		         alert("로그인을 해주세요.");
		         return;
		      }
		      console.log("로그아웃 성공 직전" + Kakao.Auth.getAccessToken())
		      Kakao.Auth.logout(function() { //  로그인한 상태에서 로그아웃 시도
		         /* alert("로그아웃 성공 -> " + Kakao.Auth.getAccessToken()); */
		/* alert("로그아웃되었습니다.");
		});
		}  */
		/* 로그아웃 end */

		/* 회원탈퇴...?*/
		/* function kakaoDelete() { //  탈퇴 버튼 클릭시 실행될 함수
		   if (Kakao.Auth.getAccessToken()) {
		      console.log(Kakao.Auth.getAccessToken())
		      Kakao.API.request({
		         url : '/v1/user/unlink', // --> 탈퇴시 url
		         success : function(response) {
		            console.log(response)
		            alert("탈퇴되었습니다.");
		         },
		         fail : function(error) {
		            console.log(error)
		            alert("로그인 후 시도해주세요");
		         },
		      })
		      Kakao.Auth.setAccessToken(undefined)
		   }
		} */
		/*  회원탈퇴 end */
	</script>

	<!-- TOP 버튼 -->
	<div style="width: 120px; position: fixed; bottom: 80px; right: 100px; z-index: 1;">
		<a href="#">
			<button type="button" class="button-top"><spring:message code="message.login.btntop" /></button>
		</a>
	</div>


</body>

</html>