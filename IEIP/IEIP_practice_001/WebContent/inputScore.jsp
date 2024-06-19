<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>학사관리 프로그램</title>
	<link rel="stylesheet" href="css/style.css">
	<script type="text/javascript">
		function chkVal() {
			
			var form = document.gradeTable;
			
			if(!form.sno.value) {
				alert("학번을 입력하세요.");
				form.sno.focus();
				return false;
			}
			else if(!form.ekor.value) {
				alert("국어점수를 입력하세요.");
				form.ekor.focus();
				return false;
			}
			else if(!form.emath.value) {
				alert("수학점수를 입력하세요.");
				form.emath.focus();
				return false;
			}
			else if(!form.eeng.value) {
				alert("영어점수를 입력하세요.");
				form.eeng.focus();
				return false;
			}
			else if(!form.ehist.value) {
				alert("역사점수를 입력하세요.");
				form.ehist.focus();
				return false;
			}
			
			alert("학생 성적이 모두 입력되었습니다.");
		}
	</script>
</head>
<body>
	
	<jsp:include page="layout/header.jsp"></jsp:include>
	
	<jsp:include page="layout/nav.jsp"></jsp:include>
	
	<section id="section">
		<h2>성적입력</h2>
		
		<form action="scoreInsert.jsp" name="gradeTable" method="post" onsubmit="return chkVal()">
			<table class="sTable">
				<tr>
					<th>학번</th>
					<td><input type="text" name="sno" size="10"></td>
				</tr>
				<tr>
					<th>국어점수</th>
					<td><input type="text" name="ekor" size="5"></td>
				</tr>
				<tr>
					<th>수학점수</th>
					<td><input type="text" name="emath" size="5"></td>
				</tr>
				<tr>
					<th>영어점수</th>
					<td><input type="text" name="eeng" size="5"></td>
				</tr>
								<tr>
					<th>역사점수</th>
					<td><input type="text" name="ehist" size="5"></td>
				</tr>
				<tr>
					<td colspan="2">
						<input type="submit" value="등록하기">
					</td>
				</tr>
			</table>
		</form>
	</section>
	
	<jsp:include page="layout/footer.jsp"></jsp:include>
</body>
</html>