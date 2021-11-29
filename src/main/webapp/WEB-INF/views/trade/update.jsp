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

/* -------------------------------------------------------- */

$(function () {
	
    $(document).on("click", "#confirm", function () {
        action_popup.confirm("되돌릴 수 없습니다. 정말로 삭제 하시겠습니까?", function (res) {
            if (res) {
            	
        		$.ajax({
        			type: "post"
        			, url: "/trade/update/deletefile"
        			, dataType: "json"
        			, data: {
        				fileStored: "${tradeDetail.FILE_STORED }"
        			}
        			, success: function(data){
        				if(data.success) {
        					$("#fileArea").html("기존에 있던 파일을 삭제했습니다!");
        				} else {
        					action_popup.alert("삭제 실패!");
        				}
        			}
        			, error: function() {
        				console.log("error");
        			}
        		});
            	
                action_popup.alert("삭제가 완료되었습니다.");
            }
        })
    });
    
    $(".modal_close").on("click", function () {
        action_popup.close(this);
    });
    
});

/* -------------------------------------------------------- */

$(document).ready(function() {
	$("input:file[name='file']").change(function () {
	    var str = $(this).val();
	    var fileName = str.split('\\').pop().toLowerCase() + ' 로 업로드하면 기존 파일이 삭제됩니다.';
	    
	    if(str == '') {
		    $('#fileName').html('<span id="fileName">${tradeDetail.FILE_STORED } <a id="confirm">X</a></span>');
	    } else {
		    $('#fileName').html(fileName);
	    }
	});
});


function submitContents(elClickedObj) {
	oEditors.getById["tradeContent"].exec("UPDATE_CONTENTS_FIELD", []);
	
	try {
		elClickedObj.form.submit();
	} catch(e) {}
}

$(document).ready(function() {
	
    $(document).on("click", "#btnUpdate", function () {
        action_popup.confirm("수정 하시겠습니까?", function (res) {
            if (res) {
            	
            	/* ----------------------------------------- */
            	
				submitContents($("#btnUpdate"));
				
				$('#fileArea').before('<input type="hidden" name="tradeNo" value="'+ ${param.tradeNo } +'" />');
				
				$("form").submit();
            	
            	/* ----------------------------------------- */
               
            }
        })
    });
    
	/* 닫는 창으로 꼭 필요함 */
    $(".modal_close").on("click", function () {
        action_popup.close(this);
    });
	
	
	$("#btnCancel").click(function() {
		history.go(-1);
	})
})

</script>
<!-- 개별 영역 끝 -->

<div class="wrap">
<div class="container">

	
	<div id="writeMain">
	
		<h1>거래 게시글 수정</h1>
		<hr style="margin-top: 20px;">
	
		<form id="updateForm" action="/trade/update" method="post" enctype="multipart/form-data">
		
			<input type="text" style="width: 60%;" name="tradeTitle" value="${tradeDetail.TRADE_TITLE }"
				   placeholder="제목을 입력해주세요" maxlength="33"/>
			<select name="tradeCategory">
				<c:if test="${tradeDetail.TRADE_CATEGORY eq 0 }">
					<option value="0" selected="selected">팝니다</option>
					<option value="1">삽니다</option>
				</c:if>
				<c:if test="${tradeDetail.TRADE_CATEGORY eq 1 }">
					<option value="0">팝니다</option>
					<option value="1" selected="selected">삽니다</option>
				</c:if>
			</select>
			<p style="text-align: left;">** 카테고리에 알맞은 주제에 대한 글을 올려주세요.</p>
		
			<div class="form-group">
				<label for="tradeContent"></label>
				<textarea rows="10" style="width: 100%; height: 400px;" id="tradeContent" name="tradeContent">
				${tradeDetail.TRADE_CONTENT }
				</textarea>
			</div>
			
			<label>기존에 업로드한 파일</label>
			
			<div id="fileArea" class="panel panel-default text-center">
				<c:if test="${empty tradeDetail.FILE_STORED }">
					<span id="fileName">기존에 업로드한 파일이 없습니다!</span>
				</c:if>
				<c:if test="${!empty tradeDetail.FILE_STORED }">
					<span id="fileName">${tradeDetail.FILE_STORED } <a id="confirm">X</a></span>
				</c:if>
			</div>
			
			<div class="form-group" style="float: left;">
				<label for="file">첨부파일</label>
				<input type="file" id="file" name="file" />
			</div>
			
			<div class="text-right">
				<button type="button" id="btnCancel" class="btn btn-default">취소</button>
				<button type="button" id="btnUpdate" class="btn btn-info">수정</button>
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