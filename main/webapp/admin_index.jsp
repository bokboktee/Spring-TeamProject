<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="nss" tagdir="/WEB-INF/tags/"%>
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
<html lang="en" class="light-style layout-menu-fixed" dir="ltr" data-theme="theme-default" data-assets-path="assets/" data-template="vertical-menu-template-free">
<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no, minimum-scale=1.0, maximum-scale=1.0" />

<title>냥신사 | 관리자홈</title>

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
					<a href="main.do" class="app-brand-link">
						<img src="img/logo.png" width="150px" alt="냥신사 홈으로 가기">
					</a>
					<a href="javascript:void(0);" class="layout-menu-toggle menu-link text-large ms-auto d-block d-xl-none">
						<i class="bx bx-chevron-left bx-sm align-middle"></i>
					</a>
				</div>

				<div class="menu-inner-shadow"></div>

				<ul class="menu-inner py-1">
					<!-- Dashboard -->
					<li class="menu-item"><a href="main.do" class="menu-link">
							<i class="menu-icon tf-icons bx bx-home-circle"></i>
							<div data-i18n="Analytics">냥신사홈</div>
						</a></li>
					<li class="menu-item"><a href="adminIndex.do" class="menu-link">
							<i class="menu-icon tf-icons bx bx-home-circle"></i>
							<div data-i18n="Analytics">관리자홈</div>
						</a></li>


					<!-- Components -->
					<li class="menu-header small text-uppercase"><span class="menu-header-text">관리자 메뉴</span></li>
					<!-- Cards -->
					<li class="menu-item"><a href="memberManagePage.do" class="menu-link">
							<i class="menu-icon tf-icons bx bx-user-check"></i>
							<div data-i18n="Basic">회원관리</div>
						</a></li>

					<!-- 상품관리 -->
					<li class="menu-item"><a href="productManagePage.do" class="menu-link">
							<i class="menu-icon tf-icons bx bx-store"></i>

							<div data-i18n="Basic">상품관리</div>
						</a></li>

					<!-- 주문관리 -->
					<li class="menu-item"><a href="orderManagePage.do" class="menu-link">
							<i class="menu-icon tf-icons bx bx-receipt"></i>
							<div data-i18n="Basic">주문관리</div>
						</a></li>

					<!-- 리뷰관리 -->
					<li class="menu-item"><a href="reviewManagePage.do" class="menu-link">
							<i class="menu-icon tf-icons bx bx-message-alt-dots"></i>
							<div data-i18n="Basic">리뷰관리</div>
						</a></li>
					<!-- 글 관리 -->
					<li class="menu-item"><a href="boardManageView.do" class="menu-link">
							<i class="menu-icon tf-icons bx bx-message-alt-dots"></i>
							<div data-i18n="Basic">게시글 관리</div>
						</a></li>
					<!-- 신고 관리 -->
					<li class="menu-item"><a href="reportManageView.do" class="menu-link">
							<i class="menu-icon tf-icons bx bx-message-alt-dots"></i>
							<div data-i18n="Basic">신고 관리</div>
						</a></li>
				</ul>
			</aside>
			<!-- / Menu -->

			<!-- Layout container -->
			<div class="layout-page">

				<!-- Navbar -->
				<nav class="layout-navbar container-xxl navbar navbar-expand-xl navbar-detached align-items-center bg-navbar-theme" id="layout-navbar">
					<div class="layout-menu-toggle navbar-nav align-items-xl-center me-3 me-xl-0 d-xl-none">
						<a class="nav-item nav-link px-0 me-xl-4" href="javascript:void(0)">
							<i class="bx bx-menu bx-sm"></i>
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
									<li><a class="dropdown-item">
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

									<li><a class="dropdown-item" href="logout.do">
											<i class="bx bx-power-off me-2"></i> <span class="align-middle">로그아웃</span>
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
						<div class="row">
							<div class="col-lg-12 mb-4 order-0">
								<div class="card">
									<div class="d-flex align-items-end row">
										<div class="col-sm-7">
											<div class="card-body">
												<h5 class="card-title text-primary">회원 현황</h5>
												<p class="mb-4">
													전체 회원수 : <span class="fw-bold">${memberTotal} 명</span>
												</p>
											</div>
										</div>
										<div class="col-sm-5 text-center text-sm-left">
											<div class="card-body pb-0 px-0 px-md-4">
												<img src="assets/img/illustrations/man-with-laptop-light.png" height="140" alt="View Badge User" data-app-dark-img="illustrations/man-with-laptop-dark.png" data-app-light-img="illustrations/man-with-laptop-light.png" />
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>

						<!-- Total Revenue -->
						<div class="row">
							<div class="col-md-6 col-lg-4 col-xl-4 order-0 mb-4">
								<div class="card h-100">
									<div class="card-body" style="justify-content: center;">
										<div class="text-center">
											<p>
											<h5>전년 대비 성장률</h5>
											<br>
											총 매출 기준
											</p>

										</div>
									</div>
									<div class="d-flex px-xxl-4 px-lg-2 p-4 gap-xxl-3 gap-lg-1 gap-3 justify-content-center">
										<div class="d-flex">
											<div class="me-2">
												<div class="badge bg-label-primary p-2">
													<i class="bx bx-dollar text-primary"></i>
												</div>
											</div>
											<div class="d-flex flex-column">
												<small>2022년</small>
												<h6 class="mb-0" id="revenueLastYear"></h6>
											</div>
										</div>
									</div>
									<div class="d-flex px-xxl-4 px-lg-2 p-4 gap-xxl-3 gap-lg-1 gap-3 justify-content-center">
										<div class="d-flex">
											<div class="me-2">
												<div class="badge bg-label-primary p-2">
													<i class="bx bx-dollar text-primary"></i>
												</div>
											</div>
											<div class="d-flex flex-column">
												<small>2023년</small>
												<h6 class="mb-0" id="revenueThisYear"></h6>
											</div>
										</div>
									</div>
									<hr>
									<div class="d-flex px-xxl-4 px-lg-2 p-4 gap-xxl-3 gap-lg-1 gap-3 justify-content-center">
										<div class="d-flex">
											<div class="me-2">
												<span class="badge bg-label-primary p-2"><i class="bx bx-wallet text-info"></i></span>
											</div>
											<div class="d-flex flex-column">
												<small id="growthRevenue"></small>
												<h6 class="mb-0" id="growthPercent"></h6>
											</div>
											<br>
											<br>
										</div>
									</div>
								</div>
							</div>
							<!--/ Total Revenue -->

							<!-- Order Statistics -->
							<div class="col-md-6 col-lg-4 col-xl-4 order-0 mb-4">
								<div class="card h-100">
									<div class="card-header d-flex align-items-center justify-content-between pb-0">
										<div class="card-title mb-0">
											<h5 class="m-0 me-2">주문 통계</h5>
											<small id="categorySum" class="text-muted"></small>
										</div>
										<!-- <div class="dropdown">
											<button class="btn p-0" type="button"
												id="orederStatistics" data-bs-toggle="dropdown"
												aria-haspopup="true" aria-expanded="false"
											>
												<i class="bx bx-dots-vertical-rounded"></i>
											</button>
											<div class="dropdown-menu dropdown-menu-end"
												aria-labelledby="orederStatistics"
											>
												<a class="dropdown-item" href="javascript:void(0);">모두선택</a>
												<a class="dropdown-item" href="javascript:void(0);">새로고침</a>
												<a class="dropdown-item" href="javascript:void(0);">공유하기</a>
											</div>
										</div> -->
									</div>
									<div class="card-body">
										<div class="d-flex justify-content-between align-items-center mb-3">
											<div class="d-flex flex-column align-items-center gap-1">
												<h2 id="orderCnt" class="mb-2"></h2>
												<span>총 주문</span>
											</div>
											<div id="orderStatisticsChart"></div>
											<!-- js 주석 주문통계 차트 -->
										</div>
										<ul class="p-0 m-0">
											<li class="d-flex mb-4 pb-1">
												<div class="avatar flex-shrink-0 me-3">
													<span class="avatar-initial rounded bg-label-primary"><i class="bx bx-mobile-alt"></i></span>
												</div>
												<div class="d-flex w-100 flex-wrap align-items-center justify-content-between gap-2">
													<div class="me-2">
														<h6 class="mb-0">사료</h6>
														<small class="text-muted">유기농, 기능성</small>
													</div>
													<div class="user-progress">
														<small id="foodSum" class="fw-semibold"></small>
													</div>
												</div>
											</li>
											<li class="d-flex mb-4 pb-1">
												<div class="avatar flex-shrink-0 me-3">
													<span class="avatar-initial rounded bg-label-success"><i class="bx bx-closet"></i></span>
												</div>
												<div class="d-flex w-100 flex-wrap align-items-center justify-content-between gap-2">
													<div class="me-2">
														<h6 class="mb-0">간식</h6>
														<small class="text-muted">츄르, 껌, 영양제</small>
													</div>
													<div class="user-progress">
														<small id="treatSum" class="fw-semibold"></small>
													</div>
												</div>
											</li>
											<li class="d-flex mb-4 pb-1">
												<div class="avatar flex-shrink-0 me-3">
													<span class="avatar-initial rounded bg-label-info"><i class="bx bx-home-alt"></i></span>
												</div>
												<div class="d-flex w-100 flex-wrap align-items-center justify-content-between gap-2">
													<div class="me-2">
														<h6 class="mb-0">모래</h6>
														<small class="text-muted">천연모래, 인공모래</small>
													</div>
													<div class="user-progress">
														<small id="sandSum" class="fw-semibold"></small>
													</div>
												</div>
											</li>
										</ul>
									</div>
								</div>
							</div>
							<!--/ Order Statistics -->

							<!-- Transactions -->
							<div class="col-md-6 col-lg-4 order-2 mb-4">
								<div class="card h-100">
									<div class="card-header d-flex align-items-center justify-content-between">
										<h5 class="card-title m-0 me-2">최근 거래</h5>

									</div>
									<div class="card-body">
										<ul class="p-0 m-0">
											<nss:list sort="adminhome" />
										</ul>
									</div>
								</div>
							</div>
							<!--/ Transactions -->
						</div>
					</div>
					<!-- / Content -->


					<!-- Footer -->
					<footer class="content-footer footer bg-footer-theme">
						<div class="container-xxl d-flex flex-wrap justify-content-between py-2 flex-md-row flex-column">
							<div class="mb-2 mb-md-0">
								냥신사©
								<script>
									document.write(new Date().getFullYear());
								</script>
								, made with ❤️ by
								<a href="https://themeselection.com" target="_blank" class="footer-link fw-bolder">ThemeSelection</a>
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

	<!-- Core JS -->
	<!-- build:js assets/vendor/js/core.js -->
	<script src="assets/vendor/libs/jquery/jquery.js"></script>
	<script src="assets/vendor/libs/popper/popper.js"></script>
	<script src="assets/vendor/js/bootstrap.js"></script>
	<script src="assets/vendor/libs/perfect-scrollbar/perfect-scrollbar.js"></script>

	<script src="assets/vendor/js/menu.js"></script>
	<!— endbuild —>

	<!— Vendors JS —>
	<script src="assets/vendor/libs/apex-charts/apexcharts.js"></script>

	<!— Main JS —>
	<script src="assets/js/main.js"></script>

	<!— Page JS —>
	<script src="assets/js/dashboards-analytics.js"></script>

	<!— Place this tag in your head or just before your close body tag. —>
	<script async defer src="https://buttons.github.io/buttons.js"></script>
	
	<script type="text/javascript">


	</script>
	
</body>
</html>