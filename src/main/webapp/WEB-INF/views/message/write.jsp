<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<!doctype html>
<html lang="ko">
<head>
    <%--page title--%>
    <title>이건못참조</title>
	<c:import url="/WEB-INF/views/layout/head.jsp" />
	
<script type="text/javascript">
$(document).ready(function() {
	$("#btnWrite").click(function() {
		submitContents($("#btnWrite"));
		
		$("form").submit();
	})
	
	$("#btnCancel").click(function() {
		history.go(-1);
	})
})
</script>
	
</head>
<body>
<%--header--%>
<c:import url="/WEB-INF/views/layout/header.jsp" />

<h1>상대 지정해서 쪽지 작성하기(로그인 구현 전까지 임시)</h1>
<hr>

<form action="/message/write" method="post">


	<label for="to">받는 사람</label>
	<input type="text" id="to" name="to" />
	<br>
	
	<label for="title">제목</label>
	<input type="text" id="msgTitle" name="msgTitle" />
	<br>
	
	<label for="content">내용</label>
	<textarea rows="10" id="msgContent" name="msgContent"></textarea>
	<br>

	<button id="btnWrite">발송</button>
	<button id="btnCancel">취소</button>


</form>

<%--footer--%>
<c:import url="/WEB-INF/views/layout/footer.jsp" />
</body>
</html>






