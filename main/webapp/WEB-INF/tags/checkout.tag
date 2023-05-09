<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:useBean id="pvo" class="com.wan.nss.biz.product.ProductVO" /> 
<jsp:useBean id="pdao" class="com.wan.nss.biz.product.ProductDAO" /> 
<%@ attributename= %>

<div class="checkout__order__products">
	상품 <span>금액</span>
</div>
<ul>
<c:forEach var="v" items="${pList}" begin="0" end="3" varStatus="status">
	<li>${v.pName}<span>${v.Price}</span></li>
</c:forEach>
</ul>
<div class="checkout__order__total">
	결제 예상 금액 <span>
<var total=0>	
<c:forEach var="v" items="${pList}" begin="0" end="3" varStatus="status">
	total=total+${v.Price}
</c:forEach>
total원
</var>
	
	</span>
</div>
<div class="checkout__input__checkbox">
	<input type="radio" name="pay" value="네이버페이"> 네이버페이 <br> <br>
	<input type="radio" name="pay" value="신용카드"> 신용카드 <br> <br>
	<input type="radio" name="pay" value="휴대폰결제"> 휴대폰결제 <br> <br>
	<input type="radio" name="pay" value="카카오페이"> 카카오페이 <br> <br>
	<input type="radio" name="pay" value="무통장 입금"> 무통장 입금 <br>
	<br>
</div>
<button type="submit" class="site-btn">결제하기</button>
