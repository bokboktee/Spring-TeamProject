<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>

<c:if test="${not empty memberId}">
	<c:if test="${memberRole!='ADMIN'}">
			<div class="header__top__right__auth">
				<a href="mypage.do"><i class="fa fa-user"></i> <spring:message code="message.logintag.mypage"/> </a>
			</div>
			<div class="header__top__right__auth">
				<a href="logout.do"> | <spring:message code="message.logintag.logout"/></a>
			</div>
	</c:if>
	
	<c:if test="${memberRole=='ADMIN'}">
			<div class="header__top__right__auth">
				<a href="adminIndex.do"><i class="fa fa-user"></i><spring:message code="message.logintag.adminHome"/></a>
			</div>
			<div class="header__top__right__auth">
				<a href="logout.do"> | <spring:message code="message.logintag.logout"/></a>
			</div>
	</c:if>
	
</c:if>

<c:if test="${empty memberId}">
		<div class="header__top__right__auth">
			<a href="login.do"><i class="fa fa-user"></i><spring:message code="message.logintag.login"/></a>
		</div>
		<div class="header__top__right__auth">
			<a href="register.do"> | <spring:message code="message.logintag.signup"/></a>
		</div>
</c:if>