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
<script src="https://spotfire-next.cloud.tibco.com/spotfire/js-api/loader.js"></script>
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
			  <button type="button" class="btn btn-sm btn-outline-secondary" onclick="location.href='/main'">페이지 초기화</button>
			</div>
			
        </div>
      </div>
      
      <!-- spotfire WP -->
      <input type="hidden" id="path" value="${path}">
  	  <div id="container" style="height: 80vh"></div>
	  <div id="div111"></div>
    </main>
  </div>
</div>
</body>
<script>
   
   // 메뉴창에 링크를 클릭하면 path값을 바꾸고, title 바꾸기/
    function changePath(event) {
		var linkPath = event.currentTarget;
		var realpath = linkPath.getAttribute('id'); //path값
		var inputPath = document.getElementById('path');
		var title = document.getElementsByClassName('h2')[0];

		var newTitleName = getFileName(realpath)
		/*
		var tSplitPath = realpath.split('/');
		var tSplitPathLen = tSplitPath.length-1;
		var newTitleName = tSplitPath[tSplitPathLen]; //path말단인 파일명 추출

		*/
		
		inputPath.setAttribute('value', realpath); //hidden의 value 바꿈
		title.innerHTML=newTitleName; //title 바꾸기

		
		//Spotfire javaScriptAPI 변수 선언
			var app;
		    var doc;
		    var webPlayerServerRootUrl = "http://localhost:82/spotfire/wp/";
		    var analysisPath = inputPath.value;
		    var parameters;
		    var reloadInstances = true;
		    var apiVersion = "7.14";
		    var customizationInfo/* = {
		            showAbout: false,
		            showAnalysisInformationTool: false,
		            showAuthor: false,
		            showClose: false,
		            showCustomizableHeader: false,
		            showDodPanel: false,
		            showExportFile: false,
		            showExportVisualization: false,
		            showFilterPanel: false,
		            showHelp: false,
		            showLogout: false,
		            showPageNavigation: false,
		            showReloadAnalysis: false,
		            showStatusBar: false,
		            showToolBar: false,
		            showUndoRedo: false
		          }*/;
			

		    // Spotfire WP 구성
		    spotfire.webPlayer.createApplication(
		        webPlayerServerRootUrl,
		        customizationInfo,
		        analysisPath,
		        parameters,
		        reloadInstances,
		        apiVersion,
		        onReadyCallback,
		        onCreateLoginElement 
		        );
		 
		    function onReadyCallback(response, newApp)
		    {
		        app = newApp;
		        if(response.status === "OK") //접속성공
		        {
		            // The application is ready, meaning that the api is loaded and that 
		            // the analysis path is validated for the current session 
		            // (anonymous or logged in user)
		            console.log("OK received. Opening document to page 0 in element renderAnalysis")
		            doc = app.openDocument("container", 0);
		        }
		        else
		        {
		            console.log("Status not OK. " + response.status + ": " + response.message)
		        }
		    }
		 
		    function onError(error)//에러 발생
		    {
		        console.log("Error: " + error);
		    }
		 
		    function onCreateLoginElement()//로그인 session 없을시
		    {
		        console.log("Creating the login element");

		        // Optionally create and return a div to host the login button
		        return null;
		    }
	}
   
   //새로운 분석파일 리스트 ADD
    function addNewPath() {
    	var newPath = prompt('추가할 Analysis경로를 입력하세요', '/abc/'); //prompt로 얻은 경로값
		
    	var newReportName = getFileName(newPath)
		/*
		var splitPath = newPath.split('/');
	
		var splitPathLen = splitPath.length-1;

		var newReportName = splitPath[splitPathLen];

		*/
    	
    	var oldUl = document.getElementById('reportList');
		
		var newLi = document.createElement("li");
		newLi.setAttribute('class','nav-item');

		var newA = document.createElement("a");
		newA.setAttribute('class','nav-link');
		newA.setAttribute('href','javascript:void(0)');
		newA.setAttribute('id',newPath);
		newA.setAttribute('onclick','changePath(event)');
	
		var newSpan = document.createElement("span");
		newSpan.setAttribute('data-feather','file-text');
		newSpan.setAttribute('class','align-text-bottom');

		var newImg = document.createElement("img");
		newImg.setAttribute('src','${pageContext.request.contextPath}/resources/img/icon/report.svg');
		newImg.setAttribute('class','feather feather-file-text align-text-bottom');
		newImg.setAttribute('aria-hidden','true');
		
		
		newSpan.append(newImg);

		newA.append(newSpan);
		newA.append(newReportName);
		

		newLi.append(newA);

		oldUl.append(newLi);
		
    }
   // 경로중 가장마지막인 파일명 추출하는 메서드
   function getFileName(newPath) {
	   
		var splitPath = newPath.split('/');
		var splitPathLen = splitPath.length-1;
		var newReportName = splitPath[splitPathLen];
		return newReportName;
   }
</script>
</html>