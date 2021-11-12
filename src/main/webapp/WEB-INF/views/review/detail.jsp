<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:import url="/WEB-INF/views/layout/head.jsp" />
<c:import url="/WEB-INF/views/layout/header.jsp" />
<!-- header end -->

<div class="container">


<h1 style="text-align: center;">${review.reviewTitle }</h1>
<hr>

<span>작성자 : ${user.userNick }</span>
<span><fmt:formatDate value="${review.reviewDate }" pattern="yy-MM-dd HH:mm"/></span>
<span class="pull-right">조회수 : ${review.reviewHit }</span>

<table class="table table-striped table-hover">
	<thead>
		<tr>
			<th style="width: 33%;">브랜드</th>
			<th style="width: 33%;">상품명</th>
			<th style="width: 33%;">가격</th>
		</tr>
	</thead>
	<tbody>
		<tr>
			<td>${item.itemBrand }</td>		
			<td>${item.itemName }</td>		
			<td>${item.itemPrice }원</td>		
		</tr>
	</tbody>
</table>

<div id="item">
	<img id="itemImg" src="/upload/${file.fileStored}" alt="상품사진" />
</div>


<div style="text-align: center;">${review.reviewContent }</div>

<div class="text-center">
	<a href="/review/list"><button class="btn btn-default">목록</button></a>
	<c:if test="${user.userNo eq review.userNo }">
		<a href="/review/update?reviewkNo=${review.reviewkNo }"><button class="btn btn-primary">수정</button></a>
		<a href="/review/delete?reviewkNo=${review.reviewkNo }"><button class="btn btn-danger">삭제</button></a>
	</c:if>
</div>




<%-- --%>
	
</div><!-- .container end -->
</div><!-- .wrap end -->

<!-- footer start -->
<c:import url="/WEB-INF/views/layout/footer.jsp" />