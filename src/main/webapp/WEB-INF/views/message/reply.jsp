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
	$("#btnWrite").click(function() {
		submitContents($("#btnWrite"));
		
		$("form").submit();
		history.go(-1);
	})
	
	$("#btnCancel").click(function() {
		history.go(-1);
	})
})
</script>

<!-- 개별 영역 끝 -->

<div class="wrap">
<div class="container">

<h1></h1>
<hr>

<form action="/message/reply" method="post">



	
	받는 사람 ${userNick }
	<input type="hidden" name="userNick" value="${userNick }">
	
	<br>
	
	<label for="msgTitle">제목</label>
	<input type="text" id="msgTitle" name="msgTitle" />
	<br>
	
	<label for="msgContent">내용</label>
	<textarea rows="10" id="msgContent" name="msgContent"></textarea>
	<br>

	<button id="btnWrite">발송</button>
	<button id="btnCancel">취소</button>


</form>


</div><!-- .container end -->
</div><!-- .wrap end -->

<!-- footer start -->
<c:import url="/WEB-INF/views/layout/footer.jsp" />






