<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:import url="/WEB-INF/views/layout/head.jsp" />
<!-- header end -->

<!-- 개별 스타일 및 스크립트 영역 -->

<!-- 스마트 에디터 2 라이브러리 로드 -->
<script type="text/javascript" src="/resources/se2/js/service/HuskyEZCreator.js"></script>

<script type="text/javascript">
function submitContents(elClickedObj) {
	oEditors.getById["msgContent"].exec("UPDATE_CONTENTS_FIELD", []);
	
	try {
		elClickedObj.form.submit();
	} catch(e) {}
}

</script>

<script type="text/javascript">

$(document).ready(function () {
	
	$("#btnWrite").click(function(){
		
		var userNick = $("#userNick").val();
		
		var nickRegex = /^[가-힣a-zA-z0-9]{4,12}$/;

	
		var nickregex = nickRegex.exec(userNick);
			
		var answer = confirm("쪽지를 보내시겠습니까?");
		
		if( answer == true){
			submitContents($("#btnWrite"));
			$("form").submit();		
		} else {
			return false;

		}
	});
	
	
	$("#btnCancel").click(function() {
		window.open('','_self').close();
	})
});

function checkNick(){
    var userNick = $('#userNick').val();
    $.ajax({
        url:"/member/nickCheck",
        type: "post",
        data:{userNick:userNick},
        success:function(cnt){
        	 if(cnt != 1){ 
                 $(".nick_ok").css("display","inline-block"); 
                 $(".nick_already").css("display", "none");
                 $(".nick_check").css("display", "none");
                 $("#join").prop("disabled", false);
             } else {
                 $(".nick_already").css("display","inline-block");
                 $(".nick_ok").css("display", "none");
                 $(".nick_check").css("display", "none");
                 $("#join").prop("disabled", true);
             }
        },
        error:function(){
            alert("에러입니다");
        }
    });
};

function checkUserNick() {
	var userNick = $("#userNick").val();

    var idRegExp = /^[가-힣a-zA-z0-9]{4,12}$/;
    if (!idRegExp.test(userNick)) {
        $(".nick_already").css("display","none");
        $(".nick_ok").css("display", "none");
        $(".nick_check").css("display", "inline-block");
        return false;
    }
    return checkNick();
}

</script>

<style>

body {
	padding: 20px 0 0 0;
}
table, h3 {
	text-align: center;
	margin: 0 auto;
}

.wrap {
	width: 600px;
	padding: 0 0 30px 0;
	margin: 0 0 0 10px;

}

.buttonarea {
	margin: 0 0 0 250px;
}

.nick_ok, .nick_check {
	color:red;
	display: none;
}


</style>

<!-- 개별 영역 끝 -->

<div class="wrap">

<h3>쪽지 보내기</h3>

<form action="/message/mem/write" method="post">

<table class="table table-hover" style="width: 590px;'">
	<tr>
		<td style="width:30%"><label for="userNick">받는 사람</label></td>
		<td style="width:70%"><input type="text" id="userNick" name="userNick" required oninput="checkUserNick()"/><br>
		<span class="nick_ok">존재하지 않는 회원입니다.</span>
		<span class="nick_check">존재하지 않는 회원입니다.</span></td>
	</tr>
	
	<tr>
		<td style="width:30%"><label for="title">제목</label></td>
		<td style="width:70%"><input type="text" id="msgTitle" name="msgTitle" /></td>
	</tr>
	<tr>
		<td colspan="2"><textarea rows="10" id="msgContent" name="msgContent"></textarea></td>
	</tr>
</table>
</form>
<span class="buttonarea">
	<button id="btnWrite">보내기</button>
	<button id="btnCancel">취소</button>
</span>

</div><!-- .wrap end -->
<script type="text/javascript">
var oEditors = [];
nhn.husky.EZCreator.createInIFrame({
	oAppRef: oEditors,
	elPlaceHolder: "msgContent",
	sSkinURI: "/resources/se2/SmartEditor2Skin.html",
	fCreator: "createSEditor2"
});
</script>

</body>
</html>






