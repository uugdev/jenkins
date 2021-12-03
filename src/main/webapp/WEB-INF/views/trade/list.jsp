<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:import url="/WEB-INF/views/layout/head.jsp" />
<c:import url="/WEB-INF/views/layout/header.jsp" />
<!-- header end -->

<!-- 개별 스타일 및 스크립트 영역 -->

<script type="text/javascript">

	$(document).ready(function() {
		
		loadList()
		
		$(document).on("click", "#btnWrite", function(){
			$(location).attr("href", "/trade/write");
		})

		//검색 버튼 클릭
// 		$("#btnSearch").click(function() {
// 			location.href = "/trade/list?search=" + $("#search").val();
// 		});
		
		//검색 버튼 클릭
		$(document).on("click", "#btnSearch", function(){
			search = $("#search").val();
			console.log(search)
			loadList()
		});
		
		//조회순으로 정렬 처리
		$("#hitList").click(function () {
//	 		console.log("#ajax clicked")
			target = 1;
			var curPage = 1;
			$.ajax({
				type: "get"
				, url: "/trade/list/ajax"
				, data: {
					curPage: curPage
					, target: target
				}
				, dataType: "html"
				, success: function ( res ) {
					console.log("AJAX 성공")
					result.innerHTML = res;
				}
				, error: function () {
					console.log("AJAX 실패")
				}
			})
		})
		
		//최신순으로 정렬 처리
		$("#latestList").click(function () {
//	 		console.log("#ajax clicked")
			
			target = 2;
			var curPage = 1;
			$.ajax({
				type: "get"
				, url: "/trade/list/ajax"
				, data: {
					curPage: curPage
					, target: target
				}
				, dataType: "html"
				, success: function ( res ) {
					console.log("AJAX 성공")
					result.innerHTML = res;
				}
				, error: function () {
					console.log("AJAX 실패")
				}
			})
		})

		//이미지로 정렬 처리
		$("#picList").click(function () {
//	 		console.log("#ajax clicked")
			
			target = 3;
			var curPage = 1;
			$.ajax({
				type: "get"
				, url: "/trade/list/ajax"
				, data: {
					curPage: curPage
					, target: target
				}
				, dataType: "html"
				, success: function ( res ) {
					console.log("AJAX 성공")
					result.innerHTML = res;
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
				, url: "/trade/list/ajax"
				, data: {
				curPage: curPage
				, target: target
				, search: search
				}
				, dataType: "html"
				, success: function(res){
					console.log("AJAX 성공")
					result.innerHTML = res;
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
	          , url: "/trade/list/ajax"
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

td:nth-child(2) {
	text-align: left;
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

.listArea {
    text-align: center;
    width: 100%;
    background: #fff;
    margin: auto;
    margin-bottom: 50px;
    padding: 50px;
    padding-bottom: 20px;
    margin-top: 10px;
}

body {
	background: #f2f2f2;
}

.table>tbody>tr>td>a {
    color: #000;
}

a:hover {
    color: #85969E;
    text-decoration: none;
    cursor: pointer;
}

a {
    color: #000;
}

.btnSearch:hover {
	border: 1px solid #5b6e7a;
	background: #fff;
	color: #5b6e7a;
	transition: all .2s ease-in-out;
}

.btnSearch {
	height: 35px;
	width: 65px;
	border-radius: 0px;
	border: 0px;
	background: #5b6e7a;
	color: #f3f3f3;
}

.tomato > a {
	color: tomato;
}

.tomato > a:hover {
	color: #ffaa9a;
}

li {
	cursor: default !important;
}

</style>

<!-- 개별 영역 끝 -->

<div class="wrap">
	<div class="container">
	
		<h1>거래</h1>
		<hr>
			
		<div class="listArea">
			<div class="pull-right" style="margin-bottom: 10px;">
				<a id="latestList">최신순</a>
				<a id="hitList">조회순</a>
				<a id="picList">이미지</a>
			</div>
			
			<div id="result"></div>
		</div>
		
	</div><!-- .container end -->
</div><!-- .wrap end -->
<!-- footer start -->
<c:import url="/WEB-INF/views/layout/footer.jsp" />


