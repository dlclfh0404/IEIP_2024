<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ include file = "layout/db_connect.jsp" %>
<%
	
	String sql = "select custno, custname, phone, address, to_char(joindate,'yyyy-mm-dd') joindate, case when grade = 'A' then 'VIP' when grade = 'B' then '일반' else '직원' end grade, city from member_tbl_02";

	PreparedStatement pstmt = conn.prepareStatement(sql);
	ResultSet rs = pstmt.executeQuery();
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>쇼핑몰 회원관리</title>
	<link rel="stylesheet" href="css/style.css">
</head>
<body>
	<jsp:include page="layout/header.jsp"></jsp:include>
	<jsp:include page="layout/nav.jsp"></jsp:include>
	
	<section id="section">
		<h2>회원목록조회/수정</h2>
		<table>
			<thead>
				<tr>
					<th>회원번호</th>
					<th>회원성명</th>
					<th>전화번호</th>
					<th>주소</th>
					<th>가입일자</th>
					<th>고객등급</th>
					<th>거주지역</th>
				</tr>
			</thead>
			
			<tbody>
				<%
					while(rs.next()) {
				%>
					<tr>
						<td><a href="mbrModify.jsp?custno=<%= rs.getString(1) %>"><%= rs.getString(1) %></a></td>
						<td><%= rs.getString(2) %></td>
						<td><%= rs.getString(3) %></td>
						<td><%= rs.getString(4) %></td>
						<td><%= rs.getString(5) %></td>
						<td><%= rs.getString(6) %></td>
						<td><%= rs.getString(7) %></td>
					</tr>
				<%
					}
				%>
			</tbody>
		
		
		</table>
	
	</section>
	
	
	
	<jsp:include page="layout/footer.jsp"></jsp:include>
</body>
</html>