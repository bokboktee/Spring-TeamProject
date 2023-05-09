<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>

<!-- =========================================================
* Sneat - Bootstrap 5 HTML Admin Template - Pro | v1.0.0
==============================================================

* Product Page: https://themeselection.com/products/sneat-bootstrap-html-admin-template/
* Created by: ThemeSelection
* License: You must have a valid license purchased in order to legally use the theme for your project.
* Copyright ThemeSelection (https://themeselection.com)

=========================================================
 -->
<!-- beautify ignore:start -->
<html lang="ko" class="light-style layout-menu-fixed" dir="ltr" data-theme="theme-default" data-assets-path="assets/" data-template="vertical-menu-template-free">
<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no, minimum-scale=1.0, maximum-scale=1.0" />

<title>관리자 페이지 | 상품관리</title>
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

<meta name="description" content="" />

<!-- Favicon -->
<link rel="icon" type="image/x-icon" href="assets/img/favicon/favicon.ico" />

<!-- Fonts -->
<link rel="preconnect" href="https://fonts.googleapis.com" />
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
<link href="https://fonts.googleapis.com/css2?family=Public+Sans:ital,wght@0,300;0,400;0,500;0,600;0,700;1,300;1,400;1,500;1,600;1,700&display=swap" rel="stylesheet" />

<!-- Icons. Uncomment required icon fonts -->
<link rel="stylesheet" href="assets/vendor/fonts/boxicons.css" />

<!-- Core CSS -->
<link rel="stylesheet" href="assets/vendor/css/core.css" class="template-customizer-core-css" />
<link rel="stylesheet" href="assets/vendor/css/theme-default.css" class="template-customizer-theme-css" />
<link rel="stylesheet" href="assets/css/demo.css" />

<!-- Vendors CSS -->
<link rel="stylesheet" href="assets/vendor/libs/perfect-scrollbar/perfect-scrollbar.css" />

<!-- Page CSS -->

<!-- Helpers -->
<script src="assets/vendor/js/helpers.js"></script>

<!--! Template customizer & Theme config files MUST be included after core stylesheets and helpers.js in the <head> section -->
<!--? Config:  Mandatory theme config file contain global vars & default theme options, Set your preferred theme option in this file.  -->
<script src="assets/js/config.js"></script>
</head>

<body>
	<!-- Layout wrapper -->
	<div class="layout-wrapper layout-content-navbar">
		<div class="layout-container">
			<!-- Menu -->
			<aside id="layout-menu" class="layout-menu menu-vertical menu bg-menu-theme">
				<div class="app-brand demo">
					<a href="main.do" class="app-brand-link"><img src="img/logo.png" width="150px" alt="냥신사 홈으로 가기"> </a> <a href="javascript:void(0);" class="layout-menu-toggle menu-link text-large ms-auto d-block d-xl-none"> <i class="bx bx-chevron-left bx-sm align-middle"></i>
					</a>
				</div>

				<div class="menu-inner-shadow"></div>

				<ul class="menu-inner py-1">
					<!-- Dashboard -->
					<li class="menu-item"><a href="main.do" class="menu-link"> <i class="menu-icon tf-icons bx bx-home-circle"></i>
							<div data-i18n="Analytics">냥신사홈</div>
					</a></li>
					<li class="menu-item"><a href="adminIndex.do" class="menu-link"> <i class="menu-icon tf-icons bx bx-home-circle"></i>
							<div data-i18n="Analytics">관리자홈</div>
					</a></li>


					<!-- Components -->
					<li class="menu-header small text-uppercase"><span class="menu-header-text">관리자 메뉴</span></li>
					<!-- Cards -->
					<li class="menu-item"><a href="memberManage.do" class="menu-link"> <i class="menu-icon tf-icons bx bx-user-check"></i>
							<div data-i18n="Basic">회원관리</div>
					</a></li>

					<!-- 상품관리 -->
					<li class="menu-item">
						<a href="productManagePage.do" class="menu-link">
							<i class="menu-icon tf-icons bx bx-store"></i>

							<div data-i18n="Basic">상품관리</div>
						</a>
					</li>

					<!-- 주문관리 -->
					<li class="menu-item">
						<a href="orderManagePage.do" class="menu-link">
							<i class="menu-icon tf-icons bx bx-receipt"></i>
							<div data-i18n="Basic">주문관리</div>
						</a>
					</li>

					<!-- 리뷰관리 -->
					<li class="menu-item">
						<a href="reviewManagePage.do" class="menu-link">
							<i class="menu-icon tf-icons bx bx-message-alt-dots"></i>
							<div data-i18n="Basic">리뷰관리</div>
						</a>
					</li>

					<!-- 글 관리 -->
					<li class="menu-item">
						<a href="boardManageView.do" class="menu-link">
							<i class="menu-icon tf-icons bx bx-message-alt-dots"></i>
							<div data-i18n="Basic">게시글 관리</div>
						</a>
					</li>
					<!-- 신고 관리 -->
					<li class="menu-item">
						<a href="reportManageView.do" class="menu-link">
							<i class="menu-icon tf-icons bx bx-message-alt-dots"></i>
							<div data-i18n="Basic">신고 관리</div>
						</a>
					</li>
				</ul>
			</aside>
			<!-- / Menu -->

			<!-- Layout container -->
			<div class="layout-page">

				<!-- Navbar -->
				<nav class="layout-navbar container-xxl navbar navbar-expand-xl navbar-detached align-items-center bg-navbar-theme" id="layout-navbar">
					<div class="layout-menu-toggle navbar-nav align-items-xl-center me-3 me-xl-0 d-xl-none">
						<a class="nav-item nav-link px-0 me-xl-4" href="javascript:void(0)"> <i class="bx bx-menu bx-sm"></i>
						</a>
					</div>

					<div class="navbar-nav-right d-flex align-items-center" id="navbar-collapse">


						<ul class="navbar-nav flex-row align-items-center ms-auto">


							<!-- User -->
							<li class="nav-item navbar-dropdown dropdown-user dropdown"><a class="nav-link dropdown-toggle hide-arrow" href="javascript:void(0);" data-bs-toggle="dropdown">
									<div class="avatar avatar-online">
										<img src="assets/img/avatars/admin.png" alt="관리자 프로필 사진" class="w-px-40 h-auto rounded-circle">
									</div>
							</a>
								<ul class="dropdown-menu dropdown-menu-end">
									<li><a class="dropdown-item" href="#">
											<div class="d-flex">
												<div class="flex-shrink-0 me-3">
													<div class="avatar avatar-online">
														<img src="assets/img/avatars/admin.png" alt="관리자 프로필 사진" class="w-px-40 h-auto rounded-circle">
													</div>
												</div>
												<div class="flex-grow-1">
													<span class="fw-semibold d-block">${memberName}</span> <small class="text-muted">관리자</small>
												</div>
											</div>
									</a></li>
									<li>
										<div class="dropdown-divider"></div>
									</li>

									<li><a class="dropdown-item" href="logout.do"> <i class="bx bx-power-off me-2"></i> <span class="align-middle">로그아웃</span>
									</a></li>
								</ul></li>
							<!--/ User -->
						</ul>
					</div>
				</nav>
				<!-- / Navbar -->

				<!-- Content wrapper -->
				<div class="content-wrapper">
					<!-- Content -->

					<div class="container-xxl flex-grow-1 container-p-y">
						<h4 class="fw-bold py-3 mb-4">
							<span class="text-muted fw-light">관리자 메뉴 > 상품 관리 > </span> 상세 보기
						</h4>

						<form action="updateProduct.do" method="POST" enctype="multipart/form-data">
							<div class="row">
								<!-- HTML5 Inputs -->
								<div class="card mb-4">
									<h5 class="card-header">기본 정보</h5>
									<div class="card-body">
										<div class="mb-3 row">
											<label for="html5-text-input" class="col-md-2 col-form-label">대표 이미지</label>
											<div class="col-md-10">
												<img src="${pvo.imageName}" height="500px" alt="상품 대표 이미지" />
											</div>
										</div>
										<div class="mb-3 row">
											<label for="html5-text-input" class="col-md-2 col-form-label">상품 번호</label>
											<div class="col-md-10">
												<input class="form-control" type="text" name="pNum" id="exampleFormControlReadOnlyInput1" value="${pvo.pNum}" readonly />
											</div>
										</div>

										<div class="mb-3 row">
											<label for="exampleFormControlSelect1" class="col-md-2 col-form-label">카테고리</label>
											<div class="col-md-10">
												<select class="form-select" id="exampleFormControlSelect1" aria-label="Default select example" name="category">
													<option disabled>선택</option>
													<option value="${pvo.category}" selected>${pvo.category}</option>
													<option value="food">사료</option>
													<option value="sand">간식</option>
													<option value="treat">모래</option>
												</select>
											</div>
										</div>
										<div class="mb-3 row">
											<label for="html5-text-input" class="col-md-2 col-form-label">상품 이름</label>
											<div class="col-md-10">
												<input class="form-control" type="text" name="pName" value="${pvo.pName}" id="html5-text-input" />
											</div>
										</div>

										<div class="mb-3 row">
											<label for="html5-number-input" class="col-md-2 col-form-label">가격</label>
											<div class="col-md-10">
												<input type="number" name="price" class="col-md-2 form-control" min="0" value="${pvo.price}">
											</div>
										</div>
										<div class="mb-3 row">
											<label for="html5-number-input" class="col-md-2 col-form-label">재고</label>
											<div class="col-md-10">
												<input type="number" name="pAmt" class="col-md-2 form-control" min="0" placeholder="재고" value="${pvo.pAmt}">
											</div>
										</div>
										<!-- <div class="mb-3 row">
											<label for="html5-number-input" class="col-md-2 col-form-label">판매 수량</label>
											<div class="col-md-10">
												<input type="number" class="col-md-2 form-control" value="30" readonly>
											</div>
										</div> -->
										<div class="mb-3 row">
											<label for="html5-number-input" class="col-md-2 col-form-label">할인 퍼센트</label>
											<div class="col-md-10">
												<input type="number" name="pDcPercent" class="col-md-2 form-control" value="${pvo.pDcPercent }">
											</div>
										</div>
										<div class="mb-3 row">
											<label for="html5-number-input" class="col-md-2 col-form-label">설명</label>
											<div class="col-md-10">
												<textarea class="form-control" aria-label="With textarea" name="pDetail" style="height: 200px; resize: none;">
                                 ${pvo.pDetail}</textarea>
											</div>
										</div>
									</div>
								</div>
							</div>

							<!-- File input -->

							<div class="card  mb-4">
								<h5 class="card-header">상품 이미지</h5>
								<div class="card-body">
									<div class="mb-3">
										<label for="formFileMultiple" class="form-label">이미지 파일을 선택하세요</label> <input class="form-control" type="file" id="formFileMultiple" name="img1" accept="image/*"  />
									</div>
								</div>
							</div>

							<div class="card  mb-4">
								<h5 class="card-header">상품 이미지 2</h5>
								<div class="card-body">
									<div class="mb-3">
										<label for="formFileMultiple" class="form-label">이미지 파일을 선택하세요 2</label> <input class="form-control" type="file" id="formFileMultiple2" name="img2" accept="image/*" />
									</div>
								</div>
							</div>
							<div class=" mb-4" align="center">
								<input type="submit" class="button-purple" value="수정하기">
							</div>
						</form>
					</div>


					<!-- / Content -->

					<!-- Footer -->
					<footer class="content-footer footer bg-footer-theme">
						<div class="container-xxl d-flex flex-wrap justify-content-between py-2 flex-md-row flex-column">
							<div class="mb-2 mb-md-0">
								©
								<script>
									document.write(new Date().getFullYear());
								</script>
								, made with ❤️ by <a href="https://themeselection.com" target="_blank" class="footer-link fw-bolder">ThemeSelection</a>
							</div>
							<div>
								<a href="https://themeselection.com/license/" class="footer-link me-4" target="_blank">License</a> <a href="https://themeselection.com/" target="_blank" class="footer-link me-4">More Themes</a> <a href="https://themeselection.com/demo/sneat-bootstrap-html-admin-template/documentation/" target="_blank" class="footer-link me-4">Documentation</a> <a href="https://github.com/themeselection/sneat-html-admin-template-free/issues" target="_blank" class="footer-link me-4">Support</a>
							</div>
						</div>

					</footer>
					<!-- / Footer -->

					<div class="content-backdrop fade"></div>
				</div>
				<!-- Content wrapper -->
			</div>
			<!-- / Layout page -->
		</div>

		<!-- Overlay -->
		<div class="layout-overlay layout-menu-toggle"></div>
	</div>
	<!-- / Layout wrapper -->

	<!— Core JS —>
	<!— build:js assets/vendor/js/core.js —>
	<script src="assets/vendor/libs/jquery/jquery.js"></script>
	<script src="assets/vendor/libs/popper/popper.js"></script>
	<script src="assets/vendor/js/bootstrap.js"></script>
	<script src="assets/vendor/libs/perfect-scrollbar/perfect-scrollbar.js"></script>

	<script src="assets/vendor/js/menu.js"></script>
	<!— endbuild —>

	<!— Vendors JS —>

	<!— Main JS —>
	<script src="assets/js/main.js"></script>

	<!— Page JS —>

	<!--  Place this tag in your head or just before your close body tag.  -->
	<script async defer src="https://buttons.github.io/buttons.js"></script>

	<script type="text/javascript">
		function fileUpload() {
			var fileInput = document.getElementsById("formFileMultiple");

			console.log(fileInput);

		}
	</script>
</body>
</html>
