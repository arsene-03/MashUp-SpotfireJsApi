<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.pnd.mashup.model.Member"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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

<title>회원정보 페이지</title>

</head>
	<body class="text-center">
		<main class="form-signin w-100 m-auto">
			<form action="/userInfo" method="post" name="frm">
			

		  		<a href="/main">
		    		<img class="mb-4" src="${pageContext.request.contextPath}/resources/img/pndLogo.png" alt="companyLogo">
		    	</a>
		    	<h1 class="h3 mb-3 fw-normal">User Information</h1>
			
				<!-- id 입력창 -->
				<sec:csrfInput/>
			    <div class="form-floating">
			      <input type="text" class="form-control" id="floatingInput" name="id" placeholder="Account" pattern="[A-Za-z0-9]+$" value="${username}" readonly required>
			      <label for="floatingInput">Account</label>
			    </div>
			    <!-- oldPw 입력창 -->
			    <div class="form-floating">
			      <input type="password" class="form-control joinPW" id="floatingPassword" name="password" placeholder="OldPassword" required style="margin-bottom:-1px;border-radius:0;">
			      <label for="floatingPassword">OldPassword</label>
			    </div>
			    <!-- newPassword -->
			    <div class="form-floating">
			      <input type="password" class="form-control" id="floatingPassword" name="newPassword" placeholder="NewPassword" required style="margin-bottom:-1px;border-radius:0;">
			      <label for="floatingPassword">NewPassword</label>
			    </div>
			    <!-- confirmpassword -->
			    <div class="form-floating">
			      <input type="password" class="form-control" id="floatingPassword" name="confirmNewPassword" placeholder="ConfirmPassword" required>
			      <label for="floatingPassword">ConfirmNewPassword</label>
			    </div>
			    
			    <!--로그인에러 메시지 출력-->
				<div class="errorbox mb-3">
				  <label>
					${msg}
				  </label>
				</div>
		    <button class="w-100 btn btn-lg btn-primary" type="submit" onclick="return pwChk()">Update</button>
		  </form>
		</main>
</body>
<script type="text/javascript">

	function pwChk(){
		//입력된 암호 일치 여부
		if(document.frm.newPassword.value != document.frm.confirmNewPassword.value){
			alert('비밀번호가 일치하지 않습니다.');
			document.frm.newPassword.value ="";
			document.frm.confirmNewPassword.value = "";
			
			frm.newPassword.focus();
			return false;
		}
		return true;	
	}
	</script>
</html>