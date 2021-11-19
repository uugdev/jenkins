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
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.4.0/Chart.min.js"></script>
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
			<c:forEach items="${itemList}" var="i">
				{
					title  : '${i.itemName}',
    	      		start  : '<fmt:formatDate value="${ i.itemDate }" pattern="YYYY-MM-dd" />',
    	      		end    : '<fmt:formatDate value="${ i.itemDate }" pattern="YYYY-MM-dd" />'
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

		var limit = uncomma($('input[name=extraMoney]').val()); //건들지마

		if( limit == ""  ) {
			alert("변경금액을 입력해주세요")
			return;
		}
		
		change = parseInt(limit); //건들지마

			$.ajax({
				type: "post"
				, url: "/account/extramoney"
				, data: { extraMoney: change }
				, dataType: "json"
				, success: function( data ) {
						console.log("성공");
						
						var data1 = data.changeMoney;
						var data1 = comma(data.changeMoney);
						
						$('.popupWrap1').addClass('hide1');
						$('#extraMoney').val('');
// 						$('#ch').html(data.changeMoney + '원')
						$('#ch').html( data1);
					

				
						
						
						
				}
				, error: function() {
					console.log("실패");
				}
			}); //ajax end
	})

 
 
})
</script>
<style type="text/css">
#calendar {
	width: 100%;
	height: 30%;
	margin-bottom: 200px;
	margin-top: 100px;
	margin-bottom: 200px;
}

.spanSize {
	font-size: x-large;
}
</style>
<!-- 개별 영역 끝 -->


<div class="wrap">
	<div class="container">

		<%-- 내부 콘텐츠 영역입니다. --%>
		<div style="display: flex;" id="plugin">

			<div id='calendar' style="flex: 4; margin-right: 50px;"></div>

			<div style="flex: 4; margin-top: 100px;">
				<!--차트가 그려질 부분-->
				<canvas id="myChart"></canvas>
				<div style="display: flex;">
					<div style="flex: 1;">
						<c:forEach items="${itemList}" var="i">
							<table class="table table-striped table-hover">
								<thead>
									<tr>
										<th>상품명</th>
										<th>상품브랜드</th>
										<th>상품가격</th>
										<th>결제날짜</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td>${i.itemName}</td>
										<td>${i.itemBrand}</td>
										<td>${i.itemPrice}</td>
										<td><fmt:formatDate value="${ i.itemDate }"
												pattern="YYYY-MM-dd" /></td>
									</tr>
								</tbody>
							</table>
						</c:forEach>
					</div>
					<div style="flex: 1;">
						<div>
							<h2 id="ch">
								<fmt:formatNumber type="number" maxFractionDigits="3"
									value="${user.extraMoney}" />
								원
							</h2>
						</div>
						<button class="popupOpen1" id="updateMoney">지출가능금액 설정하기</button>
					</div>
				</div>

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
	<div class="popup1 commaInput">
		<div class="title">
			<p>지출 가능금액을 설정해주세요</p>
			<span class="close1">❌</span>
		</div>
		<input type="text" name="extraMoney" id="extraMoney" value="" /> <span
			style="font-size: x-large;">원</span>
		<div class="btnWrap1">
			<button id="update">저장</button>
		</div>
	</div>
</div>
<script type="text/javascript">
//---인풋창 3자리마다콤마찍기---
var $input = $(".commaInput [type='text']");
// 입력 값 알아내기
$input.on('keyup', function() {
    var _this = this;
    numberFormat(_this)
});
// 콤마 찍기
function comma(str) {
    str = String(str);
    return str.replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,');
    
}
//---인풋창 3자리마다콤마찍기end---

//--------- 콤마 풀기
function uncomma(str) {
    str = String(str);
    return str.replace(/[^\d]+/g, '');
}
function numberFormat(obj) {
    obj.value = comma(uncomma(obj.value));
}
//--------- 콤마 풀기end


			var context = document
                .getElementById('myChart')
                .getContext('2d');
            var myChart = new Chart(context, {
                type: 'bar', // 차트의 형태
                data: { // 차트에 들어갈 데이터
                    labels: [
						
 							   '1월','2월','3월','4월','5월','6월','7월','8월','9월',
 							  '10월','11월','12월'
						
                    ],
                    datasets: [
                        { //데이터
                            label: '지출내역', //차트 제목
                            fill: false, // line 형태일 때, 선 안쪽을 채우는지 안채우는지
                            	
                            //여기가 지출내역 데이터입니다
                            data: [
                            	<c:forEach items="${itemSum }" var="sum">
                           			${sum.ITEM_PRICE },
                            	</c:forEach>
                            ],
                            
                            backgroundColor: [
                                //색상
                                'rgba(255, 99, 132, 0.2)',
                                'rgba(54, 162, 235, 0.2)',
                                'rgba(255, 206, 86, 0.2)',
                                'rgba(75, 192, 192, 0.2)',
                                'rgba(153, 102, 255, 0.2)',
                                'rgba(255, 159, 64, 0.2)'
                            ],
                            borderColor: [
                                //경계선 색상
                                'rgba(255, 99, 132, 1)',
                                'rgba(54, 162, 235, 1)',
                                'rgba(255, 206, 86, 1)',
                                'rgba(75, 192, 192, 1)',
                                'rgba(153, 102, 255, 1)',
                                'rgba(255, 159, 64, 1)'
                            ],
                            borderWidth: 1 //경계선 굵기
                        }/* ,
                        {
                            label: 'test2',
                            fill: false,
                            data: [
                                8, 34, 12, 24
                            ],
                            backgroundColor: 'rgb(157, 109, 12)',
                            borderColor: 'rgb(157, 109, 12)'
                        } */
                    ]
                },
                options: {
                    scales: {
                        yAxes: [
                            {
                                ticks: {
                                    beginAtZero: true
                                }
                            }
                        ]
                    }
                }
            });


            
</script>


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
