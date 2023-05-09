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
<title>냥신사 | 게시글 상세페이지</title>

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
<link rel="stylesheet" href="css/blog.css" type="text/css">
<link rel="stylesheet" href="css/alert.css" type="text/css">
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
					<div style="overflow: visible;" class="hero__search">
						<div class="hero__search__form">
							<form action="selectAllSearchBoard.do">
								<select name="searchCondition">
									<option value="title">제목</option>
									<option value="writer">작성자</option>
									<option value="content">내용</option>
								</select>
								<!-- 글 검색 부분 -->
								<input type="text" name="searchContent" placeholder="궁금한 글 있냥?" required>
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
	<div id="board">
		<div id="boardDetail">
			<div id="title">
				${board.boardTitle}
				<br>
				<div id="writer">[작성자 : ${board.userId}]</div>
			</div>
			<ul id="boardInfo">
				<li><i class="fa fa-calendar-o"></i> ${board.boardDate}</li>
				<li><i class="fa fa-comment-o"></i> ${board.replyCnt}</li>
				<li><img style="width: 20px;" src="img/eyes.png"> ${board.boardView}</li>
				<li class="${board.boardNum}info1"><c:choose>
						<c:when test="${board.isChecked==true}">
							<img onclick="javascript:updateLike(${board.boardNum}, 'down');" class="${board.boardNum}heartImg" style="width: 20px; cursor: pointer;" src="img/fullheart.png">
							<span class="${board.boardNum}">${board.likeCnt}</span>
						</c:when>
						<c:otherwise>
							<img onclick="javascript:updateLike(${board.boardNum}, 'up');" class="${board.boardNum}heartImg" style="width: 20px; cursor: pointer;" src="img/heart.png">
							<span class="${board.boardNum}">${board.likeCnt}</span>
						</c:otherwise>
					</c:choose></li>
				<li><img class="reportBtn" onclick="javascript:report(1,${board.boardNum},`${board.userId}`);" style="width: 20px; cursor: pointer;" src="img/siren.png"></li>
			</ul>
			<div style="width: 90%;">
				<div style="font-size: 120%; font-weight: bold; letter-spacing: 1px;">${board.boardContent}</div>
			</div>
		</div>
	</div>

	<div class="showReply">
		<div id="showReply" onclick="showReply()">
			<img style="width: 20px;" src="img/replyicon.png">
			댓글 (${board.replyCnt}) ▼
		</div>
		<div id="reply" style="display: block;">
			<nss:list sort="reply" />
		</div>
	</div>
	<div id="replywrite">
		<div style="width: 100%;">
			<input id="0replyContent" class="replyContent" type="text" name="replyContent" style="padding-left: 20px; width: 85%; height: 55px; border-radius: 5px; border: 1.7px solid #6667ab6b;" placeholder="댓글을 작성하세요" required />
			<div onclick="insertReply(0)" style="cursor: pointer; text-align: center; width: 14%; height: 100%; padding-top: 13px; border: 1px solid #6667ab42; float: right; color: white; border-radius: 5px; background-color: #6667AB;">댓글 작성</div>
		</div>
	</div>



	<nss:footer />

	<!--  글 신고하기 모달창  -->

	<div class="container">
		<div class="popup-wrap" id="popup">
			<div class="popup">
				<div class="popup-head">
					<span class="head-title"> 신고하기</span>
				</div>
				<!-- 원래 있었음 class="report-box" -->
				<form action="insertReport.do" method="post">
					<div class="popup-body">
						<div class="body-content">
							<div class="body-titlebox">
								<h2 style="font-size: 25px;">신고 사유를 선택해주세요.</h2>
							</div>
							<div class="body-contentbox">
								<div style="width: 300px;">
									<input type="hidden" id="targetNum" name="targetNum" value="">
									<input type="hidden" id="rpStep" name="reportStep" value="">
									<input type="hidden" id="userId" name="userId" value="">
									<input type="hidden" name="reporterId" value="${memberId}">
									<input type="radio" class="report-box2" name="reportContent" id="r1" value="욕설/부적절한 언어 입니다.">
									<label for="r1">욕설/부적절한 언어 입니다.</label>
									<br>
									<input type="radio" class="report-box2" name="reportContent" id="r2" value="스팸광고/도배글 입니다.">
									<label for="r2">스팸광고/도배글 입니다.</label>
									<br>
									<input type="radio" class="report-box2" name="reportContent" id="r3" value="부적절한 컨텐츠 입니다.">
									<label for="r3">부적절한 컨텐츠 입니다.</label>
									<br>
									<input type="radio" class="report-box2" name="reportContent" id="r4" value="음란성 게시물 입니다.">
									<label for="r4">음란성 게시물 입니다.</label>
									<br>
									<input type="radio" class="report-box2" name="reportContent" id="r5" value="기타">
									<label for="r5">기타</label>
									<br>
									<input type="text" class="report-box2 report-text" name="reportContent" disabled placeholder="사유를 작성해주세요.">
								</div>
							</div>
						</div>
					</div>
					<div class="popup-foot">
						<input type="submit" class="pop-btn2" value="신고하기" id="close">
						<span class="pop-btn modal-close" id="close2">창 닫기</span>
					</div>
				</form>
			</div>
		</div>
	</div>





	<!-- TOP 버튼 -->
	<div id="fixtop">
		<a href="#">
			<button type="button" class="button-top">▲ 맨위로</button>
		</a>
	</div>

	<div id="fixboardlist">
		<a href="boardView.do">
			<button type="button" style="border: 1px solid; border-radius: 50%; height: 65px; width: 65px; padding: 14px; background: none; background-color: white;">
				<img style="width: 50px; height: auto; cursor: pointer;" src="img/boardlist.png">
				<div style="margin-top: 15px;">목록</div>
			</button>
		</a>
	</div>
	<div id="fixshare">
		<a href="#">
			<button type="button" onclick="kakaoShare()" style="border: 1px solid; border-radius: 50%; height: 65px; width: 65px; padding: 14px; background: none; background-color: white;">
				<img class="shareImg" style="width: 50px; height: auto; cursor: pointer;" src="img/share.png">
				<div style="margin-top: 15px;">공유</div>
			</button>
		</a>
	</div>
	<div class="${board.boardNum}info2" id="fixheart">
		<a href="#fixheart">
			<button type="button" style="border: 1px solid; border-radius: 50%; height: 65px; width: 65px; padding: 14px; background: none; background-color: white;">
				<c:choose>
					<c:when test="${board.isChecked==true}">
						<img onclick="javascript:updateLike(${board.boardNum}, 'down');" class="${board.boardNum}heartImg" style="width: 50px; height: auto; cursor: pointer;" src="img/fullheart.png">
					</c:when>
					<c:otherwise>
						<img onclick="javascript:updateLike(${board.boardNum}, 'up');" class="${board.boardNum}heartImg" style="width: 50px; height: auto; cursor: pointer;" src="img/heart.png">
					</c:otherwise>
				</c:choose>
				<div class="${board.boardNum}" style="margin-top: 15px;">${board.likeCnt}</div>
			</button>
		</a>
	</div>

	<div id="fixcomment">
		<a href="#replywrite">
			<button type="button" style="border: 1px solid; border-radius: 50%; height: 65px; width: 65px; padding: 14px; background: none; background-color: white;">
				<img style="width: 50px; height: auto; cursor: pointer;" src="img/replyicon.png">
				<div class="fixcomment" style="margin-top: 15px;">${board.replyCnt}</div>
			</button>
		</a>
	</div>

	<c:if test="${board.userId == memberId}">
		<div id="fixdelete">
			<a href="javascript:deleteCheck(${board.boardNum}, 'deleteBoard')">
				<button type="button" style="border: 1px solid; border-radius: 50%; height: 65px; width: 65px; padding: 14px; background: none; background-color: white;">
					<img style="width: 50px; height: auto; cursor: pointer;" src="img/deleteBoard.png">
					<div style="margin-top: 15px;">삭제</div>
				</button>
			</a>
		</div>
		<div id="fixupdate">
			<a href="updateBoardView.do?boardNum=${board.boardNum}">
				<button type="button" style="border: 1px solid; border-radius: 50%; height: 65px; width: 65px; padding: 14px; background: none; background-color: white;">
					<img style="width: 50px; height: auto; cursor: pointer;" src="img/updateBoard.png">
					<div style="margin-top: 15px;">수정</div>
				</button>
			</a>
		</div>

	</c:if>

	<!-- 댓글 추가 -->
	<script type="text/javascript">
   function insertReply(parentNum){
	   var replyContent = $('input[id='+parentNum+'replyContent]').val();
	   if(loginCheck()){
		   if(replyContent==''){
			   swal({
					text : "내용을 입력하세요.",
					button : "확인"
				});
		   }else{
      console.log('내용'+replyContent);
      $.ajax({
         type : 'POST',
         url : 'insertReply.do',
         data : {
            boardNum: '${board.boardNum}',
            userId : '${memberId}',
            replyContent : replyContent,
            parentNum : parentNum
         },
         success : function() {
            $('.showReply').load(location.href + ' .showReply');
            $('.fixcomment').load(location.href + ' .fixcomment');
            $('#0replyContent').val('');
            setTimeout(function() {
               $('#reply').css('display', 'block');
            },100);
            // 시연해보고, 발표할때 적당한 시간 찾아서 대입
            // -> 각각을 함수로 빼서,(모듈화)
            // if분기로 처리할수있음
         },
        		error : function() {
         	   alert('error');
       		  }
    	  })
   		}
   	}
   }
   </script>
	<!-- 댓글 추가 / -->

	<!--  신고하기 모달창 Scripte  -->
	<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
	<script>

		function report(step,targetNum,userId){
			if ('${memberId}' == '') {
				swal({
					text : "로그인 후 이용해주세요",
					button : "확인"
				});

			} else{
				console.log('리포트함수');
				console.log(typeof(userId));
			  var rpStep = document.getElementById("rpStep"); 
			  rpStep.value =step;
			  
			  var targetNumInput = document.getElementById("targetNum"); 
			  targetNumInput.value =targetNum;
			  
			  var userIdInput = document.getElementById("userId"); 
			  userIdInput.value =userId;
			}
		}
	
		$(function() {
			$("#confirm").click(function() {
				modalClose();
				//컨펌 이벤트 처리
			});
			$(".reportBtn").click(function() {
				if ('${memberId}' == '') {
					swal({
						text : "로그인 후 이용해주세요",
						button : "확인"
					});
					return;
				}

				
				console.log('dd');
				$("#popup").css('display', 'flex').hide().fadeIn();
			});
			$("#modal-close").click(function() {
				modalClose();
			});
			$("#close2").click(function() {
				modalClose();
			});
			function modalClose() {
				$("#popup").fadeOut();
			}
		});
		
			// 라디오버튼 클릭시 이벤트 발생
			$(".report-box2").click(function() {
				if ($(".report-box2:checked").val() == "기타") {
					console.log('입입입2');
					$(".report-text").attr("disabled", false);
					// radio 버튼의 value 값이 1이라면 활성화
				} else {
					$(".report-text").attr("disabled", true);
					// radio 버튼의 value 값이 0이라면 비활성화
				}
			});
	
	</script>




	<script type="text/javascript">
      function loginCheck(){
         if ('${memberId}' == '') {
            swal({
               text : "로그인 후 이용해주세요",
               button : "확인"
            }).then(function(){
            	location.href = "login.do";
            });
            return false;
         }else if('${memberRole}' == 'BLOCKED'){
            swal({
               text : "커뮤니티 기능이 차단된 회원입니다. \n관리자에게 문의하세요.",
               button : "확인"
            });
            return false;
         }else if('${memberRole}' == 'MEMBER' || '${memberRole}' == 'ADMIN'){
            return true;
         }
      }
</script>

	<!-- Js Plugins -->
	<script src="js/jquery-3.3.1.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/jquery.nice-select.min.js"></script>
	<script src="js/jquery-ui.min.js"></script>
	<script src="js/jquery.slicknav.js"></script>
	<script src="js/mixitup.min.js"></script>
	<script src="js/owl.carousel.min.js"></script>
	<script src="js/main.js"></script>
	<script src="https://code.jquery.com/jquery-3.6.3.min.js" integrity="sha256-pvPw+upLPUjgMXY0G+8O0xUf+/Im1MZjXxxgOcBQBXU=" crossorigin="anonymous"></script>
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

	<script type="text/javascript">
      function updateLike(bNum, upOrDown) {
         if (loginCheck()) {
         var infoClass1 = '.'+bNum+'info1';
         var infoClass2 = '.'+bNum+'info2';
         console.log('들어옴');
         $.ajax({
            type : 'POST',
            url : 'updateBlike.do',
            data : {
               upOrDown : upOrDown,
               boardNum : bNum
            },
            success : function() {
               $(infoClass1).load(location.href + ' ' + infoClass1);
               $(infoClass2).load(location.href + ' ' + infoClass2);
            },
            error : function() {
               alert('error');
            }
         })
      }
      }
   </script>


	<script type="text/javascript">
   function showReReply(rNum){
      $('#'+rNum+'rereplywrite').stop().slideToggle(300);
       $('#'+rNum+'rereplywrite').css('display','flex'); 
      $('#'+rNum+'rereplywrite').toggleClass('on').siblings().removeClass('on');
      $('#'+rNum+'rereplywrite').siblings('#'+rNum+'rereplywrite').slideUp(300); 
   }
   </script>

	<script type="text/javascript">
   function showReply(){
         $("#showReply").next("#reply").stop().slideToggle(300);
         $("#showReply").toggleClass('on').siblings().removeClass('on');
         $("#showReply").next("#reply").siblings("#reply").slideUp(300);
   }
   </script>

	<!-- kakao sdk 호출 -->
	<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>

	<script type="text/javascript">
      // SDK를 초기화 합니다. 사용할 앱의 JavaScript 키를 설정해 주세요.
      Kakao.init('8c3000037d16f0a25f2fe24fba99fdb6');
      // SDK 초기화 여부를 판단합니다.
      console.log(Kakao.isInitialized());

		var boardLikecnt = ${board.likeCnt};
		var boardReplyCnt = ${board.replyCnt};
      
      function kakaoShare() {
         Kakao.Link
               .sendDefault({
                  objectType : 'feed',
                  content : {
                     title : '대한민국 최고의 반려묘 용품 쇼핑몰',// 글제목 
                     description : '${board.boardTitle}', // 글내용
                     imageUrl : 'https://ifh.cc/g/HkTbZk.png', // 이미지 url
                     link : {
                        mobileWebUrl : 'http://localhost:8088/nss/boardPostView.do?boardNum=${board.boardNum}',
                        webUrl : 'http://localhost:8088/nss/boardPostView.do?boardNum=${board.boardNum}',
                     },
                  },
                  social : {
                     likeCount : boardLikecnt, //좋아요 수
                     commentCount : boardReplyCnt, //댓글 수
                  },
                  buttons : [
                        {
                           title : '웹으로 보기',
                           link : {
                              mobileWebUrl : 'http://localhost:8088/nss/boardPostView.do?boardNum=${board.boardNum}', // 이동할 경로
                              webUrl : 'http://localhost:8088/nss/boardPostView.do?boardNum=${board.boardNum}', // 이동할 경로
                           },
                        }, ],
                  // 카카오톡 미설치 시 카카오톡 설치 경로이동
                  installTalk : true,
               })
      }
   </script>



	<script type="text/javascript">
      function deleteCheck(num, url) {
      swal({
    	  title: "정말로 삭제 하시겠습니까?",
    	  text: "작성된 내용이 삭제되며 복구되지 않습니다.",
    	  icon: "warning",
    	  buttons: true,
    	  dangerMode: true,
    	})
    	.then((willDelete) => {
    	  if (willDelete) {
    		   $.ajax({
                   type : 'POST',
                   url : url+'.do',
                   data : {
                      replyNum : num,
                      boardNum : num
                   },
                   success : function(data) {
                	   if(data=='reply'){
                		   $('.showReply').load(location.href + ' .showReply');
                           setTimeout(function() {
                              $('#reply').css('display', 'block');
                           },100);
                	   }else{
                		   location.href = "boardView.do";
                	   }
                   },
                   error : function() {
                      alert('error');
                   }
                })
                if(url == 'deleteReply'){
    	    		swal("삭제가 완료되었습니다.", {
    	     			 icon: "success",
    	   			 });
                } 
    	  } else {
    	    swal("삭제가 취소되었습니다.");
    	  }
    	});
      }
   </script>
<jsp:include page="channel.jsp" />
</body>

</html>
