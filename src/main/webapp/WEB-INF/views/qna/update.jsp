<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:import url="/WEB-INF/views/layout/head.jsp" />
<c:import url="/WEB-INF/views/layout/header.jsp" />
<!-- header end -->

<!-- 개별 스타일 및 스크립트 영역 -->
<!-- 스마트 에디터 2 라이브러리 로드 -->
<script type="text/javascript" src="/resources/se2/js/service/HuskyEZCreator.js"></script>

<script type="text/javascript">
function submitContents(elClickedObj) {
	oEditors.getById["qnaContent"].exec("UPDATE_CONTENTS_FIELD", []);
	
	try {
		elClickedObj.form.submit();
	} catch(e) {}
}

$(function(){
	
	$(document).on("click", "#btnCancel", function(){
		history.go(-1);
	});

	$(document).on("click", "#btnUpdate", function(){
		submitContents($("#btnUpdate"));
		
		$("form").submit();
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


.formTable {
	width: 100%;
	background: #fff;
	margin: auto;
	margin-bottom: 50px;
	padding: 50px;
}


.table {
	text-align: center;
	width: 100%;
	margin: 0 auto;
	margin-bottom: 30px;
}
.table>tbody>tr>th {
	width: 10%;
	vertical-align: middle !important;
	border-top: 0px;
}

.table>tbody>tr>td {
	border-top: 0px;
	height: 70px;
	padding: 3px;
	vertical-align: middle;
}


input[type=text], select, option {
	width: 100%;
	text-align: center;
	height: 35px;
	border-radius: 0px;
	border: 1px solid #DBDAD7;
	color: #5F6062;
}

input[type=text]:focus, select:focus, option:focus {
	outline: none;
}

#btnUpdate, #btnCancel {
	background: #808080;
	border-radius: 0px;
	height: 35px;
	border: 1px solid #808080;
	color: #fff;
	padding: 0 15px;
}

#btnUpdate:hover, #btnCancel:hover {
	border: 1px solid #808080;
	background: #fff;
	color: #808080;
	transition: all .2s ease-in-out;
}

</style>
<!-- 개별 영역 끝 -->

<div class="wrap">
<div class="container">

<div class="title">
	<h1>문의하기</h1>
	<p>질문을 남겨주시면 신속한 답변 드리겠습니다.</p>
</div>

<div class="formTable">
<form action="/qna/update" method="post">
<input type="hidden" name="userNo" value="${userNo }"/>
<input type="hidden" name="qnaNo" value="${qna.qnaNo }"/>
<table class="table">

<tr>
	<th>작성자</th>
	<td><input type="text" name="userNick" value="${userNick }" readonly="readonly" style="background: #f3f3f3;" /></td>
	<th>문의 유형</th>
	<td>
		<select name="qnaCategory">
		  <option value="가입 관련 문의" <c:if test="${qna.qnaCategory == '가입 관련 문의' }">selected</c:if>>가입 관련 문의</option>
		  <option value="거래 관련 문의" <c:if test="${qna.qnaCategory == '거래 관련 문의' }">selected</c:if>>거래 관련 문의</option>
		  <option value="이벤트 관련 문의" <c:if test="${qna.qnaCategory == '이벤트 관련 문의' }">selected</c:if>>이벤트 관련 문의</option>
		  <option value="후기 관련 문의" <c:if test="${qna.qnaCategory == '후기 관련 문의' }">selected</c:if>>후기 관련 문의</option>
		  <option value="투표 관련 문의" <c:if test="${qna.qnaCategory == '투표 관련 문의' }">selected</c:if>>투표 관련 문의</option>
		</select>
	</td>
</tr>
<tr>
	<th>제목</th>
	<td colspan="3"><input type="text" name="qnaTitle" autocomplete="off" value="${qna.qnaTitle }" /></td>
</tr>
<tr>
	<th>내용</th>
	<td colspan="3"><textarea id="qnaContent" name="qnaContent" style="width: 100%; height: 300px;">${qna.qnaContent }</textarea></td>
</tr>
</table>
<div>
	<button id="btnUpdate">수정</button>
	<button type="button" id="btnCancel">취소</button>
</div>
</form>

</div><!-- .formTable end -->
</div><!-- .container end -->
</div><!-- .wrap end -->


<script type="text/javascript">
var oEditors = [];
nhn.husky.EZCreator.createInIFrame({
	oAppRef: oEditors,
	elPlaceHolder: "qnaContent",
	sSkinURI: "/resources/se2/SmartEditor2Skin.html",
	fCreator: "createSEditor2"
});
</script>


<!-- footer start -->
<c:import url="/WEB-INF/views/layout/footer.jsp" />

