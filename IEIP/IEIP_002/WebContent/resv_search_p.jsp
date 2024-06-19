<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<%@ include file = "layout/db_connect.jsp" %>
<%
	request.setCharacterEncoding("UTF-8");	

	String sql = "select resvno from tbl_vaccresv_202108";

	PreparedStatement pstmt = conn.prepareStatement(sql);
	ResultSet rs = pstmt.executeQuery();

	int num = Integer.parseInt(request.getParameter("resvno"));
	int result = 0; // 0 : 없음 , 1 : 있음
	
	while(rs.next()) {
		if(num == rs.getInt(1)) {
			result = 1;
			break;
		}
	}
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<link rel="stylesheet" href="css/style.css">
</head>
<body>
	<%
		if(result == 1) {
	%>
		<jsp:forward page="resv_search_exist.jsp"></jsp:forward>
	<% 		
		
		} else {
	%>
		<jsp:forward page="resv_search_empty.jsp"></jsp:forward>
	<%	
		}
	%> 
</body>
</html>