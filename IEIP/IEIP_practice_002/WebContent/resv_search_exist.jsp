<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<%@ include file = "layout/db_connect.jsp" %>
<%

	String sql = "select v.resvno, j.name, case substr(j.jumin,8,1) when '1' then '남' else '여' end gender, h.hospname, '20'||substr(v.resvdate,1,2)||'년'||substr(v.resvdate,4,2)||'월'||substr(v.resvdate,7,2)||'일' resvdate, substr(lpad(v.resvtime,4,'0'),1,2)||':'||substr(lpad(v.resvtime,4,'0'),3,2) resvtime, case v.vcode when 'V001' then 'A백신' when 'V002' then 'B백신' when 'V003' then 'C백신' end vcode, case h.hospaddr when '10' then '서울' when '20' then '대전' when '30' then '대구' when '40' then '광주' end hospaddr from tbl_vaccresv_202108 v, tbl_hosp_202108 h, tbl_jumin_202108 j where v.hospcode = h.hospcode and v.jumin = j.jumin and v.resvno =" + request.getParameter("resvno");

	PreparedStatement pstmt = conn.prepareStatement(sql);
	ResultSet rs = pstmt.executeQuery();
	
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>백신예약 프로그램</title>
	<link rel="stylesheet" href="css/style.css">
</head>
<body>
	<jsp:include page="layout/header.jsp"></jsp:include>
	
	<jsp:include page="layout/nav.jsp"></jsp:include>
	
	<section id="section">
		
		<h2>예약번호 <%= request.getParameter("resvno") %>님의 예약 조회</h2>
		
		<table>
			<thead>
				<tr>
					<th>예약번호</th>
					<th>성명</th>
					<th>성별</th>
					<th>병원이름</th>
					<th>예약날짜</th>
					<th>예약시간</th>
					<th>백신코드</th>
					<th>병원지역</th>
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
			<p class="center">
				<input type="button" value="돌아가기" onclick="location.href='resv_search.jsp'">
			</p>
	</section>
	
	<jsp:include page="layout/footer.jsp"></jsp:include>
</body>
</html>