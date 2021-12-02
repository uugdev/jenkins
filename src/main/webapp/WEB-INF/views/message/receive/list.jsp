<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:import url="/WEB-INF/views/layout/head.jsp" />
<c:import url="/WEB-INF/views/layout/header.jsp" />
<!-- header end -->

<!-- 개별 스타일 및 스크립트 영역 -->
<script type="text/javascript">
function message () {
	
	action_popup.confirm("쪽지를 보내시겠습니까?", function(result) {
			
		if( result == true){
			window.open('/message/mem/write', '쪽지 보내기', 'height=500, width=620, left=400, top=500, resizable=no');
		} else {
			return false;
		}
	})
	
	$(".modal_close").on("click", function() {
		action_popup.close(this);
	});

}

</script>

<script type="text/javascript">

	$(document).ready(function() {
		
		loadList();
		
		//안읽은 쪽지 리스트
		$("#unreadList").click(function () {
//	 		console.log("#ajax clicked")
			target = 1;
			var curPage = 1;
			$.ajax({
				type: "get"
				, url: "/message/receive/list/ajax"
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
		
		//전체 쪽지
		$("#entireList").click(function () {
//	 		console.log("#ajax clicked")
			
			target = 2;
			var curPage = 1;
			$.ajax({
				type: "get"
				, url: "/message/receive/list/ajax"
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
		
		function loadList() {
			$.ajax({
				type: "get"
				, url: "/message/receive/list/ajax"
				, data: {
				curPage: curPage
				, target: target
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
	function loadCurPage(i, t){
	    var curPage =  i ;
		var target = t;
	    
		console.log("curP : "+ curPage);
	    console.log("tg : " + target);
	    
	       $.ajax({
	          type: "post"
	          , url: "/message/receive/list/ajax"
	          , data: { 
	             curPage: curPage
	             ,target: target
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
		

    

</script>

<script type="text/javascript">
$(document).ready(function(){
	
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
	
	$("#btnDelete").click(function() {
		var delchk = [];
   
	    $('.chk:checked').each(function(){
	        delchk.push($(this).val());
	    });
		
	    action_popup.confirm("선택한 쪽지를 삭제하시겠습니까? 해당 작업은 되돌릴 수 없습니다.", function(result) {
			
			if( result == true){
				location.href="/message/receive/delete?msgNo="+delchk;
			} else {
				return false;
			}
		})
		
		/* 닫는 창으로 꼭 필요함 */
		$(".modal_close").on("click", function() {
			action_popup.close(this);
		});
	})
})
	
// 	$("#unreadList").click(function () {
		
// 		$.ajax({
// 			type: "get"
// 			, url: "/message/receive/unread/list"
// 			, data: {}
// 			, dataType: "html"
// 			, success: function ( res ) {
// 				console.log("AJAX 성공")
				
// 				$("#resultArea").html( res )
				
// 			}
// 			, error: function () {
// 				console.log("AJAX 실패")
// 			}
// 		})
// 	})
	
// 	$("#entireList").click(function () {
		
// 		$.ajax({
// 			type: "get"
// 			, url: "/message/receive/entire/list"
// 			, data: {}
// 			, dataType: "html"
// 			, success: function ( res ) {
// 				console.log("AJAX 성공")
				
// 				$("#resultArea").html( res )
				
// 			}
// 			, error: function () {
// 				console.log("AJAX 실패")
// 			}
// 		})
// 	})


</script>

<style>

#messageWrite {
    margin: 0 0 0 45px;
}

#btnDelete {
    margin: 0 0 100px 60px;
}

.listArea {
	margin : 0 0 0 800px;
}

body {
	background-color: #f2f2f2;
}

#result {
	background-color: #fff;
	padding: 20px 50px 20px 50px;
	margin: 0 0 50px 0;
	
}

.titlearea > p {
	color: #85969E;
}

a {
	color: #667F92;
}

a:hover {
	cursor: pointer;
}

#btnDelete {
	width: 55px;
	height: 35px;
	border-radius: 0px;
	border: 0px;
	background: #5b6e7a;
	color: #f3f3f3;
	margin: 0 0 100px 40px;

}

#btnDelete:hover {
	border: 1px solid #5b6e7a;
	background: #fff;
	color: #5b6e7a;
	transition: all .2s ease-in-out;
}

#messageWrite {
	margin: 0 0 0 45px;
}

</style>

<!-- 개별 영역 끝 -->

<div class="wrap">
<div class="container">
<div style="height: 30px;"></div>
<div class=pull-left>
	<a id="messageWrite" onclick="message()">쪽지 보내기</a>&nbsp;|&nbsp;<a href="/message/send/list">보낸 쪽지함</a><br>
</div>
<div style="height:10px;"></div>

<h3>받은 쪽지함</h3>

<div class="listArea">
	<a id="entireList">전체 쪽지 보기</a>&nbsp;|&nbsp;<a id="unreadList">안읽은 쪽지 보기</a>
</div>

<div style="height: 30px;"></div>

<div id="result">

</div> <!-- #result end -->
<div class="clearfix"></div>


</div><!-- .container end -->
</div><!-- .wrap end -->


<!-- footer start -->
<c:import url="/WEB-INF/views/layout/footer.jsp" />
