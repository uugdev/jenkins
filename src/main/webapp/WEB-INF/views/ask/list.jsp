<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:import url="/WEB-INF/views/layout/head.jsp" />
<c:import url="/WEB-INF/views/layout/header.jsp" />
<!-- header end -->

<!-- 개별 스타일 및 스크립트 영역 -->


<script type="text/javascript">
$(document).ready(function() {
	
	loadList();
	
	$(document).on("click", "#btnWrite", function(){
		$(location).attr("href", "/ask/write");
	})
	
	$(document).on("click", "#btnSearch", function(){
		search = $("#search").val();
		console.log(search)
		loadList()
	});

	$("#search").keypress(function(event) {
		if (event.which == 13) {
			$("#btnSearch").click();
			return false;
		}
	});
	
	//조회순으로 정렬 처리
	$("#hitList").click(function () {
// 		console.log("#ajax clicked")
		target = 1;
		var curPage = 1;
		$.ajax({
			type: "get"
			, url: "/ask/list/hit"
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
			, url: "/ask/list/hit"
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
			, url: "/ask/list/hit"
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
			, url: "/ask/list/hit"
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
          , url: "/ask/list/hit"
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

table, th, td {
	text-align: left;
}

td:nth-child(2) {
	text-align: left;
}

.ellipsis2 {
 	display: -webkit-box;
	overflow: hidden;
	text-overflow: ellipsis;
	white-space: normal;
/* 	line-height: 24px; */
/* 	max-height: 1.2em; */
	word-wrap: break-word;
	-webkit-line-clamp: 1;
	-webkit-box-orient: vertical;
	width: 162px;
}

</style>

<!-- 개별 영역 끝 -->

<div class="wrap">
	<div class="container">

		<h1>질문</h1>
		<hr>
		<div class="pull-right" style="margin-bottom: 20px;">
			<a id="hitList">조회순</a>
			<a id="latestList">최신순</a>
			<a id="itemList">이미지순</a>
		</div>
		<br>
		
<%-- 		<div id="ajaxArea">
			<table class="table table-striped table-hover">
				<thead>
					<tr>
						<th style="width: 10%; text-align: center;">글번호</th>
						<th style="width: 45%; text-align: left;">제목</th>
						<th style="width: 12%; text-align: left;">작성자</th>
						<th style="width: 10%; text-align: center;">조회수</th>
						<th style="width: 15%; text-align: left;">작성일</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${list }" var="ask">
						<tr>
							<td style="text-align: center">${ask.ASK_NO }</td>
							<td>
								<a href="/ask/detail?askNo=${ask.ASK_NO }">
									<span>${ask.ASK_TITLE }</span>
								</a>
							
							<c:forEach items="${comCnt}" var="com">
								<c:if test="${ask.ASK_NO eq com.ASK_NO}">
									<strong><span>[${com.CNT}]</span></strong>
								</c:if>
							</c:forEach>
							
							</td>
							<c:if test="${ask.USER_NICK eq null}">
								<td>탈퇴한 회원입니다</td>
							</c:if>
							<c:if test="${ask.USER_NICK ne null }">
								<td style="text-align: left;"><img alt="#"
									src="${ask.GRADE_URL}" style="width: 20px; height: 20px;">
									${ask.USER_NICK }</td>
							</c:if>
							<td style="text-align: center">${ask.ASK_HIT }</td>
							<td><fmt:formatDate value="${ask.ASK_DATE }"
									pattern="yy-MM-dd HH:mm:ss" /></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>


		<c:if test="${login }">
			<button id="btnWrite" class="btn btn-primary pull-left">글쓰기</button>
		</c:if>
		<span class="pull-right">total : ${paging.totalCount }</span>
		<div class="clearfix"></div>

		<div class="form-inline text-center">
			<input class="form-control" type="text" id="search"
				value="${param.search }" />
			<button id="btnSearch" class="btn">검색</button>
		</div>
--%>
		<div id="result">
		
		</div>
	</div><!-- .container -->
</div><!-- .wrap end -->

<%--footer--%>
<c:import url="/WEB-INF/views/layout/footer.jsp" />