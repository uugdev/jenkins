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


<div class="container">

<h1>게시글 상세</h1>
<hr>

<table class="table table-bordered">
<tr>
	<td class="info">글번호</td><td colspan="3">${detailReview.reviewNo }</td>
</tr>
<tr>
	<td class="info">닉네임</td><td>${detailReview.user.userNick  }</td>
</tr>
<tr>
	<td class="info">조회수</td><td>${detailReview.reviewHit }</td>
	<td class="info">작성일</td><td><fmt:formatDate value="${detailReview.reviewDate }" pattern="yy-MM-dd HH:mm:ss"/></td>
</tr>
<tr>
	<td class="info">제목</td><td colspan="3">${detailReview.reviewTitle }</td>
</tr>
<tr>
	<td class="info" colspan="4">본문</td>
</tr>
<tr>
	<td colspan="4">${detailReview.reviewContent }</td>
</tr>
</table>

<a href="/board/download?fileNo=${file.fileNo }">${file.fileOrigin }</a>

<div class="text-center">
	<a href="/review/list"><button class="btn btn-default">목록</button></a>
	<c:if test="${id eq viewBoard.writerId }">
		<a href="/reivew/update?reviewNo=${detailReview.reviewNo }"><button class="btn btn-primary">수정</button></a>
		<a href="/review/delete?reviewNo=${detailReview.reviewNo }"><button class="btn btn-danger">삭제</button></a>
	</c:if>
</div>

</div><!-- .container -->



<%--footer--%>
<c:import url="/WEB-INF/views/layout/footer.jsp" />
</body>
</html>