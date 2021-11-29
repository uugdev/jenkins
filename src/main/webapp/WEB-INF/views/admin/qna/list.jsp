<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:import url="/WEB-INF/views/layout/head.jsp" />
<c:import url="/WEB-INF/views/layout/adminheader.jsp" />
<!-- header end -->

<!-- 개별 스타일 및 스크립트 영역 -->

<!-- <script type="text/javascript" src="https://code.jquery.com/jquery-2.2.4.min.js"></script> -->
<script type="text/javascript">
$(document).ready(function(){
	
	loadList();
	
// 	$("#btnDelete").click(function(){
	$(document).on('click', '#btnDelete', function(){
		var answer = confirm("선택한 문의글을 삭제하시겠습니까?\n※해당 작업은 되돌릴 수 없습니다!")
		var delchk = [];
   
	    $('.chk:checked').each(function(){
	        delchk.push($(this).val());
	    });
		if( answer == true ){
			location.href="/admin/qna/delete?qnaNo="+delchk;
		} else {
			return false;
		}
	})
	$(document).on('click', '#selectAll', function() {
	    if($('#selectAll').is(':checked')){
	       $('.chk').prop('checked', true);
	    } else {
	       $('.chk').prop('checked', false);
	    }
	});
	
	$(document).on('click', '.chk', function() {
	    if($('input[class=chk]:checked').length==$('.chk').length){
	        $('#selectAll').prop('checked', true);
	    }else{
	       $('#selectAll').prop('checked', false);
	    }
	});
	
	$("#orderByNo").click(function(){
		target = 1;
		var curPage = 1;
		$.ajax({
			type: "get",
			url: "/admin/qna/list/orderedList",
			data: {
				curPage: curPage,
				target: target
			},
			dataType: "html",
			success: function(res){
				console.log("AJAX 성공")
				
				result.innerHTML = res;
			},
			error: function(){
				console.log("AJAX 실패")
			}
		})
	})

	$("#orderByStatus").click(function(){
		target = 2;
		var curPage = 1;
		$.ajax({
			type: "get",
			url: "/admin/qna/list/orderedList",
			data: {
				curPage: curPage,
				target: target
			},
			dataType: "html",
			success: function(res){
				console.log("AJAX 성공")
				result.innerHTML = res;
			},
			error: function(){
				console.log("AJAX 실패")
			}
		})
	})

	/* otherwise로 로드하는 부분 */
	var target = null;
	var curPage = 1;
	
	function loadList(){
		$.ajax({
			type: "get",
			url: "/admin/qna/list/orderedList",
			data: {
				curPage: curPage,
				target: target				
			},
			dataType: "html",
			success: function(res){
				console.log("AJAX 성공")
// 				console.log(res)
				result.innerHTML = res;
			},
			error: function(){
				console.log("AJAX 실패")
			}
		})
		$("#cur").html(curPage)
	};

});
	
/* 페이지가 증가되어야 하는 부분 (+1) */
function loadCurPage(i, t){
    var curPage =  i ;
	var target = t;
    
	console.log("curP : "+ curPage);
    console.log("tg : " + target);
    
       $.ajax({
          type: "post"
          , url: "/admin/qna/list/orderedList"
          , data: { 
             curPage: curPage
             ,target: target
          }
          , dataType: "html"
          , success: function(data){
             console.log("AJAX 성공")
             console.log(data)
             result.innerHTML = data;
          }
          , error: function(){
             console.log("AJAX 실패")
          }
       })
       $("#cur").html(curPage)
 };
</script>

<style type="text/css">


.title {
	margin: 50px 0 30px 0;
}

.listTable {
	text-align: center;
	width: 100%;
	background: #fff;
	margin: auto;
	margin-bottom: 50px;
	padding-bottom: 20px;
}

.table {
	margin-top: 10px;
}

.table>tbody>tr>th {
	background: #f3f3f3;
	vertical-align: middle;
}

.table>tbody>tr>td {
	height: 30px;
	vertical-align: middle;
}

label {
	font-weight: normal !important;
}

input[type=checkbox] {
	width: 15px;
	height: 15px;
}

#orderByNo, #orderByStatus {
	color: black;
}
#orderByNo:hover, #orderByStatus:hover {
	text-decoration: underline;
	cursor: pointer;
}
</style>

<!-- 개별 영역 끝 -->

<div class="wrap">
<div class="container">

<div class="title">
	<h1>문의 목록</h1>
</div><!-- .title end -->

<div class="listTable">
<div class="pull-right">
	<a id="orderByNo">최신순</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a id="orderByStatus">미답변순</a>
</div>

<div id="result"></div>
<!-- <button id="btnDelete" class="pull-left">삭제</button> -->
<!-- <div class="clearfix"></div> -->
</div><!-- .listTable end -->

</div><!-- .container end -->
</div><!-- .wrap end -->

<!-- footer start -->
<c:import url="/WEB-INF/views/layout/footer.jsp" />
