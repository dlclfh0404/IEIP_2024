<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<%@ include file = "layout/db_connect.jsp" %>
<%
	request.setCharacterEncoding("UTF-8");

	String sql = "insert into tbl_result_202004 values (?, ?, ?, ?, ?, ?)";
	
	PreparedStatement pstmt = conn.prepareStatement(sql);
	pstmt.setString(1,request.getParameter("p_no"));
	pstmt.setString(2,request.getParameter("t_code"));
	pstmt.setString(3,request.getParameter("t_sdate"));
	pstmt.setString(4,request.getParameter("t_status"));
	pstmt.setString(5,request.getParameter("t_ldate"));
	pstmt.setString(6,request.getParameter("t_result"));
	
	pstmt.executeUpdate();


%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>진단검사 프로그램</title>
	<link rel="stylesheet" href="css/style.css">
</head>
<body>
	<jsp:forward page="index.jsp"></jsp:forward>
</body>
</html>