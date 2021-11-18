<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.Date" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:import url="/WEB-INF/views/layout/head.jsp" />
<c:import url="/WEB-INF/views/layout/header.jsp" />
<!-- header end -->

<!-- 개별 스타일 및 스크립트 영역 -->
<link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/resources/css/main.css" />
<!-- 개별 영역 끝 -->

<%
    Date date = new Date();
    SimpleDateFormat simpleDate = new SimpleDateFormat("MMdd");
    String fmtDate = simpleDate.format(date);
%>

<div class="wrap">
    <div class="container-fluid" style="background-color: black;">
        <div class="container" style="padding: 0; margin-bottom: 25px;">
            <div class="col-md-8" style="margin-top: 25px;">
            	<div>
	                <div>
			           	<!-- 인기 게시글 -->
						<div class="table-responsive" style="background-color:#eee;">
							<p style="font-size: 25px; text-align: left;">
								<img alt="fire" src="https://i.imgur.com/9LX0LXQ.png" width="30px;" height="30px;"> 현재 뜨거운 게시글
							</p>
                            <c:set var="setDate" value="<%= date %>" />
                            <c:set var="fmtDate" value="<%= fmtDate %>" />
                            <table class="table" id="popular_table">
                                <tr>
                                    <td><img alt="#" src="/upload/${popularBoard[0].FILE_STORED }"></td>
                                    <td>
                                        <a href="/ask/detail?askNo=${popularBoard[0].ASK_NO }">
                                            <c:if test="${popularBoard[0].VOTE_END gt setDate }">
                                                [진행] ${popularBoard[0].ASK_TITLE }
                                            </c:if>
                                            <c:if test="${popularBoard[0].VOTE_END lt setDate }">
                                                [종료] ${popularBoard[0].ASK_TITLE }
                                            </c:if>
                                            <p>${popularBoard[0].USER_NICK } / 
                                                <c:if test="${popularBoard[0].MMDDASK_DATE eq fmtDate }">
                                                    <fmt:formatDate value="${popularBoard[0].ASK_DATE }"  pattern="HH:ss"/>
                                                </c:if>
                                                <c:if test="${popularBoard[0].MMDDASK_DATE ne fmtDate }">
                                                    <fmt:formatDate value="${popularBoard[0].ASK_DATE }"  pattern="MM-dd"/>
                                                </c:if>
                                            </p>
                                        </a>
                                    </td>
                                    <td><img alt="#" src="/upload/${popularBoard[1].FILE_STORED }"></td>
                                    <td>
                                        <a href="/ask/detail?askNo=${popularBoard[1].ASK_NO }">
                                            <c:if test="${popularBoard[1].VOTE_END gt setDate }">
                                                [진행] ${popularBoard[1].ASK_TITLE }
                                            </c:if>
                                            <c:if test="${popularBoard[1].VOTE_END lt setDate }">
                                                [종료] ${popularBoard[1].ASK_TITLE }
                                            </c:if>
                                            <p>${popularBoard[1].USER_NICK } / 
                                                <c:if test="${popularBoard[1].MMDDASK_DATE eq fmtDate }">
                                                    <fmt:formatDate value="${popularBoard[1].ASK_DATE }"  pattern="HH:ss"/>
                                                </c:if>
                                                <c:if test="${popularBoard[1].MMDDASK_DATE ne fmtDate }">
                                                    <fmt:formatDate value="${popularBoard[1].ASK_DATE }"  pattern="MM-dd"/>
                                                </c:if>
                                            </p>
                                        </a>
                                    </td>
                                </tr>
                                <tr>
                                    <td><img alt="#" src="/upload/${popularBoard[2].FILE_STORED }"></td>
                                    <td>
                                        <a href="/ask/detail?askNo=${popularBoard[2].ASK_NO }">
                                            <c:if test="${popularBoard[2].VOTE_END gt setDate }">
                                                [진행] ${popularBoard[2].ASK_TITLE }
                                            </c:if>
                                            <c:if test="${popularBoard[2].VOTE_END lt setDate }">
                                                [종료] ${popularBoard[2].ASK_TITLE }
                                            </c:if>
                                            <p>${popularBoard[2].USER_NICK } / 
                                                <c:if test="${popularBoard[2].MMDDASK_DATE eq fmtDate }">
                                                    <fmt:formatDate value="${popularBoard[2].ASK_DATE }"  pattern="HH:ss"/>
                                                </c:if>
                                                <c:if test="${popularBoard[2].MMDDASK_DATE ne fmtDate }">
                                                    <fmt:formatDate value="${popularBoard[2].ASK_DATE }"  pattern="MM-dd"/>
                                                </c:if>
                                            </p>
                                        </a>
                                    </td>
                                    <td><img alt="#" src="/upload/${popularBoard[3].FILE_STORED }"></td>
                                    <td>
                                        <a href="/ask/detail?askNo=${popularBoard[3].ASK_NO }">
                                            <c:if test="${popularBoard[3].VOTE_END gt setDate }">
                                                [진행] ${popularBoard[3].ASK_TITLE }
                                            </c:if>
                                            <c:if test="${popularBoard[3].VOTE_END lt setDate }">
                                                [종료] ${popularBoard[3].ASK_TITLE }
                                            </c:if>
                                            <p>${popularBoard[3].USER_NICK } / 
                                                <c:if test="${popularBoard[3].MMDDASK_DATE eq fmtDate }">
                                                    <fmt:formatDate value="${popularBoard[3].ASK_DATE }"  pattern="HH:ss"/>
                                                </c:if>
                                                <c:if test="${popularBoard[3].MMDDASK_DATE ne fmtDate }">
                                                    <fmt:formatDate value="${popularBoard[3].ASK_DATE }"  pattern="MM-dd"/>
                                                </c:if>
                                            </p>
                                        </a>
                                    </td>
                                </tr>
                                <tr>
                                    <td><img alt="#" src="/upload/${popularBoard[4].FILE_STORED }"></td>
                                    <td>
                                        <a href="/ask/detail?askNo=${popularBoard[4].ASK_NO }">
                                            <c:if test="${popularBoard[4].VOTE_END gt setDate }">
                                                [진행] ${popularBoard[4].ASK_TITLE }
                                            </c:if>
                                            <c:if test="${popularBoard[4].VOTE_END lt setDate }">
                                                [종료] ${popularBoard[4].ASK_TITLE }
                                            </c:if>
                                            <p>${popularBoard[4].USER_NICK } / 
                                                <c:if test="${popularBoard[4].MMDDASK_DATE eq fmtDate }">
                                                    <fmt:formatDate value="${popularBoard[4].ASK_DATE }"  pattern="HH:ss"/>
                                                </c:if>
                                                <c:if test="${popularBoard[4].MMDDASK_DATE ne fmtDate }">
                                                    <fmt:formatDate value="${popularBoard[4].ASK_DATE }"  pattern="MM-dd"/>
                                                </c:if>
                                            </p>
                                        </a>
                                    </td>
                                    <td><img alt="#" src="/upload/${popularBoard[5].FILE_STORED }"></td>
                                    <td>
                                        <a href="/ask/detail?askNo=${popularBoard[5].ASK_NO }">
                                            <c:if test="${popularBoard[5].VOTE_END gt setDate }">
                                                [진행] ${popularBoard[5].ASK_TITLE }
                                            </c:if>
                                            <c:if test="${popularBoard[5].VOTE_END lt setDate }">
                                                [종료] ${popularBoard[5].ASK_TITLE }
                                            </c:if>
                                            <p>${popularBoard[5].USER_NICK } / 
                                                <c:if test="${popularBoard[5].MMDDASK_DATE eq fmtDate }">
                                                    <fmt:formatDate value="${popularBoard[5].ASK_DATE }"  pattern="HH:ss"/>
                                                </c:if>
                                                <c:if test="${popularBoard[5].MMDDASK_DATE ne fmtDate }">
                                                    <fmt:formatDate value="${popularBoard[5].ASK_DATE }"  pattern="MM-dd"/>
                                                </c:if>
                                            </p>
                                        </a>
                                    </td>
                                </tr>
                            </table>
						</div>
					</div>
					<br>
					<!-- 메인 멘트 -->
	                <div class="table-responsive" style="background-color:#eee; height: 153px;">
                		<c:if test="${mainment eq null }">
		                	<p style="font-size: 35px; margin-top: 3%;">회원가입을 통해 서로 의견을 나누고</p>
		                	<p style="font-size: 35px;">원하는 물건의 구매의사를 확인하세요!</p>
                		</c:if>
                		<c:if test="${mainment ne null }">
		                	<p class="pull-right" style="font-size: 16px;">회원님이 이번 달 아낀 돈은 ${moneyAndPercent.saveMoney } 원입니다.</p>
		                	<p style="font-size: 25px;">아낀 돈으로 무엇을 할 수 있나요?</p>
		                	<p style="font-size: 35px;">${mainment }</p>
                		</c:if>
	                </div>
                </div>
            </div>
            
            <div class="col-md-1"></div>
            
            <!-- 영수증 -->
            <div class="col-md-4" id="bill" style="background-color:#eee; margin-top: 25px;">
                <p>[주문(대기)번호]</p>
                <div>
	                <c:choose>
	                	<c:when test="${!empty userNo }">
			                <span style="font-size: 30px; background-color: gray;">${userNo }</span>
	                	</c:when>
	                	<c:when test="${empty userNo }">
			                <span style="font-size: 30px; background-color: gray;">1004</span>
	                	</c:when>
	                </c:choose>
                </div>
                <div style="text-align: left;">
		            <span>주문내역</span>
	            </div>
                <hr style="border: 3px solid black; margin: 0 10px 10px 0;">
                
                <div style="width: auto; height: 300px; overflow: auto;">
                    <c:set var = "sum" value = "0" />
                    <c:forEach items="${mainBill }" var="mainBill">
                        <p>
                            <span style="float: left;">
                                [${mainBill.VOTE_END }] ${mainBill.ITEM_NAME }
                            </span>
                            <span style="float: right;">
                                <fmt:formatNumber type="number" maxFractionDigits="3" value="${mainBill.ITEM_PRICE }" /> 원
                            </span>
                        </p>
                        <c:set var="sum" value="${sum + mainBill.ITEM_PRICE}"/>
                    </c:forEach>
                </div>
                
                <hr style="border: 2px dashed black; margin: 0 10px 10px 0;">
                <span style="float: left;">총 주문금액</span>
                <span style="float: right;">
                    <fmt:formatNumber type="number" maxFractionDigits="3" value="${sum }" /> 원
                </span>
                <img alt="barcode" src="https://i.imgur.com/hGHStFZ.png" style="margin-top: 10px; width: 100%;">
                <span id="time" style="float: right;"></span>
                
            </div>
        </div>
    </div>
<div class="container" id="main">

<hr class="featurette-divider">

	<!-- 등수 -->
	<div class="row">
		<p style="font-size: 30px;">
			<img alt="good" src="https://i.imgur.com/jGvv25B.png" width="30px;" height="30px;"> 너가 최고야!
		</p>
		<div class="col-lg-4">
			<img class="img-circle"
				src="data:image/gif;base64,R0lGODlhAQABAIAAAHd3dwAAACH5BAAAAAAALAAAAAABAAEAAAICRAEAOw=="
				alt="일반 자리 표시자 이미지" width="140" height="140">
			<h2>1등</h2>
			<p>${userTen[0].userNick }</p>
		</div>
		<div class="col-lg-4">
			<img class="img-circle"
				src="data:image/gif;base64,R0lGODlhAQABAIAAAHd3dwAAACH5BAAAAAAALAAAAAABAAEAAAICRAEAOw=="
				alt="일반 자리 표시자 이미지" width="140" height="140">
			<h2>2등</h2>
			<p>${userTen[1].userNick }</p>
		</div>
		<div class="col-lg-4">
			<img class="img-circle"
				src="data:image/gif;base64,R0lGODlhAQABAIAAAHd3dwAAACH5BAAAAAAALAAAAAABAAEAAAICRAEAOw=="
				alt="일반 자리 표시자 이미지" width="140" height="140">
			<h2>3등</h2>
			<p>${userTen[2].userNick }</p>
		</div>
	</div>

	<hr class="featurette-divider">

		<div class="row featurette">
			<!-- 공지사항 -->
			<div class="col-md-9">
				<div class="table-responsive">
					<table class="table table-hover" id="notice_table" style="height: 350px;">
						<tr>
							<th style="text-align: center; font-size: 20px; background-color: gray;">공지사항</th>
						</tr>
						<c:forEach var="i" begin="0" end="5">
							<tr>
								<td style="text-align: left;">
									<a href="/notice/detail?noticeno=${noticeSix[i].noticeNo }">
										<p style="margin-bottom: 0;">${noticeSix[i].noticeTitle }</p>
									</a>
								</td>
							</tr>
						</c:forEach>
					</table>
				</div>
			</div>
			
			<div class="col-md-1"></div>
			
			<!-- 인기 게시글 -->
			<div class="col-md-3">
				<table class="table table-hover" id="rank_table" style="height: 342px;">
					<c:forEach var="i" begin="3" end="9">
						<tr>
							<td>${i+1 }</td>
							<td>${userTen[i].userNick }</td>
						</tr>
					</c:forEach>
				</table>
			</div>
		</div>

		<hr class="featurette-divider">
	<p class="pull-right"><a href="#">맨 위로</a></p>
	


</div><!-- .container #main end -->
<c:import url="/WEB-INF/views/layout/footer.jsp" />
</div><!-- .wrap end -->

<!-- footer start -->
<script src="/resources/js/main.js"></script>
