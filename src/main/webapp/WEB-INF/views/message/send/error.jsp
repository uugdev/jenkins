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
	$("#btnBack").click(function(){
		history.go(-1);
	})
})

</script>
<!-- 개별 영역 끝 -->

<div class="wrap">
<div class="container">
<div style="width: 500px; height: 500px; margin: 0 auto; padding: 30px;">
<img width="150px;" height="150px;" alt="금지" src="https://i.imgur.com/OlYEpre.png">
<h3><strong>존재하지 않는 닉네임입니다. 닉네임을 다시 확인해주세요!</strong></h3>
<hr><br><br>
<button id="btnBack">이전으로</button>

</div>
</div><!-- .container end -->
</div><!-- .wrap end -->

<!-- footer start -->
<c:import url="/WEB-INF/views/layout/footer.jsp" />