<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:import url="/WEB-INF/views/layout/head.jsp" />
<c:import url="/WEB-INF/views/layout/adminheader.jsp" />
<!-- header end -->

<!-- 개별 스타일 및 스크립트 영역 -->

<script type="text/javascript">


$(function(){
	$(document).on("click", "#btnList", function(){
		history.go(-1);
		return false;
	});
	$(document).on("click", "#btnWrite", function(){
		var answer = confirm("문의 답변을 작성하시겠습니까?");
		
		if(answer == true){
			$("form").submit;
		} else {
			return false;
		}
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

th {
	background: #ccc;
}

#answer {
	margin: auto;
	margin-bottom: 30px;
	margin-top: 20px;
	width: 100%;
	height: 150px;
	border: 3px solid #f3f3f3;
	display: flex;
	align-items: center;
	justify-content: center;
}

.answer {
	width: 100%;
	height: 100%;
	font-size: 16px;
	border: 0px;
	text-align: center;
}
.answer:focus {
	outline: none;
}

</style>

<!-- 개별 영역 끝 -->

<div class="wrap">
<div class="container">

<form action="/admin/qna/com/write" method="post">
<input type="hidden" name="qnaNo" value="${qna.qnaNo }" />
<input type="hidden" name="adminNo" value="${adminNo }" />

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
	<textarea name="qnaComContent" class="answer"></textarea>	
</div>

<div class="text-center">
	<button id="btnWrite" class="btn">답변 작성</button>
	<button id="btnList" class="btn">목록으로</button>
</div><!-- .text-center end -->

</div><!-- .detail end -->
</form>

</div><!-- .container end -->
</div><!-- .wrap end -->

<!-- footer start -->
<c:import url="/WEB-INF/views/layout/footer.jsp" />
