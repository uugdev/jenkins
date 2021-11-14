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

#content {
	vertical-align: middle;
	height: 400px;
}

td, th {
	text-align: center;
	vertical-align: middle;
}

th{
	background: #ccc;
}
</style>
<!-- 개별 영역 끝 -->

<div class="wrap">
<div class="container">

<h4>${notice.noticeTitle }</h4>
<hr>
<span class="pull-left">번호  ${notice.noticeNo }</span>
<span class="pull-right">조회수  ${notice.noticeHit } | 작성일  <fmt:formatDate value="${notice.noticeDate }" pattern="yyyy-MM-dd"/></span>
<div class="clearfix"></div>
<table class="table table-striped">
<tr>
	<td id="content">${notice.noticeContent }</td>
</tr>

</table>
<div class="text-center">
	<button id="btnList">목록으로</button>
</div><!-- .text-center end -->


</div><!-- .container end -->
</div><!-- .wrap end -->

<!-- footer start -->
<c:import url="/WEB-INF/views/layout/footer.jsp" />

