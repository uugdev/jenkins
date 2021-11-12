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
		location.href="/board/list?search="+$("#search").val();
	});
})
</script>
<!-- 개별 영역 끝 -->

<div class="wrap">
<div class="container">

<h1>공지사항 리스트</h1>

<input class="form-control" type="text" id="search" value="${param.search }" />
<button id="btnSearch" class="btn">검색</button>



<c:import url="/WEB-INF/views/layout/paging.jsp" />


</div><!-- .container end -->
</div><!-- .wrap end -->



<!-- footer start -->
<c:import url="/WEB-INF/views/layout/footer.jsp" />

