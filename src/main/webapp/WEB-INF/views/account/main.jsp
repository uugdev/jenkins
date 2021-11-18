<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%--     <%@page isELIgnored="false" %> --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:import url="/WEB-INF/views/layout/head.jsp" />
<c:import url="/WEB-INF/views/layout/header.jsp" />
<!-- header end -->

<!-- 개별 스타일 및 스크립트 영역 -->
<!-- fullcalender -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/fullcalendar@5.10.1/main.css">
<script src="https://cdn.jsdelivr.net/npm/fullcalendar@5.10.1/main.js"></script>
<link rel="stylesheet" type="text/css"
	href="/resources/css/extraMoney.css">
<script>
document.addEventListener('DOMContentLoaded', function() {
	var calendarEl = document.getElementById('calendar');
    var calendar = new FullCalendar.Calendar(calendarEl, {
		initialView: 'dayGridMonth',
        nowIndicator: true, // 현재 시간 마크
        dayMaxEvents: true, // 이벤트가 오버되면 높이 제한 (+ 몇 개식으로 표현)
    	 
		events: [ 
			<c:forEach items="${itemList}" var="item">
				{
					title  : '${item.itemName}',
    	      		start  : '<fmt:formatDate value="${ item.itemDate }" pattern="YYYY-MM-dd" />',
    	      		end    : '<fmt:formatDate value="${ item.itemDate }" pattern="YYYY-MM-dd" />'
    	    	},
    	    </c:forEach>
		]
	});
	calendar.render();
});
</script>
<script type="text/javascript">
$(document).ready(function() {
	$("#update").click(function() {
	
		if($("#extraMoney").val() == ""  ) {
			
			alert("변경금액을 입력해주세요")
			return;
			
		} else {
			
			$("form").submit();
			
		}
		
	})
	
})
</script>

<style type="text/css">
#calendar {
	width: 50%;
	margin-top: 100px;
	margin-bottom: 200px;
	margin-top: 100px;
}
</style>
<!-- 개별 영역 끝 -->


<div class="wrap">
	<div class="container">

		<div style="display: flex;">
			<%-- 내부 콘텐츠 영역입니다. --%>

			<div id='calendar' style="flex: 2"></div>

			<div style="flex: 1; margin-top: 100px;">
				<div style="margin-top: 10px; text-align: right;">
					<h2>${user.extraMoney}원</h2>
				</div>
				<button class="popupOpen1 pull-right" id="updateMoney">지출
					가능금액 설정하기</button>
			</div>
		</div>


		<%-- 내부 콘텐츠 영역입니다. --%>
	<!-- .container end -->
	</div>
<!-- footer start -->
<c:import url="/WEB-INF/views/layout/footer.jsp" />

<!-- .wrap end -->
</div>
<div class="popupWrap1 hide1">
	<form action="/account/extramoney" method="post">
		<input type="hidden" name="userNo" value="${userNo }" />
		<div class="popup1">
			<div class="title">
				<p>지출 가능금액을 설정해주세요</p>
				<span class="close1">❌</span>
			</div>
			<input type="number" name="extraMoney" id="extraMoney" /> 
			<span style="font-size: x-large;">원</span>
			<div class="btnWrap1">
				<button type="button" id="update">저장</button>
			</div>
		</div>
	</form>
</div>

<script>
	$('.popupOpen1').on('click', function() {
		$('.popupWrap1').removeClass('hide1');
	});
	$('.close1').on('click', function() {
		$(this).parents('.popupWrap1').addClass('hide1');
		$(this).parents('.popup1').children('#extraMoney').val('');
	});

// 	$(".btnWrap1").click(function() {
// 		$(this).parents("form").submit();
// 	});
</script>
