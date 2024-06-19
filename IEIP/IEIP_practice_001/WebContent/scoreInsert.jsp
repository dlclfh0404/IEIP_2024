<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<%@ include file = "layout/db_connect.jsp" %>
<%
	request.setCharacterEncoding("UTF-8");

	String sql = "insert into exam_tbl_03 values (?, ?, ?, ?, ?)";
	
	PreparedStatement pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, request.getParameter("sno"));
	pstmt.setString(2, request.getParameter("ekor"));
	pstmt.setString(3, request.getParameter("emath"));
	pstmt.setString(4, request.getParameter("eeng"));
	pstmt.setString(5, request.getParameter("ehist"));
	
	pstmt.executeUpdate();


%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>학사관리 프로그램</title>
</head>
<body>
	<jsp:forward page="inputScore.jsp"></jsp:forward>
</body>
</html>