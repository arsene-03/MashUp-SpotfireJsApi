<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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

<jsp:include page="../../include/header.jsp" />
<div class="container-fluid">
  <div class="row">
<jsp:include page="../../include/nav.jsp" />
 <main class="col-md-9 ms-sm-auto col-lg-10 px-md-4">
   <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
        <h1 class="h2">전체 회원정보</h1>
   </div>
   
      <div class="table-responsive">
        <table class="table table-striped table-sm" style="text-align:  center;">
          <thead>
            <tr>
              <th scope="col">Id</th>
              <th scope="col">JoinDate</th>
              <th scope="col">User_Role</th>
              <th scope="col" colspan="2">수정/삭제</th>
            </tr>
          </thead>
          <tbody>
          	<c:forEach var="members" items="${Lib_items}">
	          	<tr>
	              <td>${members.id}</td>
	              <td>
	              	<fmt:formatDate value="${members.joinDate}" pattern="yyyy-MM-dd HH:mm:ss"/>
	              </td>
	              <td>
	              ${members.role}
	              <input type="hidden" id= "memberrole" value="${members.role}">
	             
	              	
	              </td>
	              <td>
					<a href="/admin/selectMember?userid=${members.id}">
						수정
					</a>
				  </td> 	
	              <td>
	              	<a href="/admin/deleteMember?userid=${members.id}" onClick="return deleteMember()">
						삭제
					</a>
				 </td>
	            </tr>	
          	
          	</c:forEach>
            
         
          </tbody>
        </table>
      </div>
      </main>
      </div>
      </div>
      <script type="text/javascript">
      	function deleteMember() {
			if(confirm('회원을 삭제하시겠습니까?')){
				return true;
			}
			return false;
		}
      </script>
</body>
</html>