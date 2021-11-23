<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:import url="/WEB-INF/views/layout/head.jsp" />
<c:import url="/WEB-INF/views/layout/header.jsp" />
<!-- header end -->

<table class="table table-striped table-hover">
	<thead>
		<tr>
			<th style="width: 10%; text-align: center;">글번호</th>
			<th style="width: 45%; text-align: left;">제목</th>
			<th style="width: 12%; text-align: left;">작성자</th>
			<th style="width: 10%; text-align: center;">조회수</th>
			<th style="width: 15%; text-align: left;">작성일</th>
		</tr>
	</thead>
	<tbody>
		<c:forEach items="${list }" var="ask">
			<tr>
				<td style="text-align: center">${ask.ASK_NO }</td>
				<td>
					<a href="/ask/detail?askNo=${ask.ASK_NO }">
						<span class="ellipsis2">${ask.ASK_TITLE }</span>
					</a>
				</td>
				<c:if test="${ask.USER_NICK eq null}">
					<td>탈퇴한 회원입니다</td>
				</c:if>
				<c:if test="${ask.USER_NICK ne null }">
					<td style="text-align: left;"><img alt="#"
						src="${ask.GRADE_URL}" style="width: 20px; height: 20px;">
						${ask.USER_NICK }</td>
				</c:if>
				<td style="text-align: center">${ask.ASK_HIT }</td>
				<td><fmt:formatDate value="${ask.ASK_DATE }"
						pattern="yy-MM-dd HH:mm:ss" /></td>
			</tr>
		</c:forEach>
	</tbody>
</table>
