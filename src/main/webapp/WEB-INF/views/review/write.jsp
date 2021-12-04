<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" %>

<!doctype html>
<html lang="ko">
<head>
    <%--page title--%>
    <title>이건못참조</title>
	<c:import url="/WEB-INF/views/layout/head.jsp" />
</head>
<body>
<%--header--%>
<c:import url="/WEB-INF/views/layout/header.jsp" />

<!-- 스마트 에디터 2 라이브러리 로드 -->
<script type="text/javascript" src="/resources/se2/js/service/HuskyEZCreator.js"></script>

<script type="text/javascript">
$(document).ready(function() {
	$("#btnWrite").click(function() {

        var elClickedObj = $("#btnWrite");
        oEditors.getById["reviewContent"].exec("UPDATE_CONTENTS_FIELD", []);
        var reviewContent = $("#reviewContent").val();

        if( reviewContent == ""  || reviewContent == null || reviewContent == '<p><br></p>' || reviewContent == '&nbsp;' || reviewContent == '<p>&nbsp;</p>')  {
        	 action_popup.alert("빈 칸을 모두 입력해 주세요");
        	 
        	 /* 닫는 창으로 꼭 필요함 */
			$(".modal_close").on("click",function() {
			action_popup.close(this);
             oEditors.getById["reviewContent"].exec("FOCUS"); //포커싱
			});
             return;
        }

        try {
            elClickedObj.submit();
        } catch(e) {}

		var nullCheck = [
			"reviewTitle", "file", "reviewContent"
		];
	
		//입력 값 널 체크
		for (var i = 0; i < nullCheck.length; i++) {
			//alert(arr[i]);
			if ($.trim($('#' + nullCheck[i]).val()) == '') {
		        action_popup.alert('빈 칸을 모두 입력해 주세요.');
		        $('#' + nullCheck[i]).focus();
		
		        /* 닫는 창으로 꼭 필요함 */
		        $(".modal_close").on("click",function() {
		        	action_popup.close(this);
		        });
		
		        return;
		
			} //if end
		} //for end
	
		var limit = uncomma($('input[name=itemPrice]').val()); //건들지마
		var price = parseInt(limit); //건들지마
		$('input[name=itemPrice]').val(price);
		$("form").submit();
	})
	
	$("#cancel").click(function() {
		history.go(-1);
	})
})
</script>

<style type="text/css">
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
}

input:focus {
	outline:none;
}

#reviewTitle {
	width: 100%;
	border: 1px solid #ccc;
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
	<p>구매한 제품의 지출내역을 남겨주세요</p>
</div>

<form action="/review/write?askNo=${param.askNo }" method="post" enctype="multipart/form-data" id="nullCheck" style="text-align: left;">
<!-- 	<div class="form-group"> -->
<!-- 		<label for="userNick">작성자</label> -->
<!-- 	</div> -->
	<input type="hidden" id="userNick" value="${userNick }" class="form-control" readonly="readonly"/>
	<div class="">
		<label for="reviewTitle">제목</label><br>
		<input type="text" id="reviewTitle" name="reviewTitle" maxlength="32"  placeholder="제목을 입력해주세요" />
	</div>
	<div class="">
		<label for="itemName">상품명</label>
		<input type="text" id="itemName" name="itemName" value="${item.itemName }" readonly="readonly"/>
	</div>
	<div class="inlineWrap">
		<div>
			<label for="itemBrand">브랜드</label><br>
			<input type="text" id="itemBrand" name="itemBrand" value="${item.itemBrand }" readonly="readonly"/>
		</div>
		<div class="commaInput">
			<label for="itemPrice">가격</label><br>
			<input type="text" id="itemPrice" name="itemPrice"
			value="<fmt:formatNumber type="number" maxFractionDigits="3" value="${item.itemPrice }"/>" readonly="readonly"/>
		</div>
	</div>
	<div class="">
		<label for="reviewContent" style="margin-bottom: 10px;">리뷰를 남겨주세요</label>
		<textarea rows="10" style="width: 100%; height: 400px;" id="reviewContent" name="reviewContent" maxlength="1333"></textarea>
	</div>
	
	<div style="margin-top: 5px;">
		<label for="file">첨부파일</label>
		<input type="file" id="file" name="file" />
	</div>
	
	
	<div class="text-center">
		<button type="button" class="btn btnWrap" id="btnWrite">작성</button>
		<input type="reset" id="cancel" class="btn btnWrap" value="취소"/>
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

