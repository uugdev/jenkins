<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" %>

<c:import url="/WEB-INF/views/layout/head.jsp" />
<c:import url="/WEB-INF/views/layout/header.jsp" />

<!-- 스마트 에디터 2 라이브러리 로드 -->
<script type="text/javascript" src="/resources/se2/js/service/HuskyEZCreator.js"></script>

<script type="text/javascript">
function submitContents(elClickedObj) {
	oEditors.getById["reviewContent"].exec("UPDATE_CONTENTS_FIELD", []);
	
	try {
		elClickedObj.form.submit();
	} catch(e) {}
}

$(document).ready(function() {
	$("#btnUpdate").click(function() {
		submitContents($("#btnUpdate"));
		
		action_popup.confirm("게시글을 수정하시겠습니까?",
		
		function(result) {
			if (result == true) {
				$("form").submit();
				
			} else {
				$("#reviewContent").focus();
			}
		})
		
		/* 닫는 창으로 꼭 필요함 */
		$(".modal_close").on("click", function() {
			action_popup.close(this);
		});
	})
	
	$("#btnCancel").click(function() {
		history.go(-1);
	})
})
</script>

<style type="text/css">
#item {
	width: 400px;
	margin: 0 auto;
	margin-top: 50px;
	margin-bottom: 50px;
}

#itemImg {
	width: 100%;
	height: 100%;
}

.btnWrap:hover {
	border: 1px solid #5b6e7a;
	background: #fff;
	color: #5b6e7a;
	transition: all .2s ease-in-out;
}

.btnWrap {
	height: 35px;
	width: 65px;
	border-radius: 0px;
	border: 0px;
	background: #5b6e7a;
	color: #f3f3f3;
}

input {
	border: none;
	border-bottom: 1px solid #ccc;
	height: 32px;
	margin-bottom: 50px;
	cursor: auto;
}

input:focus {outline:none;}


#reviewTitle {
	width: 100%;
}

#itemName {
	width: 100%;
}

label {
	font-size: 20px;
}

#itemBrand, #itemPrice {
	width: 390px;
}

.inlineWrap {
	display: flex;
	justify-content: space-between;
}

#file {
	border: none;
	margin: 0;
}

.voteWrap {
	text-align: center;
	margin-bottom: 50px;
}


.title {
	margin: 50px 0;
}

.title>p {
	color: #85969E;
}

body {
    background: #f2f2f2;
}

form {

    width: 100%;
    background: #fff;
    margin: auto;
    margin-bottom: 100px;
    padding: 50px;
}
</style>

<div class="wrap">
<div class="container" style="width: 950px;">

<div class="title">
	<h1>지출내역서</h1>
	<p>구매한 제품의 지출내역을 수정해주세요</p>
</div>

<form action="/review/update" method="post" enctype="multipart/form-data" style="text-align: left;">
	<input type="hidden" name="reviewNo" value="${review.REVIEW_NO }">
<!-- 	<div> -->
<!-- 		<label for="userNick">작성자</label> -->
<%-- 		<input type="text" id="userNick" value="${userNick }" class="form-control" readonly="readonly"/> --%>
<!-- 	</div> -->
	<div>
		<label for="reviewTitle">제목</label>
		<input type="text" id="reviewTitle" value="${review.REVIEW_TITLE }" name="reviewTitle" maxlength="32" />
	</div>
	
	<div>
		<label for="itemName">상품명</label>
		<input type="text" id="itemName" value="${item.itemName }" name="itemName" readonly="readonly"/>
	</div>
	
	<div class="inlineWrap">
		<div>
			<label for="itemBrand">브랜드</label><br>
			<input type="text" id="itemBrand" value="${item.itemBrand }" name="itemBrand" readonly="readonly"/>
		</div>
	<div class=" commaInput">
			<label for="itemPrice">가격</label><br>
			<input type="text" id="itemPrice" name="itemPrice"
				value="<fmt:formatNumber type="number" maxFractionDigits="3" value="${item.itemPrice }"/>" readonly="readonly"/>
		</div>
	</div>
	
	<div id="fileBox">	
		<div id="originFile">
			<label for="file">기존 첨부파일</label><br>
			<a href="/review/download?fileNo=${file.fileNo }">${file.fileStored }</a>
			<span id="delFile">X</span>
		</div>
		<br>
			
		<div id="newFile">
			<label for="file">새로운 첨부파일</label>
				<small> *새로운 파일을 첨부하면 기존파일이 삭제됩니다*</small>
			<input type="file" name="file" id="file" />
		</div>
	</div>
	<br>
	
	<div class="form-group">
		<label for="reviewContent">본문</label>
		<textarea rows="10" style="width: 100%; height: 400px;"  id="reviewContent" name="reviewContent">${review.REVIEW_CONTENT }</textarea>
	</div>
	
	
	<div class="text-center">
<!-- 		<input type="reset" id="cancel" class="btn btnWrap" value="취소"/> -->
		<button type="button" id="btnCancel" class="btn btnWrap">취소</button>
		<button type="button" id="btnUpdate" class="btn btnWrap">수정</button>
	</div>
</form>


<script type="text/javascript">
var oEditors = [];
nhn.husky.EZCreator.createInIFrame({
	oAppRef: oEditors,
	elPlaceHolder: "reviewContent",
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

</div><!-- .container -->

<%--footer--%>
<c:import url="/WEB-INF/views/layout/footer.jsp" />

</div><!-- .wrap end -->
