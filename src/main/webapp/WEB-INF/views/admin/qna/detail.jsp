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

.detail {
	text-align: center;
	width: 100%;
	background: #fff;
	margin: 50px auto;
}

.info {
	display: flex;
	justify-content: space-between;
	font-size: 15px;
	width: 80%;
	margin: auto;
	color: #5F6062;
}

#content {
	display: flex;
	justify-content: center;
	align-items: center;
	height: 400px;
	background: #f2f2f2;
	padding: 10px;
	overflow: auto;
	font-size: 16px;
}

td, th {
	text-align: center;
	vertical-align: middle;
}

th{
	background: #ccc;
}

#answer {
	margin: auto;
	margin-bottom: 30px;
	margin-top: 20px;
	width: 100%;
	height: 250px;
	border: 3px solid #f3f3f3;
	display: flex;
	align-items: center;
	justify-content: center;
	padding: 10px;
	font-size: 16px;
	overflow: auto;
}

</style>

<!-- 개별 영역 끝 -->

<div class="wrap">
<div class="container">

<div class="detail">
<h2 style="margin-bottom: 40px;">${qna.qnaTitle }</h2>

<div class="info">
	<span><label>문의번호</label>&nbsp;&nbsp;&nbsp;${qna.qnaNo }</span>|
	<span><label>닉네임</label>&nbsp;&nbsp;&nbsp;${nick }</span>|
	<span><label>문의 유형</label>&nbsp;&nbsp;&nbsp;${qna.qnaCategory }</span>|
	<span><label>답변 여부</label>&nbsp;&nbsp;&nbsp;
		<c:if test="${qna.qnaStatus == 'n' }">답변 대기중</c:if>
		<c:if test="${qna.qnaStatus == 'y' }">답변 완료</c:if>
	</span>|
	<span><label>작성일</label>&nbsp;&nbsp;&nbsp;<fmt:formatDate value="${qna.qnaDate }" pattern="yyyy-MM-dd" /></span>
</div><!-- .info end -->

<div id="content">${qna.qnaContent }</div>

<div id="answer">
	<c:if test="${not empty qnaComment }">
		<span>${qnaComment.qnaComContent }</span>
	</c:if>
	<c:if test="${empty qnaComment }">
		<span>아직 작성된 답변이 없습니다.</span>
	</c:if>
</div>

<c:if test="${not empty qnaComment }">
<div class="text-center">
	<button id="btnUpdate" class="btn">답변 수정</button>
	<button id="btnDelete" class="btn">답변 삭제</button>
	<button id="btnList" class="btn">목록으로</button>
</div><!-- .text-center end -->
</c:if>

<c:if test="${empty qnaComment }">
<div class="text-center">
	<button id="btnWrite" class="btn">답변 작성</button>
	<button id="btnList" class="btn">목록으로</button>
</div><!-- .text-center end -->
</c:if>

</div><!-- .detail end -->
</div><!-- .container end -->
</div><!-- .wrap end -->

<!-- footer start -->
<c:import url="/WEB-INF/views/layout/footer.jsp" />

