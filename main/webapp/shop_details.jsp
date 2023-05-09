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
<title>냥신사 | 상세페이지</title>

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
<link rel="stylesheet" href="css/jquery.rating.css" type="text/css">

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
						<i class="fa fa-shopping-bag"></i><span id="cartCnt2"></span>
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
							<li><a href="shopingCart.do">
									<i class="fa fa-shopping-bag"></i> <span id="cartCnt"></span>
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
						<h2>상세페이지</h2>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Breadcrumb Section End -->

	<!-- Product Details Section Begin -->
	<section class="product-details spad">
		<div class="container">
			<div class="row">

				<div class="col-lg-6 col-md-6">
					<div class="product__details__pic">
						<div class="product__details__pic__item">

							<!--  메인이미지 표시 부분 -->
							<img class="product__details__pic__item--large" src="${pvo.imageName}" alt="상품 대표 이미지">
						</div>
					</div>
				</div>

				<div class="col-lg-6 col-md-6">
					<div class="product__details__text">
						<h3>${pvo.pName}</h3>
						<div class="product__details__rating">

							<!-- 별점 표시 부분 -->
							<c:set var="sumRate" value="0" />
							<c:forEach var="v" items="${rList}">
								<c:set var="sumRate" value="${sumRate+v.rRate}" />
							</c:forEach>
							<c:set var="pRate" value="${sumRate/fn:length(rList)}" />
							<c:choose>
								<c:when test="${pRate>=1.0 && pRate<1.5}">
									<i class="fa fa-star"></i>
									<i class="fa fa-star-o"></i>
									<i class="fa fa-star-o"></i>
									<i class="fa fa-star-o"></i>
									<i class="fa fa-star-o"></i>
								</c:when>
								<c:when test="${pRate>=1.5 && pRate<2.0}">
									<i class="fa fa-star"></i>
									<i class="fa fa-star-half-o"></i>
									<i class="fa fa-star-o"></i>
									<i class="fa fa-star-o"></i>
									<i class="fa fa-star-o"></i>
								</c:when>
								<c:when test="${pRate>=2.0 && pRate<2.5}">
									<i class="fa fa-star"></i>
									<i class="fa fa-star"></i>
									<i class="fa fa-star-o"></i>
									<i class="fa fa-star-o"></i>
									<i class="fa fa-star-o"></i>
								</c:when>
								<c:when test="${pRate>=2.5 && pRate<3.0}">
									<i class="fa fa-star"></i>
									<i class="fa fa-star"></i>
									<i class="fa fa-star-half-o"></i>
									<i class="fa fa-star-o"></i>
									<i class="fa fa-star-o"></i>
								</c:when>
								<c:when test="${pRate>=3.0 && pRate<3.5}">
									<i class="fa fa-star"></i>
									<i class="fa fa-star"></i>
									<i class="fa fa-star"></i>
									<i class="fa fa-star-o"></i>
									<i class="fa fa-star-o"></i>
								</c:when>
								<c:when test="${pRate>=3.5 && pRate<4.0}">
									<i class="fa fa-star"></i>
									<i class="fa fa-star"></i>
									<i class="fa fa-star"></i>
									<i class="fa fa-star-half-o"></i>
									<i class="fa fa-star-o"></i>
								</c:when>
								<c:when test="${pRate>=4.0 && pRate<4.5}">
									<i class="fa fa-star"></i>
									<i class="fa fa-star"></i>
									<i class="fa fa-star"></i>
									<i class="fa fa-star"></i>
									<i class="fa fa-star-o"></i>
								</c:when>
								<c:when test="${pRate>=4.5 && pRate<5.0}">
									<i class="fa fa-star"></i>
									<i class="fa fa-star"></i>
									<i class="fa fa-star"></i>
									<i class="fa fa-star"></i>
									</i>
									<i class="fa fa-star-half-o"></i>
								</c:when>
								<c:when test="${pRate==5}">
									<i class="fa fa-star"></i>
									<i class="fa fa-star"></i>
									<i class="fa fa-star"></i>
									<i class="fa fa-star"></i>
									<i class="fa fa-star"></i>
									</i>
								</c:when>
								<c:otherwise>
									<i class="fa fa-star-o"></i>
									<i class="fa fa-star-o"></i>
									<i class="fa fa-star-o"></i>
									<i class="fa fa-star-o"></i>
									<i class="fa fa-star-o"></i>
								</c:otherwise>
							</c:choose>

							<span>(리뷰 : ${fn:length(rList)}개)</span>

						</div>
						<div class="product__details__price">
							<fmt:formatNumber value="${pvo.dc_price}" pattern="#,###" />
							원
							<c:if test="${pvo.pDcPercent != 0}">
								<span style="text-decoration: line-through; display: inline-block; color: #343a4057; font-size: 18px;"><fmt:formatNumber value="${pvo.price}" pattern="#,###" />원</span>
							</c:if>
						</div>

						<p>${pvo.pDetail}</p>

						<form id="insertCart" action="insertCart.do" method="post">
							<div class="product__details__quantity">
								<div class="quantity">
									<div class="pro-qty">
										<input type="number" id="pCnt" name="pCnt" value="1">
									</div>
								</div>
							</div>
							<input type="hidden" name="pNum" value="${pvo.pNum}">
							<c:if test="${pvo.pAmt > 0}">
								<a href="#" id="addCart" class="primary-btn">장바구니에 추가</a>
								<a href="#" id="modalButton" class="primary-btn" data-toggle="modal" data-target="#exampleModal" style="display: none;"></a>
							</c:if>
							<c:if test="${pvo.pAmt <= 0}">
								<div class="primary-btn" style="background-color: lightgray;">품절</div>
							</c:if>

							<!-- 모달 -->
							<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
								<div class="modal-dialog" role="document" style="position: fixed; top: 50%; left: 50%; transform: translate(-50%, -50%);">
									<div class="modal-content">
										<div class="modal-header">
											<h5 class="modal-title" id="exampleModalLabel">장바구니 추가</h5>
											<button type="button" class="close" data-dismiss="modal" aria-label="Close">
												<span aria-hidden="true">&times;</span>
											</button>
										</div>
										<div class="modal-body">선택하신 상품이 장바구니에 추가되었습니다</div>
										<div class="modal-footer">
											<button type="button" class="btn btn-secondary" data-dismiss="modal">쇼핑 계속하기</button>
											<a href="shopingCart.do">
												<button type="button" class="btn btn-primary" style="background-color: #6667AB; border-color: #6667AB;">장바구니 확인하기</button>
											</a>
										</div>
									</div>
								</div>
							</div>
							<!--  모달 end -->

						</form>

						<ul>
							<li><b><span>재고</span> <c:if test="${pvo.pAmt > 0}">
                     있음
                        </c:if> <c:if test="${pvo.pAmt <= 0}">
										<strong style="color: red;">없음</strong>
									</c:if> </b></li>
							<li><b>전상품 무료 배송</b><span><samp></samp></span></li>
						</ul>

					</div>
				</div>
			</div>
			<!-- row End -->

			<div class="row" style="display: inline-block; justify-content: center;">
				<div class="col-lg-12">

					<div class="product__details__tab">

						<ul class="nav nav-tabs" role="tablist">
							<li class="nav-item"><a class="nav-link active" data-toggle="tab" href="#tabs-1" role="tab" aria-selected="true">상세 정보</a></li>
							<li class="nav-item"><a class="nav-link" data-toggle="tab" href="#tabs-2" role="tab" aria-selected="false">리뷰 (${fn:length(rList)})</a></li>
						</ul>

						<div class="tab-content col-lg-12">
							<div class="tab-pane active" id="tabs-1" role="tabpanel">
								<div class="product__details__tab__desc" style="max-width: 100%; text-align: center;">
									<p>
										<img src="img/shopDetailLine.png" />
										<img src="${pvo.imageName2}" />
									</p>
								</div>
							</div>

							<!--tabs-2 Start -->
							<div class="tab-pane" id="tabs-2" role="tabpanel">
								<div class="product__details__tab__desc" style="max-width: 100%; text-align: center;">
									<div class="row col-lg-12">
										<p>
											<img src="img/shopDetailLine.png" />
										<div class="col-lg-12">
											<!-- 리뷰 목록 출력부분(카테고리별, 정렬방식별) -->
											<div class="col-lg-12" id="dataTableBody"></div>
											<!-- 페이지네이션 부분 -->
											<div class="product__pagination col-lg-12">
												<ul id="pagingul"></ul>
											</div>
										</div>
										</p>
									</div>
								</div>
							</div>
							<!--tabs-2 End -->


						</div>
						<!--tabs-content End -->
					</div>
					<!--  product__details__tab End -->
				</div>
				<!-- col-lg-12 End -->
			</div>
			<!--  row End -->
		</div>
	</section>
	<!-- Product Details Section End -->

	<!-- Related Product Section Begin -->
	<section class="related-product">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="section-title related__product__title">
						<h2>관련 상품</h2>
					</div>
				</div>
			</div>
			<div class="row">

				<!-- 관련 상품 목록 출력 부분 -->
				<nss:list sort="related" />

			</div>
		</div>
	</section>
	<!-- Related Product Section End -->

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
	<script src="js/jquery.rating.pack.js"></script>
	<script src="js/r_list.js"></script>
	<script src="js/c_list.js"></script>

	<!-- 리스트세팅 -->
	<script>
      $(document).ready(function() {
         console.log("확인1");
         list("review","regiDesc", ${pvo.pNum}, 1);
         console.log("확인2");
         console.log('확인확인확인');
         $.ajax({ // ajax로 데이터 가져오기
            type: 'POST',
            url: 'getCartCnt.do',
            success: function(data) {
               console.log("레디 data : "+data);
               let cartCnt = '';
               cartCnt += data; // 장바구니 상품 개수
               $('#cartCnt').text(cartCnt); 
               $('#cartCnt2').text(cartCnt); 
               console.log("레디 span 값 : " + $('#cartCnt').text());
            },
            error: function(){
               alert('error');
            }
         })
      });
      
      function insertCart(pNum) {
			console.log(pNum);
			window.location.href = "insertCart.do?pNum=" + pNum;
			setTimeout(function() {
				$.ajax({ // ajax로 데이터 가져오기
					type : 'POST',
					url : 'getCartCnt.do',
					success : function(data) {
						console.log("data: " + data);
						let cartCnt = '';
						cartCnt += data; // 장바구니 상품 개수
						console.log("cartCnt 새로고침: " + cartCnt);
						$('#cartCnt').text(cartCnt);
						$('#cartCnt2').text(cartCnt);
					},
					error : function() {
						alert('error');
					}
				})
			}, 300);
		}
   </script>

	<script type="text/javascript">
      console.log('스크립트 진입');
      document.querySelector('#addCart').addEventListener('click', function (){
         document.getElementById('insertCart').submit();
         console.log('추가 클릭 이벤트 발생');
         setTimeout(function() {
            $.ajax({ // ajax로 데이터 가져오기
            type: 'POST',
            url: 'getCartCnt.do',
            success: function(data) {
               let cartCnt = '';
               cartCnt += data; // 장바구니 상품 개수
               $('#cartCnt').text(cartCnt); 
               $('#cartCnt2').text(cartCnt); 
               document.getElementById('modalButton').click();
            },
            error: function(){
               alert('error');
            }
            
         })  }, 300);
       })  
      

</script>


	<!-- TOP 버튼 -->
	<div style="width: 120px; position: fixed; bottom: 80px; right: 100px; z-index: 1;">
		<a href="#">
			<button type="button" class="button-top">▲ 맨위로</button>
		</a>
	</div>



</body>

</html>