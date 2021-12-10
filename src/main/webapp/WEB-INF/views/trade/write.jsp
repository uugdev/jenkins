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
// function submitContents(elClickedObj) {
//     var elClickedObj = $("#form");
//     oEditors.getById["tradeContent"].exec("UPDATE_CONTENTS_FIELD", []);
//     var ir1 = $("#tradeContent").val();
    
//     alert(ir1);

//     if( ir1 == ""  || ir1 == null || ir1 == '&nbsp;' || ir1 == '<p>&nbsp;</p>' || ir1 == '<p><br></p>')  {
//          alert("내용을 입력하세요.");
//          oEditors.getById["tradeContent"].exec("FOCUS"); //포커싱
//          return;
//     }
    
// 	oEditors.getById["tradeContent"].exec("UPDATE_CONTENTS_FIELD", []);
	
// 	try {
// 		elClickedObj.form.submit();
// 	} catch(e) {}
// }

$(document).ready(function() {
	$("#btnWrite").click(function() {
// 		submitContents($("#btnWrite"));
		
		//-------------------------------------------------------------------------------------------------------
	    var elClickedObj = $("#btnWrite");
	    oEditors.getById["tradeContent"].exec("UPDATE_CONTENTS_FIELD", []);
	    var ir1 = $("#tradeContent").val();

	    if( ir1 == ""  || ir1 == null || ir1 == '&nbsp;' || ir1 == '<p>&nbsp;</p>' || ir1 == '<p><br></p>')  {
	        action_popup.alert('빈 칸을 모두 입력해 주세요.');
	
	        /* 닫는 창으로 꼭 필요함 */
	        $(".modal_close").on("click",function() {
	        	action_popup.close(this);
		        oEditors.getById["tradeContent"].exec("FOCUS"); //포커싱
	        });
	
	         return;
	    }
	    
		try {
			elClickedObj.form.submit();
		} catch(e) {}
		//-------------------------------------------------------------------------------------------------------
		
        var nullCheck = ["tradeTitle"];

		//입력 값 널 체크
		for (var i = 0; i < nullCheck.length; i++) {
		    //alert(arr[i]);
		    if ($.trim($('#' + nullCheck[i]).val()) == '') {
		        action_popup.alert('빈 칸을 모두 입력해 주세요.');
		
		        /* 닫는 창으로 꼭 필요함 */
		        $(".modal_close").on("click",function() {
		        	action_popup.close(this);
			        $('#' + nullCheck[i]).focus();
		        });
		
		        return;
		
			} //if end
		} //for end
		
		$("form").submit();
	})
	
	$("#btnCancel").click(function() {
		history.go(-1);
	})
})

// function fileCheck(obj) {
// 	pathpoint = obj.value.lastIndexOf('.');
// 	filepoint = obj.value.substring(pathpoint+1, obj.length);
// 	filetype = filepoint.toLowerCase();
//     if(filetype=='jpg' || filetype=='gif' || filetype=='png' || filetype=='jpeg' || filetype=='bmp') {
    	
//     } else {
//     	alert('이미지 파일만 선택할 수 있습니다.');
//     	parentObj = obj.parentNode
//     	node = parentObj.replaceChild(obj.cloneNode(true),obj);
//     	return false;
//     }
//     if(filetype=='bmp') {
//     	upload = confirm('BMP 파일은 웹상에서 사용하기엔 적절한 이미지 포맷이 아닙니다. \n그래도 계속 하시겠습니까?');
//     	if(!upload) return false;
//     }
// }

function fileCheck(obj) {

	pathpoint = obj.value.lastIndexOf('.');

	filepoint = obj.value.substring(pathpoint+1,obj.length);

	filetype = filepoint.toLowerCase();

	if(filetype=='jpg' || filetype=='gif' || filetype=='png' || filetype=='jpeg' || filetype=='bmp') {

		// 정상적인 이미지 확장자 파일인 경우

	} else {

        action_popup.alert('이미지 파일만 업로드할 수 있습니다!');
		
        /* 닫는 창으로 꼭 필요함 */
        $(".modal_close").on("click",function() {
        	action_popup.close(this);
        });

		parentObj  = obj.parentNode

		node = parentObj.replaceChild(obj.cloneNode(true),obj);
		
		document.getElementById("file").select();
		
		$('#file').remove();
		
		$('#fileLabel').after('<input type="file" id="file" name="file" onchange="fileCheck(this)"' +
				'accept="image/gif, image/jpeg, image/png" />');

		return false;

	}

}

</script>
<!-- 개별 영역 끝 -->

<div class="wrap">
	<div class="title">
		<h1>오이장터</h1>
		<p>장터 글을 원하는데로 작성하세요!</p>
	</div>
<div class="container">
	<div id="writeMain">
	
		<span>제목</span>
	
		<form id="writeForm" action="/trade/write" method="post" enctype="multipart/form-data">
		
			<input type="text" style="width: 60%;" maxlength="33" id="tradeTitle" name="tradeTitle" placeholder="제목을 입력해주세요"/>
			<select name="tradeCategory">
				<option value="0">팝니다</option>
				<option value="1">삽니다</option>
			</select>
			<p style="text-align: left;">** 카테고리에 알맞은 주제에 대한 글을 올려주세요.</p>
		
			<div class="form-group">
				<label for="tradeContent"></label>
				<textarea rows="10" style="width: 100%; height: 400px;" id="tradeContent" name="tradeContent" maxlength="1333"></textarea>
			</div>
			
			<div class="form-group" style="float: left;">
				<label for="file" id="fileLabel">첨부파일</label>
				<input type="file" id="file" name="file" onchange="fileCheck(this)"
					   accept="image/gif, image/jpeg, image/png" />
			</div>
			
			<div class="text-right">
				<button type="button" id="btnCancel" class="button">취소</button>
				<button type="button" id="btnWrite" class="button">작성</button>
			</div>
		
		</form>
	</div>

</div><!-- .container end -->

<!-- footer start -->
<c:import url="/WEB-INF/views/layout/footer.jsp" />

</div><!-- .wrap end -->


<script type="text/javascript">
var oEditors = [];
nhn.husky.EZCreator.createInIFrame({
	oAppRef: oEditors,
	elPlaceHolder: "tradeContent",
	sSkinURI: "/resources/se2/SmartEditor2Skin.html",
	fCreator: "createSEditor2"
});
</script>
