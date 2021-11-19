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
		
		var answer = confirm("쪽지를 보내시겠습니까?");
		
		if( answer == true) {
			submitContents($("#btnWrite"));
			$("form").submit();
		}
	})

	$("#btnCancel").click(function() {
		window.open('','_self').close();
	})
})
</script>

<style>

body {
	padding: 20px 0 0 0;
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
	margin: 0 0 0 250px;
}

</style>


<!-- 개별 영역 끝 -->
<div class="wrap">


<h3>쪽지 보내기</h3>


<form action="/message/write" method="post">
<input type="hidden" name="userNick" value="${userNick }">

<table class="table table-hover" style="width: 590px;'">
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

</body>
</html>








