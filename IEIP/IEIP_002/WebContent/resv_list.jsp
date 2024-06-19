<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ include file = "layout/db_connect.jsp" %>
<%

	String sql = "select h.hospaddr, case h.hospaddr when '10' then '서울' when '20' then '대전' when '30' then '대구' when '40' then '광주' end hospaddra, count(v.hospcode) cnt from tbl_hosp_202108 h, tbl_vaccresv_202108 v where h.hospcode = v.hospcode(+) group by h.hospaddr order by hospaddr asc";

	PreparedStatement pstmt = conn.prepareStatement(sql);
	ResultSet rs = pstmt.executeQuery();

	int sum = 0;
%>
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
		<h2></h2>
		
		<table>
			<thead>
				<tr>
					<th>병원지역</th>
					<th>병원지역명</th>
					<th>접종건수</th>
				</tr>
			</thead>
			
			<tbody>
				<%
					while(rs.next()) {
						sum += rs.getInt(3);
				%>
					<tr>
						<td><%= rs.getString(1) %></td>
						<td><%= rs.getString(2) %></td>
						<td><%= rs.getString(3) %></td>
					</tr>
				<%
					}
				%>
					<tr>
						<td colspan="2">총합</td>
						<td><%= sum %></td>
					</tr>
			</tbody>
		
		
		</table>
	
	</section>
	
	<jsp:include page="layout/footer.jsp"></jsp:include>

</body>
</html>