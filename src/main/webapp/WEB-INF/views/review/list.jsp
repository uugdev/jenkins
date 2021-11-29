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
body {
	background: #f2f2f2;
}

.title {
	margin: 50px 0;
}

.title > p {
	color: #85969E;
}

.listTable {
	text-align: center;
	width: 100%;
	background: #fff;
	margin: auto;
	margin-bottom: 50px;
	padding: 50px;
	padding-bottom: 20px;
}

th {
	background: #f3f3f3;
}

.table>tbody>tr>td {
	height: 50px;
	vertical-align: middle;
}

.table>tbody>tr>td>a {
	color: #000;
}
.table>tbody>tr>td>a:hover {
	color: #85969E;
	text-decoration: none;
}

#btnWrite {
	height: 35px;
	width: 65px;
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
</style>

<div class="wrap">
<div class="container">
	
<div class="title">	
<h1 style="text-align: center;">후기</h1>
<p>질문한 제품을 구매하셨다면 후기를 남겨주세요.</p>
</div>

<div class="listTable">
<div class="pull-right" style="margin-bottom: 20px;">
	<a id="hitList">조회순</a>
	<a id="latestList">최신순</a>
	<a id="itemList">이미지순</a>
</div>
	
<div id="result">
<!-- ajax로 리스트가 불러올 영역 -->
</div>
</div><!-- .listTable end -->

</div><!-- .container -->
</div><!-- .wrap end -->



<%--footer--%>
<c:import url="/WEB-INF/views/layout/footer.jsp" />