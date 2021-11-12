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
	oEditors.getById["askContent"].exec("UPDATE_CONTENTS_FIELD", []);
	
	try {
		elClickedObj.form.submit();
	} catch(e) {}
}

$(document).ready(function() {
	$("#btnWrite").click(function() {
		submitContents($("#btnWrite"));
		
		var result = confirm("게시글을 수정하시겠습니까?");

		if (result == true) {
			$("form").submit();
		} else {
			
			$("#askContent").focus();
		}
		
	})
	
	$("#cancel").click(function() {
		history.go(-1);
	})
})
</script>

<style type="text/css">

#item {
 width : 300px;
 height: 300px;
 margin: 0 auto;
 margin-top: 100px;
 margin-bottom: 100px;
}

#itemImg {
	width: 100%;
	height: 100%;
}

</style>


<!-- 개별 영역 끝 -->

<div class="wrap">
<div class="container">

<%-- 시작 --%>

<h1>질문 글쓰기 수정페이지</h1>
<hr>

<form action="/ask/update" method="post" enctype="multipart/form-data">
<div class="form-group">
	<label for="userNick">작성자</label>
	<input type="text" id="userNick" value="${userNick }" class="form-control" readonly="readonly"/>
	<input type="hidden" id="askNo" name="askNo" value="${ask.askNo }" />
</div>
<div class="form-group">
	<label for="askTitle">제목</label>
	<input type="text" id="askTitle" name="askTitle" class="form-control" value="${ask.askTitle }"/>
</div>

<div class="form-group">
	<label for="itemBrand">브랜드</label>
	<input type="text" id="itemBrand" name="itemBrand" class="form-control" value="${item.itemBrand }" readonly="readonly"/>
</div>
<div class="form-group">
	<label for="itemName">상품명</label>
	<input type="text" id="itemName" name="itemName" class="form-control" value="${item.itemName }" readonly="readonly"/>
</div>
<div class="form-group">
	<label for="itemPrice">가격</label>
	<input type="text" id="itemPrice" name="itemPrice" class="form-control" value="${item.itemPrice }" readonly="readonly"/>
</div>

<div class="form-group" id="item">
	<span>첨부파일</span><img id="itemImg" src="/upload/${file.fileStored}" alt="상품사진" />
</div>

<div class="form-group">
	<label for="askContent">구구절절</label>
	<textarea rows="10" style="width: 100%;" id="askContent" name="askContent" >${ask.askContent }</textarea>
</div>

<div class="form-group">
	<h6>투표 기간</h6>
<fmt:formatDate value="${vote.voteStart}" pattern="yy-MM-dd HH:mm"/>
~
<fmt:formatDate value="${vote.voteEnd}" pattern="yy-MM-dd HH:mm"/>
	
</div>

<div class="text-center">
	<button type="button" class="btn btn-primary" id="btnWrite">작성</button>
	<input type="reset" id="cancel" class="btn btn-danger" value="취소"/>
</div>

</form>
<%-- 끝 --%>

<script type="text/javascript">
var oEditors = [];
nhn.husky.EZCreator.createInIFrame({
	oAppRef: oEditors,
	elPlaceHolder: "askContent",
	sSkinURI: "/resources/se2/SmartEditor2Skin.html",
	fCreator: "createSEditor2"
});
</script>



</div><!-- .container end -->
</div><!-- .wrap end -->

<!-- footer start -->
<c:import url="/WEB-INF/views/layout/footer.jsp" />

