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
<title>냥신사 | 주문내역</title>

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

#review {
	font-size: 14px;
	color: #ffffff;
	text-transform: uppercase;
	padding: 10px 25px 10px;
	background: #6667ab;
	border: none;
	border-radius: 10px;
}
</style>
<script type="text/javascript">
		/* function review() {
			window.open("review.jsp", "review", "width=500,height=570, left=400, top = 200");
		} */
		function review(pNum) {
			window.open("reviewPage.do?pNum="+pNum, "review", "width=500,height=800, left=400, top = 200");
		}
	</script>
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
							<li><a href="shopingCart.do">
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
						<h2>상세 주문내역</h2>
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
								<li><a href="myReviewView.do">내가 쓴 후기</a></li>
								<li><a href="selectAllMyLike.do">내가 좋아요 한 글 </a></li>
							</ul>
						</div>
					</div>
				</div>
				<div class="col-lg-9 col-md-7">
					<div class="col-lg-12">
						<div class="shoping__cart__table">
							<table>
								<thead>
									<tr>
										<!-- <th class="shoping__product"></th> -->
										<th colspan="2">주문 상품</th>
										<th>주문 수량</th>
										<th>주문 금액</th>
										<th>리뷰 작성</th>
										<th></th>
									</tr>
								</thead>
								<c:forEach var="v" items="${odList}" begin="0" varStatus="status">
									<tbody>
										<tr>
											<!-- <td class="shoping__cart__item">
												<h5>164118</h5>
											</td> -->
											<td class="detail_img"><a href="shopDetails.do?pNum=${v.pNum}">
													<img src="${v.imageName}" alt="${v.pName}의 상세사진 ">
												</a></td>
											<td class="shoping__cart__price"><a style="color: black;" href="shopDetails.do?pNum=${v.pNum}">${v.pName}</a></td>
											<td class="shoping__cart__total">${v.odCnt}개</td>
											<td class="shoping__cart__total">${v.odPrice}원</td>
											<td><input id="review" type="button" value="리뷰 작성하기" onClick="review(${v.pNum})"></td>
										</tr>
									</tbody>
								</c:forEach>
							</table>
						</div>
					</div>
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

	<!-- TOP 버튼 -->
	<div style="width: 120px; position: fixed; bottom: 80px; right: 100px; z-index: 1;">
		<a href="#">
			<button type="button" class="button-top">▲ 맨위로</button>
		</a>
	</div>

</body>

</html>