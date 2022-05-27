<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
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
</head>


<body>

<jsp:include page="../include/header.jsp" />
<div class="container-fluid">
  <div class="row">
<jsp:include page="../include/nav.jsp" />
 <main class="col-md-9 ms-sm-auto col-lg-10 px-md-4">
      <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
        <h1 class="h2">Dashboard</h1>
        <div class="btn-toolbar mb-2 mb-md-0">
          <div class="btn-group me-2">
            <button type="button" class="btn btn-sm btn-outline-secondary" onclick="location.href='/main'">페이지 초기화</button>
          </div>
        </div>
      </div>
	<iframe  id="if111" name="myframe" style="width:100%; height:80vh"></iframe>
	<div id="div111"></div>
    </main>
  </div>
</div>
</body>
</html>