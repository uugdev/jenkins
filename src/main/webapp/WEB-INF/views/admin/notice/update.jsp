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
	$("#btnUpdate").click(function() {
		
		var answer = confirm("공지사항을 수정하시겠습니까?");
		if(answer == true){
		
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

.title {
	margin: 50px 0 30px 0;
}

.detail {
	text-align: center;
	width: 100%;
	background: #fff;
	margin: 50px auto;
}


table {
	width: 100%;
	margin: auto;
	margin-bottom: 30px;
}

th, td {
	height: 35px;
	padding: 5px;
}

input[type=text] {
	width: 100%;
	text-align: center;
	height: 35px;
	border-radius: 0px;
	border: 1px solid #DBDAD7;
	color: #5F6062;
}

input[type=text]:focus {
	outline: none;
}

</style>
<!-- 개별 영역 끝 -->

<div class="wrap">
<div class="container">

<div class="title">
	<h2>공지사항 수정</h2>
</div>

<div class="detail">
<form action="/admin/notice/update" method="post">
<input type="hidden" name="noticeNo" value="${notice.noticeNo }"/>
<input type="hidden" name="adminNo" value="${adminNo }"/>
<input type="hidden" name="noticeHit" value="${notice.noticeHit }"/>

<table>

<tr>
	<th>제목</th>
	<td><input type="text" name="noticeTitle" autocomplete="off" value="${notice.noticeTitle }" /></td>
	<th style="width: 10%;">작성자</th>
	<td style="width: 15%;"><input type="text" name="adminNick" value="${adminNick }" readonly="readonly" style="background: #f2f2f2;" /></td>
</tr>
<tr>
	<th>내용</th>
	<td colspan="3"><textarea id="noticeContent" name="noticeContent" style="width: 100%; height: 200px;">${notice.noticeContent }</textarea></td>
</tr>
</table>
<div>
	<button id="btnUpdate" class="btn">수정</button>
	<button type="button" id="btnCancel" class="btn">취소</button>
</div>
</form>
</div><!-- .detail end -->

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

