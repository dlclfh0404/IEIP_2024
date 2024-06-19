<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>학사관리 프로그램</title>
</head>
<body>
<%
	Connection conn = null;
	String url = "jdbc:oracle:thin:@localhost:1521:xe";
	String id  = "system";
	String pw  = "pass";
	String driver = "oracle.jdbc.OracleDriver";
	
	try {
		Class.forName(driver);
		conn = DriverManager.getConnection(url, id, pw);
		
		System.out.println("Connected!");
	}	catch(Exception e) {
		e.printStackTrace();
	}


%>
</body>
</html>