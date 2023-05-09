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
<title>냥신사 | 마이페이지</title>

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
</head>
<style type="text/css">
.mypagedt {
	display: flex;
	width: 100px;
	height: 30px;
	border: 2px solid #6667AB;
	border-radius: 15px;
	margin: 10px;
	padding: 5px;
	padding-top: 2px;
	padding-bottom: 2px;
	justify-content: center;
	background: #6667AB;
	color: #FFFFFF;
}

.mypagetext {
	padding-left: 30px;
}

.mypageli {
	list-style: none;
	line-height: 150%;
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
						<h2>마이페이지</h2>
						<!-- <div class="breadcrumb__option">
                     <a href="./index.html">홈</a>
                  </div> -->
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Breadcrumb Section End -->
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

					<div class="col-lg-6 col-md-6 col-sm-6">
						<div class="blog__item">
							<div class="blog__item__pic">
								<h3 style="font-weight: bold;">회원정보</h3>
								<hr>
							</div>
							<ul>
								<li class="mypageli">
									<div>
										<div class="mypagedt">아이디</div>
										<span class="mypagetext">${memberId}</span>
										<br>
									</div>

								</li>
								<hr>

								<li class="mypageli">
									<div class="mypagedt">이름</div> <span class="mypagetext">${memberName}</span> <br>
								</li>
								<hr>

								<li class="mypageli">
									<div class="mypagedt">고영이 이름</div> <span class="mypagetext">${memberCatName}</span> <br>
								</li>
								<hr>
								<li class="mypageli">
									<div class="mypagedt">전화번호</div> <span class="mypagetext">${memberPhoneNum}</span> <br>
								</li>
								<hr>
								<li class="mypageli">
									<div class="mypagedt">주소</div> <span class="mypagetext">[우편번호] ${memberPostNum}
									<div style = "margin-left: 30px;"> [상세주소]${memberAddress1}<br>${memberAddress2}</div></span>
								</li>
							</ul>
						</div>



					</div>


				</div>

				<div class="col-lg-6 col-md-6 col-sm-6">

					<div class="blog__item">
						<div class="blog__item__pic"></div>

					</div>
				</div>


				<div class="col-lg-6 col-md-6 col-sm-6">

					<div class="blog__item">
						<div class="blog__item__pic">
							<!--   <img src="img/blog/blog-4.jpg" alt="">-->
						</div>
						<div class="blog__item__text"></div>
					</div>
				</div>
				<div class="col-lg-6 col-md-6 col-sm-6">
					<div class="blog__item">
						<div class="blog__item__pic">
							<!--   <img src="img/blog/blog-6.jpg" alt=""> -->
						</div>
						<div class="blog__item__text"></div>
					</div>
				</div>
				<!-- <div class="col-lg-12">
                  <div class="product__pagination blog__pagination">
                     <a href="#">1</a> <a href="#">2</a> <a href="#">3</a> <a href="#"><i
                        class="fa fa-long-arrow-right"></i></a>
                  </div>
               </div> -->
			</div>
		</div>
		</div>
		<!--   </div>-->

	</section>
	
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



</body>

</html>