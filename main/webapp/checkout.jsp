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
<title>냥신사 | 주문하기</title>
<style type="text/css">
#iamportPayment, #iamportPayment2, #iamportPayment3 {
	border-radius: 20px;
	border: solid 1px;
	border-color: gray;
}

button img {
	
}
</style>

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
<link rel="stylesheet" href="css/alert.css" type="text/css">

<style type="text/css">
#iamportPayment2 {
	border: none;
	background: transparent;
}
</style>
</head>

<body>
	<!-- Page Preloder -->
	<div id="preloder">
		<div class="loader"></div>
	</div>

	<!-- Humberger Begin -->
	<div class="humberger__menu__overlay"></div>
	<div class="humberger__menu__wrapper">
		<div class="humberger__menu__logo">
			<a href="main.do">
				<img src="img/logo.png" alt="홈으로 가기">
			</a>
		</div>
		<div class="humberger__menu__cart">
			<ul>
				<li><a href="shopingCart.do">
						<i class="fa fa-shopping-bag"></i> <span>${fn:length(cList)}</span>
					</a></li>
			</ul>
		</div>

		<div class="humberger__menu__widget">
			<!-- 로그인 -->
			<nss:login />
		</div>

		<nav class="humberger__menu__nav mobile-menu">
			<ul>
				<li class="active"><a href="main.do">홈</a></li>
				<li><a href="shop.do?category=all&sort=sellDesc">쇼핑</a></li>
				<li><a href="contact.do">Contact</a></li>
				<li><a href="boardView.do">자랑해냥</a></li>
			</ul>
		</nav>
		<div id="mobile-menu-wrap"></div>
		<div class="header__top__right__social">
			<a href="https://www.facebook.com/profile.php?id=100089405234926">
				<i class="fa fa-facebook"></i>
			</a>
			<a href="https://www.instagram.com/nyangsinsa5/">
				<i class="fa fa-instagram"></i>
			</a>
			<a href="https://twitter.com/nyangsinsa">
				<i class="fa fa-twitter"></i>
			</a>
		</div>
		<div class="humberger__menu__contact">
			<ul>
				<li><i class="fa fa-envelope"></i>nyangsinsa@gmail.com</li>
				<li>대한민국 최고의 반려묘 용품 쇼핑몰</li>
			</ul>
		</div>
	</div>
	<!-- Humberger End -->

	<!-- Header Section Begin -->
	<header class="header">
		<div class="header__top">
			<div class="container">
				<div class="row">
					<div class="col-lg-6 col-md-6">
						<div class="header__top__left">
							<ul>
								<li><i class="fa fa-envelope"></i>nyangsinsa@gmail.com</li>
								<li>대한민국 최고의 반려묘 용품 쇼핑몰</li>
							</ul>
						</div>
					</div>
					<div class="col-lg-6 col-md-6">
						<div class="header__top__right">
							<div class="header__top__right__social">
								<a href="https://www.facebook.com/profile.php?id=100089405234926">
									<i class="fa fa-facebook"></i>
								</a>
								<a href="https://www.instagram.com/nyangsinsa5/">
									<i class="fa fa-instagram"></i>
								</a>
								<a href="https://twitter.com/nyangsinsa">
									<i class="fa fa-twitter"></i>
								</a>
							</div>

							<!-- 로그인 -->
							<nss:login />

						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="container">
			<div class="row">
				<div class="col-lg-3">
					<div class="header__logo">
						<a href="main.do">
							<img src="img/logo.png" alt="홈으로 가기">
						</a>
					</div>
				</div>
				<div class="col-lg-6">
					<nav class="header__menu">
						<ul>
							<li class="active"><a href="main.do">홈</a></li>
							<li><a href="shop.do?category=all&sort=sellDesc">쇼핑</a></li>
							<li><a href="contact.do">Contact</a></li>
							<li><a href="boardView.do">자랑해냥</a></li>
						</ul>
					</nav>
				</div>
				<div class="col-lg-3">
					<div class="header__cart">
						<ul>
							<li><a href="shoping_cart.jsp">
									<i class="fa fa-shopping-bag"></i> <span>${fn:length(cList)}</span>
								</a></li>
						</ul>
					</div>
				</div>
			</div>
			<div class="humberger__open">
				<i class="fa fa-bars"></i>
			</div>
		</div>
	</header>
	<!-- Header Section End -->

	<!-- Hero Section Begin index는 아래줄 section class="hero" -->
	<section class="hero hero-normal">
		<div class="container">
			<div class="row">
				<div class="col-lg-3">
					<div class="hero__categories">
						<div class="hero__categories__all">
							<i class="fa fa-bars"></i> <span>메뉴</span>
						</div>
						<ul>
							<li><a href="shop.do?category=all">전체</a></li>
							<li><a href="shop.do?category=food">사료</a></li>
							<li><a href="shop.do?category=treat">간식</a></li>
							<li><a href="shop.do?category=sand">모래</a></li>
						</ul>
					</div>
				</div>
				<div class="col-lg-9">
					<div class="hero__search">
						<div class="hero__search__form">
							<form action="search.do">
								<!-- <input type="hidden" name="searchCondition" value="pName">  -->
								<input type="text" name="pSearchContent" placeholder="필요한 거 있냥?" required>
								<button type="submit" class="site-btn">검색</button>
							</form>
						</div>
						<div class="hero__search__phone">
							<div class="hero__search__phone__icon">
								<i class="fa fa-phone"></i>
							</div>
							<div class="hero__search__phone__text">
								<h5>02-0202-0202</h5>

								<span>상담 가능 시간<br>평일 09:00~18:00
								</span>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Hero Section End -->

	<!-- 메인 화면에는 제외 -->
	<!-- Breadcrumb Section Begin -->
	<section class="breadcrumb-section set-bg" data-setbg="">
		<div class="container">
			<div class="row">
				<div class="col-lg-12 text-center">
					<div class="breadcrumb__text">
						<h2>주문하기</h2>
						<!-- <div class="breadcrumb__option">
                     <a href="./index.html">홈</a>
                  </div> -->
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Breadcrumb Section End -->

	<!-- Checkout Section Begin -->
	<section class="checkout spad">
		<div class="container">
			<div class="row">
				<div class="col-lg-12"></div>
			</div>
			<div class="checkout__form">
				<h4>세부 정보</h4>
				<form action="#">
					<div class="row" style="max-width: 100%">
						<div class="col-lg-8 col-md-6">
							<!--                     <div class="col-lg-6">
                           <div class="checkout__input">
                              <p>
                                 성<span>*</span>
                              </p>
                              <input type="text">
                           </div>
                        </div> -->
							<div class="col-lg-6" style="max-width: 100%">
								<div class="checkout__input" style="max-width: 100%">
									<p>
										이름<span>*</span>
									</p>
									<input id="name" type="text" name="name" value="${memberName }">
								</div>
							</div>
							<div class="col-lg-6" style="max-width: 100%">
								<div class="checkout__input">
									<p>
										번호<span>*</span>
									</p>
									<input id="phone" type="text" name="phone" value="${memberPhoneNum}" placeholder="전화번호 입력" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" required>
								</div>
							</div>
							<div class="col-lg-6" style="max-width: 100%">
								<div class="checkout__input">
									<p>
										주소<span>*</span>
									</p>
									<input type="text" id="post" name="post" value="${memberPostNum }" placeholder="우편번호" onclick="sample6_execDaumPostcode()" readonly>
									<input type="button" value="우편번호 찾기" onclick="sample6_execDaumPostcode()" readonly>
									<br>
									<input type="text" class="form-control" id="address" name="address" value="${memberAddress1}" placeholder="주소" readonly>
									<input type="text" class="form-control" id="address_plus" name="addressPlus" placeholder="참고항목" readonly>
									<input type="text" class="form-control" id="address_detail" name="addressDetail" value="${memberAddress2}" placeholder="상세주소" required>
								</div>
							</div>
						</div>

						<div class="col-lg-4 col-md-6">
							<div class="checkout__order">
								<h4>결제 하기</h4>

								<div class="checkout__order__products">
									상품 <span>금액</span>
								</div>
								<ul>
									<c:forEach var="v" items="${cList}" begin="0" varStatus="status">
										<li><div style="display: inline-block; width: 200px; white-space: nowrap; overflow: hidden; text-overflow: ellipsis;">${v.pName}</div> <span style="display: inline-block;"><fmt:formatNumber value="${v.dc_price*v.pCnt}" type="currency" pattern="#,###" /></span></li>
									</c:forEach>
								</ul>
								<div class="checkout__order__total">
									결제 예상 금액 <span> <c:set var="total" value="0" /> <c:forEach var="v" items="${cList}" begin="0" varStatus="status">
											<c:set var="total" value="${total + v.dc_price*v.pCnt}" />
										</c:forEach> <fmt:formatNumber value="${total}" type="currency" pattern="#,###" /> <c:forEach var="v" items="${cList}" begin="0" end="0" varStatus="status">
											<c:set var="orderName" value="${v.pName}" />
										</c:forEach>
									</span>
								</div>

								<button id="iamportPayment" class="payment" type="button">
									<img src="img/card.png" alt="카드결제버튼" style="heigth: 30px; width: 30px;">
									카드결제
								</button>
								<button id="iamportPayment2"  class="payment" type="button" style="border-radius: 20px; border: solid 1px; border-color: gray;">
									<img src="img/kakaoPay.png" alt="카카오페이버튼" style="heigth: 50px; width: 50px;">
									카카오페이
								</button>
								<button id="iamportPayment3"  class="payment" type="button">
									<img src="img/phone_pay.png" alt="휴대폰결제버튼" style="heigth: 30px; width: 30px;">
									휴대폰결제
								</button>
								<!-- <button id="iamportPayment" type="button">카드결제</button> 
                          <button id="iamportPayment2" type="button"><img src="img/kakaopay.png" alt="카카오페이버튼"></button>
                          <button id="iamportPayment3" type="button">휴대폰결제</button>  -->

							</div>
						</div>
				</form>
			</div>
		</div>
	</section>
	<!-- Checkout Section End -->

	<!-- Footer Section Begin -->
	<footer class="footer spad">
		<div class="container">
			<div class="row">
				<div class="col-lg-4 col-md-4 col-sm-6">
					<div class="footer__about">
						<div class="footer__about__logo">
							<a href="main.do">
								<img src="img/logo.png" alt="로고">
							</a>
						</div>

					</div>
				</div>
				<div class="col-lg-4 col-md-4 col-sm-6">
					<div class="footer__widget">
						<ul>
							<li>주소: 서울 강남구 역삼동 골목길</li>
							<li>전화: +82 02-0202-0202</li>
							<li>이메일: nyangsinsa@gmail.com</li>
						</ul>
					</div>
				</div>
				<div class="col-lg-4 col-md-4 col-sm-6">
					<div class="footer__widget">
						<div class="footer__widget__social">
							<a href="https://www.facebook.com/profile.php?id=100089405234926">
								<i class="fa fa-facebook"></i>
							</a>
							<a href="https://www.instagram.com/nyangsinsa5/">
								<i class="fa fa-instagram"></i>
							</a>
							<a href="https://twitter.com/nyangsinsa">
								<i class="fa fa-twitter"></i>
							</a>
						</div>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-lg-12">
					<div class="footer__copyright">
						<div class="footer__copyright__text">
							<p>
								<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
								Copyright 냥신사&copy;
								<script>
                           document.write(new Date().getFullYear());
                        </script>
								All rights reserved | This template is made with <i class="fa fa-heart" aria-hidden="true"></i> by
								<a href="https://colorlib.com" target="_blank">Colorlib</a>
								<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
							</p>
						</div>
						<div class="footer__copyright__payment">
							<img src="img/payment-item.png" alt="결제수단">
						</div>
					</div>
				</div>
			</div>
		</div>
	</footer>
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

	<!-- jQuery -->
	<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
	<!-- iamport.payment.js -->
	<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>


	<script type="text/javascript">
      //문서가 준비되면 제일 먼저 실행
         
      function inputCheck(){
    	  var userName=$("#name").val();
    	  var userPhoneNum=$("#phone").val();
    	  var post=$("#post").val();
    	  var address=$("#address").val();
    	  var addressDetail=$("#address_detail").val();
    	  
    	  console.log(userName);
    	  console.log(userPhoneNum);
    	  console.log(post);
    	  console.log(address);
    	  console.log(addressDetail);
    	  
    	  if(userName == '') {
    		  swal({
					text : "이름을 입력해주세요",
					button : "확인"
				});
				return false;
    	  } else if (userPhoneNum == '') {
    		  swal({
					text : "핸드폰 번호를 입력해주세요",
					button : "확인"
				});
				return false;
    	  } else if (post == '' || address == '' || addressDetail == '') {
    		  swal({
					text : "주소를 확인해주세요",
					button : "확인"
				});
    		  return false;
    	  }else{
    		  return true;
    	  }
      }
      	
            
         $(document).ready(function() {
            
         var data;
         $("#iamportPayment").click(function() {
        	 if(inputCheck()){
            data = '카드결제';
            payment(data); //버튼 클릭하면 호출 
        	 }
         });
         $("#iamportPayment2").click(function() {
        	 if(inputCheck()){
            data = '카카오페이';
            payment(data); //버튼 클릭하면 호출 
        	 }
         });
         $("#iamportPayment3").click(function() {
        	 if(inputCheck()){
            data = '휴대폰결제';
            payment(data); //버튼 클릭하면 호출
        	 }
         });
           
         });

          
          //버튼 클릭하면 실행
          function payment(data) {
    	  	var list =' ';
    	  	if(${fn:length(cList)}>=2){
    	  		list = ' 외 '+'${fn:length(cList)-1}'+'건';
    	  	}
    	  	
             var orderName='${orderName}'+list ;
            var searchItem2='${memberId}';
            var cTotalPrice='${total}';            
            var uid = 'ORDER' + new Date().toLocaleString();
            console.log(cTotalPrice);
            console.log(orderName);
         var pay = data;
         if (pay == '카카오페이') {
            pgcode = 'kakaopay.TC0ONETIME';
         } else if (pay == '휴대폰결제') {
            pgcode = 'danal.A010002002';
         } else if (pay == '카드결제') {
            pgcode = 'nice.nictest00m';
         }

         IMP.init('imp02567853');//아임포트 관리자 콘솔에서 확인한 '가맹점 식별코드' 입력
         IMP.request_pay({// param

            pg : pgcode, //옵션값에 따라 다르개 들어오눈 pg코드 
            pay_method : "card", //지불 방법
            merchant_uid : uid, //ovo.getoNum() 오더 pk값 
            name : orderName, //pvo.getPname() 상품 이름 
            amount : cTotalPrice, //
            buyer_addr : document.getElementById("address").value+" "+document.getElementById("address_detail").value,
            buyer_name : document.getElementById("name").value, // 세션에 저장된 (로그인한 멤버의 name)mvo.getName()
            buyer_tel : document.getElementById("phone").value // 멤버 phoneNum

         }, function(rsp) { // callback
            if (rsp.success) {
               console.log(rsp.name);
               console.log(rsp.amount);
               console.log(rsp.buyer_name);
               console.log(rsp.buyer_tel);
               console.log(rsp.buyer_addr);
               
               var link = 'insertOrder.do?rcvName=' + rsp.buyer_name + '&rcvPhoneNum=' + rsp.buyer_tel + '&rcvAddress=' + rsp.buyer_addr + '&oPay=' +pay;
            location.href = link;

               //결제완료시 프론트 컨트롤러로 이동후 InsertOrder.do로 이동후 order dao 애서 데이터베이스에 추가 

            } else {
               alert("실패 : 코드(" + rsp.error_code + ") / 메세지(" + rsp.error_msg + ")");
            }

         });
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
                     document.getElementById('post').value = data.zonecode;
                     document.getElementById("address").value = addr;
                     // 커서를 상세주소 필드로 이동한다.
                     document.getElementById("address_detail").focus();
                  }
               }).open();
      }
   </script>
	<!—  주소 스클립트 end —>

	<!— TOP 버튼 —>
	<div style="width: 120px; position: fixed; bottom: 80px; right: 100px; z-index: 1;">
		<a href="#">
			<button type="button" class="button-top">▲ 맨위로</button>
		</a>
	</div>


</body>

</html>