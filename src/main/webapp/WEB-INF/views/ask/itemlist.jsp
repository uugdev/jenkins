<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<ul style="width: 300px; height: 300px;">
	<c:forEach items="${list}" var="list">
		<li>
			<div style="width: 100%; height: 60%;">
				<a href="/ask/detail?askNo=${list.ASK_NO}">
					<img style="width: 100%;" alt="#" src="/upload/${list.FILE_STORED}">
				</a>
			</div>
			
			<span>제목: ${list.ASK_TITLE}</span>
			<span>
				작성자: <img alt="#" src="${list.GRADE_URL}" style="width: 20px;">${list.USER_NICK}
			</span>
			<span>
				작성일: <fmt:formatDate value="${list.ASK_DATE}" pattern="yy-MM-dd HH:mm" />
			</span>
			<span>조회수: ${list.ASK_HIT}</span>
		</li>
	</c:forEach>
</ul>





</body>
</html>