<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<ul id="photoList">
	<c:forEach items="${list}" var="list">
		<li>
			<div style="width: 100%; height: 250px;">
				<a href="/ask/detail?askNo=${list.ASK_NO}">
					<img style="width: 100%; height: 100%;" alt="#" src="/upload/${list.FILE_STORED}">
				</a>
			</div>
			<div style="border: 1px solid #ccc; border-top: none; box-sizing: border-box; padding: 0 5px 10px; ">
				<div style="padding-top: 8px; display:flex; align-items: flex-start; justify-content: space-between;">
						<span class="ellipsis2" style="text-align: left;">제목: ${list.ASK_TITLE}</span>
						<span class="">조회수: ${list.ASK_HIT}</span>
				</div>
	
				<div style="display:flex; align-items: flex-start; justify-content: space-between;">
					<span>작성자: 
						<img alt="#" src="${list.GRADE_URL}" style="width: 20px;">${list.USER_NICK}</span> 
					<span>작성일: <fmt:formatDate value="${list.ASK_DATE}" pattern="yy-MM-dd" /></span>
				</div>
			</div>
		</li>
	</c:forEach>
</ul>





</body>
</html>