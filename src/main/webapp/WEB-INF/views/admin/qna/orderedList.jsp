<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<table class="table table-hover table-condensed">
<tr>
	<th><input type="checkbox" id="selectAll" name="select"/></th>
	<th>문의 번호</th>
	<th width="45%">제목</th>
	<th>답변 여부</th>
	<th>작성일</th>
</tr>
<c:forEach items="${list }" var="i">
<tr>
	<td><input type="checkbox" id="${i.QNA_NO }" value="${i.QNA_NO }" class="chk" /></td>
	<td><label for="${i.QNA_NO}">${i.QNA_NO }</label></td>
	<td><label for="${i.QNA_NO }"><a href="/admin/qna/detail?qnaNo=${i.QNA_NO }">${i.QNA_TITLE }</a></label></td>
	<td>
		<c:if test="${i.QNA_STATUS == 'y' }">답변 완료</c:if>
		<c:if test="${i.QNA_STATUS == 'n' }">답변 대기중</c:if>
	</td>
	<td><fmt:formatDate value="${i.QNA_DATE }" pattern="yyyy-MM-dd"/></td>
</tr>
</c:forEach>
</table>
<button id="btnDelete" class="pull-left">삭제</button>
<span class="pull-right">총 ${paging.totalCount }개</span>
<div class="clearfix"></div>
<c:import url="/WEB-INF/views/review/paging.jsp" />
    