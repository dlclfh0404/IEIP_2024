<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<link rel="stylesheet" href="css/style.css">
</head>
<body>
	<jsp:include page="layout/header.jsp"></jsp:include>
	
	<jsp:include page="layout/nav.jsp"></jsp:include>
	
	<section id="section">
		<h2>예약번호<%= request.getParameter("resvno") %>로 조회된 결과가 없습니다.</h2>
		<p>
			<input type="button" value="홈으로" onclick="location.href='index.jsp'">
		</p>
	</section>
	
	<jsp:include page="layout/footer.jsp"></jsp:include>
</body>
</html>