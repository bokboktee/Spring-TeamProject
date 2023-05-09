<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
<title>냥신사 | 글 작성</title>

<!-- google Font -->
<link
	href="https://fonts.googleapis.com/css2?family=Cairo:wght@200;300;400;600;900&display=swap"
	rel="stylesheet">

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
<style>
/* CKEditor Style */
.ck.ck-editor {
	max-width: 100%;
}

.ck-editor__editable {
	min-height: 1000px;
}
</style>

<body>
	<nss:header />

	<!-- 메인 화면에는 제외 -->
	<!-- Breadcrumb Section Begin -->
	<!-- <section class="breadcrumb-section set-bg" data-setbg="">
		<div class="container">
			<div class="row">
				<div class="col-lg-12 text-center">
					<div class="breadcrumb__text">
						<h2>contact</h2>
						<div class="breadcrumb__option">
                     <a href="./index.html">홈</a>
                  </div>
					</div>
				</div>
			</div>
		</div>
	</section> -->
	<!-- Breadcrumb Section End -->

	<!-- 자랑하기 Begin -->
	<div class="contact-form spad">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="contact__form__title">
						<h2>고양이 자랑하기</h2>
						<hr>
					</div>
				</div>
			</div>
			<form action="updateBoard.do" method="POST" enctype="multipart/form-data">
				<div class="row">
					<div class="row1" style="width: 10%; margin-left: 15px">
						<div style="padding-bottom: 45px;">
							<p style="font-weight: bold;">제목</p>
						</div>
						<div style="padding-bottom: 495px;">
							<p style="font-weight: bold;">내용</p>
						</div>
					</div>
					<div class="row2" style="width: 90%; margin-left: -15px">
						<div class="col-lg-12 col-md-12">
							<input type="text" name="boardTitle" value="${board.boardTitle}" required>
							<input type="hidden" name="writer" value="${memberId}">
							<input type="hidden" name="userId" value="${memberId}">
							<input type="hidden" name="boardNum" value="${board.boardNum}">
							<input type="hidden" name="searchCondition" value="edit">
						</div>
						<div class="col-lg-12 text-center">
							<textarea name="boardContent" id="editor">${board.boardContent}</textarea>
							<button type="submit" class="site-btn" style="margin-top: 30px;">수정하기</button>
						</div>
					</div>
				</div>
			</form>
		</div>
	</div>
	<!-- 자랑하기 End -->

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
	<script src="js/email.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/ckeditor/ckeditor.js"></script>
	<script>
		$(function() {
			CKEDITOR
					.replace(
							'editor',
							{
								filebrowserUploadUrl : '${pageContext.request.contextPath}/fileupload.do'
							});
		});
	</script>

	<!-- TOP 버튼 -->
	<div
		style="width: 120px; position: fixed; bottom: 80px; right: 100px; z-index: 1;">
		<a href="#">
			<button type="button" class="button-top">▲ 맨위로</button>
		</a>
	</div>
</body>


</html>