<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="theme-color" content="#712cf9">
<meta name="viewport" content="width=device-width, initial-scale=1">

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
    
<!-- Custom styles for this template -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/signin.css?ver=1">

<title>회원가입 페이지</title>

</head>
	<body class="text-center">
		<main class="form-signin w-100 m-auto">
			<form action="/join" method="post" name="frm">
			
		  		<!-- 로그인 이후 진입 제한을 위함 -->
		  		<input type="hidden" value="${username}">
		  		<a href="/main">
		    		<img class="mb-4" src="${pageContext.request.contextPath}/resources/img/pndLogo.png" alt="companyLogo">
		    	</a>
		    	<h1 class="h3 mb-3 fw-normal">Enter user information</h1>
			
				<!-- id 입력창 -->
				<sec:csrfInput/>
			    <div class="form-floating">
			      <input type="text" class="form-control" id="floatingInput" name="id" placeholder="Account" pattern="[A-Za-z0-9]+$" required>
			      <label for="floatingInput">Account</label>
			    </div>
			    <!-- pw 입력창 -->
			    <div class="form-floating">
			      <input type="password" class="form-control joinPW" id="floatingPassword" name="password" placeholder="Password" required style="margin-bottom:-1px;border-radius:0;">
			      <label for="floatingPassword">Password</label>
			    </div>
			    <!-- confirmpassword -->
			    <div class="form-floating">
			      <input type="password" class="form-control" id="floatingPassword" name="confirmPassword" placeholder="ConfirmPassword" required>
			      <label for="floatingPassword">ConfirmPassword</label>
			    </div>
		    <button class="w-100 btn btn-lg btn-primary" type="submit" onclick="return pwChk()">Sign up</button>
		  </form>
		</main>

<script>
	window.onload = function() {
		//로그인 상태 진입방지
		var log = document.getElementsByTagName('input')[0].value;
		if (log!="") {
			alert("로그아웃 해주세요")
			history.back();
			}
	}
	function pwChk(){
		//입력된 암호 일치 여부
		if(document.frm.password.value != document.frm.confirmPassword.value){
			alert('비밀번호가 일치하지 않습니다.');
			document.frm.password.value ="";
			document.frm.confirmPassword.value = "";
			
			frm.password.focus();
			return false;
		}
		return true;	
	}
</script>
</body>
</html>