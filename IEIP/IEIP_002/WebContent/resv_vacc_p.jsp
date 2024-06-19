<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<%@ include file = "layout/db_connect.jsp" %>
<%
	request.setCharacterEncoding("UTF-8");

	String sql = "insert into tbl_vaccresv_202108 values (?, ?, ?, ?, ?, ?)";

	PreparedStatement pstmt = conn.prepareStatement(sql);
	
	pstmt.setInt(1, Integer.parseInt(request.getParameter("resvno")));
	pstmt.setString(2, request.getParameter("jumin"));
	pstmt.setString(3, request.getParameter("hospcode"));
	pstmt.setString(4, request.getParameter("resvdate"));
	pstmt.setInt(5, Integer.parseInt(request.getParameter("resvtime")));
	pstmt.setString(6, request.getParameter("hospaddr"));
	
	
	pstmt.executeUpdate();

%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>백신예약 프로그램</title>
</head>
<body>
	<jsp:forward page="index.jsp"></jsp:forward>
</body>
</html>