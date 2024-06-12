<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ include file = "layout/db_connect.jsp" %>
<%
	/* 안해주면 한글 깨짐 중요!! */
	request.setCharacterEncoding("UTF-8");
	
	String sql = "delete from member_tbl_02 where custno = " + request.getParameter("custno");
	
	PreparedStatement pstmt = conn.prepareStatement(sql);
	
	/* select문 제외하곤 다 Update */
	pstmt.executeUpdate();
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>쇼핑몰 회원관리</title>
</head>
<body>
	<jsp:forward page="mbrList.jsp"></jsp:forward>
</body>
</html>