<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

<header class="navbar navbar-dark sticky-top bg-dark flex-md-nowrap p-0 shadow">

	<!-- 좌측 메뉴/ 계정명 -->
	<div class="navbar-brand col-md-3 col-lg-2 me-0 px-3 fs-6" style="display:flex;justify-content:space-between">		
		<a href="/main" >
			<img alt="companyLogo" src="${pageContext.request.contextPath}/resources/img/pndLogo2.png" height="20px">
		</a>
		
		<a href="/userInfo" Style="color:white; text-decoration: none">
			<img alt="userIcon" src="${pageContext.request.contextPath}/resources/img/icon/account.svg">${username}	
		</a>
	</div>
	
	<button class="navbar-toggler position-absolute d-md-none collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#sidebarMenu" aria-controls="sidebarMenu" aria-expanded="false" aria-label="Toggle navigation">
		<span class="navbar-toggler-icon"></span>
	</button>
		
	<!-- 검색창 -->
	<input class="form-control form-control-dark w-100 rounded-0 border-0" type="text" placeholder="Search" aria-label="Search">
	
	<!-- 로그아웃 -->
	<div class="navbar-nav">
		<div class="nav-item text-nowrap">
	  		<sec:authorize access="isAnonymous()"> <a href="/login">로그인</a>"> </sec:authorize> 
			<sec:authorize access="isAuthenticated()">	
				<a class="nav-link px-3" href="javascript:void(0)" onClick="javascript:logOutPost()">Sign out</a>
			</sec:authorize> 
	  	</div>
	</div>
	<script>
// 로그아웃 form 태그 //
	function logOutPost(){
		if(confirm("로그아웃 하시겠습니까?")){
			let f = document.createElement('form');
		    f.setAttribute('action', '/logout');
		    f.setAttribute('method', 'post');
		    let sec = document.createElement('input');
		    sec.setAttribute('type', 'hidden');
		    sec.setAttribute('name', '${_csrf.parameterName}');
		    sec.setAttribute('value', '${_csrf.token}');
		   
		    document.body.appendChild(f);
		    f.appendChild(sec);
		    
		    f.submit();	
		}
	}
</script>
</header>
