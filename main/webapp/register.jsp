<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="nss" tagdir="/WEB-INF/tags/"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="UTF-8">
<meta name="description" content="Ogani Template">
<meta name="keywords" content="Ogani, unica, creative, html">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title><spring:message code="message.register.title" /></title>

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

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<style type="text/css">
#tos1 { /* 불러온내용*/
	padding-top: 5px;
	border: 1px solid black;
	overflow: scroll;
	width: 450px;
	height: 400px;
}

#tos2 { /* 불러온내용*/
	padding-top: 5px;
	border: 1px solid black;
	overflow: scroll;
	width: 450px;
	height: 400px;
}

#tos3 { /* 불러온내용*/
	padding-top: 5px;
	border: 1px solid black;
	overflow: scroll;
	width: 450px;
	height: 400px;
}

.btn-primary {
	color: #fff;
	background-color: white;
	border-color: white;
	color: #777;
	font-family: 'Roboto', sans-serif;
	font-size: 15px;
	font-weight: 400;
	line-height: 1.667;
	padding: 0px;
}

.btn-primary:hover {
	color: #fff;
	background-color: white;
	border-color: white;
}

.btn-primary:not(:disabled):not(.disabled).active, .btn-primary:not(:disabled):not(.disabled):active,
	.show>.btn-primary.dropdown-toggle {
	background-color: white;
	border-color: white;
	color: #fff;
}

.checkre {
	font-size: 8px;
	color: red;
	margin-left: 7%;
}

.check {
	color: white;
	border-radius: 20px;
}
</style>

</head>

<body>
	<nss:header />

	<!--================Login Box Area =================-->
	<section class="login_box_area section-margin">
		<div class="container">
			<div class="row">
				<div class="col-lg-6">
					<div class="login_box_img">
						<div class="hover">
							<h4>
								<spring:message code="message.register.msg1" />
							</h4>
							<p>
								<spring:message code="message.register.msg2" />
							</p>
							<a class="button button-account" href="login.do">
								<spring:message code="message.register.login" />
							</a>
						</div>
					</div>
				</div>
				<div class="col-lg-6">
					<div class="login_form_inner register_form_inner">
						<h3>
							<spring:message code="message.register.join" />
							<br>
							<br>
							<a href="#kakao-login-btn" style="color: black;">
								<small><u><spring:message code="message.register.kakaoshortcut" /></u></small>
							</a>
						</h3>

						<form class="row login_form" action="signUp.do" id="register_form" onsubmit="return registerCheck()" method="POST">
							<input type="hidden" id="urlBack" name="urlBack" value=""/>
							<!-- 아이디 -->
							<div class="col-md-12 form-group">
								<input type="text" style="width: 60%;" id="id" name="userId" placeholder="&nbsp;<spring:message code="message.register.enterid"/>" onfocus="this.placeholder = ''" onblur="this.placeholder = '<spring:message code="message.register.enterid"/>'" required>
								&nbsp;
								<input style="color: white; border-radius: 7px; float: right;" type="button" id="idCheckBtn" onclick="checkId()" class="button button-register" value="<spring:message code="message.register.iddouble"/>">
							</div>
							<p class="checkre" align="left" id="outputId">
								<spring:message code="message.register.id" />
							</p>


							<!-- 이름 -->
							<div class="col-md-12 form-group">
								<input type="text" class="form-control" id="name" name="userName" placeholder="<spring:message code="message.register.entername"/>" onfocus="this.placeholder = ''" onblur="this.placeholder = '<spring:message code="message.register.entername"/>'" required>
							</div>
							<p class="checkre" id="outputName">
								<spring:message code="message.register.name" />
							</p>

							<!-- 고양이 이름 -->
							<div class="col-md-12 form-group">
								<input type="text" class="form-control" id="cName" name="catName" placeholder="<spring:message code="message.register.entercatname"/>" onfocus="this.placeholder = ''" onblur="this.placeholder = '<spring:message code="message.register.entercatname"/>'" required>
							</div>
							<p class="checkre" id="outputcName">
								<spring:message code="message.register.catname" />
							</p>

							<!-- 비밀번호 -->
							<div class="col-md-12 form-group">
								<input type="password" class="form-control" id="password" name="userPw" placeholder="<spring:message code="message.register.enterpw"/>" onfocus="this.placeholder = ''" onblur="this.placeholder = '<spring:message code="message.register.enterpw"/>'" required>
							</div>
							<p class="checkre" id="outputPw">
								<spring:message code="message.register.enterpw" />
							</p>

							<!-- 비밀번호 확인 -->
							<div class="col-md-12 form-group">
								<input type="password" class="form-control" id="confirmPassword" name="confirmPassword" placeholder="<spring:message code="message.register.reenterpw"/>" onfocus="this.placeholder = ''" onblur="this.placeholder = '<spring:message code="message.register.reenterpw"/>'" required>
							</div>

							<p class="checkre" id="outputPw2">
								<spring:message code="message.register.pleasereenterpw" />
							</p>

							<!-- 전화 번호 -->
							<div class="col-md-12 form-group">
								<input type="tel" style="width: 65%;" id="phone" name="phoneNum" placeholder="<spring:message code="message.register.phone"/>" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" required>
								<input type="button" class="button button-register" style="color: white; border-radius: 7px; float: right;" value="<spring:message code="message.register.getphone"/>" onclick="sms()">
								<div style="text-align: left; padding: 0px;">
									<p class="checkre" id="outputPhone">
										<spring:message code="message.register.phone" />
									</p>
								</div>
								<div>
									<input type="text" style="width: 65%;" placeholder="<spring:message code="message.register.enterauthentication"/>" id="userCheck" required>
									<input type="button" class="button button-register" style="color: white; border-radius: 7px;" value="<spring:message code="message.register.checkauthentication"/>" onclick="smsCheck()">
								</div>
							</div>
							<!-- 인증번호 -->

							<!-- 주소 -->
							<div class="col-md-12 form-group">
								<div>
									<input type="text" style="width: 65%;" id="post" placeholder="<spring:message code="message.register.postal"/>" onclick="sample6_execDaumPostcode()" name="postNum" readonly>
									<input type="button" style="color: white; border-radius: 7px;" class="button button-register" value="<spring:message code="message.register.findpostal"/>" onclick="sample6_execDaumPostcode()" readonly>
								</div>
								<input type="text" class="form-control" id="address" name="address1" placeholder="<spring:message code="message.register.postal"/>" readonly>
								<input type="text" class="form-control" id="address_plus" name="addressPlus" placeholder="<spring:message code="message.register.seealso"/>" readonly>
								<input type="text" class="form-control" id="address_detail" name="address2" placeholder="<spring:message code="message.register.detailaddress"/>" required>
							</div>

							<!-- 약관 동의 전체-->
							<div class="checkbox_group">
								<input type="checkbox" id="check_all">
								<label for="check_all"><spring:message code="message.register.allagreement" /></label>
								<br>

								<!-- 약관 동의1 -->
								<input type="checkbox" id="check_1" class="normal" required>
								<label for="check_1"></label>
								<spring:message code="message.register.privacyagree" />
								<a class="btn btn-primary" data-toggle="modal" data-target="#exampleModal3" style="font-size: 5px;">
									<spring:message code="message.register.seemore" />
								</a>
								<br>

								<!-- 약관 동의2 -->
								<input type="checkbox" id="check_2" class="normal" required>
								<label for="check_2"></label>
								<spring:message code="message.register.serviceagree" />
								<a class="btn btn-primary" data-toggle="modal" data-target="#exampleModal2" style="font-size: 5px;">
									<spring:message code="message.register.seemore" />
								</a>
								<br>

								<!-- 약관 동의3 -->
								<input type="checkbox" id="check_3" class="normal">
								<label for="check_3"></label>
								<spring:message code="message.register.marketingagree" />
								<a class="btn btn-primary" data-toggle="modal" data-target="#exampleModal1" style="font-size: 5px;">
									<spring:message code="message.register.seemore" />
								</a>
								<br>
								<br>
							</div>

							<!-- 회원 가입 버튼 -->
							<div class="col-md-12 form-group">
								<button id="signupBtn" type="submit" value="submit" class="button button-register w-100">
									<spring:message code="message.register.join" />
								</button>
								<br>
							</div>

							<!-- SNS 가입 -->
							<div class="col-md-12 form-group">
								<a id="kakao-login-btn" href="javascript:kakaoLogin()">
									<img style="border-radius: 30px" src="img/kakao_join.png" alt="카카오 로그인 버튼" width=100% />
								</a>
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
	<%--ajax 쓰기 위해 JQ연결 --%>
	<script src="https://code.jquery.com/jquery-3.6.3.min.js"
		integrity="sha256-pvPw+upLPUjgMXY0G+8O0xUf+/Im1MZjXxxgOcBQBXU="
		crossorigin="anonymous">
   </script>
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

	<script type="text/javascript">
		$(document).ready(function getURL() {
			var urlBack = document.referrer;
			$('#urlBack').attr('value', urlBack);
		});
	</script>

	<!-- 아이디 중복확인 -->
	<script type="text/javascript">
	var smsTrue = false;
	var smsCheckTrue = false;
	var registerTrue = false;
	var idTrue = false;
      
	function checkId(){
         console.log('로그 1 : check()라는 JS 함수가 연결되었음');
         var id=$('#id').val(); // $('id 속성이 id인 요소')의 값을 불러올래!
         $.ajax({
            type: 'POST',
            url: 'checkDuplication.do',
            data: {userId:id},
            success: function(result){
               console.log(result)
               if(id == "" || !(reId.exec(id)) ){
                  outputId.textContent = `<spring:message code="message.register.id"/>`;
               }else if(result == 1){
                  console.log(result)
                  outputId.textContent = `<spring:message code="message.register.available"/>`;
                  outputId.style.color = '#6667AB';
                  idTrue = true;
               }
               else{
                  outputId.textContent = `중복된 아이디가 있습니다.`;
                  idTrue = false;
               }
            },
            error : function(request, status, error){
        		alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
            }
         })
      }
   </script>
	<!-- 아이디 중복확인 end -->


	<!-- 전화번호 중복확인 -->
	<script type="text/javascript">
      var smsTrue = false;
      var smsCheckTrue = false;
      var registerTrue = false;
      var idTrue = false;
      
   </script>
	<!-- 아이디 중복확인 end -->


	<!-- 카카오 스크립트 -->
	<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
	<!-- 카카오 스크립트 end -->


	<!-- 카카오 로그인 -->
	<script>
      Kakao.init('a4736b83f633d7309942ec1e31da7d0f'); // SDK를 초기화함 / 발급 받은 키 중 javascript키를 사용해준다.
      console.log(Kakao.isInitialized()); // sdk초기화여부판단
      var name = ""; //  현재 로그인한 사람
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
                                 var name= response.kakao_account.profile.nickname;
                                 var id = response.id;
                                 var pw = response.id;
                                 /* window.open("loginCheck.do?action=loginCheck&userName="+name+"&userId="+id+"&userPw="+pw, "loginCheck", "width=500, height=570, left=400, top = 200"); */
                                 // 일치하는 회원 있는지 확인
                                 location.href = "loginCheck.do?userName="+name+"&userId="+id;
                                 console.log(response)
                                 console.log(response.kakao_account.profile.nickname) // 로그인 성공한 유저 nickname
                                 name = response.kakao_account.profile.nickname  //  로그인한 유저 이름 저장
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
      </script>

	<!-- 개인정보 처리방침 동의 모달 시작 -->
	<div class="modal fade" id="exampleModal3" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">이용약관</h5>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<div id=tos1></div>
				</div>
				<div class="modal-footer"></div>
			</div>
		</div>
	</div>
	<script type="text/javascript">
const loremIpsum = document.getElementById("tos1")
fetch("tos1.jsp") /*해당 경로의 내용 가져옴 */
    .then(response => response.text())
    .then(result => tos1.innerHTML = result)
  
</script>
	<!-- 개인정보 처리방침 동의 모달 끝 -->
	<!-- 서비스 이용약관 동의 모달 시작 -->
	<div class="modal fade" id="exampleModal2" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">서비스 이용약관</h5>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<div id=tos2></div>
				</div>
				<div class="modal-footer"></div>
			</div>
		</div>
	</div>
	<script type="text/javascript">
const tos2 = document.getElementById("tos2")
fetch("tos2.jsp") /*해당 경로의 내용 가져옴 */
    .then(response => response.text())
    .then(result => tos2.innerHTML = result)
  
    
</script>
	<!-- 서비스 이용약관 동의 모달 끝 -->
	<!-- 마케팅 수신 정보 모달 시작 -->
	<div class="modal fade" id="exampleModal1" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">마케팅 수신동의</h5>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<div id=tos3></div>
				</div>
				<div class="modal-footer"></div>
			</div>
		</div>
	</div>

	<script type="text/javascript">
const tos3 = document.getElementById("tos3")
fetch("tos3.jsp") /*해당 경로의 내용 가져옴 */
    .then(response => response.text())
    .then(result => tos3.innerHTML = result)
  
    
</script>


	<!-- 마케팅 수신 정보 모달 끝 -->


	<!-- 정규표현식 검사 -->
	<script type="text/javascript">
   
    const form = document.querySelector('#register_form')
    const inputId = document.querySelector('#id')
    const inputName = document.querySelector('#name')
    const inputPw = document.querySelector('#password')
    const inputPw2 = document.querySelector('#confirmPassword')
    
    const inputaddress = document.querySelector('#address')
    
    const inputPhoneNum = document.querySelector('#phone')
    
    const inputCnm = document.querySelector('#cName')
    const outputId = document.querySelector('#outputId')
    const outputName = document.querySelector('#outputName')
    const outputcName = document.querySelector('#outputcName')
    const outputPw = document.querySelector('#outputPw')
    const outputPw2 = document.querySelector('#outputPw2')
    const outputAddress = document.querySelector('#outputAddress')
    const outputPhoneNum = document.querySelector('#outputPhonNum')
    const reId = /^(?=.*\d)(?=.*[a-zA-Z])[0-9a-zA-Z]{8,16}$/
    const reName = /^[가-힣]{2,6}$/
    const reCname = /^[가-힣]{2,6}$/
    const rePw = /(?=.*\d{1,50})(?=.*[~`!@#$%\^&*()-+=]{1,50})(?=.*[a-zA-Z]{2,50}).{8,50}$/
    const rePhoneNum = /^01([0|1|6|7|8|9]{1})([0-9]{3,4})([0-9]{4})$/
    // 정규표현식 통과 boolean
    var idValid = false; // 아이디 정규식 일치 여부
    var nameValid = false; // 이름 정규식 일치 여부
    var cNameValid = false; // 고양이 이름 정규식 일치 여부
    var PhoneNumValid = false; // 휴대폰 번호 정규식 일치 여부
    var pwValid = false; // 비밀번호 정규식 일치 여부
    var pwSame = false; // 비밀번호 확인 일치 여부
    var isPhoneOnly = false; // 전화번호 중복 확인 통과 여부
    
    inputId.addEventListener('input', function () {
       idTrue = false;
       /* checkId() */
        const ok = reId.exec(this.value)
        if (!ok) {
           idTrue = false;
            outputId.textContent = `<spring:message code="message.register.id"/>`
            outputId.style.color = 'red'
            idValid = false; // id 플래그 false
        } else {
           idTrue = false;
            outputId.textContent = `<spring:message code="message.register.checkid"/>`
            outputId.style.color = 'red'
            idValid = true; // id 플래그 true
        }
        if (idValid) {
            console.log('idValid ooo', idValid);
        } else {
            console.log('idValid xxx', idValid);
        }
    })
    
    inputName.addEventListener('input', function () {
        const ok = reName.exec(this.value)
        if (!ok) {
            outputName.textContent = `<spring:message code="message.register.name"/>`;
            outputName.style.color = 'red';
            nameValid = false;
        } else {
            outputName.textContent = `<spring:message code="message.register.available"/>`;
            outputName.style.color = '#6667AB';
            nameValid = true;
        }
    })
    inputCnm.addEventListener('input', function () {
        const ok = reCname.exec(this.value)
        if (!ok) {
            outputcName.textContent = `<spring:message code="message.register.catname"/>`;
            outputcName.style.color = 'red';
            cNameValid = false;
        } else {
            outputcName.textContent = `<spring:message code="message.register.available"/>`;
            outputcName.style.color = '#6667AB';
            cNameValid = true;
        }
    })
    
      inputPw.addEventListener('input', function () {
        const ok = rePw.exec(this.value)
        if (!ok) {
            outputPw.textContent = `<spring:message code="message.register.pw"/>`;
            outputPw.style.color = 'red';
            pwValid = false;
        } else {
            outputPw.textContent = `<spring:message code="message.register.available"/>`;
            outputPw.style.color = '#6667AB';
            pwValid = true;
        }
    })
    
    inputPw2.addEventListener('input', function () {
        if (inputPw.value == inputPw2.value) { 
            outputPw2.textContent = `<spring:message code="message.register.mathces"/>`
            outputPw2.style.color = '#6667AB'
            inputPw.addEventListener('input', function () {
               if(inputPw.value==""){
                    outputPw2.textContent = `<spring:message code="message.register.reenterpw"/>` 
                        outputPw2.style.color = 'red'
                        pwSame = false;
                  }else if (inputPw.value == inputPw2.value) {
                    outputPw2.textContent = `<spring:message code="message.register.mathces"/>`
                    outputPw2.style.color = '#6667AB'
                    pwSame = true;
                   } else {
                    outputPw2.textContent = `<spring:message code="message.register.reenterpw"/>`
                    outputPw2.style.color = 'red'
                    pwSame = false;
                   }
            })
            pwSame = true;
        } else {
            outputPw2.textContent = `<spring:message code="message.register.reenterpw"/>`
            outputPw2.style.color = 'red'
            pwSame = false;
        }
    })
    
    function register(){
        if (!(idValid && nameValid && cNameValid && pwValid && pwSame)) {
           console.log('아이디'+idValid)
           console.log('이름'+nameValid)
           console.log('고양이 이름'+cNameValid)
           console.log('비번'+pwValid)
           console.log('비번재확인'+pwSame)
           registerTrue = false;
        }else{
           registerTrue = true;
           console.log(registerTrue)
        }
    }
   <!-- 정규식 스크립트 end -->
   <!-- 문자 인증 스크립트 -->
   var number=0;  //랜덤문자인증번호 저장할 변수   
   //  var phoneCheck=0;  //인증번호 일치, 불일치 변수
   // 인증번호 전송하기: sms()
   
   // 전화번호 형식 확인
   inputPhoneNum.addEventListener('input', function () {
        const ok = rePhoneNum.exec(this.value)
        if (!ok) {
           outputPhone.textContent = `<spring:message code="message.register.checkphonenum"/>`; 
           outputPhone.style.color = 'red';
            phoneNumValid = false;
        } else {
           outputPhone.textContent = `<spring:message code="message.register.sendauthentication1"/>`;
           outputPhone.style.color = '#6667AB';
           phoneNumValid = true;
        }
    })
   
   function sms(){
      
      // 전화번호 중복검사
      console.log('로그 1 : checkPhone()이라는 JS 함수가 연결되었음');
      var phone=$('#phone').val(); // $('id 속성이 phone인 요소')의 값을 불러올래!
      $.ajax({
         type: 'POST',
         url: 'checkDuplication.do',
         data: {phoneNum:phone},
           success: function(result){
              console.log("checkResult: "+result)
               if(result == 1){
               isPhoneOnly = true;
               }
               else if(result == -1){
                  outputPhone.textContent = `<spring:message code="message.register.alreadynumber"/>`;
                  outputPhone.style.color = 'red'; 
               isPhoneOnly = false;
               }
               console.log("phoneNumValid: "+phoneNumValid)
               console.log("isPhoneOnly: "+isPhoneOnly);
         }
      }).then(function(){
         console.log("로그: 인증번호 발송 메서드 시작")
         if(!phoneNumValid){ // 전화번호 형식이 틀리다면
            outputPhone.textContent = `<spring:message code="message.register.recheckphonenum"/>`;
              outputPhone.style.color = 'red';
         }
         else if(phoneNumValid && !isPhoneOnly){ // 전화번호 형식이 맞지만 중복이라면
            outputPhone.textContent = `<spring:message code="message.register.otherphonenum"/>`;
              outputPhone.style.color = 'red';
         }
         else if(phoneNumValid && isPhoneOnly){ // 전화번호 형식이 맞고 중복이 아니라면
            console.log('로그 1 : sms()라는 JS 함수가 연결되었음');
            var userPhoneNum = $("#phone").val();
            
            console.log('로그2 : userPhoneNum '+userPhoneNum);
            //Sms서블릿클래스로 이동함.
            $.ajax({
               type: 'POST',
               url: 'sms.do',
               data: {userPhoneNum:userPhoneNum},
               success: function(randNum){
                      console.log("로그:인증번호["+randNum+"]")
                      console.log("로그:번호["+userPhoneNum+"]")
                      if(randNum != null){
                         number = randNum;  //랜덤문자인증번호
                         smsTrue = true;
                         console.log(smsTrue)
                         outputPhone.textContent = `<spring:message code="message.register.sendauthentication2"/>`;
                           outputPhone.style.color = '#6667AB';
                      } 
                      else{
                         outputPhone.textContent = `<spring:message code="message.register.unablesendauthentication"/>`;
                           outputPhone.style.color = 'red';
                         smsTrue = false;
                      }
                   }
            })
         }
         console.log("로그: 인증번호 발송 메서드 끝")
      })
   }
       
     //인증번호 비교: sms()
       function smsCheck(){
          console.log('로그 : smsCheck()라는 JS 함수가 연결되었음');
          var checkNum = $("#userCheck").val();
          console.log('로그(사용자가 입력한 값) : checkNum '+checkNum);
          
          //SmsCheck서블릿클래스로 이동
          $.ajax({
             type: 'POST',
             url: 'checkSms.do',
             data: {randNum:number, checkNum:checkNum},
             success: function(result){
                console.log("로그 result:["+result+"]")
                console.log(typeof result);
                if(result == "1"){
                   swal("<spring:message code="message.register.matchauthentication"/>");
                   smsCheckTrue = true;
                   console.log(smsCheckTrue)
                   document.getElementById('phone').readOnly = true;
                } 
                else{
                   swal("<spring:message code="message.register.nomatchauthentication"/>");  //인증번호 불일치
                   smsCheckTrue = false;
                }
             }
          })
       }
       
   <!-- 문자 인증 스크립트 end -->
   function registerCheck(){
      register()
      checkId()
      console.log('회원가입' + registerTrue)
      console.log('문자 전송' + smsTrue)
      console.log('인증번호' + smsCheckTrue)
      console.log('아이디 중복확인' + idTrue)
      if(registerTrue && smsTrue && smsCheckTrue && idTrue){
         return true;
      }else{
         if(!smsTrue){
            swal("<spring:message code="message.register.confirmationphone"/>");  
         }else if(!smsCheckTrue){
        	 swal("<spring:message code="message.register.checkauthentication"/>"); 
         }else if(!registerTrue){
        	 swal("<spring:message code="message.register.checkenter"/>"); 
         }else if(!idTrue){
        	 swal("<spring:message code="message.register.checkid"/>"); 
         }
         return false;
      }
   }
   </script>


	<!-- 주소 API 스크립트 -->
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script>
    function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
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
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
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
	<!-- 주소 스클립트 end -->

	<!-- <!— TOP 버튼 —> -->
	-->
	<div style="width: 120px; position: fixed; bottom: 80px; right: 100px; z-index: 1;">
		<a href="#">
			<button type="button" class="button-top">▲맨위로</button>
		</a>
	</div>


</body>

</html>
