<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:import url="/WEB-INF/views/layout/head.jsp" />
<c:import url="/WEB-INF/views/layout/header.jsp" />
<!-- header end -->

<!-- 개별 스타일 및 스크립트 영역 -->

<script type="text/javascript">


$(function(){
	
	$(document).on("click", "#btnList", function(){
		history.go(-1);
	});
	
	$(document).on("click", "#btnUpdate", function(){
		if(${qna.qnaStatus == 'y'}){
			action_popup.alert("답변 완료된 문의글은 수정하실 수 없습니다.");
		} else {
			location.href="/qna/update?qnaNo="+${qna.qnaNo};
		}
	});
	
	$(document).on("click", "#btnDelete", function(){
		action_popup.confirm("문의글을 삭제하시겠습니까?", function (res){
			if(res){
				location.href="/qna/delete?qnaNo="+${qna.qnaNo};
			}
		})
	});

	$(".modal_close").on("click", function () {
	       action_popup.close(this);
	});
	
})/* $(function(){}) end */

</script>

<style type="text/css">

body {
	background: #f2f2f2;
}

.title {
	margin: 50px 0;
}

.title > p {
	color: #85969E;
}

.detail {
	text-align: center;
	width: 100%;
	background: #fff;
	margin: 50px auto;
	padding: 50px;
}

.info {
	display: flex;
	justify-content: space-between;
	font-size: 15px;
	width: 50%;
	margin: auto;
	color: #5F6062;
}

#content {
	vertical-align: middle;
	height: 300px;
	font-size: 15px;
}

.answer {
	margin: 0 auto;
	width: 100%;
	height: 95%;
	display: flex;
	align-items: center;
	justify-content: center;
	background: #F6F5F3;
	padding: 10px;
}


#btnUpdate, #btnDelete, #btnList {
	background: #808080;
	border-radius: 0px;
	height: 35px;
	border: 1px solid #808080;
	color: #fff;
	padding: 0 15px;
}

#btnUpdate:hover, #btnDelete:hover, #btnList:hover {
	border: 1px solid #808080;
	background: #fff;
	color: #808080;
	transition: all .2s ease-in-out;
}

</style>

<!-- 개별 영역 끝 -->

<div class="wrap">
<div class="container">

<!-- <div class="title"> -->
<!-- 	<h1>문의하기</h1> -->
<!-- 	<p>질문을 남겨주시면 친절하고 신속한 답변 드리겠습니다.</p> -->
<!-- </div> -->

<div class="detail">
<h2 style="margin-bottom: 40px;">${qna.qnaTitle }</h2>
<div class="info">
<span>No.&nbsp;${qna.qnaNo }</span>
<span><i class="far fa-question-circle"></i>&nbsp;&nbsp;${qna.qnaCategory }</span>
<span>
	<c:if test="${qna.qnaStatus == 'n' }"><i class="far fa-comment-dots"></i>&nbsp;&nbsp;답변 대기중</c:if>
	<c:if test="${qna.qnaStatus == 'y' }"><i class="fas fa-comment-dots"></i>&nbsp;&nbsp;답변 완료</c:if>
</span>
<span><i class="far fa-clock"></i>&nbsp;&nbsp;<fmt:formatDate value="${qna.qnaDate }" pattern="yyyy-MM-dd"/></span>
</div><!-- .info end -->

<table class="table">
<tr>
	<td id="content">${qna.qnaContent }</td>
</tr>
<tr>
	<td>
	<c:if test="${not empty qnaComment }">
		<div class="answer" style="height: 200px;"><span>${qnaComment.qnaComContent }</span></div>
	</c:if>
	<c:if test="${empty qnaComment }">
		<div class="noAnswer"><span>아직 작성된 답변이 없습니다.</span></div>
	</c:if>
	</td>
</tr>
</table>
<div class="text-center">
	<button id="btnUpdate">수정</button>
	<button id="btnDelete">삭제</button>
	<button id="btnList">목록으로</button>
</div><!-- .text-center end -->

</div><!-- .detail end -->

</div><!-- .container end -->
</div><!-- .wrap end -->

<!-- footer start -->
<c:import url="/WEB-INF/views/layout/footer.jsp" />

