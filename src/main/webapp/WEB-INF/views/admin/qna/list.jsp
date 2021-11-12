<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:import url="/WEB-INF/views/layout/head.jsp" />
<c:import url="/WEB-INF/views/layout/adminheader.jsp" />
<!-- header end -->

<!-- 개별 스타일 및 스크립트 영역 -->

<script type="text/javascript">
$(document).ready(function(){
	

})
</script>

<style type="text/css">

table {
	text-align: center;
	margin: auto;
}

th, td {
	text-align: center;
}


</style>

<!-- 개별 영역 끝 -->

<div class="wrap">
<div class="container">

<h3>문의 목록</h3>
<hr>
<table class="table table-hover table-condensed">
<tr>

</tr>
<c:forEach items="${qnaList }" var="i">
<tr>
	
</tr>
</c:forEach>
</table>
<span class="pull-right">총 ${paging.totalCount }개</span>
<div class="clearfix"></div>

<c:import url="/WEB-INF/views/layout/paging.jsp" />


</div><!-- .container end -->
</div><!-- .wrap end -->

<!-- footer start -->
<c:import url="/WEB-INF/views/layout/footer.jsp" />
