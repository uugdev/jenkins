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

<style>

#left {
	float: left;
}

#right {
	float: right;
}

table {
    margin-left: auto; 
    margin-right: auto;
}

.buttonarea {
	margin: 0 505px 50px 505px;
	
}

.titlearea {
	margin: 0 0 30px 0;
}

</style>
<!-- 개별 영역 끝 -->

<div class="wrap">
<div class="container">


<div class="titlearea">
<h3> 회원정보 조회 </h3>
</div>

<table class="table table-hover" style="width: 300px">
	<tr>
		<td style="width:10%" >아이디</td>
		<td style="width:10%" >${user.userId }</td>
	</tr>
	<tr>
		<td>닉네임</td>
		<td>${user.userNick }</td>
	</tr>
	<tr>
		<td>이메일</td>
		<td>${user.userMail }</td>
	</tr>
	<tr>
		<td>유저 성별</td>
		<c:if test="${user.userGender == 'M' }">
			<td>남</td>
		</c:if>
		<c:if test="${user.userGender == 'F' }">
			<td>여</td>
	</c:if>
	</tr>
	<tr>
		<td>생일</td>
		<td>${user.userBday }</td>
	</tr>
	<tr>
		<td>가입일</td>
		<td><fmt:formatDate value="${user.joinDate }" pattern="yyyy-MM-dd" /></td>
	</tr>
	<tr>
		<td>포인트</td>
		<td>${user.userPoint }</td>
	</tr>

</table>


<div class="buttonarea">
<div id="left">
<a href="<%=request.getContextPath() %>/mypage/update?userNo=${user.userNo }"><button id="btnUpdate">수정하기</button></a>
</div>
<div id="right">
<form action="/mypage/delete" method="post">
<button id="btnDelete">회원탈퇴</button>
<input type="hidden" name="userNo" value="${user.userNo }">
</form>
</div>
</div>




</div><!-- .container end -->
</div><!-- .wrap end -->

<!-- footer start -->
<c:import url="/WEB-INF/views/layout/footer.jsp" />

