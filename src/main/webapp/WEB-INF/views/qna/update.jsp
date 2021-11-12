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

$(document).ready(function() {
	$("#btnUpdate").click(function() {
		
		var answer = confirm("문의글을 수정하시겠습니까?");
		
		if( answer == true ){
			submitContents($("#btnUpdate"));
			
			$("form").submit();
		} else {
			return false;
		}
	})
	
	$("#btnCancel").click(function() {
		history.go(-1);
	})
})
</script>

<style type="text/css">

table {
	width: 1000px;
	margin: 0 auto;
}

th, td {
	height: 35px;
	padding: 5px;
}

th {
	width: 100px;
}

input[type=text], select, option {
	width: 95%;
	height: 30px;
}

</style>
<!-- 개별 영역 끝 -->

<div class="wrap">
<div class="container">

<h3>문의하기</h3>
<hr>

<form action="/qna/update" method="post">
<input type="hidden" name="userNo" value="${userNo }"/>
<input type="hidden" name="qnaNo" value="${qna.qnaNo }"/>
<table>

<tr>
	<th>작성자</th>
	<td><input type="text" name="userNick" value="${userNick }" readonly="readonly" style="background: #f2f2f2;" /></td>
	<th>문의 유형</th>
	<td>
		<div class="selectBox">
		  <select name="qnaCategory">
		    <option value="가입 관련 문의" <c:if test="${qna.qnaCategory == '가입 관련 문의' }">selected</c:if>>가입 관련 문의</option>
		    <option value="거래 관련 문의" <c:if test="${qna.qnaCategory == '거래 관련 문의' }">selected</c:if>>거래 관련 문의</option>
		    <option value="이벤트 관련 문의" <c:if test="${qna.qnaCategory == '이벤트 관련 문의' }">selected</c:if>>이벤트 관련 문의</option>
		    <option value="후기 관련 문의" <c:if test="${qna.qnaCategory == '후기 관련 문의' }">selected</c:if>>후기 관련 문의</option>
		    <option value="투표 관련 문의" <c:if test="${qna.qnaCategory == '투표 관련 문의' }">selected</c:if>>투표 관련 문의</option>
		  </select>
		  <span class="icoArrow"><img src="https://freepikpsd.com/media/2019/10/down-arrow-icon-png-7-Transparent-Images.png" alt=""></span>
		</div>
	</td>
</tr>
<tr>
	<th>제목</th>
	<td colspan="3"><input type="text" name="qnaTitle" autocomplete="off" value="${qna.qnaTitle }" /></td>
</tr>
<tr>
	<th>내용</th>
	<td colspan="3"><textarea id="qnaContent" name="qnaContent" style="width: 100%; height: 200px;">${qna.qnaContent }</textarea></td>
</tr>
</table>
<div>
	<button id="btnUpdate">수정</button>
	<button type="button" id="btnCancel">취소</button>
</div>
</form>


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

