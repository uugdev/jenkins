<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:import url="/WEB-INF/views/layout/head.jsp" />
<c:import url="/WEB-INF/views/layout/header.jsp" />
<!-- header end -->

<!-- 개별 스타일 및 스크립트 영역 -->
<link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/resources/css/tradeWrite.css" />
<!-- 스마트 에디터 2 라이브러리 로드 -->
<script type="text/javascript" src="/resources/se2/js/service/HuskyEZCreator.js"></script>

<script type="text/javascript">
function submitContents(elClickedObj) {
	oEditors.getById["tradeContent"].exec("UPDATE_CONTENTS_FIELD", []);
	
	try {
		elClickedObj.form.submit();
	} catch(e) {}
}

$(document).ready(function() {
	$("#btnWrite").click(function() {
		submitContents($("#btnWrite"));
		
		$("form").submit();
	})
	
	$("#btnCancel").click(function() {
		history.go(-1);
	})
})
</script>
<!-- 개별 영역 끝 -->

<div class="wrap">
<div class="container">

	
	<div id="writeMain">
	
		<h1>거래 게시글 작성</h1>
		<hr style="margin-top: 20px;">
	
		<form id="writeForm" action="/trade/write" method="post" enctype="multipart/form-data">
		
			<input type="text" style="width: 60%;" name="tradeTitle" placeholder="제목을 입력해주세요"/>
			<select name="tradeCategory">
				<option value="0">팝니다</option>
				<option value="1">삽니다</option>
			</select>
			<p style="text-align: left;">** 카테고리에 알맞은 주제에 대한 글을 올려주세요.</p>
		
			<div class="form-group">
				<label for="tradeContent"></label>
				<textarea rows="10" style="width: 100%; height: 400px;" id="tradeContent" name="tradeContent"></textarea>
			</div>
			
			<div class="form-group" style="float: left;">
				<label for="file">첨부파일</label>
				<input type="file" id="file" name="file" />
			</div>
			
			<div class="text-right">
				<button type="button" id="btnCancel" class="btn btn-default">취소</button>
				<button type="button" id="btnWrite" class="btn btn-info">작성</button>
			</div>
		
		</form>
	</div>

</div><!-- .container end -->
</div><!-- .wrap end -->

<!-- footer start -->
<c:import url="/WEB-INF/views/layout/footer.jsp" />

<script type="text/javascript">
var oEditors = [];
nhn.husky.EZCreator.createInIFrame({
	oAppRef: oEditors,
	elPlaceHolder: "tradeContent",
	sSkinURI: "/resources/se2/SmartEditor2Skin.html",
	fCreator: "createSEditor2"
});
</script>
