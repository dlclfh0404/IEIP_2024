<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>쇼핑몰 회원관리</title>
</head>
<body>
<%
	Connection conn = null;
	
	String url = "jdbc:oracle:thin:@localhost:1521:xe";
	String id = "system";
	String pw = "pass";
	String drv = "oracle.jdbc.OracleDriver";
	
	try {
		Class.forName(drv);
		conn = DriverManager.getConnection(url, id, pw);
		
		System.out.println("DB 접속");
		
	}	catch(Exception e) {
		e.printStackTrace();
	}




%>
</body>
</html>