<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>


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
	
	$('#btnUpdate').click(function() {
		
		var answer = confirm("회원정보 수정 페이지로 이동하시겠습니까?")
		
		if( answer == true ){
			
			location.href="<%=request.getContextPath() %>/admin/mem/delete?memid=${mem.memId }";
			
		} else {
			return false;
		}
	})
	
});
</script>

<style>

#btnUpdate {
	float: left;
	margin: 0 0 0 20px;
}

#btnDelete {
	float: right;
	margin: 0 20px 0 0;
}

table {
    margin-left: auto; 
    margin-right: auto;
}

</style>
<!-- 개별 영역 끝 -->
<!-- 카카오 로그인 확인 절차 -->
<c:set var="userId" value="${user.userId }" />
<c:set var="kakaoUser" value="${fn:substringBefore(userId, '-') }" />
<!-- 카카오 로그인 확인 절차 끝 -->

<div class="wrap">
<div class="container">

<c:import url="/WEB-INF/views/layout/myPageSideMenu.jsp" />
	<div class="one">
		<div class="col-md-9" style="height: 500px;">
	
		<h3> 회원정보 조회 </h3>
	
		<table class="table table-hover" style="width: 300px">
			<tr>
				<td style="width:10%" >아이디</td>
				<c:if test="${kakaoUser == 'kakao'}">
					<td style="width:10%">소셜 로그인 회원입니다.</td>
				</c:if>
				<c:if test="${kakaoUser == '' }">
					<td style="width:10%" >${user.userId }</td>			
				</c:if>
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
				<c:if test="${user.userGender == 'N' }">
					<td>선택 안함</td>
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
		
		
		<div class="buttonarea" style="width:200px; margin: 0 auto;">
		<a href="<%=request.getContextPath() %>/mypage/update?userNo=${user.userNo }"><button id="btnUpdate" class="btn" class="left">수정하기</button></a>
		<form action="/mypage/delete" method="post">
		<button id="btnDelete" class="btn">회원탈퇴</button>
		<input type="hidden" name="userNo" value="${user.userNo }">
		</form>
		</div><!-- .buttonarea end -->
		
		</div> <!-- .col-md-9 end -->
	</div> <!-- .one end -->

</div><!-- .container end -->
</div><!-- .wrap end -->

<!-- footer start -->
<c:import url="/WEB-INF/views/layout/footer.jsp" />

