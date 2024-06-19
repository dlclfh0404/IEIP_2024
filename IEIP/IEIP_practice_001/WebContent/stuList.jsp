<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ include file = "layout/db_connect.jsp" %>
<%
	String sql = "select sno, sname, substr(sno,1,1) grade, substr(sno,2,2) class, substr(sno,4,2) classnum, case when sgender = 'M' then '남' else '여' end sgender, sphone, saddress from student_tbl_03";

	PreparedStatement pstmt = conn.prepareStatement(sql);
	ResultSet rs = pstmt.executeQuery();

%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>학사관리 프로그램</title>
	<link rel="stylesheet" href="css/style.css">
</head>
<body>
	
	<jsp:include page="layout/header.jsp"></jsp:include>
	
	<jsp:include page="layout/nav.jsp"></jsp:include>
	
	<section id="section">
		<h2>학생목록</h2>
		
		<table>
			<thead>
				<tr>
					<th>학번</th>
					<th>이름</th>
					<th>학년</th>
					<th>반</th>
					<th>번호</th>
					<th>성별</th>
					<th>전화번호</th>
					<th>주소</th>
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
						<td><%= rs.getString(5) %></td>
						<td><%= rs.getString(6) %></td>
						<td><%= rs.getString(7) %></td>
						<td><%= rs.getString(8) %></td>
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