<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" %>

<!doctype html>
<html lang="ko">
<head>
    <%--page title--%>
    <title>이건못참조</title>
	<c:import url="/WEB-INF/views/layout/head.jsp" />
</head>
<body>
<%--header--%>
<c:import url="/WEB-INF/views/layout/header.jsp" />


<script type="text/javascript">
$(document).ready(function() {
	$("#btnWrite").click(function() {
		$(location).attr("href", "/mypage/item/list");
// 		location.href = "/review/write";
	})
	
	//검색 버튼 클릭
	$("#btnSearch").click(function() {
		location.href="/review/list?search="+$("#search").val();
	});
	
	$("#hitList").click(function () {
		console.log("#ajax clicked")
		
		$.ajax({
			type: "get"
			, url: "/review/list/hit"
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
			, url: "/review/list/latest"
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


<div class="wrap">
	<div class="container">
	
	<h1 style="text-align: center;">후기</h1>
	<hr>
	<!-- 구분선 삭제 예정 -->
	<span class="pull-left">총게시글수  ${paging.totalCount }</span>
	<div class="clearfix"></div>
	
	<div class="pull-right" style="margin-bottom: 20px;">
		<a id="latestList">최신순</a>
		<a id="hitList">조회순</a>
	</div>
	<br>
	
	<div id="ajaxArea">
		<table class="table table-striped table-hover">
		<thead>
			<tr>
				<th style="width: 10%;">글번호</th>
				<th style="width: 45%;">제목</th>
				<th style="width: 12%;">닉네임</th>
				<th style="width: 10%;">조회수</th>
				<th style="width: 15%;">작성일</th>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${reviewList }" var="review">
			<tr>
				<td>${review.REVIEW_NO }</td>
				<td><a href="/review/detail?reviewNo=${review.REVIEW_NO }">${review.REVIEW_TITLE }</a></td>
				
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
	</div>
	
	<c:if test="${login }">
		<button id="btnWrite" class="btn btn-primary pull-left">글쓰기</button>
	</c:if>
	
	<div class="form-inline text-center">
		<input class="form-control" type="text" id="search" value="${param.search }" />
		<button id="btnSearch" class="btn">검색</button>
	</div>
	<c:import url="/WEB-INF/views/layout/paging.jsp" />
	
	</div><!-- .container -->
</div><!-- .wrap end -->

<%--footer--%>
<c:import url="/WEB-INF/views/layout/footer.jsp" />