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
<title>냥신사 | CONTACT</title>



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
<link rel="stylesheet" href="css/alert.css" type="text/css">
</head>



<body>
	<nss:header />

	<!-- 메인 화면에는 제외 -->
	<!-- Breadcrumb Section Begin -->
	<section class="breadcrumb-section set-bg" data-setbg="">
		<div class="container">
			<div class="row">
				<div class="col-lg-12 text-center">
					<div class="breadcrumb__text">
						<h2>contact</h2>
						<!-- <div class="breadcrumb__option">
                     <a href="./index.html">홈</a>
                  </div> -->
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Breadcrumb Section End -->

	<!-- Contact Section Begin -->
	<section class="contact spad">
		<div class="container">
			<div class="row">
				<div class="col-lg-3 col-md-3 col-sm-6 text-center">
					<div class="contact__widget">
						<span class="icon_phone"></span>
						<h4>대표 번호</h4>
						<p>+82 02-0202-0202</p>
					</div>
				</div>
				<div class="col-lg-3 col-md-3 col-sm-6 text-center">
					<div class="contact__widget">
						<span class="icon_pin_alt"></span>
						<h4>주소</h4>
						<p>서울특별시 강남구 역삼동 골목길</p>
					</div>
				</div>
				<div class="col-lg-3 col-md-3 col-sm-6 text-center">
					<div class="contact__widget">
						<span class="icon_clock_alt"></span>
						<h4>운영 시간</h4>
						<p>10:00 ~ 18:00</p>
					</div>
				</div>
				<div class="col-lg-3 col-md-3 col-sm-6 text-center">
					<div class="contact__widget">
						<span class="icon_mail_alt"></span>
						<h4>Email</h4>
						<p>nyangsinsa@gmail.com</p>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Contact Section End -->

	<!-- Map Begin -->
	<div class="map">
		<iframe src="https://maps.google.com/maps?q=%EC%84%9C%EC%9A%B8%ED%8A%B9%EB%B3%84%EC%8B%9C%20%EA%B0%95%EB%82%A8%EA%B5%AC%20%EC%97%AD%EC%82%BC%EB%8F%99%20736-7&t=&z=15&ie=UTF8&iwloc=&output=embed" height="500" style="border: 0;" allowfullscreen="" aria-hidden="false" tabindex="0"></iframe>
		<div class="map-inside">
			<i class="icon_pin"></i>
			<div class="inside-widget">
				<h4>코리아 it</h4>
				<ul>
					<li>번호 : +82 02-0202-0202</li>
					<li>주소 : 서울특별시 강남구 역삼동 골목길</li>
				</ul>
			</div>
		</div>
	</div>
	<!-- Map End -->

	<!-- Contact Form Begin -->
	<div class="contact-form spad">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="contact__form__title">
						<h2>의견 보내기</h2>
					</div>
				</div>
			</div>
			<form id="contact-form">
				<div class="row">
					<div class="col-lg-6 col-md-6">
						<input type="text" id="name" name="name" placeholder="이름 입력" required>
						<input type="hidden" name="contact_number">
					</div>
					<div class="col-lg-6 col-md-6">
						<input type="email" id="email2" name="email2" placeholder="이메일 입력" required>
					</div>
					<div class="col-lg-12 text-center">
						<textarea name="message" id="message" placeholder="의견 작성" required></textarea>
						<button type="submit" class="site-btn">보내기</button>
					</div>
				</div>
			</form>
		</div>
	</div>

	<!-- Contact Form End -->

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
	<script src="js/email.js"></script>
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

	<!-- 이메일 스크립트 -->
	<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/emailjs-com@2.4.1/dist/email.min.js"></script>
	<script type="text/javascript">
		(function() {
			emailjs.init('tF1Xl-q593SoUIe7n');
		})();
	</script>
	<script type="text/javascript">
		window.onload = function() {
			document.getElementById('contact-form').addEventListener(
					'submit',
					function(event) {
						event.preventDefault();
						this.contact_number.value = Math.random() * 100000 | 0;
						emailjs.sendForm('service_g4rgr9x', 'template_ckvoqfx',
								this).then(function() {
							swal({
								text : "냥신사로 메일을 보냈어요!",
								button : "확인"
							}).then(function(){
							location.replace("contact.do");
							console.log('SUCCESS!');
							});
						}, function(error) {
							swal({
								text : "냥신사로 메일을 보내기를 실패했어요... 다시 시도해주세요!",
								button : "확인"
							});
							console.log('FAILED...', error);
						});
					});
		}
	</script>
	<!-- 이메일 스크립트 end -->


	<!-- TOP 버튼 -->
	<div style="width: 120px; position: fixed; bottom: 80px; right: 100px; z-index: 1;">
		<a href="#">
			<button type="button" class="button-top">▲ 맨위로</button>
		</a>
	</div>
</body>


</html>
