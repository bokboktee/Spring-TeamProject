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
<title>냥신사 | 회원정보 변경</title>
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
	border-style: none;
}
</style>

<!-- google Font -->
<link href="https://fonts.googleapis.com/css2?family=Cairo:wght@200;300;400;600;900&display=swap" rel="stylesheet">

<!-- favicon -->
<link rel="shortcut icon" type="image/x-icon" href="img/favicon.ico" />

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
<style type="text/css">
.shoping__cart__table table tbody tr td.shoping__cart__item {
	width: 100px;
	text-align: left;
}

.shoping__cart__table table tbody tr td.shoping__cart__price {
	font-size: 18px;
	color: #1c1c1c;
	font-weight: 700;
	width: 180px;
}

.shoping__cart__table table tbody tr td.shoping__cart__price2 {
	font-size: 18px;
	color: #1c1c1c;
	font-weight: 700;
	width: 400px;
}

.shoping__cart__table table tbody tr td.shoping__cart__total {
	font-size: 18px;
	color: #1c1c1c;
	font-weight: 700;
	width: 180px;
}

#order_detail {
	font-size: 14px;
	color: #ffffff;
	text-transform: uppercase;
	padding: 10px 25px 10px;
	background: #6667ab;
	border: none;
	border-radius: 10px;
}
</style>

<body>
	<nss:header />

	<!-- 메인 화면에는 제외 -->
	<!-- Breadcrumb Section Begin -->
	<section class="breadcrumb-section set-bg" data-setbg="">
		<div class="container">
			<div class="row">
				<div class="col-lg-12 text-center">
					<div class="breadcrumb__text">
						<h2>회원정보 변경</h2>
						<!-- <div class="breadcrumb__option">
                     <a href="./index.html">홈</a>
                  </div> -->
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Breadcrumb Section End -->
	<!-- Blog Section Begin -->
	<section class="blog spad">
		<div class="container">
			<div class="row">
				<div class="col-lg-3 col-md-5">
					<div class="sidebar">
						<div class="sidebar__item">
							<h4>마이페이지</h4>
							<hr>
							<ul>
								<li><a href="mypage.do">내정보</a></li>
								<li><a href="orderList.do">주문내역</a></li>
								<li><a href="checkPassword.do">회원정보변경</a></li>
								<li><a href="myreview.do">내 리뷰 모아보기</a></li>
								<li><a href="selectAllMyLike.do">내가 좋아요 한 글 </a></li>
							</ul>
						</div>
					</div>
				</div>

				<div class="col-lg-7 col-md-7">
					<form action="updateMember.do" method="POST">
						<!-- 고양이 이름 -->
						<label class="label">고양이 이름</label>
						<input type="text" class="form-control" id="cName" name="catName" value="${memberCatName}" placeholder="고양이 이름 입력" onfocus="this.placeholder = ''" onblur="this.placeholder = '고양이 이름 입력'" required>
						<p style="font-size: 5px;">* 변경할 고양이 이름을 입력하세요.</p>
						<!-- 고양이 이름 -->

						<!-- 전화번호 -->
						<label class="label">전화번호</label>
						<input type="text" class="form-control" id="Phone" name="phoneNum" value="${memberPhoneNum}" readonly required>
						<br>

						<label class="label">주소</label>
						<div class="checkout__input">
							<input type="text" id="postNum" name="postNum" value="${memberPostNum}" placeholder="우편번호" onclick="sample6_execDaumPostcode()" readonly>
							<input type="button" value="우편번호 찾기" onclick="sample6_execDaumPostcode()" readonly>
							<br>
							<input type="text" class="form-control" id="address" value="${memberAddress1}" name="address1" placeholder="주소" readonly>
							<input type="text" class="form-control" id="address_plus" name="addressPlus" placeholder="참고항목" readonly>
							<input type="text" class="form-control" value="${memberAddress2}" id="address_detail" name="address2" placeholder="상세주소" required>
						</div>
						<p style="font-size: 5px;">* 변경할 주소를 입력하세요.</p>
						<input type="submit" value="적용" class="button-purple">

					</form>
					<br>
					<br>
					<form action="updatePw.do" method="POST">
						<!-- 기존 비밀번호 -->
						<label class="label">현재 비밀번호 </label>
						<input type="hidden" name="userId" value="${memberId}">
						<input type="password" class="form-control" id="usePw" name="userPw" placeholder="현재 비밀번호 입력" onfocus="this.placeholder = ''" onblur="this.placeholder = '현재 비밀번호 입력'" required>
						<p style="font-size: 5px;">* 현재 비밀번호를 입력하세요.</p>
						<!-- 기존 비밀번호  -->

						<label class="label">새 비밀번호</label>
						<input type="password" class="form-control" id="pw" name="memberPwNew" placeholder="변경할 비밀번호 입력" onfocus="this.placeholder = ''" onblur="this.placeholder = '변경할 비밀번호 입력'" required>
						<p id="outputPw" style="font-size: 5px;">* 변경할 비밀번호를 입력하세요.</p>

						<label class="label">새 비밀번호 재입력</label>
						<input type="password" class="form-control" id="pw2" placeholder="변경할 비밀번호 재입력" onfocus="this.placeholder = ''" onblur="this.placeholder = '변경할 비밀번호 배입력'" required>
						<p id="outputPw2" style="font-size: 5px;">* 변경할 비밀번호를 다시 입력하세요.</p>




						<input type="submit" value="적용" class="button-purple">

					</form>



				</div>






			</div>
		</div>
		<!--   </div>-->

	</section>
	<!-- Blog Section End -->

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
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

	<!-- 비밀번호 변경 정규식 -->
	<script type="text/javascript">
		const inputUsePw = document.querySelector('#usePw')
		const inputPw = document.querySelector('#pw')
		const inputPw2 = document.querySelector('#pw2')

		const outputPw = document.querySelector('#outputPw')
		const outputPw2 = document.querySelector('#outputPw2')

		const registerTrue = false;

		const rePw = /(?=.*\d{1,50})(?=.*[~`!@#$%\^&*()-+=]{1,50})(?=.*[a-zA-Z]{2,50}).{8,50}$/

		var pwValid = false; // 비밀번호 정규식 일치 여부
		var pwSame = false; // 비밀번호 확인 일치 여부

		inputPw
				.addEventListener(
						'input',
						function() {
							const ok = rePw.exec(this.value)
							if (!ok) {
								outputPw.textContent = `영어/숫자/특수문자를 모두 혼합하여 8자리 이상 비밀번호를 입력해주세요.`;
								outputPw.style.color = 'red';
								pwValid = false;

							}
							
							else if(inputUsePw.value == inputPw.value) {
								outputPw.textContent = `현재 비밀번호와 일치합니다. 다른 비밀번호를 입력 해주세요.`;
								outputPw.style.color = 'red';
								pwValid = false;
								
							}
							
							else {
								outputPw.textContent = `사용 가능합니다.`;
								outputPw.style.color = '#6667AB';
								pwValid = true;
							}
						})

		inputPw2.addEventListener('input', function() {
			if (inputPw.value == inputPw2.value && inputPw.value != inputUsePw.value) {
				outputPw2.textContent = `일치합니다.`
				outputPw2.style.color = '#6667AB'
				inputPw.addEventListener('input', function() {
					if (inputPw.value == "") {
						outputPw2.textContent = `비밀번호를 다시 입력해주세요.`
						outputPw2.style.color = 'red'
						pwSame = false;
					} else if (inputPw.value == inputPw2.value && inputPw.value != inputUsePw.value) {
						outputPw2.textContent = `일치합니다.`
						outputPw2.style.color = '#6667AB'
						pwSame = true;
					} else {
						outputPw2.textContent = `비밀번호를 다시 입력해주세요.`
						outputPw2.style.color = 'red'
						pwSame = false;
					}
				})
				pwSame = true;
			} else if(inputUsePw.value == inputPw2.value) {
				outputPw2.textContent = `현재 비밀번호와 일치합니다. 다른 비밀번호를 입력 해주세요.`;
				outputPw2.style.color = 'red';
				pwValid = false;
				if (inputPw.value == "") {
					outputPw2.textContent = `비밀번호를 다시 입력해주세요.`
					outputPw2.style.color = 'red'
					pwSame = false;
				} else {
					outputPw2.textContent = `비밀번호를 다시 입력해주세요.`
					outputPw2.style.color = 'red'
					pwSame = false;
				}
			} else {
				outputPw2.textContent = `비밀번호를 다시 입력해주세요.`
				outputPw2.style.color = 'red'
				pwSame = false;
			}
		})
		function profile() {
			if (!(pwValid && pwSame)) {
				console.log('비번' + pwValid)
				console.log('비번재확인' + pwSame)
				registerTrue = false;
			} else {
				registerTrue = true;
				console.log(registerTrue)
			}
		}

		function registerCheck() {
			if (registerTrue) {
				return true;
			} else {
				if (!registerTrue) {
					swal({
						text : "입력한 내용을 확인해주세요.",
						button : "확인"
					});
				}
				return false;
			}
		}
	</script>


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
							document.getElementById('postNum').value = data.zonecode;
							document.getElementById("address").value = addr;
							// 커서를 상세주소 필드로 이동한다.
							document.getElementById("address_detail").focus();
						}
					}).open();
		}
	</script>
	<!--  주소 스크립트 end -->

	<!-- TOP 버튼 -->
	<div style="width: 120px; position: fixed; bottom: 80px; right: 100px; z-index: 1;">
		<a href="#">
			<button type="button" class="button-top">▲ 맨위로</button>
		</a>
	</div>

</body>

</html>