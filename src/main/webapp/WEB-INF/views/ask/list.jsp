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

		$(document).on("click", "#btnWrite", function() {
			$(location).attr("href", "/ask/write");
		})

		$(document).on("click", "#btnSearch", function() {
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
		$("#hitList").click(function() {
			target = 1;
			var curPage = 1;
			$.ajax({
				type : "get",
				url : "/ask/list/hit",
				data : {
					curPage : curPage,
					target : target
				},
				dataType : "html",
				success : function(res) {
					console.log("AJAX 성공")
					result.innerHTML = res;

				},
				error : function() {
					console.log("AJAX 실패")
				}
			})
		})

		//최신순으로 정렬 처리
		$("#latestList").click(function() {

			target = 2;
			var curPage = 1;
			$.ajax({
				type : "get",
				url : "/ask/list/hit",
				data : {
					curPage : curPage,
					target : target
				},
				dataType : "html",
				success : function(res) {
					console.log("AJAX 성공")
					result.innerHTML = res;

				},
				error : function() {
					console.log("AJAX 실패")
				}
			})
		})

		//사진순으로 정렬 처리
		$("#itemList").click(function() {

			target = 3;
			var curPage = 1;
			$.ajax({
				type : "get",
				url : "/ask/list/hit",
				data : {
					curPage : curPage,
					target : target
				},
				dataType : "html",
				success : function(res) {
					console.log("AJAX 성공")
					result.innerHTML = res;

				},
				error : function() {
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
				type : "get",
				url : "/ask/list/hit",
				data : {
					curPage : curPage,
					target : target,
					search : search
				},
				dataType : "html",
				success : function(res) {
					console.log("AJAX 성공")
					result.innerHTML = res;
				},
				error : function() {
					console.log("AJAX 실패")
				}
			})
			$("#cur").html(curPage)
		}
		;

	});

	//페이지가 증가되야하는 부분 (+1)
	function loadCurPage(i, t, s) {
		var curPage = i;
		var target = t;
		var search = s;

		console.log("curP : " + curPage);
		console.log("tg : " + target);
		console.log("sc : " + search);

		$.ajax({
			type : "post",
			url : "/ask/list/hit",
			data : {
				curPage : curPage,
				target : target,
				search : search
			},
			dataType : "html",
			success : function(data) {
				console.log("AJAX 성공")
				console.log(data)
				result.innerHTML = data;

			},
			error : function() {
				console.log("AJAX 실패")
			}
		})
		$("#cur").html(curPage)
	}

	function reportStatusY() {

		action_popup.alert("신고된 게시물로 접근이 불가합니다");

		$(".modal_close").on("click", function() {
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

.title>p {
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
	margin-top: 10px;
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

a {
	color: #000;
}

a:hover {
	color: #85969E;
	text-decoration: none;
	cursor: pointer;
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
		<div class="title">
			<h1><a href="/ask/list">머니토론</a></h1>
			<p>회원들의 선택은 머니?</p>
		</div>
		<div class="listTable">
			<div class="pull-right" style="margin-bottom: 20px;">
				<a id="latestList">최신순</a> <a id="hitList">조회순</a> <a id="itemList">이미지</a>
			</div>

			<div id="result"></div>
		</div>
	</div>
	<!-- .container -->
</div>
<!-- .wrap end -->

<%--footer--%>
<c:import url="/WEB-INF/views/layout/footer.jsp" />