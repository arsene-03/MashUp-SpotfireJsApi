

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



function a($) {
	
	console.log("js진입")	;
	alert('1111');
	return false;
	//아이디 입력 여부
	/*
	if(document.frm.id.value.length == 0){
		alert('아이디를 입력해 주세요!');
		frm.id.focus();
		return false;
	}
	
	//암호 입력 여부
	if(document.frm.password.value == ""){
		alert('비밀번호를 입력해 주세요!');
		frm.password.focus();
		return false;
	}
	//입력된 암호 일치 여부
	if(document.frm.password.value != document.frm.confirmPassword.value){
		alert('비밀번호가 일치하지 않습니다.!');
		document.frm.password.value ="";
		document.frm.confirmPassword.value = "";
		
		frm.password.focus();
		return false;
	}
	
	//아이디 중복 체크 여부(reid=??)
	if(document.frm.reid.value.length == 0){
		alert('중복 체크를 하지 않았습니다.');
		frm.member_id.focus();
		return false;
	}
	
	return true;
}

function idChk(){
	if(document.frm.member_id.value.length == 0){
		alert('아이디를 입력해 주세요.');
		frm.member_id.focus();
		return false;
	}
	var url = "LS?command=idChk_action&member_id="+document.frm.member_id.value;
	
	window.open(url,"_blank_1","toolbar=no, menubar=no, scrollbars=yes, resizable=no, width=450, height=400");
}

function idok(){
	opener.frm.member_id.value = document.frm.member_id.value;
	opener.frm.reid.value = document.frm.member_id.value;
	
	self.close(); //새로 열린창 종료*/
}