<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:import url="/WEB-INF/views/layout/head.jsp" />

<!-- header end -->

<!-- 개별 스타일 및 스크립트 영역 -->

<style>

button {
    height: 35px;
    width: 65px;
    border-radius: 0px;
    border: 0px;
    background: #5b6e7a;
    color: #f3f3f3;
}

.error {
	margin: 0 auto;
}

.flexbody {
	display: flex;

}

.ment {
	margin: 0 auto;
}

.buttonarea {
	margin: 0 auto;
}

.ment {
	margin-bottom: 40px;
}



</style>

<script type="text/javascript">

$(document).ready(function(){
	$("#btnBack").click(function(){
		history.go(-1);
	})
})

</script>
<!-- 개별 영역 끝 -->

<div class="wrap">
	<div class="flexbody" style="width: 600px; ">
		<div class="error" style="width: 150px; height:150px;">
			<img width="100%;" height="100%;" alt="금지" src="https://i.imgur.com/OlYEpre.png">
		</div>
	</div>
		<div class="mentarea" style="width: 600px;">
			<div class="ment" style="width: 288px;">
				<h3><strong>존재하지 않는 닉네임입니다.<br>
				닉네임을 다시 확인해주세요!</strong></h3>
			</div>
			<div class="buttonarea" style="width:65px;">
				<button id="btnBack">이전으로</button>
			</div>
		</div>
		
</div><!-- .wrap end -->

<!-- footer start -->
</body>
</html>
