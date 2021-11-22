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

	$("#hitList").click(function () {
		console.log("#ajax clicked")
		
		$.ajax({
			type: "get"
			, url: "/ask/list/hit"
			, data: {}
			, dataType: "html"
			, success: function ( res ) {
				console.log("AJAX 성공")
				
				$("#ajaxArea").html( res )
				
			}
			, error: function () {
				console.log("AJAX 실패")
			}
		})
	})
	
	$("#latestList").click(function () {
		console.log("#ajax clicked")
		
		$.ajax({
			type: "get"
			, url: "/ask/list/latest"
			, data: {}
			, dataType: "html"
			, success: function ( res ) {
				console.log("AJAX 성공")
				
				$("#ajaxArea").html( res )
				
			}
			, error: function () {
				console.log("AJAX 실패")
			}
		})
	})
	
});
</script>

<style type="text/css">
table {
	table-layout: fixed;
}

table, th, td {
	text-align: left;
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
			<a id="latestList">최신순</a>
			<a id="hitList">조회순</a>
		</div>
		<div id="ajaxArea">
			<table class="table table-striped table-hover">
				<thead>
					<tr>
						<th style="width: 10%; text-align: left;">글번호</th>
						<th style="width: 45%; text-align: left;">제목</th>
						<th style="width: 12%; text-align: left;">작성자</th>
						<th style="width: 10%; text-align: left;">조회수</th>
						<th style="width: 15%; text-align: left;">작성일</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${list }" var="ask">
						<tr>
							<td>${ask.ASK_NO }</td>
							<td><a href="/ask/detail?askNo=${ask.ASK_NO }">${ask.ASK_TITLE }</a></td>
							<c:if test="${ask.USER_NICK eq null}">
								<td>탈퇴한 회원입니다</td>
							</c:if>
							<c:if test="${ask.USER_NICK ne null }">
								<td style="text-align: left;"><img alt="#"
									src="${ask.GRADE_URL}" style="width: 30px; height: 30px;">
									${ask.USER_NICK }</td>
							</c:if>
							<td>${ask.ASK_HIT }</td>
							<td><fmt:formatDate value="${ask.ASK_DATE }"
									pattern="yy-MM-dd HH:mm:ss" /></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>


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




