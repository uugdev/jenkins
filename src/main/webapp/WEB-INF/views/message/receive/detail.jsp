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

<h1>받은 쪽지 상세보기 페이지</h1>

<table>
	<tr>
		<td>제목</td>
		<td>${msg.msgTitle }</td>
	</tr>
	<tr>
		<td>내용</td>
		<td>${msg.msgContent }</td>
	</tr>
	<tr>
		<td>보낸 사람</td>
		<td>${userNick } </td>
	</tr>
	<tr>
		<td>받은 시간</td>
		<td><fmt:formatDate value="${msg.msgDate }" pattern="yy-MM-dd HH:MM" /></td>
	</tr>
</table>


<a href="/message/delete?msgNo=${msg.msgNo }"><button>삭제</button></a>

</div><!-- .container end -->
</div><!-- .wrap end -->

<!-- footer start -->
<c:import url="/WEB-INF/views/layout/footer.jsp" />

