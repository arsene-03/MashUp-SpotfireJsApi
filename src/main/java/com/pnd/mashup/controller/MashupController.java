package com.pnd.mashup.controller;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.Authentication;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.pnd.mashup.Library.service.impl.SpotfireServiceImpl;
import com.pnd.mashup.member.service.impl.MemberServiceImpl;
import com.pnd.mashup.model.Lib_items;
import com.pnd.mashup.model.Member;
import com.pnd.mashup.security.SecurityMember;

@Controller
@PreAuthorize("hasRole('ROLE_USER')")
public class MashupController {
	

	@Autowired
	MemberServiceImpl memberService;
	
	@Autowired
	SpotfireServiceImpl spotfireService;
	
// 메인 페이지//
	@RequestMapping(value = "/main", method = RequestMethod.GET)
	public String goMain(Model model, Authentication authentication) {
		System.out.println("메인 페이지로");
		authenticationChk(authentication,model);
		
		
		
		
		return"main";
	}
	

// 로그인 페이지 //
	@RequestMapping(value = "/login", method = {RequestMethod.GET, RequestMethod.POST})
	public String goLogin(Model model, Authentication authentication) {
		System.out.println("로그인 페이지로");
		authenticationChk(authentication,model);
		return"login";
	}

	
// 회원가입 페이지 // 
	@RequestMapping(value = "/join", method = RequestMethod.GET)
	public String goJoin(Model model, Authentication authentication) {
		System.out.println("로그인 페이지로");
		authenticationChk(authentication,model);
		System.out.println("회원가입 페이지로");
		return "join";
	}
	
// 회원가입 기능 //
	@RequestMapping(value = "/join", method = RequestMethod.POST)
	public String Join(Member member, Model model) {
		member.setPassword(new BCryptPasswordEncoder().encode(member.getPassword()));
		
		if(memberService.idChk(member)) { 
			//id 중복검사 //
			model.addAttribute("msg", "idDup");
			
		}else {
			// 회원가입 //
			memberService.join(member);
			model.addAttribute("msg","joinSuc");
		}
		return "alert";
	}
	
// 회원정보 조회 페이지 //
	@RequestMapping(value = "/userInfo", method = RequestMethod.GET)
	public String goUserInfo(Model model, Authentication authentication) {
		SecurityMember member = (SecurityMember)authentication.getPrincipal();
		
		model.addAttribute("username",member.getUsername());
		return "userInfo";
	}
// 회원정보 조회 기능
	@RequestMapping(value = "/userInfo", method = RequestMethod.POST)
	public String userInfo(Member member, Authentication authentication, Model model, @RequestParam("newPassword")String newPw, @RequestParam("role")String role) {
		System.out.println("진입");
		//DB 유저정보
		SecurityMember dbmember = (SecurityMember)authentication.getPrincipal();
		
		//Input OldPw
		String writeOldPW = member.getPassword();
		
		//encoder 인스턴스 생성
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		
		//DB 비밀번호 vs 입력한 기존비밀번호
		
			if(encoder.matches(writeOldPW, dbmember.getPassword())) {
				//입력한 기존비밀번호 vs 새로운 비밀번호 
				if(writeOldPW.equals(newPw) ) {
					model.addAttribute("username",dbmember.getUsername());
					model.addAttribute("msg", "기존 비밀번호를 이용할 수 없습니다.");
					return "userInfo";
				}else {
					member.setPassword(new BCryptPasswordEncoder().encode(newPw));
					memberService.update(member);
					model.addAttribute("username",dbmember.getUsername());
					model.addAttribute("msg", "pwSuc");
					return "alert";
				}
			}else {
				model.addAttribute("msg", "현재 비밀번호가 일치하지 않습니다.");
				model.addAttribute("username",dbmember.getUsername());
			}
		
		return "userInfo";
	}
	@RequestMapping(value = "/mash", method = RequestMethod.GET)
	public String gomash(Model model, Authentication authentication,@RequestParam("path")String path) {
		System.out.println("경로:"+path);
		model.addAttribute("path",path);
		return "mash";
	}

	
	
	
	
	// 유저정보가 있으면 model객체로 넘겨주는 메서드
	private void authenticationChk(Authentication authentication, Model model) {
		if(authentication != null) {
			SecurityMember member = (SecurityMember)authentication.getPrincipal();
			model.addAttribute("username", member.getUsername());
		}
	}
		
}
