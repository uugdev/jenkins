<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:import url="/WEB-INF/views/layout/head.jsp" />
<c:import url="/WEB-INF/views/layout/adminheader.jsp" />
<!-- header end -->

<!-- 개별 스타일 및 스크립트 영역 -->

<script type="text/javascript">

$(document).ready(function(){
	$("#btnList").click(function(){
		location.href="/admin/notice/list"
	})
	$("#btnDelete").click(function(){
		var answer = confirm("공지사항을 삭제하시겠습니까?");
		
		if(answer == true){
			location.href="/admin/notice/delete?noticeNo="+${notice.noticeNo};
		} else {
			return false;
		}
	})
	$("#btnUpdate").click(function(){
		location.href="/admin/notice/update?noticeNo="+${notice.noticeNo};
	})
})

</script>

<style type="text/css">

.detail {
	text-align: center;
	width: 100%;
	background: #fff;
	margin: 50px auto;
}

.info {
	display: flex;
	justify-content: space-between;
	font-size: 15px;
	width: 60%;
	margin: auto;
	color: #5F6062;
}

#content {
	vertical-align: middle;
	height: 400px;
	background: #f2f2f2;
}

td, th {
	text-align: center;
	vertical-align: middle;
}

th{
	background: #ccc;
}
</style>

<!-- 개별 영역 끝 -->

<div class="wrap">
<div class="container">

<div class="detail">
<h2 style="margin-bottom: 40px;">${notice.noticeTitle }</h2>

<div class="info">
<span><label>번호</label>&nbsp;&nbsp;&nbsp;${notice.noticeNo }</span>|
<span><label>작성자</label>&nbsp;&nbsp;&nbsp;${adminNick }</span>|
<span><label>조회수</label>&nbsp;&nbsp;&nbsp;${notice.noticeHit }</span>|
<span><label>작성일</label>&nbsp;&nbsp;&nbsp;<fmt:formatDate value="${notice.noticeDate }" pattern="yyyy-MM-dd HH:mm:s"/></span>
</div><!-- .info end -->

<table class="table">
<tr>
	<td id="content">${notice.noticeContent }</td>
</tr>

</table>
<div class="text-center">
	<button id="btnUpdate" class="btn">수정</button>
	<button id="btnDelete" class="btn">삭제</button>
	<button id="btnList" class="btn">목록으로</button>
</div><!-- .text-center end -->

</div><!-- .detail end -->

</div><!-- .container end -->
</div><!-- .wrap end -->

<!-- footer start -->
<c:import url="/WEB-INF/views/layout/footer.jsp" />

