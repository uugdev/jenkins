<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.Date"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<table class="table table-hover table-striped">
	<thead>
	<tr>
		<th style="width:10%"><input type="checkbox" name="select" id="selectAll" /></th>
		<th style="width:10%">보낸 사람</th>
		<th style="width:30%">제목</th>
		<th style="width:10%">상태</th>
		<th style="width:10%">받은 날짜</th>
	</tr>
	</thead>
	<tbody>
	<c:forEach items="${resultMapList }" var="map">
	<tr>
		<td><input type="checkbox" name="select" id="${map.MSG_NO }" value="${map.MSG_NO }" class="chk" /></td>
		<td>${map.USER_NICK }</td>
		<td><a href="<%=request.getContextPath() %>/message/receive/detail?msgNo=${map.MSG_NO }">${map.MSG_TITLE }</a></td>
		<td>
			<c:if test="${map.MSG_CHECK eq 'n'}" >읽지 않음</c:if>
			<c:if test="${map.MSG_CHECK eq 'y'}" >읽음</c:if>
		</td>
		<fmt:formatDate value="${map.MSG_DATE  }" pattern="yyyyMMdd" var="timeStr" />
		<fmt:formatDate value="<%=new Date()%>" pattern="yyyyMMdd" var="nowStr" />

			<td>
				<c:choose>
					<c:when test="${timeStr lt nowStr }">
						<fmt:formatDate value="${map.MSG_DATE }" pattern="yy-MM-dd" />
					</c:when>
					<c:when test="${timeStr eq nowStr }">
						<fmt:formatDate value="${map.MSG_DATE }" pattern="HH:mm" />
					</c:when>
				</c:choose>
			</td>
	</tr>
	</c:forEach>
	</tbody>
</table>
<button id="btnDelete" class="pull-left">삭제</button>
	<div style="height:30px;"></div>

<c:import url="/WEB-INF/views/message/receive/paging.jsp" />


<div style="height:30px;"></div>

