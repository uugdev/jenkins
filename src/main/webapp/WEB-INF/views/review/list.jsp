<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" %>

<!doctype html>
<html lang="ko">
<head>
    <%--page title--%>
    <title>이건못참조</title>
	<c:import url="/WEB-INF/views/layout/head.jsp" />
</head>
<body>
<%--header--%>
<c:import url="/WEB-INF/views/layout/header.jsp" />


<script type="text/javascript">
$(document).ready(function() {
	
	loadList();

	$(document).on("click", "#btnWrite", function(){
		$(location).attr("href", "/mypage/item/list");	
	});

	
// 	$("#btnWrite").click(function() {
// 		$(location).attr("href", "/mypage/item/list");
// // 		location.href = "/review/write";
// 	})
	
	//검색 버튼 클릭
// 	$("#btnSearch").click(function() {
// 		location.href="/review/list?search="+$("#search").val();
// 	});
	
	$(document).on("click", "#btnSearch", function(){
		search = $("#search").val();
		console.log(search)
		loadList()
	});
	
	//조회순으로 정렬 처리
	$("#hitList").click(function () {
// 		console.log("#ajax clicked")
		target = 1;
		var curPage = 1;
		$.ajax({
			type: "get"
			, url: "/review/list/hit"
			, data: {
				curPage: curPage
				, target: target
			}
			, dataType: "html"
			, success: function ( res ) {
				console.log("AJAX 성공")
				result.innerHTML = res;
				/* $("#ajaxArea").html( res ) */
				
			}
			, error: function () {
				console.log("AJAX 실패")
			}
		})
	})
	
	//최신순으로 정렬 처리
	$("#latestList").click(function () {
// 		console.log("#ajax clicked")
		
		target = 2;
		var curPage = 1;
		$.ajax({
			type: "get"
			, url: "/review/list/hit"
			, data: {
				curPage: curPage
				, target: target
			}
			, dataType: "html"
			, success: function ( res ) {
				console.log("AJAX 성공")
				result.innerHTML = res;
				/* $("#ajaxArea").html( res ) */
				
			}
			, error: function () {
				console.log("AJAX 실패")
			}
		})
	})
	
	//사진순으로 정렬 처리
	$("#itemList").click(function () {
// 		console.log("#ajax clicked")
		
		target = 3;
		var curPage = 1;
		$.ajax({
			type: "get"
			, url: "/review/list/hit"
			, data: {
				curPage: curPage
				, target: target
			}
			, dataType: "html"
			, success: function ( res ) {
				console.log("AJAX 성공")
				result.innerHTML = res;
				/* $("#ajaxArea").html( res ) */
				
			}
			, error: function () {
				console.log("AJAX 실패")
			}
		})
	})
	
	//<otherwise>태그로 로드하는 부분
	var target = null;
	var curPage = 1;
	var search = null;
	
	function loadList() {
		$.ajax({
			type: "get"
			, url: "/review/list/hit"
			, data: {
			curPage: curPage
			, target: target
			, search: search
			}
			, dataType: "html"
			, success: function(res){
				console.log("AJAX 성공")
				result.innerHTML = res;
//	 			$("#result").html( $("#result").html() + res );
			}
			, error: function(){
				console.log("AJAX 실패")
			}
		})
		$("#cur").html(curPage)
	};
	
});

//페이지가 증가되야하는 부분 (+1)
function loadCurPage(i, t, s){
    var curPage =  i ;
	var target = t;
	var search = s;
    
	console.log("curP : "+ curPage);
    console.log("tg : " + target);
    console.log("sc : " + search);
    
       $.ajax({
          type: "post"
          , url: "/review/list/hit"
          , data: { 
             curPage: curPage
             ,target: target
             ,search: search
          }
          , dataType: "html"
          , success: function(data){
             console.log("AJAX 성공")
             console.log(data)
             result.innerHTML = data;
 //             $("#result").html( $("#result").html() + res );

          }
          , error: function(){
             console.log("AJAX 실패")
          }
       })
       $("#cur").html(curPage)
 }

function reportStatusY() {
	
        action_popup.alert("신고된 게시물로 접근이 불가합니다"); 
        
    $(".modal_close").on("click", function () {
        action_popup.close(this);
    });
}

</script>

<style type="text/css">
table {
	table-layout: fixed;
}

table, th {
	text-align: center;
}

td:nth-child(2) {
	text-align: left;
}
</style>


<div class="wrap">
	<div class="container">
	
	<h1 style="text-align: center;">후기</h1>
	<hr>
	<!-- 구분선 삭제 예정 -->	
	<div class="pull-right" style="margin-bottom: 20px;">
		<a id="hitList">조회순</a>
		<a id="latestList">최신순</a>
		<a id="itemList">이미지순</a>
	</div>
	<br>
	
<%-- 	<div id="ajaxArea">
		${reviewStatus }
		<table class="table table-striped table-hover">
		<thead>
			<tr>
				<th style="width: 10%;">글번호</th>
				<th style="width: 45%;">제목</th>
				<th style="width: 12%;">닉네임</th>
				<th style="width: 10%;">조회수</th>
				<th style="width: 15%;">작성일</th>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${reviewList }" var="review">
			<tr>
				<td>${review.REVIEW_NO }</td>
				<td>
					<c:if test="${review.REPORT_STATUS eq 'n' }">				
						<a href="/review/detail?reviewNo=${review.REVIEW_NO }">${review.REVIEW_TITLE }</a>
					</c:if>
					<c:if test="${review.REPORT_STATUS eq 'y' }">				
						<a onclick="reportStatusY()">${review.REVIEW_TITLE }</a>
					</c:if>
				</td>
					<c:if test="${review.USER_NICK eq null }">
						<td>탈퇴한 회원</td>
					</c:if>
					<c:if test="${review.USER_NICK ne null }">
						<td style="text-align: left;">
							<img alt="#" src="${review.GRADE_URL}" style="width: 20px; height: 20px;"> ${review.USER_NICK }
						</td>
					</c:if>
				
				<td>${review.REVIEW_HIT }</td>
				<td><fmt:formatDate value="${review.REVIEW_DATE }" pattern="yy-MM-dd HH:mm:ss"/></td>
			</tr>
		</c:forEach>
		</tbody>
		</table>
	</div>
	
	
	<div class="form-inline text-center">
		<input class="form-control" type="text" id="search" value="${param.search }" />
		<button id="btnSearch" class="btn">검색</button>
	</div>
	<c:import url="/WEB-INF/views/review/paging.jsp" /> --%>
		<div id="result">
		
		</div>
	</div><!-- .container -->
</div><!-- .wrap end -->

<%--footer--%>
<c:import url="/WEB-INF/views/layout/footer.jsp" />