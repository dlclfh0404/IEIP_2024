<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<%@ include file = "layout/db_connect.jsp" %>
<%
	String sql = "select p.p_city, case p.p_city when '10' then '서울' when '20' then '경기' when '30' then '강원' when '40' then '대구' end p_city, count(r.p_no) p_no from tbl_patient_202004 p, tbl_result_202004 r where  p.p_no = r.p_no group by p.p_city order by p.p_city asc";

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
		<h2>(지역별)검사건수통계</h2>
		<table>
			<thead>
				<tr>
					<th>지역코드</th>
					<th>지역명</th>
					<th>검사건수</th>
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