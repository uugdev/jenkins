<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<style type="text/css">

li {
	cursor: pointer;
}

</style>

<div class="text-center">
<ul class="pagination pagination-sm">

<c:if test="${not empty param.search }">
	<c:set var="searchParam" value="${param.search }"/>
</c:if>

<%-- 첫 페이지로 이동 --%>
<c:if test="${paging.curPage ne 1 }">
<%-- 	<li><a href="<%=request.getContextPath() %>${linkUrl }${searchParam }">첫 페이지로 &laquo;</a></li> --%>
	
	<!-- 검색 안했을 때 -->
	<c:if test="${empty param.search }">
		<li><span onclick="loadCurPage(1, ${paging.target })"><input name ="curP" type="hidden" value="1,${paging.target }"/>첫 페이지로</span></li>
	</c:if>
	
	<!-- 검색 했을 때, 타겟 설정했을 때 -->
	<c:if test="${not empty param.search and not empty paging.target }">
		<li><span onclick="loadCurPage(1, ${paging.target }, ${param.search })"><input name ="curP" type="hidden" value="1,${paging.target },${param.search }"/>첫 페이지로</span></li>
	</c:if>
	
	<!-- 검색 했을 때, 타겟 설정안했을 때 -->
	<c:if test="${not empty param.search and empty paging.target }">
		<li><span onclick="loadCurPage(1, null, ${param.search })"><input name ="curP" type="hidden" value="1, null, ${param.search }"/>첫 페이지로</span></li>
	</c:if>
	
</c:if>

<%-- 이전 페이징 리스트로 이동 --%>
<c:choose>
<c:when test="${paging.startPage ne 1 }">
<%-- 	<li><a href="<%=request.getContextPath() %>${linkUrl }?curPage=${paging.startPage - paging.pageCount }${searchParam }"> &lt; </a></li> --%>
	
	<!-- 검색 안했을 때 -->
	<c:if test="${empty param.search }">
		<li><span onclick="loadCurPage(${paging.startPage - paging.pageCount }, ${paging.target })"><input name ="curP" type="hidden" value="${paging.startPage - paging.pageCount }, ${paging.target }"/> &lt; </span></li>
	</c:if>
	
	<!-- 검색 했을 때, 타겟 설정했을 때 -->
	<c:if test="${not empty param.search and not empty paging.target }">
		<li><span onclick="loadCurPage(${paging.startPage - paging.pageCount }, ${paging.target }, ${param.search })"><input name ="curP" type="hidden" value="${paging.startPage - paging.pageCount }, ${paging.target }, ${param.search }"/> &lt; </span></li>
	</c:if>
	
	<!-- 검색 했을 때, 타겟 설정안했을 때 -->
	<c:if test="${not empty param.search and empty paging.target }">
		<li><span onclick="loadCurPage(${paging.startPage - paging.pageCount }, null, ${param.search })"><input name ="curP" type="hidden" value="${paging.startPage - paging.pageCount }, null, ${param.search }"/> &lt; </span></li>
	</c:if>
	
</c:when>
<c:when test="${paging.startPage eq 1 }">
	<li class="disabled"><a>&lt;</a>
</c:when>
</c:choose>

<%-- 이전 페이지로 가기 --%>
<c:if test="${paging.curPage > 1 }">
<%-- 	<li><a href="<%=request.getContextPath() %>${linkUrl }?curPage=${paging.curPage - 1 }${searchParam }">&larr;</a></li> --%>
	
	<!-- 검색 안했을 때 -->
	<c:if test="${empty param.search }">
		<li><span onclick="loadCurPage(${paging.curPage - 1 }, ${paging.target })"><input name ="curP" type="hidden" value="${paging.curPage - 1 }, ${paging.target }"/>&larr;</span></li>
	</c:if>
	
	<!-- 검색 했을 때, 타겟 설정했을 때 -->
	<c:if test="${not empty param.search and not empty paging.target }">
		<li><span onclick="loadCurPage(${paging.curPage - 1 }, ${paging.target }, ${param.search })"><input name ="curP" type="hidden" value="${paging.curPage - 1 }, ${paging.target }, ${param.search }"/>&larr;</span></li>
	</c:if>
	
	<!-- 검색 했을 때, 타겟 설정안했을 때 -->
	<c:if test="${not empty param.search and empty paging.target }">
		<li><span onclick="loadCurPage(${paging.curPage - 1 }, null, ${param.search })"><input name ="curP" type="hidden" value="${paging.curPage - 1 }, null, ${param.search }"/>&larr;</span></li>
	</c:if>
	
</c:if>

<%-- 페이징 리스트 --%>
<c:forEach begin="${paging.startPage }" end="${paging.endPage }" var="i">

<!-- 검색 안했을 때 -->
<c:if test="${empty param.search }">
	<c:if test="${paging.curPage eq i }">
		<li class="active"><span onclick="loadCurPage(${i }, ${paging.target })"><input name ="curP" type="hidden" value="${i },${paging.target }"/>${i }</span></li>
	</c:if>
	<c:if test="${paging.curPage ne i }">
		<li><span onclick="loadCurPage(${i }, ${paging.target })"><input name ="curP" type="hidden" value="${i },${paging.target }"/>${i }</span></li>
	</c:if>
</c:if>

<!-- 검색 했을 때, 타겟 설정했을 때 -->
<c:if test="${not empty param.search and not empty paging.target }">
	<c:if test="${paging.curPage eq i }">
		<li class="active"><span onclick="loadCurPage(${i }, ${paging.target }, '${paging.search }')"><input name ="curP" type="hidden" value="${i },${paging.target }, '${paging.search }'"/>${i }</span></li>
	</c:if>
	<c:if test="${paging.curPage ne i }">
		<li><span onclick="loadCurPage(${i }, ${paging.target }, '${paging.search }')"><input name ="curP" type="hidden" value="${i },${paging.target }, '${paging.search }'"/>${i }</span></li>
	</c:if>
</c:if>

<!-- 검색 했을 때, 타겟 설정안했을 때 -->
<c:if test="${not empty param.search and empty paging.target }">
	<c:if test="${paging.curPage eq i }">
		<li class="active"><span onclick="loadCurPage(${i }, null, '${paging.search }')"><input name ="curP" type="hidden" value="${i }, null, '${paging.search }'"/>${i }</span></li>
	</c:if>
	<c:if test="${paging.curPage ne i }">
		<li><span onclick="loadCurPage(${i }, null, '${paging.search }')"><input name ="curP" type="hidden" value="${i }, null, '${paging.search }'"/>${i }</span></li>
	</c:if>
</c:if>

</c:forEach>

<%-- 다음 페이지로 가기 --%>
<c:if test="${paging.curPage < paging.totalPage }">
<%-- 	<li><a href="<%=request.getContextPath() %>${linkUrl }?curPage=${paging.curPage + 1 }${searchParam }">&rarr;</a></li> --%>
	
	<!-- 검색 안했을 때 -->
	<c:if test="${empty param.search }">
		<li><span onclick="loadCurPage(${paging.curPage + 1 }, ${paging.target })"><input name ="curP" type="hidden" value="${paging.curPage + 1 }, ${paging.target }"/>&rarr;</span></li>
	</c:if>
	
	<!-- 검색 했을 때, 타겟 설정했을 때 -->
	<c:if test="${not empty param.search and not empty paging.target }">
		<li><span onclick="loadCurPage(${paging.curPage + 1 }, ${paging.target }, ${param.search })"><input name ="curP" type="hidden" value="${paging.curPage + 1 }, ${paging.target }, ${param.search }"/>&rarr;</span></li>
	</c:if>
	
	<!-- 검색 했을 때, 타겟 설정안했을 때 -->
	<c:if test="${not empty param.search and empty paging.target }">
		<li><span onclick="loadCurPage(${paging.curPage + 1 }, null, ${param.search })"><input name ="curP" type="hidden" value="${paging.curPage + 1 }, null, ${param.search }"/>&rarr;</span></li>
	</c:if>
	
</c:if>

<%-- 다음 페이징 리스트로 이동 --%>
<c:choose>
<c:when test="${paging.endPage ne paging.totalPage }">
<%-- 	<li><a href="<%=request.getContextPath() %>${linkUrl }?curPage=${paging.startPage + paging.pageCount }${searchParam }"> &gt; </a></li> --%>
	
	<!-- 검색 안했을 때 -->
	<c:if test="${empty param.search }">
		<li><span onclick="loadCurPage(${paging.startPage + paging.pageCount }, ${paging.target })"><input name ="curP" type="hidden" value="${paging.startPage + paging.pageCount }, ${paging.target }"/> &gt; </span></li>
	</c:if>
	
	<!-- 검색 했을 때, 타겟 설정했을 때 -->
	<c:if test="${not empty param.search and not empty paging.target }">
		<li><span onclick="loadCurPage(${paging.startPage + paging.pageCount }, ${paging.target }, ${param.search })"><input name ="curP" type="hidden" value="${paging.startPage + paging.pageCount }, ${paging.target }, ${param.search }"/> &gt; </span></li>
	</c:if>
	
	<!-- 검색 했을 때, 타겟 설정안했을 때 -->
	<c:if test="${not empty param.search and empty paging.target }">
		<li><span onclick="loadCurPage(${paging.startPage + paging.pageCount }, null, ${param.search })"><input name ="curP" type="hidden" value="${paging.startPage + paging.pageCount }, null, ${param.search }"/> &gt; </span></li>
	</c:if>
	
</c:when>
<c:when test="${paging.endPage eq paging.totalPage }">
	<li class="disabled"><a>&gt;</a>
</c:when>
</c:choose>

<%-- 끝 페이지로 이동 --%>
<c:if test="${paging.curPage ne paging.totalPage }">
<%-- 	<li><a href="<%=request.getContextPath() %>${linkUrl }?curPage=${paging.totalPage }${searchParam }">마지막 페이지로 &raquo;</a></li> --%>
	
	<!-- 검색 안했을 때 -->
	<c:if test="${empty param.search }">
		<li><span onclick="loadCurPage(${paging.totalPage }, ${paging.target })"><input name ="curP" type="hidden" value="${paging.totalPage }, ${paging.target }"/>마지막 페이지로</span></li>
	</c:if>
	
	<!-- 검색 했을 때, 타겟 설정했을 때 -->
	<c:if test="${not empty param.search and not empty paging.target }">
		<li><span onclick="loadCurPage(${paging.totalPage }, ${paging.target }, ${param.search })"><input name ="curP" type="hidden" value="${paging.totalPage }, ${paging.target }, ${param.search }"/>마지막 페이지로</span></li>
	</c:if>
	
	<!-- 검색 했을 때, 타겟 설정안했을 때 -->
	<c:if test="${not empty param.search and empty paging.target }">
		<li><span onclick="loadCurPage(${paging.totalPage }, null, ${param.search })"><input name ="curP" type="hidden" value="${paging.totalPage }, null, ${param.search }"/>마지막 페이지로</span></li>
	</c:if>
	
</c:if>

</ul>
</div>