<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ page import="com.pnd.mashup.model.Member"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>로그인 페이지</title>

<!-- Bootstrap core CSS -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css">

    <style>
      .bd-placeholder-img {
        font-size: 1.125rem;
        text-anchor: middle;
        -webkit-user-select: none;
        -moz-user-select: none;
        user-select: none;
      }

      @media (min-width: 768px) {
        .bd-placeholder-img-lg {
          font-size: 3.5rem;
        }
      }
    </style>
<!-- Custom styles for this page -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/signin.css?ver=1">
</head>
<body class="text-center">    
	<main class="form-signin">
		<form action="/login" method="post">
			
			<!-- 로그인 이후 진입 제한을 위함 -->
			<input type="hidden" value="${username}">
			<a href="/main">
				<img class="mb-4" src="${pageContext.request.contextPath}/resources/img/pndLogo.png" alt="">
			</a>
			<sec:csrfInput/>
			<!-- ID 입력창 -->
			<div class="form-floating">
			  <input type="text" name= "id" class="form-control" id="floatingInput" placeholder="Account">
			  <label for="floatingInput">Account</label>
			</div>
			
			<!-- PW 입력창 -->
			<div class="form-floating">
			  <input type="password" name="password" class="form-control" id="floatingPassword" placeholder="Password">
			  <label for="floatingPassword">Password</label>
			</div>
			
			<!--로그인에러 메시지 출력-->
			<div class="errorbox mb-3">
			  <label>
			    ${requestScope.loginFailMsg}
			  </label>
			</div>
			
			<!-- submit버튼 -->
			<button class="w-100 btn btn-lg btn-primary" type="submit">Sign in</button>
			
			<!-- 회원가입 링크 -->
			<a class="mt-5 mb-3 text-muted" href="/join">Sign up</a>
		</form>
	</main>
</body>
<script>
	window.onload = function() {
		//로그인 상태 진입방지
		var log = document.getElementsByTagName('input')[0].value;
		if (log!="") {
			alert("로그아웃 해주세요")
			history.back();
			}
	}
</script>
</html>