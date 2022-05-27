<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<input type="hidden" name="msg" value="${msg}">
</body>
<script>
	var msg = document.getElementsByTagName('input')[0].value;
	switch (msg) {
	case "idDup":
		alert("중복된 ID입니다.");
		location.href="/join";
		break;
	case "joinSuc":
		alert("회원가입 성공했습니다.");
		location.href="/login";
		break;
	case "pwSuc":
		alert("비밀번호가 변경되었습니다.");
		location.href="/main";
		break;
	case "delMemberSuc":
		alert("회원정보가 삭제되었습니다..");
		location.href="/admin/selectAllMember";
		break;
	}
</script>
</html>