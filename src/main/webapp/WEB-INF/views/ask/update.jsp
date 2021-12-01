<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:import url="/WEB-INF/views/layout/head.jsp" />
<c:import url="/WEB-INF/views/layout/header.jsp" />
<!-- header end -->

<!-- 개별 스타일 및 스크립트 영역 -->
<!-- 스마트 에디터 2 라이브러리 로드 -->
<script type="text/javascript"
	src="/resources/se2/js/service/HuskyEZCreator.js"></script>

<script type="text/javascript">
	function submitContents(elClickedObj) {
		oEditors.getById["askContent"].exec("UPDATE_CONTENTS_FIELD", []);

		try {
			elClickedObj.form.submit();
		} catch (e) {
		}
	}

	$(document).ready(function() {
		$("#btnWrite").click(function() {
			submitContents($("#btnWrite"));

			action_popup.confirm("게시글을 수정하시겠습니까?", function(result) {

				if (result == true) {
					$("form").submit();
				} else {

					$("#askContent").focus();
				}

			})

			/* 닫는 창으로 꼭 필요함 */
			$(".modal_close").on("click", function() {
				action_popup.close(this);
			});

		})

		$("#cancel").click(function() {
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


#askTitle {
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


<!-- 개별 영역 끝 -->

<div class="wrap">
	<div class="container" style="width: 950px;">

		<div class="title">
			<h1>머니토론</h1>
			<p>제목과 본문을 수정할수있습니다</p>
		</div>

		<form action="/ask/update" method="post" enctype="multipart/form-data"
			style="text-align: left;">
			<input type="hidden" id="askNo" name="askNo" value="${ask.askNo }" />
			<div class="">
				<label for="askTitle">제목</label> <input type="text" id="askTitle"
					name="askTitle" class=""  maxlength="32"  value="${ask.askTitle }" />
			</div>
			<div class="">
				<label for="itemName">상품명</label> <input type="text" id="itemName"
					name="itemName" class="" value="${item.itemName }"
					readonly="readonly" />
			</div>
			<div class="inlineWrap">
				<div class="">
					<label for="itemBrand">브랜드</label><br> <input type="text" id="itemBrand"
						name="itemBrand" class="" value="${item.itemBrand }"
						readonly="readonly" />
				</div>
				<div class="">
					<label for="itemPrice">가격</label><br>
					<input type="text" id="itemPrice" name="itemPrice" class=""
						value="<fmt:formatNumber type="number" maxFractionDigits="3" value="${item.itemPrice }"/>"
						readonly="readonly" />
				</div>
			</div>
			
			<div class="" id="item">
				<img id="itemImg" src="/upload/${file.fileStored}" alt="상품사진" />
			</div>

			<div class="">
				<label for="askContent" style="margin-bottom: 10px;">고민이유를 적어주세요</label>
				<textarea rows="10" style="width: 100%; height: 400px" id="askContent"
					name="askContent" maxlength="1333">${ask.askContent }</textarea>
			</div>

			<div class="voteWrap">
				<p style="font-size: 20px; margin-top: 20px;">투표 기간</p>
				<fmt:formatDate value="${vote.voteStart}" pattern="yy-MM-dd HH:mm" />
				~
				<fmt:formatDate value="${vote.voteEnd}" pattern="yy-MM-dd HH:mm" />

			</div>

			<div class="text-center">
				<button type="button" class="btn btnWrap" id="btnWrite">수정</button>
				<input type="reset" id="cancel" class="btn btnWrap" value="취소" />
			</div>

		</form>
		<%-- 끝 --%>

		<script type="text/javascript">
			var oEditors = [];
			nhn.husky.EZCreator.createInIFrame({
				oAppRef : oEditors,
				elPlaceHolder : "askContent",
				sSkinURI : "/resources/se2/SmartEditor2Skin.html",
				fCreator : "createSEditor2"
			});
		</script>



	</div>
	<!-- .container end -->
	<!-- footer start -->
	<c:import url="/WEB-INF/views/layout/footer.jsp" />
</div>
<!-- .wrap end -->


