<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:import url="/WEB-INF/views/layout/head.jsp" />
<c:import url="/WEB-INF/views/layout/header.jsp" />
<!-- header end -->

<!-- 개별 스타일 및 스크립트 영역 -->


<script type="text/javascript">
	$(document).ready(function() {
		$("#btnWrite").click(function() {
			$(location).attr("href", "/ask/write");
		})

		//검색 버튼 클릭
		$("#btnSearch").click(function() {
			location.href = "/ask/list?search=" + $("#search").val();
		});

		$("#search").keypress(function(event) {
			if (event.which == 13) {
				$("#btnSearch").click();
				return false;
			}
		});

	})
</script>

<style type="text/css">
table {
	table-layout: fixed;
}

table, th {
	text-align: center;
}

td:nth-child(2) {
	text-align: left;
}
</style>

<!-- 개별 영역 끝 -->

<div class="wrap">
	<div class="container">

		<h1>게시판 최신순</h1>
		<hr>
		<div class="pull-right" style="margin-bottom: 20px;">
			<a href="/ask/list">최신순</a> <a href="/ask/hitlist">조회순</a>
		</div>

		<table class="table table-striped table-hover">
			<thead>
				<tr>
					<th style="width: 10%;">글번호</th>
					<th style="width: 45%;">제목</th>
					<th style="width: 20%;">작성자</th>
					<th style="width: 10%;">조회수</th>
					<th style="width: 15%;">작성일</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${list }" var="ask">
					<tr>
						<td>${ask.askNo }</td>
						<td><a href="/ask/detail?askNo=${ask.askNo }">${ask.askTitle }</a></td>
						<c:forEach items="${userGrade}" var="grade">
							<c:if test="${grade.USER_NO eq ask.userNo }">
								<c:if test="${ask.userNo ne 0}">
									<c:if test="${ask.userNo eq grade.USER_NO}">
										<c:choose>
											<c:when test="${grade.GRADE eq 'bronze' }">
												<td><img style="width: 15%;" alt="아이콘"
													src="/resources/img/브론즈.png">${grade.USER_NICK }</td>
											</c:when>

											<c:when test="${grade.GRADE eq 'silver' }">
												<td><img style="width: 15%;" alt="아이콘"
													src="/resources/img/실버.png">${grade.USER_NICK }</td>
											</c:when>

											<c:when test="${grade.GRADE eq 'GOLD' }">
												<td><img style="width: 15%;" alt="아이콘"
													src="/resources/img/골드.png">${grade.USER_NICK }</td>
											</c:when>

											<c:when test="${grade.GRADE eq 'platinum' }">
												<td><img style="width: 15%;" alt="아이콘"
													src="/resources/img/플래티넘.png">${grade.USER_NICK }</td>
											</c:when>

											<c:when test="${grade.GRADE eq 'diamond' }">
												<td><img style="width: 15%;" alt="아이콘"
													src="/resources/img/다이아.png">${grade.USER_NICK }</td>
											</c:when>
										</c:choose>
									</c:if>
								</c:if>
							</c:if>
						</c:forEach>
						<c:if test="${ask.userNo eq 0}">
							<td>탈퇴한 회원입니다</td>
						</c:if>
						<td>${ask.askHit }</td>
						<td><fmt:formatDate value="${ask.askDate }"
								pattern="yy-MM-dd HH:mm:ss" /></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<c:if test="${login }">
			<button id="btnWrite" class="btn btn-primary pull-left">글쓰기</button>
		</c:if>
		<span class="pull-right">total : ${paging.totalCount }</span>
		<div class="clearfix"></div>

		<div class="form-inline text-center">
			<input class="form-control" type="text" id="search"
				value="${param.search }" />
			<button id="btnSearch" class="btn">검색</button>
		</div>

	</div>
	<!-- .container end -->
	<c:import url="/WEB-INF/views/layout/paging.jsp" />
	<!-- footer start -->
	<c:import url="/WEB-INF/views/layout/footer.jsp" />
</div>
<!-- .wrap end -->




