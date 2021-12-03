<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:import url="/WEB-INF/views/layout/head.jsp" />
<c:import url="/WEB-INF/views/layout/header.jsp" />
<!-- header end -->

<!-- 개별 스타일 및 스크립트 영역 -->
<script type="text/javascript">

$(document).ready(function(){
	$("#btnList").click(function(){
		location.href="/notice/list"
	})
})

</script>

<style type="text/css">

body {
	background: #f2f2f2;
}

.title {
	margin: 50px 0;
}

.title > p {
	color: #85969E;
}

.detail {
	text-align: center;
	width: 100%;
	background: #fff;
	margin: 50px auto;
	padding: 50px;
}

.info {
	display: flex;
	justify-content: space-between;
	font-size: 15px;
	width: 25%;
	margin: auto;
	color: #5F6062;
}

#content {
	vertical-align: middle;
	height: 300px;
	font-size: 15px;
}

.table {
	margin-bottom: 50px;
}

.table>tbody>tr>td {
	border-bottom: 1px solid #DBDAD7;
}

#btnList {
	background: #808080;
	border-radius: 0px;
	height: 35px;
	border: 1px solid #808080;
	color: #fff;
	padding: 0 15px;
}

#btnList:hover {
	border: 1px solid #808080;
	background: #fff;
	color: #808080;
	transition: all .2s ease-in-out;
}


</style>
<!-- 개별 영역 끝 -->

<div class="wrap">
<div class="container">

<div class="detail">
<h2 style="margin-bottom: 40px;">${notice.noticeTitle }</h2>
<div class="info">
	<span>No.&nbsp;${notice.noticeNo }</span>
	<span><i class="far fa-eye"></i>&nbsp;&nbsp;${notice.noticeHit }</span>
	<span><i class="far fa-clock"></i>&nbsp;&nbsp;<fmt:formatDate value="${notice.noticeDate }" pattern="yyyy-MM-dd"/></span>
</div>
<table class="table">
<tr>
	<td id="content">${notice.noticeContent }</td>
</tr>
</table>
<div class="text-center">
	<button id="btnList">목록</button>
</div><!-- .text-center end -->
</div><!-- .detail end -->

</div><!-- .container end -->
</div><!-- .wrap end -->

<!-- footer start -->
<c:import url="/WEB-INF/views/layout/footer.jsp" />

