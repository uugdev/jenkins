<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:import url="/WEB-INF/views/layout/head.jsp" />
<c:import url="/WEB-INF/views/layout/header.jsp" />
<!-- header end -->

<!-- 개별 스타일 및 스크립트 영역 -->

<!-- 개별 영역 끝 -->

<div class="wrap">
<div class="container">

<h3>회원 정보</h3>

<table class="table table-hover">
	<tr>
		<td>닉네임</td>
		<td>${user.userNick }</td>
	</tr>
	<tr>
		<td>가입일</td>
		<td>${user.joinDate }</td>
	</tr>
	<tr>
		<td>포인트</td>
		<td>{user.userPoint }</td>
	</tr>
</table>




</div><!-- .container end -->
</div><!-- .wrap end -->

<!-- footer start -->
<c:import url="/WEB-INF/views/layout/footer.jsp" />

