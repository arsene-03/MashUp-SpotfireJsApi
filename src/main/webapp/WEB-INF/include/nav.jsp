<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!DOCTYPE html>
 <nav id="sidebarMenu" class="col-md-3 col-lg-2 d-md-block bg-light sidebar collapse">
      <div class="position-sticky pt-3">
        <ul class="nav flex-column">
          <li class="nav-item">
           <a class="nav-link active" aria-current="page" href="/main">
              <span data-feather="home" class="align-text-bottom">
              	<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-home align-text-bottom" aria-hidden="true"><path d="M3 9l9-7 9 7v11a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2z"></path><polyline points="9 22 9 12 15 12 15 22"></polyline></svg>
              </span>
              메인화면
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="/userInfo">
            <span data-feather="file" class="align-text-bottom"> 
            	<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-users align-text-bottom" aria-hidden="true"><path d="M17 21v-2a4 4 0 0 0-4-4H5a4 4 0 0 0-4 4v2"></path><circle cx="9" cy="7" r="4"></circle><path d="M23 21v-2a4 4 0 0 0-3-3.87"></path><path d="M16 3.13a4 4 0 0 1 0 7.75"></path></svg>
            </span>
             회원정보 조회/수정
            </a>
          </li>
          <sec:authorize access="hasRole('ROLE_ADMIN')">  
          <li class="nav-item">
            <a class="nav-link" href="/admin/selectAllMember">
              <span data-feather="shopping-cart" class="align-text-bottom">
              	<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-layers align-text-bottom" aria-hidden="true"><polygon points="12 2 2 7 12 12 22 7 12 2"></polygon><polyline points="2 17 12 22 22 17"></polyline><polyline points="2 12 12 17 22 12"></polyline></svg>
              </span>
              전체 회원정보
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#">
              <span data-feather="users" class="align-text-bottom">
              	<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-bar-chart-2 align-text-bottom" aria-hidden="true"><line x1="18" y1="20" x2="18" y2="10"></line><line x1="12" y1="20" x2="12" y2="4"></line><line x1="6" y1="20" x2="6" y2="14"></line></svg>
              </span>
              Report 관리
            </a>
          </li>
          </sec:authorize>
        </ul>

        <h6 class="sidebar-heading d-flex justify-content-between align-items-center px-3 mt-4 mb-1 text-muted text-uppercase">
          <span>Saved reports</span>
          <a class="link-secondary" href="javascript:void(0)" aria-label="Add a new report" onclick="addNewPath()">
            <span data-feather="plus-circle" class="align-text-bottom">
            	<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-plus-circle align-text-bottom" aria-hidden="true"><circle cx="12" cy="12" r="10"></circle><line x1="12" y1="8" x2="12" y2="16"></line><line x1="8" y1="12" x2="16" y2="12"></line></svg>
            </span>
          </a>
        </h6>
        <ul class="nav flex-column mb-2" id="reportList">
         <li class="nav-item">
            <a class="nav-link" href="javascript:void(0)"  id="/abc/barchart" onclick="changePath(event)"  >
              <span data-feather="file-text" class="align-text-bottom">
              	<img alt="" src="${pageContext.request.contextPath}/resources/img/icon/report.svg" class="feather feather-file-text align-text-bottom" aria-hidden="true">
              </span>
              barchart
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="javascript:void(0)"  id="/abc/비엠아이" onclick="changePath(event)"  >
              <span data-feather="file-text" class="align-text-bottom">
              	<img alt="" src="${pageContext.request.contextPath}/resources/img/icon/report.svg" class="feather feather-file-text align-text-bottom" aria-hidden="true">
              </span>
              비엠아이
            </a>
          </li>
           
        </ul>
      </div>
    </nav>
    <script src="https://cdn.jsdelivr.net/npm/feather-icons@4.28.0/dist/feather.min.js"></script>