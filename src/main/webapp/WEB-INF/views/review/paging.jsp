<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="text-center">
<ul class="pagination pagination-sm">

<c:if test="${not empty param.search }">
	<c:set var="searchParam" value="&search=${param.search }"/>
</c:if>

<%-- 첫 페이지로 이동 --%>
<c:if test="${paging.curPage ne 1 }">
	<li><a href="<%=request.getContextPath() %>${linkUrl }${searchParam }">첫 페이지로 &laquo;</a></li>
</c:if>

<%-- 이전 페이징 리스트로 이동 --%>
<c:choose>
<c:when test="${paging.startPage ne 1 }">
	<li><a href="<%=request.getContextPath() %>${linkUrl }?curPage=${paging.startPage - paging.pageCount }${searchParam }"> &lt; </a></li>
</c:when>
<c:when test="${paging.startPage eq 1 }">
	<li class="disabled"><a>&lt;</a>
</c:when>
</c:choose>

<%-- 이전 페이지로 가기 --%>
<c:if test="${paging.curPage > 1 }">
	<li><a href="<%=request.getContextPath() %>${linkUrl }?curPage=${paging.curPage - 1 }${searchParam }">&larr;</a></li>
</c:if>

<%-- 페이징 리스트 --%>
<c:forEach begin="${paging.startPage }" end="${paging.endPage }" var="i">
<c:if test="${paging.curPage eq i }">
	<li><span onclick=loadCurPage(${i }, ${paging.target })><input name ="curP" type="hidden" value="${i },${paging.target }"/>${i }</span></li>
</c:if>
<c:if test="${paging.curPage ne i }">
	<li><span onclick=loadCurPage(${i })><input name ="curP" type="hidden" value="${i }"/>${i }</span></li>
</c:if>
</c:forEach>

<%-- 다음 페이지로 가기 --%>
<c:if test="${paging.curPage < paging.totalPage }">
	<li><a href="<%=request.getContextPath() %>${linkUrl }?curPage=${paging.curPage + 1 }${searchParam }">&rarr;</a></li>
</c:if>

<%-- 다음 페이징 리스트로 이동 --%>
<c:choose>
<c:when test="${paging.endPage ne paging.totalPage }">
	<li><a href="<%=request.getContextPath() %>${linkUrl }?curPage=${paging.startPage + paging.pageCount }${searchParam }"> &gt; </a></li>
</c:when>
<c:when test="${paging.endPage eq paging.totalPage }">
	<li class="disabled"><a>&gt;</a>
</c:when>
</c:choose>

<%-- 끝 페이지로 이동 --%>
<c:if test="${paging.curPage ne paging.totalPage }">
	<li><a href="<%=request.getContextPath() %>${linkUrl }?curPage=${paging.totalPage }${searchParam }">마지막 페이지로 &raquo;</a></li>
</c:if>

</ul>
</div>