<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ include file = "layout/db_connect.jsp" %>
<%
	
	String sql = "select mbr.custno, mbr.custname, case mbr.grade when 'A' then 'VIP' when 'B' then '일반' else '직원' end grade, sum(mon.price) price from member_tbl_02 mbr, money_tbl_02 mon where mbr.custno = mon.custno group by mbr.custno, mbr.custname, mbr.grade order by price desc";

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
		<h2>회원매출조회</h2>
		<table>
			<thead>
				<tr>
					<th>회원번호</th>
					<th>회원성명</th>
					<th>고객등급</th>
					<th>매출</th>
				</tr>
			</thead>
			
			<tbody>
				<%
					while(rs.next()) {
				%>
					<tr>
						<td><%= rs.getString(1) %></td>
						<td><%= rs.getString(2) %></td>
						<td><%= rs.getString(3) %></td>
						<td><%= rs.getString(4) %></td>
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