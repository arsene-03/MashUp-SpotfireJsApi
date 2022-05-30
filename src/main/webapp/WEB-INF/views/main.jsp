<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="X-UA-Compatible" content="IE=Edge; chrome=1" />

<title>메인 페이지</title>
<!-- Bootstrap core CSS -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css">
	
<!-- Custom styles for this template -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/dashboard.css?ver=3">

<!-- Bootstrap  -->	
<script src="//code.jquery.com/jquery-3.3.1.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/bootstrap.bundle.min.js" ></script>
<script src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js" ></script>

<!-- Spotfire-Loader -->
<script src="http://localhost:82//spotfire/js-api/loader.js"></script>

</head>


<body>
	<jsp:include page="../include/header.jsp" />
	
	<div class="container-fluid">
	  <div class="row">
		<jsp:include page="../include/nav.jsp" />
	 	<main class="col-md-9 ms-sm-auto col-lg-10 px-md-4">
	      <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
	       
			<!-- 타이틀 -->
	        <h1 class="h2">Dashboard</h1>
	        <div class="btn-toolbar mb-2 mb-md-0">
	        
	        	<!-- 페이지초기화버튼 -->
				<div class="btn-group me-2">
				  <button type="button" class="btn btn-sm btn-outline-secondary" onclick="closeDoc()">페이지 닫기</button>
				</div>
	        </div>
	      </div>
	      
	      <!-- spotfire WP -->
	      <input type="hidden" id="path" value="${path}">
	      <input type="hidden" id="cookieName" value="${username}">
	  	  <div id="container" style="height: 80vh"></div>
		  <div id="div111">
		  </div>
	    </main>
	  </div>
	</div>
</body>
<script src="${pageContext.request.contextPath}/resources/js/mashup.js"></script>
</html>