<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:import url="/WEB-INF/views/layout/head.jsp" />
<c:import url="/WEB-INF/views/layout/header.jsp" />
<!-- header end -->

<!-- 개별 스타일 및 스크립트 영역 -->
<!-- fullcalender -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/fullcalendar@5.10.1/main.css">
<script src="https://cdn.jsdelivr.net/npm/fullcalendar@5.10.1/main.js"></script>
<script>

      document.addEventListener('DOMContentLoaded', function() {
        var calendarEl = document.getElementById('calendar');
        var calendar = new FullCalendar.Calendar(calendarEl, {
          initialView: 'dayGridMonth',
          nowIndicator: true, // 현재 시간 마크
          dayMaxEvents: true, // 이벤트가 오버되면 높이 제한 (+ 몇 개식으로 표현)
    	  events: [ 
    	 
    	    {
    	      title  : '${itemList.itemName}',
    	      start  : '${itemList.item}',
    	      end    : '2021-11-17'
    	    }
		]
        });
        
    	  
        calendar.render();
        
      });
        
        
        

      
      
</script>

<style type="text/css">
#calendar {
	width: 50%;
	margin-top: 100px;
	margin-bottom: 200px;
}
</style>
<!-- 개별 영역 끝 -->


<div class="wrap">
<div class="container">

<%-- 내부 콘텐츠 영역입니다. --%>
    
<div id='calendar'></div>


<%-- 내부 콘텐츠 영역입니다. --%>
</div><!-- .container end -->
</div><!-- .wrap end -->

<!-- footer start -->
<c:import url="/WEB-INF/views/layout/footer.jsp" />

