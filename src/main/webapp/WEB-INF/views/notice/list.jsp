<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:import url="/WEB-INF/views/layout/head.jsp" />
<c:import url="/WEB-INF/views/layout/header.jsp" />
<!-- header end -->

<!-- 개별 스타일 및 스크립트 영역 -->
<script type="text/javascript">
$(document).ready(function() {
	
	//검색 버튼 클릭
	$("#btnSearch").click(function() {
		location.href="/notice/list?search="+$("#search").val();
	});
	//엔터치면 검색 버튼 클릭한 것 처럼
	$("#search").keypress(function(event){
	     if ( event.which == 13 ) {
	         $("#btnSearch").click();
	         return false;
	     }
	});
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

.listTable {
	text-align: center;
	width: 100%;
	background: #fff;
	margin: auto;
	margin-bottom: 50px;
	padding: 50px;
	padding-bottom: 20px;
}

th {
	background: #f3f3f3;
}

.table>tbody>tr>td {
	height: 40px;
	vertical-align: middle;
}

input[type=text] {
	width: 100%;
	text-align: center;
	height: 35px;
	border-radius: 0px;
	border: 1px solid #DBDAD7;
	color: #5F6062;
}

input[type=text]:focus {
	outline: none;
}


#btnSearch {
	height: 35px;
	width: 65px;
	border-radius: 0px;
	border: 0px;
	background: #5b6e7a;
	color: #f3f3f3;
}

#btnSearch:hover {
	border: 1px solid #5b6e7a;
	background: #fff;
	color: #5b6e7a;
	transition: all .2s ease-in-out;
}

.table>tbody>tr>td>a {
	color: #000;
}
.table>tbody>tr>td>a:hover {
	color: #85969E;
	text-decoration: none;
}

</style>
<!-- 개별 영역 끝 -->

<div class="wrap">
<div class="container">

<div class="title">
	<h1>공지사항</h1>
	<p>홈페이지 이용에 필요한 정보를 전해드립니다.</p>
</div>

<div class="listTable">
<div class="text-center" style="width: 700px; margin: 0 auto;">
	<input class="pull-left" type="text" id="search" name="search" value="${param.search }" style="width: 90%;" />
	<button id="btnSearch" class="pull-right">검색</button>
</div>
<div class="clearfix" style="margin-bottom: 10px;"></div>
<table class="table table-hover">
<tr>
	<th>공지 번호</th>
	<th width="45%">제목</th>
	<th>조회수</th>
	<th>작성일</th>
</tr>
<c:forEach items="${list }" var="i">
<tr>
	<td>${i.noticeNo }</td>
	<td><a href="/notice/detail?noticeNo=${i.noticeNo }">${i.noticeTitle }</a></td>
	<td>${i.noticeHit }</td>
	<td><fmt:formatDate value="${i.noticeDate }" pattern="yyyy-MM-dd"/></td>
</tr>
</c:forEach>
</table>


<c:import url="/WEB-INF/views/layout/paging.jsp" />
</div><!-- .listTable end -->

</div><!-- .container end -->
</div><!-- .wrap end -->



<!-- footer start -->
<c:import url="/WEB-INF/views/layout/footer.jsp" />

