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

        var nullCheck = [
        	"askTitle","itemBrand",
        	"itemName","itemPrice", 
        	"file","askContent"
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
			action_popup.confirm("글쓰기 완료 시 상품정보,투표설정은 수정이 불가합니다. 확인버튼을 누르시면 글쓰기가 완료됩니다.", 
				function(result) {
					if (result == true) {
						$('input[name=itemPrice]').val(price);
                        $("form").submit();
					} else {
                        $("#askContent").focus();
                    }

				})

           /* 닫는 창으로 꼭 필요함 */
           $(".modal_close").on("click",function() {
                   action_popup.close(this);
           });

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

		<%-- 시작 --%>

		<div class="title">
			<h1>머니토론</h1>
			<p>고민제품과 이유를 적어주세요</p>
		</div>

		<form action="/ask/write" method="post" enctype="multipart/form-data"
			id="nullCheck" style="text-align: left;">
			<div class="">
				<label for="askTitle">제목</label> <input type="text" id="askTitle"
					name="askTitle" class="" maxlength="32" placeholder="제목을 입력해주세요" />
			</div>
			<div class="">
				<label for="itemName">상품명</label><input type="text" id="itemName"
					name="itemName" class="" placeholder="상품명을 입력해주세요" />
			</div>
			<div class="inlineWrap">
				<div>
					<label for="itemBrand">브랜드</label><br> <input type="text"
						id="itemBrand" name="itemBrand" class="" placeholder="브랜드를 입력해주세요" />
				</div>
				<div class=" commaInput">
					<label for="itemPrice">가격</label><br> <input type="text"
						id="itemPrice" name="itemPrice" class="" maxlength="11"
						placeholder="가격을 입력해주세요" />
				</div>
			</div>


			<div class="">
				<label for="askContent" style="margin-bottom: 10px;">고민이유를 적어주세요</label>
				<textarea rows="10" style="width: 100%; height: 400px;" id="askContent"
					name="askContent" maxlength="1333"></textarea>
			</div>

			<div style="margin-top: 5px;">
				<label for="file">첨부파일</label> <input type="file" id="file"
					name="file" />
			</div>



			<div class="voteWrap">
				<p style="font-size: 20px;">투표 기간 설정</p>
				<label><input type="radio" class="voteEnd" name="voteEnd"
					value="sysdate+1" checked="checked" />24시간</label> <label><input
					type="radio" class="voteEnd" name="voteEnd" value="sysdate+2" />48시간</label>
				<label><input type="radio" class="voteEnd" name="voteEnd"
					value="sysdate+3" />72시간</label>
			</div>

			<div class="text-center">
				<button type="button" class="btn btnWrap" id="btnWrite">작성</button>
				<input type="reset" id="cancel" class="btn btnWrap" value="취소" />
			</div>
		</form>

		<script type="text/javascript">
			var oEditors = [];
			nhn.husky.EZCreator.createInIFrame({
				oAppRef : oEditors,
				elPlaceHolder : "askContent",
				sSkinURI : "/resources/se2/SmartEditor2Skin.html",
				fCreator : "createSEditor2"
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




	</div>
	<!-- .container end -->
	<!-- footer start -->
	<c:import url="/WEB-INF/views/layout/footer.jsp" />
</div>
<!-- .wrap end -->

