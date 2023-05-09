<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ attribute name="list" %>

<!-- 별점 표시 부분 -->
<c:set var="pRate" value="0" />
<c:forEach var="v" items="${list}">
	<c:set var="pRate" value="${pRate+v.rRate}" />
</c:forEach>

<c:choose>
	<c:when test="${pRate>=1.0 && pRate<1.5}" >
		<i class="fa fa-star"></i><i class="fa fa-star-o"></i><i class="fa fa-star-o"></i><i class="fa fa-star-o"></i><i class="fa fa-star-o"></i>
	</c:when>
	<c:when test="${pRate>=1.5 && pRate<2.0}" >
		<i class="fa fa-star"></i><i class='fa fa-star-half-o'></i><i class="fa fa-star-o"></i><i class="fa fa-star-o"></i><i class="fa fa-star-o"></i>
	</c:when>
	<c:when test="${pRate>=2.0 && pRate<2.5}" >
		<i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star-o"></i><i class="fa fa-star-o"></i><i class="fa fa-star-o"></i>
	</c:when>
	<c:when test="${pRate>=2.5 && pRate<3.0}" >
		<i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star-half-o"></i><i class="fa fa-star-o"></i><i class="fa fa-star-o"></i>
	</c:when>
	<c:when test="${pRate>=3.0 && pRate<3.5}" >
		<i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star-o"></i><i class="fa fa-star-o"></i>
	</c:when>
	<c:when test="${pRate>=3.5 && pRate<4.0}" >
		<i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star-o"></i><i class="fa fa-star-o"></i>
	</c:when>
	<c:when test="${pRate>=4.0 && pRate<4.5}" >
		<i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star-o"></i>
	</c:when>
	<c:when test="${pRate>=4.5 && pRate<5.0}" >
		<i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i></i><i class="fa fa-star-o"></i>
	</c:when>
	<c:when test="${pRate==5}" >
		<i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i></i>
	</c:when>
	<c:otherwise>
	 	<i class="fa fa-star-o"></i><i class="fa fa-star-o"></i><i class="fa fa-star-o"></i><i class="fa fa-star-o"></i><i class="fa fa-star-o"></i>
	</c:otherwise>
</c:choose>