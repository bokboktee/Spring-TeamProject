<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"
%>
<%@ taglib prefix="nss" tagdir="/WEB-INF/tags/"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="UTF-8">
<meta name="description" content="Ogani Template">
<meta name="keywords" content="Ogani, unica, creative, html">
<meta name="viewport"
   content="width=device-width, initial-scale=1.0"
>
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>냥신사 | 에러 페이지</title>

<!-- favicon -->
<link rel="shortcut icon" type="image/x-icon" href="img/favicon.ico" />

<!-- google Font -->
<link
   href="https://fonts.googleapis.com/css2?family=Cairo:wght@200;300;400;600;900&display=swap"
   rel="stylesheet"
>

<!-- Css Styles -->
<link rel="stylesheet" href="css/bootstrap.min.css" type="text/css">
<link rel="stylesheet" href="css/font-awesome.min.css"
   type="text/css"
>
<link rel="stylesheet" href="css/elegant-icons.css" type="text/css">
<link rel="stylesheet" href="css/nice-select.css" type="text/css">
<link rel="stylesheet" href="css/jquery-ui.min.css" type="text/css">
<link rel="stylesheet" href="css/owl.carousel.min.css"
   type="text/css"
>
<link rel="stylesheet" href="css/slicknav.min.css" type="text/css">
<link rel="stylesheet" href="css/style.css" type="text/css">
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
         <a href="main.do"><img src="img/logo.png" alt="홈으로 가기"></a>
      </div>


      <div id="mobile-menu-wrap"></div>
      <div class="header__top__right__social">
         <a href="https://www.facebook.com/profile.php?id=100089405234926"><i
            class="fa fa-facebook"
         ></i></a> <a href="https://www.instagram.com/nyangsinsa5/"><i
            class="fa fa-instagram"
         ></i></a> <a href="https://twitter.com/nyangsinsa"><i
            class="fa fa-twitter"
         ></i></a>
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
                        <a
                           href="https://www.facebook.com/profile.php?id=100089405234926"
                        ><i class="fa fa-facebook"></i></a> <a
                           href="https://www.instagram.com/nyangsinsa5/"
                        ><i class="fa fa-instagram"></i></a> <a
                           href="https://twitter.com/nyangsinsa"
                        ><i class="fa fa-twitter"></i></a>
                     </div>


                  </div>
               </div>
            </div>
         </div>
      </div>
      <div class="container">
         <div class="row">
            <div class="col-lg-3">
               <div class="header__logo">
                  <a href="main.do"><img src="img/logo.png" alt="홈으로 가기"></a>
               </div>
            </div>
         </div>
         <div class="humberger__open">
            <i class="fa fa-bars"></i>
         </div>
      </div>
   </header>
   <!-- Header Section End -->


   <!-- ★★★★★여기에 페이지의 메인 코드를 넣어주세요★★★★★ -->
   <div>
      <img alt="에러가 났습니다"
         style="width: 300px; display: block; margin: auto;"
         src="img/errorNotice.png"
      >
   </div>

   <!-- Footer Section Begin -->
   <footer class="footer spad">
      <div class="container">
         <div class="row">
            <div class="col-lg-4 col-md-4 col-sm-6">
               <div class="footer__about">
                  <div class="footer__about__logo">
                     <a href="main.do"><img src="img/logo.png" alt="로고"></a>
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
                     <a
                        href="https://www.facebook.com/profile.php?id=100089405234926"
                     ><i class="fa fa-facebook"></i></a> <a
                        href="https://www.instagram.com/nyangsinsa5/"
                     ><i class="fa fa-instagram"></i></a> <a
                        href="https://twitter.com/nyangsinsa"
                     ><i class="fa fa-twitter"></i></a>
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
                        All rights reserved | This template is made with <i
                           class="fa fa-heart" aria-hidden="true"
                        ></i> by <a href="https://colorlib.com" target="_blank">Colorlib</a>
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


</body>

</html>