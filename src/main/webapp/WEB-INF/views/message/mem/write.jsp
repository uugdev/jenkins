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
	oEditors.getById["msgContent"].exec("UPDATE_CONTENTS_FIELD", []);
	
	try {
		elClickedObj.form.submit();
	} catch(e) {}
}

$(document).ready(function() {
	$("#btnWrite").click(function() {
		submitContents($("#btnWrite"));
		
		$("form").submit();
		history.go(-1);
	})
	
	$("#btnCancel").click(function() {
		history.go(-1);
	})
	
	
})
</script>

<!-- 개별 영역 끝 -->

<div class="wrap">
<div class="container">

<h1>상대 지정해서 쪽지 작성하기</h1>
<hr>

<form action="/message/mem/write" method="post">

<table class="table table-hover" style="width: 600px;'">
	<tr>
		<td><label for="userNick">받는 사람</label></td>
		<td><input type="text" id="userNick" name="userNick" />
	</tr>
	
	<tr>
		<td><label for="title">제목</label></td>
		<td><input type="text" id="msgTitle" name="msgTitle" /></td>
	</tr>
	<tr>
		<td colspan="2"><label for="content">내용</label></td>
	</tr>
	<tr>
		<td colspan="2"><textarea rows="10" id="msgContent" name="msgContent"></textarea></td>
	</tr>
</table>

	<button id="btnWrite">발송</button>
</form>
	<button id="btnCancel">취소</button>


</div><!-- .container end -->
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


<!-- footer start -->
<c:import url="/WEB-INF/views/layout/footer.jsp" />






