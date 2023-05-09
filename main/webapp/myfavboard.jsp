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

#board-view {
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
						<h2>내가 좋아요 한 글 ❤❤❤︎</h2>
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
							<script>
                        console.log(${board});
                     </script>
							<table>
								<thead>
									<tr>
										<th class="shoping__product">글 제목</th>
										<th>글 작성일</th>
										<th>작성자</th>
										<th>바로가기</th>
										<th></th>
									</tr>
								</thead>
								<c:forEach var="v" items="${board}" begin="0" varStatus="status">
									<tbody>
										<tr>
											<td class="shoping__cart__item" style="text-align: center;">
												<h5>${v.boardTitle}</h5>
											</td>
											<td class="shoping__cart__price">${v.boardDate}</td>
											<td class="shoping__cart__total">${v.userId}</td>
											<td><a href="boardPostView.do?boardNum=${v.boardNum}">
													<input id="board-view" type="button" value="상세보기">
												</a></td>
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