<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ attribute name="list" %>

<c:set var="rRate" value="${list}" />

<c:choose>
	<c:when test="${rRate>=1.0 && rRate<1.5}" >
		<i class="fa fa-star" style="color : #EDBB0E;"></i>
		<i class="fa fa-star-o"></i>
		<i class="fa fa-star-o"></i>
		<i class="fa fa-star-o"></i>
		<i class="fa fa-star-o"></i>
	</c:when>
	<c:when test="${rRate>=1.5 && rRate<2.0}" >
		<i class="fa fa-star" style="color : #EDBB0E;"></i>
		<i class='fa fa-star-half-o'></i>
		<i class="fa fa-star-o"></i>
		<i class="fa fa-star-o"></i>
		<i class="fa fa-star-o"></i>
	</c:when>
	<c:when test="${rRate>=2.0 && rRate<2.5}" >
		<i class="fa fa-star" style="color : #EDBB0E;"></i>
		<i class="fa fa-star" style="color : #EDBB0E;"></i>
		<i class="fa fa-star-o"></i>
		<i class="fa fa-star-o"></i>
		<i class="fa fa-star-o"></i>
	</c:when>
	<c:when test="${rRate>=2.5 && rRate<3.0}" >
		<i class="fa fa-star" style="color : #EDBB0E;"></i>
		<i class="fa fa-star" style="color : #EDBB0E;"></i>
		<i class="fa fa-star-half-o"></i>
		<i class="fa fa-star-o"></i>
		<i class="fa fa-star-o"></i>
	</c:when>
	<c:when test="${rRate>=3.0 && rRate<3.5}" >
		<i class="fa fa-star" style="color : #EDBB0E;"></i>
		<i class="fa fa-star" style="color : #EDBB0E;"></i>
		<i class="fa fa-star" style="color : #EDBB0E;"></i>
		<i class="fa fa-star-o"></i>
		<i class="fa fa-star-o"></i>
	</c:when>
	<c:when test="${rRate>=3.5 && rRate<4.0}" >
		<i class="fa fa-star" style="color : #EDBB0E;"></i>
		<i class="fa fa-star" style="color : #EDBB0E;"></i>
		<i class="fa fa-star" style="color : #EDBB0E;"></i>
		<i class="fa fa-star-half-o"></i>
		<i class="fa fa-star-o"></i>
	</c:when>
	<c:when test="${rRate>=4.0 && rRate<4.5}" >
		<i class="fa fa-star" style="color : #EDBB0E;"></i>
		<i class="fa fa-star" style="color : #EDBB0E;"></i>
		<i class="fa fa-star" style="color : #EDBB0E;"></i>
		<i class="fa fa-star" style="color : #EDBB0E;"></i>
		<i class="fa fa-star-o"></i>
	</c:when>
	<c:when test="${rRate>=4.5 && rRate<5.0}" >
		<i class="fa fa-star" style="color : #EDBB0E;"></i>
		<i class="fa fa-star" style="color : #EDBB0E;"></i>
		<i class="fa fa-star" style="color : #EDBB0E;"></i>
		<i class="fa fa-star" style="color : #EDBB0E;"></i>
		<i class="fa fa-star-half-o"></i>
	</c:when>
	<c:when test="${rRate==5}" >
		<i class="fa fa-star" style="color : #EDBB0E;"></i>
		<i class="fa fa-star" style="color : #EDBB0E;"></i>
		<i class="fa fa-star" style="color : #EDBB0E;"></i>
		<i class="fa fa-star" style="color : #EDBB0E;"></i>
		<i class="fa fa-star" style="color : #EDBB0E;"></i>
	</c:when>
	<c:otherwise>
		<i class="fa fa-star-o"></i>
		<i class="fa fa-star-o"></i>
		<i class="fa fa-star-o"></i>
		<i class="fa fa-star-o"></i>
		<i class="fa fa-star-o"></i>
	</c:otherwise>
</c:choose>