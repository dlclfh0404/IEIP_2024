<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<%@ include file = "layout/db_connect.jsp" %>
<%
	String sql = "select p.p_no, p.p_name, l.t_name, to_char(r.t_sdate, 'YYYY-MM-DD') t_sdate, case r.t_status when '1' then '검사중' when '2' then '검사완료' end t_status, to_char(r.t_ldate, 'YYYY-MM-DD') t_ldate, case r.t_result when 'X' then '미입력' when 'P' then '양성' when 'N' then '음성' end t_result from tbl_result_202004 r, tbl_patient_202004 p, tbl_lab_test_202004 l where r.p_no = p.p_no and r.t_code = l.t_code order by p_no asc";

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
					<th>환자명</th>
					<th>검사명</th>
					<th>검사시작일</th>
					<th>검사상태</th>
					<th>검사완료일</th>
					<th>검사결과</th>
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