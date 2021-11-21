<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script type="text/javascript">

$(function () { /* $(document).ready(function() { 와 똑같은 역할 */
	
	/* confirm 사용 예시 */
    $(document).on("click", "#confirm", function () {
        action_popup.confirm("되돌릴 수 없습니다. 정말로 삭제 하시겠습니까?", function (res) {
            if (res) {
            	
            	/* ----------------------------------------- */
            	
            	/* 실행하고 싶은 스크립트를 작성하는 곳 */
            	
            	/* ----------------------------------------- */
               
            }
        })
    });
    
	/* alert 사용 예시 */
    $(document).on("click", "#alert", function () { /* #alert를 클릭했을 경우 */
        action_popup.alert("경고"); /* action_popup.alert를 실행시켜 alert창을 띄워준다 */
    });
	
	/* 닫는 창으로 꼭 필요함 */
    $(".modal_close").on("click", function () {
        action_popup.close(this);
    });
    
});




/* /trade/update 에 사용했던 예시 */

$(function () {
	
    $(document).on("click", "#confirm", function () {
        action_popup.confirm("되돌릴 수 없습니다. 정말로 삭제 하시겠습니까?", function (res) {
            if (res) {
            	
        		$.ajax({
        			type: "post"
        			, url: "/trade/update/deletefile"
        			, dataType: "json"
        			, data: {
        				fileStored: "${tradeDetail.FILE_STORED }"
        			}
        			, success: function(data){
        				if(data.success) {
        					$("#fileArea").html("기존에 있던 파일을 삭제했습니다!");
        				} else {
        					action_popup.alert("삭제 실패!");
        				}
        			}
        			, error: function() {
        				console.log("error");
        			}
        		});
            	
                action_popup.alert("삭제가 완료되었습니다.");
            }
        })
    });
    
    $(".modal_close").on("click", function () {
        action_popup.close(this);
    });
    
});

/* ------------------------------ */
</script>

</head>
<body>

</body>
</html>