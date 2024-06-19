<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>백신예약 프로그램</title>
</head>
<body>
<%
	Connection conn = null;
	String url = "jdbc:oracle:thin:@localhost:1521:xe";
	String id  = "system";
	String pw  = "pass";
	String drv = "oracle.jdbc.OracleDriver";
	
	try {
		Class.forName(drv);
		conn = DriverManager.getConnection(url, id, pw);
		
		System.out.println("Connect!");
	} catch(Exception e) {
		e.printStackTrace();
	}



%>
</body>
</html>