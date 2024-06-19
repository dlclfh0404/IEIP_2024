<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
<%@ page import="java.sql.*" %>
<%@ include file = "layout/db_connect.jsp" %>
<%
	String sql = "select substr(s.sno,1,1) grade, substr(s.sno,2,2) class, substr(s.sno,4,2) classnum, s.sname, e.ekor, e.emath, e.eeng, e.ehist, sum(ekor+emath+eeng+ehist) sum, sum(ekor+emath+eeng+ehist)/4 avg, rank() over (order by sum(ekor+emath+eeng+ehist) desc) rank from student_tbl_03 s, exam_tbl_03 e where s.sno = e.sno group by substr(s.sno,1,1), substr(s.sno,2,2), substr(s.sno,4,2), s.sname, e.ekor, e.emath, e.eeng, e.ehist";

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
					<th>학년</th>
					<th>반</th>
					<th>번호</th>
					<th>이름</th>
					<th>국어</th>
					<th>수학</th>
					<th>영어</th>
					<th>역사</th>
					<th>합계</th>
					<th>평균</th>
					<th>순위</th>
				</tr>
			</thead>
			<tbody>
			<%
				int skor  = 0;
				int smath = 0;
				int seng  = 0;
				int shist = 0;
				int cnt   = 0;
				
				while(rs.next()) {
			%>
				<tr>
					<td><%= rs.getString("grade") %></td>
					<td><%= rs.getString("class") %></td>
					<td><%= rs.getString("classnum") %></td>
					<td><%= rs.getString("sname") %></td>
					<td><%= rs.getString("ekor") %></td>
					<td><%= rs.getString("emath") %></td>
					<td><%= rs.getString("eeng") %></td>
					<td><%= rs.getString("ehist") %></td>
					<td><%= rs.getString("sum") %></td>
					<td><%= rs.getString("avg") %></td>
					<td><%= rs.getString("rank") %></td>
					
				</tr>
			<%
					skor  += rs.getInt("ekor");
					smath += rs.getInt("emath");
					seng  += rs.getInt("eeng");
					shist += rs.getInt("ehist");
					cnt++;
				} 
			%>
				<tr>
					<td colspan="4">총합계</td>
					<td><%= skor %></td>
					<td><%= smath %></td>
					<td><%= seng %></td>
					<td><%= shist %></td>
					<td><%= skor+smath+seng+shist %></td>
					<td><%= (skor+smath+seng+shist)/4 %></td>
					<td rowspan="2"></td>
				</tr>
				<tr>
					<td colspan="4">총평균</td>
					<td><%= skor/cnt %></td>
					<td><%= smath/cnt %></td>
					<td><%= seng/cnt %></td>
					<td><%= shist/cnt %></td>
					<td><%= (skor+smath+seng+shist)/cnt %></td>
					<td><%= (skor+smath+seng+shist)/(cnt*4) %></td>
				</tr>
			</tbody>
		</table>
	</section>
	
	<jsp:include page="layout/footer.jsp"></jsp:include>
</body>
</html>