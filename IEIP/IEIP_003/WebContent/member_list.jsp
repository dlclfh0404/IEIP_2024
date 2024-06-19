<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<%@ include file = "layout/db_connect.jsp" %>
<%

	String sql = "select substr(c.resist_month,1,4)||'년'||substr(c.resist_month,5,2)||'월' resist_month, c.c_no, m.c_name, t.class_name, c.class_area, to_char(tuition, 'L999,999') tuition, m.grade from tbl_teacher_202201 t, tbl_member_202201 m, tbl_class_202201 c where t.teacher_code = c.teacher_code and m.c_no = c.c_no";

	PreparedStatement pstmt = conn.prepareStatement(sql);
	ResultSet rs = pstmt.executeQuery();


%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<link rel="stylesheet" href="css/style.css?ver1.0">
</head>
<body>
	<jsp:include page="layout/header.jsp"></jsp:include>
	
	<jsp:include page="layout/nav.jsp"></jsp:include>
	
	<section id="section">
		<h2>회원정보조회</h2>
		<table>
			<thead>
				<tr>
					<th>수강월</th>
					<th>회원번호</th>
					<th>회원명</th>
					<th>강의명</th>
					<th>강의장소</th>
					<th>수강료</th>
					<th>등급</th>
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