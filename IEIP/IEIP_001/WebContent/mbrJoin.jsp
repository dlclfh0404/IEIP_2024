<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<%@ include file = "layout/db_connect.jsp" %>
<%
	String sql = "select max(custno)+1 from member_tbl_02";

	PreparedStatement pstmt = conn.prepareStatement(sql);
	ResultSet rs = pstmt.executeQuery();
	
	rs.next();
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>쇼핑몰 회원관리</title>
	<link rel="stylesheet" href="css/style.css">
	<script type="text/javascript">
		function chkVal() {
			
			var mData = document.mbrData;
			
			if(!mData.custname.value) {
				alert("회원성명을 입력하세요.");
				mData.custname.focus();
				return false;
			}
			
			if(!mData.phone.value) {
				alert("전화번호를 입력하세요.");
				mData.phone.focus();
				return false;
			}
			
			if(!mData.address.value) {
				alert("주소를 입력하세요.");
				mData.address.focus();
				return false;
			}
			
			if(!mData.joindate.value) {
				alert("가입일자를 입력하세요.");
				mData.joindate.focus();
				return false;
			}
			
			if(mData.grade.value == "none") {
				alert("고객등급을 선택하세요.");
				mData.grade.focus();
				return false;
			}
			
			if(!mData.city.value) {
				alert("도시코드를 입력하세요.");
				mData.city.focus();
				return false;
			}

		}
	</script>
</head>
<body>
	<jsp:include page="layout/header.jsp"></jsp:include>
	<jsp:include page="layout/nav.jsp"></jsp:include>
	
	<section id="section">
		<h2>홈쇼핑 회원 등록</h2>
		<form action="mbrJoin_p.jsp" name="mbrData" method="post" onsubmit="return chkVal()">
			
			<table class="joinTable">
				<tr>
					<th>회원번호(자동발생)</th>
					<td><input type="text" name="custno" size="10" value="<%= rs.getString(1) %>" readonly></td>
				</tr>
				<tr>
					<th>회원성명</th>
					<td><input type="text" name="custname" size="10"></td>
				</tr>
				<tr>
					<th>회원전화</th>
					<td><input type="text" name="phone" size="15"></td>
				</tr>
				<tr>
					<th>회원주소</th>
					<td><input type="text" name="address" size="25"></td>
				</tr>
				<tr>
					<th>가입일자</th>
					<td><input type="text" name="joindate" size="10"></td>
				</tr>
				<tr>
					<!-- 연습 차원에서 변경 -->
					<th>고객등급</th>
					<td>
						<select name="grade">
							<option value="none">===== 선택 =====</option>
							<option value="A">VIP</option>
							<option value="B">일반</option>
							<option value="C">직원</option>
						</select>
					</td>
				</tr>
				<tr>
					<th>도시코드</th>
					<td><input type="text" name="city" size="10"></td>
				</tr>
				<tr>
					<td colspan="2">
						<input type="submit" value="등록">
						<input type="button" value="조회" onclick="location.href='mbrList.jsp'">
					</td>
				</tr>
			</table>
			
		</form>
	</section>
	
	<jsp:include page="layout/footer.jsp"></jsp:include>
</body>
</html>