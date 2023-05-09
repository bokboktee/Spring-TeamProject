<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ attribute name="category"%>
<%@ attribute name="sort"%>
<!-- 전체 신상품(홈 페이지) -->
<c:if test="${sort=='regiDesc'}">
	<c:forEach var="v" items="${newPList}" begin="0" varStatus="status">
		<div class="col-lg-3">
			<a href="shopDetails.do?pNum=${v.pNum}">
				<div class="categories__item set-bg" data-setbg="${v.imageName}">
					<h5>${v.pName}</h5>
				</div>
			</a>
		</div>
	</c:forEach>
</c:if>

<!-- 전체 인기상품(홈 페이지) 페이지에 직접 넣었음 -->
<c:if test="${sort=='sellDesc'}">
	<c:forEach var="v" items="${popPList}" begin="0" end="14" varStatus="status">
		<div class="col-lg-3 col-md-4 col-sm-6 mix ${v.category}">
			<div class="featured__item">
				<div class="featured__item__pic set-bg" data-setbg="${v.imageName}">
					<ul class="featured__item__pic__hover">
						<li><a href="javascript:void(0);" onclick="javascript:insertCart(${v.pNum});">
								<i class="fa fa-shopping-cart"></i>
							</a></li>
					</ul>
				</div>
				<div class="featured__item__text">
					<div class="product__discount__item__text" style="padding-top: 0px;">
						<h6>
							<a href="shopDetails.do?pNum=${v.pNum}">${v.pName}</a>
						</h6>
						<div class="product__item__price">
							<fmt:formatNumber value="${v.dc_price}" pattern="#,###" />
							원
							<c:if test="${v.pDcPercent != 0}">
								<span><fmt:formatNumber value="${v.price}" pattern="#,###" />원</span>
							</c:if>
						</div>
					</div>
				</div>
			</div>
		</div>
	</c:forEach>
</c:if>

<!-- 전체 할인상품(쇼핑 페이지) -->
<c:if test="${sort=='dc'}">
	<c:forEach var="v" items="${pList}" begin="0" varStatus="status">
		<c:if test="${v.pDcPercent>0}">
			<div class="col-lg-4">
				<div class="product__discount__item">
					<div class="product__discount__item__pic set-bg" data-setbg="${v.imageName}">
						<div class="product__discount__percent">-${v.pDcPercent}%</div>
						<ul class="product__item__pic__hover">
							<li><a href="javascript:void(0);" onclick="javascript:insertCart(${v.pNum});">
									<i class="fa fa-shopping-cart"></i>
								</a></li>
						</ul>
					</div>
					<div class="product__discount__item__text">
						<h5>
							<a href="shopDetails.do?pNum=${v.pNum}">${v.pName}</a>
						</h5>
						<div class="product__item__price">
							<fmt:formatNumber value="${v.dc_price}" pattern="#,###" />
							원<span><fmt:formatNumber value="${v.price}" pattern="#,###" />원</span>
						</div>
					</div>
				</div>
			</div>
		</c:if>
	</c:forEach>
</c:if>

<!-- 관련 상품(상품 세부정보 페이지) 페이지에 직접 넣었음 -->
<c:if test="${sort=='related'}">
	<c:forEach var="v" items="${pList}" begin="0" end="9" varStatus="status">
		<div class="col-lg-3 col-md-4 col-sm-6">
			<div class="product__item">
				<div class="product__item__pic set-bg" data-setbg="${v.imageName}">
					<ul class="product__item__pic__hover">
						<li><a href="javascript:void(0);" onclick="javascript:insertCart(${v.pNum});">
								<i class="fa fa-shopping-cart"></i>
							</a></li>
					</ul>
				</div>
				<div class="product__item__text">
					<div class="product__discount__item__text" style="padding-top: 0px;">
						<h6>
							<a href="shopDetails.do?pNum=${v.pNum}">${v.pName}</a>
						</h6>
						<div class="product__item__price">
							<fmt:formatNumber value="${v.dc_price}" pattern="#,###" />
							원
							<c:if test="${v.pDcPercent != 0}">
								<span><fmt:formatNumber value="${v.price}" pattern="#,###" />원</span>
							</c:if>
						</div>
					</div>
				</div>
			</div>
		</div>
	</c:forEach>
</c:if>

<!-- 관리자 홈 진입시 거래부분  -->
<c:if test="${sort=='adminhome'}">
	<c:forEach var="v" items="${oList}" begin="0" end="5" varStatus="status">
		<li class="d-flex mb-4 pb-1">
			<div class="avatar flex-shrink-0 me-3">
				<c:if test="${v.oPay=='카카오페이'}">
					<img src="assets/img/icons/unicons/kakaopay.png" alt="User" class="rounded" />
				</c:if>
				<c:if test="${v.oPay=='카드결제'}">
					<img src="assets/img/icons/unicons/card.png" alt="User" class="rounded" />
				</c:if>
				<c:if test="${v.oPay=='휴대폰결제'}">
					<img src="assets/img/icons/unicons/phone_pay.png" alt="User" class="rounded" />
				</c:if>
			</div>
			<div class="d-flex w-100 flex-wrap align-items-center justify-content-between gap-2">
				<div class="me-2">
					<small class="text-muted d-block mb-1">${v.oPay}</small>
					<h6 class="mb-0">입금</h6>
				</div>
				<div class="user-progress d-flex align-items-center gap-1">
					<h6 class="mb-0">
						+
						<fmt:formatNumber value="${v.oPrice}" pattern="#,###" />
					</h6>
					<span class="text-muted">원</span>
				</div>
			</div>
		</li>
	</c:forEach>
</c:if>


<!-- 커뮤니티 전체 글 리스트 -->
<c:if test="${sort=='community'}">
	<c:forEach var="v" items="${bList}" begin="0" varStatus="status">
		<div class="col-lg-4 col-md-4 col-sm-4 show-board">
			<div class="blog__item">
				<div class="blog__item__pic">
					<img src="${v.imageName}" alt="고양이 사진">
				</div>
				<div class="blog__item__text">
					<ul id="${v.boardNum}info">
						<li><i class="fa fa-calendar-o"></i> ${v.boardDate}</li>
						<li><i class="fa fa-comment-o"></i> ${v.replyCnt}</li>
						<li><img style="width: 20px;" src="img/eyes.png" alt="조회수 아이콘"> ${v.boardView }</li>
						<c:choose>
							<c:when test="${v.isChecked==true}">
								<li><img onclick="javascript:updateLike(${v.boardNum}, 'down');" id="${v.boardNum}heartImg" style="width: 20px; cursor: pointer;" src="img/fullheart.png" alt="좋아요 아이콘"> <span id="${v.boardNum}">${v.likeCnt}</span></li>
							</c:when>
							<c:otherwise>
								<li><img onclick="javascript:updateLike(${v.boardNum}, 'up');" id="${v.boardNum}heartImg" style="width: 20px; cursor: pointer;" src="img/heart.png" alt="좋아요 아이콘"> <span id="${v.boardNum}">${v.likeCnt}</span></li>
							</c:otherwise>
						</c:choose>
					</ul>
					<h5>
						<a href="boardPostView.do?boardNum=${v.boardNum}">${v.boardTitle}</a>
					</h5>
					<a href="boardPostView.do?boardNum=${v.boardNum}" class="blog__btn">
						글 보기<span class="arrow_right"></span>
					</a>
				</div>
			</div>
		</div>
	</c:forEach>
</c:if>


<!-- 게시글 댓글 리스트  -->
<c:if test="${sort=='reply'}">
	<c:forEach var="v" items="${replyset}" begin="0" varStatus="status">
		<c:set var="reply" value="${v.reply}" />
		<div class="replyDetail" id="replyDetail">
			<div class="replywriter">[작성자 : ${reply.userId}]</div>
			<div id="replyContent">
				<c:choose>
					<c:when test="${reply.replyStatus==3}">
						<div id="replyContent">
							<div style="font-size: 15px; color: #6f6f6fc4; margin-bottom: 10px;" id="replyContent">삭제된 댓글입니다.</div>
						</div>
					</c:when>
					<c:otherwise>
						<div id="replyContent">
							<div style="font-size: 15px;" id="replyContent">${reply.replyContent}</div>
						</div>
						<ul style="font-size: 13px; float: left; display: flex;" id="replyInfo">
							<li style="margin-right: 4px;"><i class="fa fa-calendar-o"></i> ${reply.replyDate}</li>
							<li>
								<button onclick="showReReply(${reply.replyNum})" class="showReReply" style="border-radius: 10px; border: 1px solid #b2b2b2; margin-left: 10px; font-size: 12px;">답글 달기</button>
							<li>
							<li style="margin-left: 8px;"><img class="reportBtn" onclick="javascript:report(2,${reply.replyNum},`${reply.userId}`);" style="width: 20px; cursor: pointer;" src="img/siren.png"></li>
							<c:if test="${reply.userId==memberId}">
								<li style="cursor: pointer; margin-left: 8px; color: #49505787; border-bottom: 1px solid #49505787;"><a onclick="deleteCheck(${reply.replyNum}, 'deleteReply')">삭제</a></li>
							</c:if>
						</ul>
					</c:otherwise>
				</c:choose>

			</div>
		</div>
		<div id="${reply.replyNum}rereplywrite" style="display: none;">
			<div style="width: 90%; display: flex;">
				<div style="float: left; width: 80%; margin: 10px; margin-left: 66px;">
					<input id = "${reply.replyNum}replyContent"class = "replyContent" type="text" name="replyContent" style="border-radius: 5px; border: 1.7px solid #6667ab6b; width: 83%; height: 47px;" placeholder="댓글을 작성하세요" required />
					<div style="float: right;">
						<div style="border: 1px solid #6667ab42; float: right; color: white; padding: 10px; border-radius: 5px; background-color: #6667AB; width: 100%; cursor: pointer;" onclick="insertReply(${reply.replyNum})">댓글 작성</div>
					</div>
				</div>
				<br>
			</div>
		</div>

		<c:forEach var="r" items="${v.replyList}" begin="0" varStatus="status">
			<div id="rereplyDetail">
				<img style="width: 20px;" src="img/rereply.png">
				<div style="width: 100%;">
					<div class="replywriter">[작성자 : ${r.userId}]</div>
					<div id="replyContent">
						<c:choose>
							<c:when test="${r.replyStatus==3}">
								<div style="font-size: 15px; color: #6f6f6fc4; margin-bottom: 10px;" id="replyContent">삭제된 댓글입니다.</div>
							</c:when>
							<c:otherwise>
								<div style="font-size: 15px;" id="replyContent">${r.replyContent}</div>
								<ul style="font-size: 13px; float: left; display: flex;" id="replyInfo">
									<li style="margin-right: 4px;"><i class="fa fa-calendar-o"></i> ${r.replyDate}</li>
									<li><img class="reportBtn" onclick="javascript:report(3,${r.replyNum}, `${r.userId}`);" style="width: 20px; cursor: pointer;" src="img/siren.png"></li>
									<c:if test="${r.userId==memberId}">
										<li style="margin-left: 8px; cursor: pointer;"><a style="color: #49505787; border-bottom: 1px solid #49505787;" onclick="deleteCheck(${r.replyNum}, 'deleteReply')">삭제</a></li>
									</c:if>
								</ul>
							</c:otherwise>
						</c:choose>
					</div>
				</div>
			</div>

		</c:forEach>
	</c:forEach>

</c:if>
