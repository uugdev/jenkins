<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:import url="/WEB-INF/views/layout/head.jsp" />
<c:import url="/WEB-INF/views/layout/adminheader.jsp" />
<!-- header end -->

<!-- 개별 스타일 및 스크립트 영역 -->

<script type="text/javascript">

$(document).ready(function(){
	$("#btnList").click(function(){
		location.href="/admin/qna/list"
	})
	$("#btnDelete").click(function(){
		var answer = confirm("문의 답변을 삭제하시겠습니까?");
		
		if(answer == true){
			location.href="/admin/qna/com/delete?qnaNo="+${qna.qnaNo};
		} else {
			return false;
		}
	})
	$("#btnUpdate").click(function(){
		location.href="/admin/qna/com/update?qnaNo="+${qna.qnaNo};
	})
	$("#btnWrite").click(function(){
		location.href="/admin/qna/com/write?qnaNo="+${qna.qnaNo};
	})
})

</script>

<style type="text/css">

#content {
	vertical-align: middle;
	height: 200px;
}

.answer {
	margin: 0 auto;
	width: 95%;
	height: 95%;
	text-align: center;
	display: flex;
	align-items: center;
	justify-content: center;
	background: #f2f2f2;
	padding: 10px;
}

td, th {
	text-align: center;
	vertical-align: middle;
}

th{
	background: #ccc;
}
</style>

<!-- 개별 영역 끝 -->

<div class="wrap">
<div class="container">

<h3>${qna.qnaTitle }</h3>
<hr>
<table class="table table-condensed">
<tr>
	<th>문의번호</th>
	<td>${qna.qnaNo }</td>
	<th>닉네임</th>
	<td>${nick }</td>
	<th>문의 유형</th>
	<td>${qna.qnaCategory }</td>
	<th>답변 여부</th>
	<td>
		<c:if test="${qna.qnaStatus == 'n' }">답변 대기중</c:if>
		<c:if test="${qna.qnaStatus == 'y' }">답변 완료</c:if>
	</td>
	<th>작성일</th>
	<td><fmt:formatDate value="${qna.qnaDate }" pattern="yyyy-MM-dd" /></td>
</tr>
<tr>
	<td colspan="10" id="content">${qna.qnaContent }</td>
</tr>
<tr>
	<td colspan="10" style="height: 100px;">
	<c:if test="${not empty qnaComment }">
		<div class="answer"><span>${qnaComment.qnaComContent }</span></div>
	</c:if>
	<c:if test="${empty qnaComment }">
		<div class="answer"><span>아직 작성된 답변이 없습니다.</span></div>
	</c:if>
	</td>
</tr>
</table>
<c:if test="${not empty qnaComment }">
<div class="text-center">
	<button id="btnUpdate">답변 수정</button>
	<button id="btnDelete">답변 삭제</button>
	<button id="btnList">목록으로</button>
</div><!-- .text-center end -->
</c:if>

<c:if test="${empty qnaComment }">
<div class="text-center">
	<button id="btnWrite">답변 작성</button>
	<button id="btnList">목록으로</button>
</div><!-- .text-center end -->
</c:if>

</div><!-- .container end -->
</div><!-- .wrap end -->

<!-- footer start -->
<c:import url="/WEB-INF/views/layout/footer.jsp" />

