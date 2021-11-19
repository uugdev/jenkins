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
		
		var limit = uncomma($('input[name=itemPrice]').val()); //건들지마
		var price = parseInt(limit); //건들지마
		var result = confirm("글쓰기 완료 시 상품정보,투표설정은 수정이 불가합니다. 확인버튼을 누르시면 글쓰기가 완료됩니다.");

		if (result == true) {
			$('input[name=itemPrice]').val(price);
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


<!-- 개별 영역 끝 -->

<div class="wrap">
<div class="container">

<%-- 시작 --%>

<h1>질문 글쓰기 페이지</h1>
<hr>

<form action="/ask/write" method="post" enctype="multipart/form-data">
<div class="form-group">
	<label for="userNick">작성자</label>
	<input type="text" id="userNick" value="${userNick }" class="form-control" readonly="readonly"/>
</div>
<div class="form-group">
	<label for="askTitle">제목</label>
	<input type="text" id="askTitle" name="askTitle" class="form-control"/>
</div>

<!-- 상품 브랜드명 상품명 가격 사진 구매고민이유가본문  -->




<div class="form-group">
	<label for="itemBrand">브랜드</label>
	<input type="text" id="itemBrand" name="itemBrand" class="form-control"/>
</div>
<div class="form-group">
	<label for="itemName">상품명</label>
	<input type="text" id="itemName" name="itemName" class="form-control"/>
</div>
<div class="form-group commaInput">
	<label for="itemPrice">가격</label>
	<input type="text" id="itemPrice" name="itemPrice" class="form-control" />
</div>

<div class="form-group">
	<label for="file">첨부파일</label>
	<input type="file" id="file" name="file" />
</div>

<div class="form-group">
	<label for="askContent">구구절절</label>
	<textarea rows="10" style="width: 100%;" id="askContent" name="askContent"></textarea>
</div>

<div class="form-group">
	<h6>투표 기간 설정</h6>
</div>

<div class="form-group">
	<label><input type="radio" id="voteEnd" name="voteEnd" value="sysdate+1" checked="checked" />24시간</label>
	<label><input type="radio" id="voteEnd" name="voteEnd" value="sysdate+2" />48시간</label>
	<label><input type="radio" id="voteEnd" name="voteEnd" value="sysdate+3" />72시간</label>
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
//---인풋창 3자리마다콤마찍기---
var $input = $(".commaInput [type='text']");
// 입력 값 알아내기
$input.on('keyup', function() {
    var _this = this;
    numberFormat(_this)
});
// 콤마 찍기
function comma(str) {
    str = String(str);
    return str.replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,');
    
}
//---인풋창 3자리마다콤마찍기end---

//--------- 콤마 풀기
function uncomma(str) {
    str = String(str);
    return str.replace(/[^\d]+/g, '');
}
function numberFormat(obj) {
    obj.value = comma(uncomma(obj.value));
}
//--------- 콤마 풀기end

</script>




</div><!-- .container end -->
<!-- footer start -->
<c:import url="/WEB-INF/views/layout/footer.jsp" />
</div><!-- .wrap end -->


