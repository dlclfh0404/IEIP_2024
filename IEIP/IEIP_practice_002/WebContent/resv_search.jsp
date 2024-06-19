<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>백신예약 프로그램</title>
	<link rel="stylesheet" href="css/style.css">
	<script type="text/javascript">
		function chkVal() {
			var vData = document.vData;
			
			if(!vData.resvno.value) {
				alert("예약번호를 입력하세요.");
				vData.resvno.focus();
				return false;
			}
		}
	</script>
</head>
<body>
	<jsp:include page="layout/header.jsp"></jsp:include>
	
	<jsp:include page="layout/nav.jsp"></jsp:include>
	
	<section id="section">
		
		<h2>백신예약조회</h2>
		
		<form action="resv_search_p.jsp" name="vData" method="post" onsubmit="return chkVal()">
			<table>
				<tr>
					<th>예약번호</th>
					<td><input type="text" name="resvno" size="20"></td>
				</tr>
				<tr>
					<td colspan="2">
						<input type="submit" value="조회하기">
						<input type="button" value="홈으로" onclick="location.href='index.jsp'">
					</td>
				</tr>
			</table>
		</form>
		
	</section>
	
	<jsp:include page="layout/footer.jsp"></jsp:include>
</body>
</html>