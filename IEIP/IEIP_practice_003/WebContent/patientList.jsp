<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<%@ include file = "layout/db_connect.jsp" %>
<%
	String sql = "select p_no, p_name, substr(p_birth,1,4)||'년'||substr(p_birth,5,2)||'월'||substr(p_birth,7,2)||'일' p_birth, case p_gender when 'M' then '남' else '여' end p_gender, p_tel1||'-'||p_tel2||'-'||p_tel3 p_tel, case p_city when '10' then '서울' when '20' then '경기' when '30' then '강원' when '40' then '대구' end p_city from tbl_patient_202004";

	PreparedStatement pstmt = conn.prepareStatement(sql);
	ResultSet rs = pstmt.executeQuery();

%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>진단검사 프로그램</title>
	<link rel="stylesheet" href="css/style.css?ver1.0">
</head>
<body>
	<jsp:include page="layout/header.jsp"></jsp:include>
	
	<jsp:include page="layout/nav.jsp"></jsp:include>
	
	<section id="section">
		<h2>환자조회</h2>
		<table>
			<thead>
				<tr>
					<th>환자번호</th>
					<th>환자성명</th>
					<th>생년월일</th>
					<th>성별</th>
					<th>전화번호</th>
					<th>지역</th>
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
<%
	rs.close();
	pstmt.close();
	conn.close();
%>