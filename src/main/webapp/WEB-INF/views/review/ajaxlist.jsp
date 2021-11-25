<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" %>

<!-- <div> -->
<!-- <div id="ajaxArea"> -->
<table class="table table-striped table-hover">
	<thead>
		<tr>
			<th style="width: 10%;">글번호</th>
			<th style="width: 45%;">제목</th>
			<th style="width: 20%;">닉네임</th>
			<th style="width: 10%;">조회수</th>
			<th style="width: 15%;">작성일</th>
		</tr>
	</thead>
	<tbody>
	<c:forEach items="${reviewList }" var="review">
		<tr>
			<td>${review.REVIEW_NO }</td>
			<td>
				<a href="/review/detail?reviewNo=${review.REVIEW_NO }">${review.REVIEW_TITLE }</a>
				
<!-- 				title 옆 comment count 처리 -->
<%-- 				<c:if test="${review.REVIEW_NO }"> --%>
<%-- 					<strong><span> [${review.REVIEW_COM_NO }]</span></strong> --%>
<%-- 				</c:if> --%>
			</td>
				
				<c:if test="${review.USER_NICK eq null }">
					<td>
						탈퇴한 회원
					</td>
				</c:if>
				<c:if test="${review.USER_NICK ne null }">
					<td style="text-align: left;">
						<img alt="#" src="${review.GRADE_URL}" style="width: 20px; height: 20px;"> ${review.USER_NICK }
					</td>
				</c:if>
				
			<td>${review.REVIEW_HIT }</td>
			<td><fmt:formatDate value="${review.REVIEW_DATE }" pattern="yy-MM-dd HH:mm:ss"/></td>
		</tr>
	</c:forEach>
	</tbody>
</table>
<%-- 	<c:if test="${login }"> --%>
<!-- 		<button id="btnWrite" class="btn btn-primary pull-left">글쓰기</button> -->
<%-- 	</c:if> --%>
	
	<div class="form-inline text-center">
		<input class="form-control" type="text" id="search" value="${param.search }" />
		<button id="btnSearch" class="btn">검색</button>
	</div>
	<c:import url="/WEB-INF/views/review/paging.jsp" />
	
<!-- 	</div>.container -->
<!-- </div>.wrap end -->