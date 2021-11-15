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
			location.href = "/ask/hitlist?search=" + $("#search").val();
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

		<h1>게시판 리스트</h1>
		<hr>
		<div class="pull-right" style="margin-bottom: 20px;">
			<a href="/ask/list">최신순</a>
			<a href="/ask/hitlist">조회순</a>
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
						<c:forEach items="${user }" var="user">
							<c:if test="${ask.userNo eq user.userNo}">
								<td>${user.userNick }</td>
							</c:if>
						</c:forEach>
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
</div>
<!-- .wrap end -->


<c:import url="/WEB-INF/views/ask/paging.jsp" />

<!-- footer start -->
<c:import url="/WEB-INF/views/layout/footer.jsp" />

