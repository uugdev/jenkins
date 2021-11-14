<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:import url="/WEB-INF/views/layout/head.jsp" />
<c:import url="/WEB-INF/views/layout/adminheader.jsp" />
<!-- header end -->

<!-- 개별 스타일 및 스크립트 영역 -->
<!-- 스마트 에디터 2 라이브러리 로드 -->
<script type="text/javascript" src="/resources/se2/js/service/HuskyEZCreator.js"></script>

<script type="text/javascript">
function submitContents(elClickedObj) {
	oEditors.getById["noticeContent"].exec("UPDATE_CONTENTS_FIELD", []);
	
	try {
		elClickedObj.form.submit();
	} catch(e) {}
}

$(document).ready(function() {
	$("#btnWrite").click(function() {
		
		var answer = confirm("공지사항을 작성하시겠습니까?");
		if( answer == true ){
		submitContents($("#btnWrite"));
		
		$("form").submit();			
		} else {
			return false;
		}
	})
	
	$("#btnCancel").click(function() {
		history.go(-1);
	})
})
</script>

<style type="text/css">

table {
	width: 1000px;
	margin: 0 auto;
}

th, td {
	height: 35px;
	padding: 5px;
}

th {
	width: 100px;
}

input[type=text] {
	width: 95%;
	height: 30px;
}

</style>
<!-- 개별 영역 끝 -->

<div class="wrap">
<div class="container">

<h3>공지사항 작성</h3>
<hr>

<form action="/admin/notice/write" method="post">
<input type="hidden" name="adminNo" value="${adminNo }"/>
<table>

<tr>
	<th>작성자</th>
	<td><input type="text" name="adminNick" value="${adminNick }" readonly="readonly" style="background: #ccc;" /></td>
</tr>
<tr>
	<th>제목</th>
	<td><input type="text" name="noticeTitle" autocomplete="off" /></td>
</tr>
<tr>
	<th>내용</th>
	<td><textarea id="noticeContent" name="noticeContent" style="width: 100%; height: 200px;"></textarea></td>
</tr>
</table>
<div>
	<button id="btnWrite">작성</button>
	<button type="button" id="btnCancel">취소</button>
</div>
</form>


</div><!-- .container end -->
</div><!-- .wrap end -->


<script type="text/javascript">
var oEditors = [];
nhn.husky.EZCreator.createInIFrame({
	oAppRef: oEditors,
	elPlaceHolder: "noticeContent",
	sSkinURI: "/resources/se2/SmartEditor2Skin.html",
	fCreator: "createSEditor2"
});
</script>


<!-- footer start -->
<c:import url="/WEB-INF/views/layout/footer.jsp" />

