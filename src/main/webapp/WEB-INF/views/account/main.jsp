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
		
    	headerToolbar: {
    		
    		left: 'title',
    		right: 'dayGridMonth,today prev,next'
    		
    	},
    	
    	initialView: 'dayGridMonth',
        nowIndicator: true, // 현재 시간 마크
        dayMaxEvents: true, // 이벤트가 오버되면 높이 제한 (+ 몇 개식으로 표현)
        editable : true,
        eventLimit : true,
		events: [ 
			
			<c:forEach items="${bDay}" var="b">
			{
				color : "#FFF",
                backgroundColor: '#FFF',
                textColor : "red",
                title  : '🎉B-DAY',	
	      		start  : '<fmt:formatDate value="${b}" pattern="YYYY-MM-dd" />',
	      		end  : '<fmt:formatDate value="${b}" pattern="YYYY-MM-dd" />',
	    	},
	    	
	    	
	    	</c:forEach>
	    	
	    	
			<c:forEach items="${itemList}" var="i">
				{
					
					color : "#EEA54C",
	                textColor : "white",
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
	var context2 = document
    .getElementById('myChart2')
    .getContext('2d');
var myChart2 = new Chart(context2, {
    type: 'doughnut', // 차트의 형태
    data: { // 차트에 들어갈 데이터
        labels: [
            //x 축
        	<c:forEach items="${monthItemList }" var="mon">
					'${mon.itemName }', 
			</c:forEach>
            '지출가능금액'
        ],
        datasets: [
            { //데이터
                data: [
                	<c:forEach items="${monthItemList }" var="sum">
                		${sum.itemPrice },
            		</c:forEach>
                		${user.extraMoney} - ${monthPrice}
                ],
                
                holeSize: 0.6,
                animationSpeed: 0.5,
                
                
                backgroundColor: [
                    //색상
                    '#DE92C6',
                    'rgba(54, 162, 235, 1)',
                    'rgba(255, 206, 86, 1)',
                    'rgba(75, 192, 192, 1)',
                    'rgba(153, 102, 255,1)',
                    'rgba(255, 159, 64, 1)',
                    'rgba(255, 99, 132, 1)',
                    '#6AC28B',
                    '#C10D25',
                    '#847E8C',
                    '#BCB84A',
                    '#035100'
                ],
                borderColor: [
                    //경계선 색상
                    'white',
                    'white',
                    'white',
                    'white',
                    'white',
                    'white',
                    'white',
                    'white',
                    'white',
                    'white',
                    'white',
                    'white'
                ],
                borderWidth: 1 //경계선 굵기
            }
        ]
    },
    options: {
    	
    	title: { 
    		display: true, // 차트 제목 
    		text: '이번달 지출내역'
    	},
    	legend: {
            display: true,
            position: "top"
          },
    	
    	
    	responsive: true, 
    	maintainAspectRatio: false,
        scales: {
            Axes: [
                {
                	scaleLabel:{
                	    display: false
                	},
            		ticks: {
                		display:false // it should work
                 	}
                }
            ]
        }
    }
});
	
	
	$("#update").click(function() {

		var limit = uncomma($('input[name=extraMoney]').val()); //건들지마

		if( limit == ""  ) {
			action_popup.alert("변경금액을 입력해주세요");
			$(".modal_close").on("click", function () {
		        action_popup.close(this);
		    });
			
// 			return;
		}
		
		
		
		var change = parseInt(limit); //건들지마

			$.ajax({ 
				type: "post"
				, url: "/account/extramoney"
				, data: { extraMoney: change }
				, dataType: "json"
				, success: function( data ) {
						console.log("성공");
						
						var data1 = data.changeMoney;
						var data1 = comma(data1);
						  
						var data2 = data.sub;
						var data2 = comma(data2);
						var arr = [];
						var arr = data.arr;
						
						$('.popupWrap1').addClass('hide1');
						$('#extraMoney').val('');
						$('#ch').html( data1 + '원');
						$('#subMoney').html( data2 + '원');
						
						myChart2.data.datasets[0].data= arr;
						myChart2.update();
						
				}
				, error: function() {
					console.log("실패");
				}
			}); //ajax end
	})

 
 
})
</script>
<style type="text/css">
/*요일*/
.fc-col-header-cell-cushion {
	color: #000;
}

.fc-col-header-cell-cushion:hover {
	text-decoration: none;
	color: #000;
}
/*일자*/
.fc-daygrid-day-number {
	color: #000;
	font-size: 1em;
}

.fc-event-title.fc-sticky {
	white-space: normal;
}

#calendar {
	
}

.spanSize {
	font-size: x-large;
}

#plugin {
	height: 515px;
	display: flex;
	margin-top: 100px;
	margin-bottom: 50px;
}

#calendar {
	flex: 1;
	margin-right: 50px;
}

#chartJs {
	flex: 1;
	height: 500px;
}

#barChart {
	height: 250px;
	border: 1px solid #ccc;
	border-radius: 5px;
	margin-bottom: 10px;
}

#doughnut {
	width: 50%;
	height: 240px;
	flex: 1;
	margin-left: 10px;
}

#btnMoney {
	width: 50%;
	height: 250px;
	flex: 1;
	align-items: center;
}

#monthMoney {
	display: flex;
	border: 1px solid #ccc;
	border-radius: 5px;
	box-shadow: 2px 2px 2px 2px rgb(0, 0, 0, 0.12);
}

#updateMoney {
	box-shadow: 2px 2px 2px 2px rgb(0, 0, 0, 0.12);
	line-height: 30px;
	font-size: large;
	width: 150px;
	height: 35px;
	background: #337ab7;
	border-color: #337ab7;
	color: white;
	border-radius: 5px;
	padding: 0;
}

#itemlist {
	display: flex;
	margin-bottom: 100px;
}

#bill {
	width: 50%;
	flex: 1;
}

#ment {
	width: 50%;
	height: 250px;
	flex: 1;
	margin-left: 26px;
	border: 1px solid #ccc;
	border-radius: 5px;
	text-align: left;
	padding-left: 20px;
	padding-bottom: 20px;
}
</style>
<!-- 개별 영역 끝 -->


<div class="wrap">
	<div class="container">

		<%-- 내부 콘텐츠 영역입니다. --%>
		<div id="plugin">

			<div id='calendar'></div>


			<div id="chartJs">
				<div id="barChart">
					<!--차트가 그려질 부분-->
					<canvas id="myChart" style=""></canvas>
				</div>
				<div id="monthMoney">
					<!-- 기본 도넛차트 -->
					<div id="doughnut">
						<canvas id="myChart2"></canvas>
					</div>
					<div style="position: relative;" id="btnMoney">
						<div>
							<h3 style="margin-top: 50px;">이번달 지출한도</h3>
							<h3 id="ch" style="margin-top: 0">
								<fmt:formatNumber type="number" maxFractionDigits="3"
									value="${user.extraMoney}" />
								원
							</h3>
						</div>
						<button class="popupOpen1" id="updateMoney">지출한도 수정하기</button>
						<div class="popupWrap1 hide1">
							<div class="popup1 commaInput">
								<div class="title">
									<p>지출 가능 금액 설정</p>
									<span class="close1">❌</span>
								</div>
								<input type="text" name="extraMoney" id="extraMoney" value="" />
								<span style="font-size: 24px;">원</span>
								<div class="btnWrap1">
									<button id="update">저장</button>
								</div>
							</div>
						</div>
					</div>
				</div>

			</div>
		</div>

		<div id="itemlist">
			<div id="bill">
				<table class="table table-striped table-hover">
					<tr>
						<th>상품명</th>
						<th>상품브랜드</th>
						<th>상품가격</th>
						<th>결제날짜</th>
					</tr>
					<c:forEach items="${monthItemList}" var="i">
						<tr>
							<td>${i.itemName}</td>
							<td>${i.itemBrand}</td>
							<td><fmt:formatNumber type="number" maxFractionDigits="3"
									value="${i.itemPrice}" /></td>
							<td><fmt:formatDate value="${ i.itemDate }"
									pattern="YYYY-MM-dd" /></td>
						</tr>
					</c:forEach>
					<tr>
						<th></th>
						<th></th>
						<th>이번달지출액</th>
						<th>지출가능금액</th>
					</tr>
					<tr>
						<td></td>
						<td></td>
						<td id="monthPrice"><fmt:formatNumber type="number"
								maxFractionDigits="3" value="${monthPrice}" />원</td>
						<td id="subMoney"><fmt:formatNumber type="number"
								maxFractionDigits="3" value="${subMoney}" />원</td>
					</tr>
				</table>
			</div>
			<div id="ment">
				<c:if test="${monthPrice gt last}">
					<h2>이번 달 지출금액은 지난 달보다</h2>
					<div>
						<span style="color: red; font-size: 32px;"> <fmt:formatNumber
								type="number" maxFractionDigits="3" value="${compare}" />원
						</span> <span style="font-size: 30px;">더 쓰셨네요!</span>
					</div>
					<div style="width: 150px; height: 120px; margin-right: 20px;"
						class="pull-right">
						<img style="width: 100%; height: 100%;"
							src="https://i.imgur.com/OqXy9GH.png" alt="더씀" />
					</div>
				</c:if>

				<c:if test="${monthPrice lt last}">
					<h2>이번 달 지출금액은 지난 달보다</h2>
					<div>
						<span style="color: blue; font-size: 32px;"> <fmt:formatNumber
								type="number" maxFractionDigits="3" value="${compare}" />원
						</span> <span style="font-size: 30px;">덜 쓰셨네요!</span>
					</div>
					<div style="width: 150px; height: 120px; margin-right: 20px;"
						class="pull-right">
						<img style="width: 100%; height: 100%;"
							src="https://i.imgur.com/CuGkpYF.png" alt="덜씀" />
					</div>
				</c:if>

				<c:if test="${monthPrice eq last}">
					<h2>이번 달 지출금액은 지난 달과 같아요</h2>
					<div style="width: 150px; height: 120px; margin-right: 20px; margin-top: 40px;"
						class="pull-right">
						<img style="width: 100%; height: 100%;"
							src="https://i.imgur.com/Rg5O9bR.png" alt="같음" />
					</div>
				</c:if>
			</div>
		</div>



		<%-- 내부 콘텐츠 영역입니다. --%>
		<!-- .container end -->
	</div>
	<!-- footer start -->
	<c:import url="/WEB-INF/views/layout/footer.jsp" />

	<!-- .wrap end -->
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
	                            label: '월별 지출내역', //차트 제목
	                            fill: false, // line 형태일 때, 선 안쪽을 채우는지 안채우는지
	                            	
	                            //여기가 지출내역 데이터입니다
	                            data: [
	                            	<c:forEach items="${itemSum }" var="sum">
	                           			${sum.ITEM_PRICE },
	                            	</c:forEach>
	                            ],
	                            
	                            backgroundColor: [
	                                //색상
	                                '#4E79A6',
	                                '#4E79A6',
	                                '#4E79A6',
	                                '#4E79A6',
	                                '#4E79A6',
	                                '#4E79A6',
	                                '#4E79A6',
	                                '#4E79A6',
	                                '#4E79A6',
	                                '#4E79A6',
	                                '#4E79A6',
	                                '#4E79A6',
// 	                            	'rgba(255, 99, 132, 0.8)',
// 	                                'rgba(54, 162, 235, 0.8)',
// 	                                'rgba(255, 206, 86, 0.8)',
// 	                                'rgba(75, 192, 192, 0.8)',
// 	                                'rgba(153, 102, 255,0.8)',
// 	                                'rgba(255, 159, 64, 0.8)',
	                            ],
	                            borderColor: [
	                                //경계선 색상
	                            	'white',
	                                'white',
	                                'white',
	                                'white',
	                                'white',
	                                'white',
	                                'white',
	                                'white',
	                                'white',
	                                'white',
	                                'white',
	                                'white'
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
	                	maintainAspectRatio: false,
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
