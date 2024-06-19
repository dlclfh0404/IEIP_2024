<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<%@ include file = "layout/db_connect.jsp" %>
<%

	String sql = "select t.teacher_code, t.class_name, teacher_name, to_char(sum(c.tuition),'L999,999') tuition from tbl_teacher_202201 t, tbl_class_202201 c where t.teacher_code = c.teacher_code group by t.teacher_code, t.class_name, teacher_name order by t.teacher_code asc";

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
		<h2>강사매출현황</h2>
		<table>
			<thead>
				<tr>
					<th>강사코드</th>
					<th>강의명</th>
					<th>강사명</th>
					<th>총매출</th>
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
<%
	rs.close();
	pstmt.close();
	conn.close();
%>