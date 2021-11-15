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
	$("#btnDelete").click(function() {
		var answer = confirm(" 정말 탈퇴하시겠습니까?\n탈퇴시 작성하신 글은 삭제되지 않습니다.")
		
		if(answer == true) {
			$("form").submit();
		} else {
			return false;
		}
	});
	
});
</script>
<!-- 개별 영역 끝 -->

<div class="wrap">
<div class="container">

<h1> 회원정보 조회 </h1>


<div>아이디</div>
<div>${user.userId }</div>

<div>닉네임</div>
<div>${user.userNick }</div>
<div>이메일</div>
<div>${user.userMail }</div>
<div>가입일</div>
<div>${user.joinDate }</div>
<div>포인트</div>
<div>${user.userPoint }</div>


<a href="<%=request.getContextPath() %>/mypage/update?userNo=${user.userNo }"><button id="btnUpdate">수정하기</button></a>
<form action="/mypage/delete" method="post">
<button id="btnDelete">회원탈퇴</button>
<input type="hidden" name="userNo" value="${user.userNo }">
</form>




</div><!-- .container end -->
</div><!-- .wrap end -->

<!-- footer start -->
<c:import url="/WEB-INF/views/layout/footer.jsp" />

