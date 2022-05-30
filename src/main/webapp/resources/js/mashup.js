
// Spotfire.Application 변수 선언
	var app;
	var doc;
	var webPlayerServerRootUrl = "http://localhost:82/spotfire/wp/";
	var analysisPath; // ex) '/abc/varchart'
	var parameters;
	var reloadInstances = true;
	var apiVersion = "7.14";
	var customizationInfo = {
		    showCustomizableHeader : false,
		    showStatusBar : false,
		    showToolBar : false,
		    showPageNavigation : false
		}
	var inputPath = document.getElementById('path');
 
// 링크 클릭 (path변경, spotfireApp생성)
function changePath(event) {
	var linkPath = event.currentTarget;
	var realpath = linkPath.getAttribute('id'); //path값
	var title = document.getElementsByClassName('h2')[0];

	var newTitleName = getFileName(realpath)
		
	inputPath.setAttribute('value', realpath); //hidden의 value 바꿈
	title.innerHTML=newTitleName; //title 바꾸기

		
	//spotfire 분석파일 경로 설정
	analysisPath = inputPath.value;
	
    // Spotfire WP 구성
    spotfire.webPlayer.createApplication (
	    webPlayerServerRootUrl,
	    customizationInfo,
	    analysisPath,
	    parameters,
	    reloadInstances,
	    apiVersion,
	    onReadyCallback,
	    onCreateLoginElement 
	);		 	

	//새로운 application opencallback		    
	function onReadyCallback(response, newApp) {
	    app = newApp;
	    
	    if(response.status === "OK") //접속성공
	    {
	        // The application is ready, meaning that the api is loaded and that 
	        // the analysis path is validated for the current session 
	        // (anonymous or logged in user)
	        console.log("OK received. Opening document to page 0 in element renderAnalysis")
	        doc = app.openDocument("container", 0);  
	    } else {
	        console.log("Status not OK. " + response.status + ": " + response.message)
	    }
	}

	//에러 발생시
	function onError(error) {
	    console.log("Error: " + error);
	}
 
	// 로그인정보가 없을 시
	function onCreateLoginElement() {
	    console.log("Creating the login element");
	
	    // Optionally create and return a div to host the login button
	    return null;
	}
   
 
	//External Authentication - Cookie설정
	    var getCookieName = document.getElementById('cookieName').value;
	    setCookie('SSOConn',getCookieName,1);
	    console.log('쿠키날림');
}
   
//새로운 분석파일 리스트 ADD
function addNewPath() {
	var newPath = prompt('추가할 Analysis경로를 입력하세요', '/abc/'); //prompt로 얻은 경로값
	var newReportName = getFileName(newPath)
	
	//<ul> 	
    var oldUl = document.getElementById('reportList');	
	
	//<li>생성
	var newLi = document.createElement("li");
		newLi.setAttribute('class','nav-item');

	//<a>생성
	var newA = document.createElement("a");
		newA.setAttribute('class','nav-link');
		newA.setAttribute('href','javascript:void(0)');
		newA.setAttribute('id',newPath);
		newA.setAttribute('onclick','changePath(event)');
	
	//<span>생성
	var newSpan = document.createElement("span");
		newSpan.setAttribute('data-feather','file-text');
		newSpan.setAttribute('class','align-text-bottom');
	
	//<img>생성
	var newImg = document.createElement("img");
		newImg.setAttribute('src','${pageContext.request.contextPath}/resources/img/icon/report.svg');
		newImg.setAttribute('class','feather feather-file-text align-text-bottom');
		newImg.setAttribute('aria-hidden','true');
		
	//하위 태그 append
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

// 쿠키생성 메서드
function setCookie(name, value, exp) {
	var date = new Date();
	date.setTime(date.getTime() + exp * 24 * 60 * 60 * 1000 );
	document.cookie = name + '=' + value + ';expires=' + date.toUTCString() + ';path=/';  
}

// webPlayer창 닫기 메서드
function closeDoc() {
	console.log('webPlayer창 닫기');
	doc.close();
}

// 로그아웃 form 태그 //
function logOutPost(){
	if(confirm("로그아웃 하시겠습니까?")) {
		
		// form태그 생성
		let f = document.createElement('form');
	    f.setAttribute('action', '/logout');
	    f.setAttribute('method', 'post');
	    
	    // spring-security csrf토큰 생성
	    let sec = document.createElement('input');
	    sec.setAttribute('type', 'hidden');
	    sec.setAttribute('name', '${_csrf.parameterName}');
	    sec.setAttribute('value', '${_csrf.token}');
	   
	    document.body.appendChild(f);
	    f.appendChild(sec);
	    
	    // 쿠키 기간 만료시키기 메서드
	    var getCookieName = document.getElementById('cookieName').value;
	    setCookie('SSOConn',getCookieName,-1);
	    console.log('쿠키없애기');
	    
	    // wp가 열려 있다면, 로그아웃
	    if(doc != null){
	    	console.log('spotfire server 로그아웃');
		    doc.logout();	
	    } 
	       
	   	f.submit();
	}
}
  