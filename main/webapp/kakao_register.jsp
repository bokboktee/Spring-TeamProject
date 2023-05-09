<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="UTF-8">
<meta name="description" content="Ogani Template">
<meta name="keywords" content="Ogani, unica, creative, html">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>냥신사 | 카카오 회원가입</title>
<style>
.button-purple {
	/* width:100%;
   height : 100%;
   display: inherit; */
	align-items: inherit;
	justify-content: inherit;
	background-color: #6667AB;
	color: white;
	padding: 10px 30px 10px 30px;
	border-radius: 10px;
}
</style>

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
<link rel="stylesheet" href="css/style_profile.css" type="text/css">
</head>

<body>
	<!-- Page Preloder -->
	<div id="preloder">
		<div class="loader"></div>
	</div>
	<!-- Breadcrumb Section Begin -->
	<section class="breadcrumb-section set-bg" data-setbg="">
		<div class="container">
			<div class="row">
				<div class="col-lg-12 text-center">
					<div class="breadcrumb__text">
						<h2>카카오로 회원가입 완료하기</h2>
						<!-- <div class="breadcrumb__option">
                     <a href="./index.html">홈</a>
                  </div> -->
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Breadcrumb Section End -->

	<div class="container">
		<section class="section main-section">
			<div class="grid grid-cols-1 gap-6 col-lg-12mb-6">
				<!-- 수정함 -->
				<div class="card">
					<header class="card-header">
						<p class="card-header-title">
							<span class="icon"><i class="mdi mdi-account-circle"></i></span> 정보 입력
						</p>
					</header>
					<div class="card-content">
						<form action="signUp.do" method="POST">
							<hr>
							<div class="field">
								<label class="label">이름</label>
								<div class="field-body">
									<div class="field">
										<div class="control">
											<input type="hidden" id="urlBack" name="urlBack" value="" />
											<input type="text" autocomplete="on" name="userName" value="${data.userName}" class="input" required>
										</div>
										<p class="help">* 이름을 입력하세요.</p>
									</div>
								</div>
							</div>
							<div class="field">
								<label class="label">고양이 이름</label>
								<div class="field-body">
									<div class="field">
										<div class="control">
											<input type="text" autocomplete="on" name="catName" value="냥숙녀" class="input" required>
											<input type="hidden" autocomplete="on" name="userId" value="${data.userId}" class="input" required>
											<input type="hidden" autocomplete="on" name="userPw" value="${data.userId}" class="input" required>
										</div>
										<p class="help">* 고양이 이름을 입력하세요.</p>
									</div>
								</div>
							</div>
							<div class="field">
								<label class="label">전화번호</label>
								<div class="field-body">
									<div class="field">
										<div class="control">
											<input type="text" autocomplete="on" class="input" name="phoneNum" placeholder="전화번호 입력" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" required>
										</div>
										<p class="help">* 전화번호를 입력하세요.</p>
									</div>
								</div>
							</div>
							<div class="field">
								<label class="label">주소</label>
								<div class="field-body">
									<div class="field">
										<div class="control">
											<input type="button" class="button button-register" style="background: #6667AB; color: white;" value="우편번호 찾기" onclick="sample6_execDaumPostcode()" readonly>
											<input type="text" id="post" class="form-control" style="margin-bottom: 10px; margin-top: 10px;" placeholder="우편번호" onclick="sample6_execDaumPostcode()" name="postNum" readonly>
											<input type="text" class="form-control" style="margin-bottom: 10px; margin-top: 10px;" id="address" name="address1" placeholder="주소" readonly>
											<input type="text" class="form-control" id="address_plus" name="addressPlus" placeholder="참고항목" readonly>
											<input type="text" class="form-control" style="margin-bottom: 10px; margin-top: 10px;" id="address_detail" name="address2" placeholder="상세주소" required>
										</div>
									</div>
								</div>
							</div>
							<hr>
							<div class="field">
								<div class="control">
									<button type="submit" class="button-purple">회원가입 완료하기</button>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</section>
	</div>

	<!-- Js Plugins -->
	<script src="js/jquery-3.3.1.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/jquery.nice-select.min.js"></script>
	<script src="js/jquery-ui.min.js"></script>
	<script src="js/jquery.slicknav.js"></script>
	<script src="js/mixitup.min.js"></script>
	<script src="js/owl.carousel.min.js"></script>
	<script src="js/main.js"></script>

	<!-- 주소 API 스크립트 -->
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script>
		function sample6_execDaumPostcode() {
			new daum.Postcode(
					{
						oncomplete : function(data) {
							// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

							// 각 주소의 노출 규칙에 따라 주소를 조합한다.
							// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
							var addr = ''; // 주소 변수
							var extraAddr = ''; // 참고항목 변수

							//사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
							if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
								addr = data.roadAddress;
							} else { // 사용자가 지번 주소를 선택했을 경우(J)
								addr = data.jibunAddress;
							}

							// 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
							if (data.userSelectedType === 'R') {
								// 법정동명이 있을 경우 추가한다. (법정리는 제외)
								// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
								if (data.bname !== ''
										&& /[동|로|가]$/g.test(data.bname)) {
									extraAddr += data.bname;
								}
								// 건물명이 있고, 공동주택일 경우 추가한다.
								if (data.buildingName !== ''
										&& data.apartment === 'Y') {
									extraAddr += (extraAddr !== '' ? ', '
											+ data.buildingName
											: data.buildingName);
								}
								// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
								if (extraAddr !== '') {
									extraAddr = ' (' + extraAddr + ')';
								}
								// 조합된 참고항목을 해당 필드에 넣는다.
								document.getElementById("address_plus").value = extraAddr;

							} else {
								document.getElementById("address_plus").value = '';
							}

							// 우편번호와 주소 정보를 해당 필드에 넣는다.
							document.getElementById('post').value = data.zonecode;
							document.getElementById("address").value = addr;
							// 커서를 상세주소 필드로 이동한다.
							document.getElementById("address_detail").focus();
						}
					}).open();
		}
	</script>
	<!-- 주소 스크립트 end -->



</body>

</html>