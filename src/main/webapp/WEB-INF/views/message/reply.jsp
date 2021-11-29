<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:import url="/WEB-INF/views/layout/head.jsp" />
<!-- header end -->

<!-- 개별 스타일 및 스크립트 영역 -->
<script type="text/javascript" src="/resources/se2/js/service/HuskyEZCreator.js"></script>

<script type="text/javascript">
function submitContents(elClickedObj) {
	oEditors.getById["msgContent"].exec("UPDATE_CONTENTS_FIELD", []);
	
	try {
		elClickedObj.form.submit();
	} catch(e) {}
}
</script>

<script type="text/javascript">
$(document).ready(function() {
	
	$("#btnWrite").click(function() {
		
		action_popup.confirm("쪽지를 보내시겠습니까?", function(result) {
			
			if( result == true){
				submitContents($("#btnWrite"));
				$("form").submit();		 
			} else {
				return false;
	
			}
		})
		
		/* 닫는 창으로 꼭 필요함 */
		$(".modal_close").on("click", function() {
			action_popup.close(this);
		});
	})

	$("#btnCancel").click(function() {
		window.open('','_self').close();
	})
})

</script>

<style>

.titlearea {
	margin-bottom: 20px;
}

#btnWrite {
	height: 35px;
	width: 76px;
	border-radius: 0px;
	border: 0px;
	background: #5b6e7a;
	color: #f3f3f3;
}

#btnCancel {
	height: 35px;
	width: 76px;
	border-radius: 0px;
	border: 0px;
	background: #5b6e7a;
	color: #f3f3f3;
}

#btnWrite:hover {
	border: 1px solid #5b6e7a;
	background: #fff;
	color: #5b6e7a;
	transition: all .2s ease-in-out;
}

#btnCancel:hover {
	border: 1px solid #5b6e7a;
	background: #fff;
	color: #5b6e7a;
	transition: all .2s ease-in-out;
}

body {
	padding: 20px 0 0 0;
	background-color: #f2f2f2;
	
}

table, h3 {
	text-align: center;
	margin: 0 auto;
}

.wrap {
	width: 600px;
	padding: 0 0 30px 0;
	margin: 0 0 0 10px;

}

.buttonarea {
	margin: 0 0 0 240px;
}

table {
	background-color: #fff;

}
</style>

<!-- 개별 영역 끝 -->

<div class="wrap">

	<div class="titlearea">
		<h3>답장하기</h3>
	</div>


<form action="/message/reply" method="post">
<input type="hidden" name="userNick" value="${userNick }">

<table class="table table-hover" style="width: 590px;">
	<tr>
		<td style="width:30%">받는 사람</td>
		<td style="width:70%"> ${userNick }</td>
	</tr>
	<tr>
		<td style="width:30%"><label for="title">제목</label></td>
		<td style="width:70%"><input type="text" id="msgTitle" name="msgTitle" /></td>
	</tr>
	<tr>
		<td colspan="2"><textarea rows="10" id="msgContent" name="msgContent"></textarea></td>
	</tr>
</table>
</form>

<span class="buttonarea">
	<button id="btnWrite">보내기</button>
	<button id="btnCancel">취소</button>
</span>	

</div><!-- .wrap end -->
<script type="text/javascript">
var oEditors = [];
nhn.husky.EZCreator.createInIFrame({
	oAppRef: oEditors,
	elPlaceHolder: "msgContent",
	sSkinURI: "/resources/se2/SmartEditor2Skin.html",
	fCreator: "createSEditor2"
});
</script>

<!-- confirm 모달을 쓸 페이지에 추가 start-->
<section class="modal modal-section type-confirm">
    <div class="enroll_box">
        <p class="menu_msg"></p>
    </div>
    <div class="enroll_btn">
        <button class="btn pink_btn btn_ok">확인</button>
        <button class="btn gray_btn modal_close">취소</button>
    </div>
</section>
<!-- confirm 모달을 쓸 페이지에 추가 end-->


</body>
</html>







